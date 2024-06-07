use [Projeto Meli]

/*
1. Liste usu�rios com anivers�rio de hoje cujo n�mero de vendas realizadas em janeiro de 2020 seja superior a 1.500.  
*/
-- Seleciona os nomes e sobrenomes dos clientes e a contagem de pedidos realizados
SELECT 
    Cliente.nome, 
    Cliente.sobrenome, 
    COUNT(Pedido.id_pedido) AS total_vendas
FROM 
    Cliente
-- Junta a tabela Cliente com a tabela Item baseada no id_vendedor para obter os itens vendidos pelo cliente
JOIN 
    Item ON Cliente.id_cliente = Item.id_vendedor
-- Junta a tabela Item com a tabela Pedido baseada no id_item para obter os pedidos relacionados aos itens
JOIN 
    Pedido ON Item.id_item = Pedido.id_item
-- Filtra os clientes que fazem anivers�rio hoje e que tiveram pedidos realizados em janeiro de 2020
WHERE 
    DATEPART(month, Cliente.data_nascimento) = DATEPART(month, GETDATE())
    AND DATEPART(day, Cliente.data_nascimento) = DATEPART(day, GETDATE())
    AND DATEPART(year, Pedido.data_pedido) = 2020
    AND DATEPART(month, Pedido.data_pedido) = 1
-- Agrupa os resultados pelos identificadores dos clientes e seus nomes
GROUP BY 
    Cliente.id_cliente, Cliente.nome, Cliente.sobrenome
-- Filtra os grupos para incluir apenas aqueles que t�m mais de 1.500 vendas
HAVING 
    COUNT(Pedido.id_pedido) > 1500;



/*
2. Para cada m�s de 2020, s�o solicitados os 5 principais usu�rios que mais venderam ($) na categoria Celulares. 
S�o obrigat�rios o m�s e ano da an�lise, nome e sobrenome do vendedor, quantidade de vendas realizadas, quantidade de produtos vendidos e valor total transacionado. 
*/
-- Common Table Expression (CTE) para calcular as vendas mensais
WITH VendasMensais AS (
    SELECT 
        -- Extrai o m�s e o ano da data do pedido
        DATEPART(month, Pedido.data_pedido) AS mes, 
        DATEPART(year, Pedido.data_pedido) AS ano, 
        -- Seleciona o nome e sobrenome do vendedor
        Cliente.nome, 
        Cliente.sobrenome, 
        -- Conta o n�mero total de pedidos como total_vendas
        COUNT(Pedido.id_pedido) AS total_vendas, 
        -- Soma a quantidade de produtos vendidos como quantidade_produtos_vendidos
        SUM(Pedido.quantidade) AS quantidade_produtos_vendidos, 
        -- Calcula o valor total transacionado multiplicando a quantidade pelo pre�o do item
        SUM(Pedido.quantidade * Item.preco) AS valor_total_transacionado,
        -- N�mero da linha dentro de cada m�s e ano, ordenado pelo valor total transacionado
        ROW_NUMBER() OVER (
            PARTITION BY DATEPART(month, Pedido.data_pedido), DATEPART(year, Pedido.data_pedido) 
            ORDER BY SUM(Pedido.quantidade * Item.preco) DESC
        ) AS rn
    FROM 
        Pedido
    JOIN 
        Item ON Pedido.id_item = Item.id_item
    JOIN 
        Cliente ON Item.id_vendedor = Cliente.id_cliente
    JOIN 
        Categoria ON Item.id_categoria = Categoria.id_categoria
    WHERE 
        -- Filtra apenas pedidos na categoria 'Celulares e Smartphones' e no ano de 2020
        Categoria.nome = 'Celulares e Smartphones'
        AND DATEPART(year, Pedido.data_pedido) = 2020
    GROUP BY 
        -- Agrupa os resultados por m�s, ano e vendedor
        DATEPART(month, Pedido.data_pedido), 
        DATEPART(year, Pedido.data_pedido), 
        Cliente.id_cliente, 
        Cliente.nome, 
        Cliente.sobrenome
)
-- Seleciona os resultados finais limitados aos 5 principais vendedores de cada m�s
SELECT 
    mes, 
    ano, 
    nome, 
    sobrenome, 
    total_vendas, 
    quantidade_produtos_vendidos, 
    valor_total_transacionado
FROM 
    VendasMensais
WHERE 
    -- Filtra os resultados para incluir apenas os 5 principais vendedores de cada m�s
    rn <= 5
ORDER BY 
    -- Ordena os resultados por ano, m�s e valor total transacionado em ordem decrescente
    ano, mes, valor_total_transacionado DESC;



/* 
3. � solicitada uma nova tabela a ser preenchida com o pre�o e status dos Itens no final do dia. 
Lembre-se de que deve ser reprocess�vel . Vale ressaltar que na tabela Item teremos apenas o �ltimo status informado pelo PK definido. (Pode ser resolvido atrav�s de StoredProcedure)     
*/
-- Cria��o da tabela de hist�rico de itens
CREATE TABLE HistoricoItem (
    id_historico INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    id_item INT NOT NULL,
    data_registro DATE NOT NULL,
    preco DECIMAL(10, 2) NOT NULL,
    status VARCHAR(50) NOT NULL,
    FOREIGN KEY (id_item) REFERENCES Item(id_item)
);

-- Cria��o da stored procedure para atualizar a tabela de hist�rico de itens
CREATE PROCEDURE AtualizaHistoricoItem
AS
BEGIN
    SET NOCOUNT ON;
    
    DECLARE @data_registro DATE;
    SET @data_registro = CAST(GETDATE() AS DATE);
    
    -- Deletar registros antigos para o dia atual, se houver
    DELETE FROM HistoricoItem
    WHERE data_registro = @data_registro;

    -- Inserir novos registros
    INSERT INTO HistoricoItem (id_item, data_registro, preco, status)
    SELECT 
        id_item,
        @data_registro,
        preco,
        status
    FROM 
        Item;
END;

-- Executar manualmente a stored procedure
EXEC AtualizaHistoricoItem;

