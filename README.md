# Engenheiro de Desafios - Primeira Parte - SQL
Pontos para avaliar 

Interpretação do slogan 
Ordem de código e comentários 
Consultas simples e eficazes 
Qualidade da entrega 
Se você pensar em outro ponto que poderia ser adicionado, sinta-se à vontade para adicioná-lo e nos dizer o que é e por que o adicionou. 
#Mirar
Com base na seguinte necessidade, é necessário desenhar um DER que responda ao modelo de negócio. Então, diferentes questões devem ser respondidas usando SQL. 



# Descrição da necessidade 

Tendo em conta o modelo de comércio eletrónico que gerimos, temos algumas entidades básicas que queremos representar: Cliente, Encomenda, Artigo e Categoria . 

Cliente : Esta é a entidade onde estão localizados todos os nossos usuários, sejam eles Compradores ou Vendedores do Site. Os principais atributos são email, nome, sobrenome, sexo, endereço, data de nascimento, telefone, entre outros. 
Item : É a entidade onde estão localizados os produtos publicados em nosso marketplace. O volume é muito grande porque estão incluídos todos os produtos que foram publicados em algum momento. Usando o status do item ou a data de cancelamento, você pode detectar os itens ativos no marketplace.  
Categoria : É a entidade onde se encontra a descrição de cada categoria com seu respectivo caminho. Cada item possui uma categoria associada a ele.   
Pedido : O pedido é a entidade que reflete as transações geradas dentro do site (cada compra é um pedido). Neste caso não teremos fluxo de carrinho de compras, portanto cada item vendido será refletido em um pedido independente da quantidade que foi adquirida.
Fluxo de compra
Um usuário entra no site do Mercado Libre para comprar dois dispositivos móveis idênticos. 
Faça a busca navegando pelas categorias Tecnologia > Celulares e Telefonias > Celulares e Smartphones e, por fim, encontre o produto que deseja comprar.  
Prosseguir com a compra das mesmas duas unidades selecionadas, o que gera um pedido de compra.
# Um resolvedor
Liste usuários com aniversário de hoje cujo número de vendas realizadas em janeiro de 2020 seja superior a 1.500.  
Para cada mês de 2020, são solicitados os 5 principais usuários que mais venderam ($) na categoria Celulares. São obrigatórios o mês e ano da análise, nome e sobrenome do vendedor, quantidade de vendas realizadas, quantidade de produtos vendidos e valor total transacionado .    
É solicitada uma nova tabela a ser preenchida com o preço e status dos Itens no final do dia. Lembre-se de que deve ser reprocessável . Vale ressaltar que na tabela Item teremos apenas o último status informado pelo PK definido. (Pode ser resolvido através de StoredProcedure)     
# Pendências de tarefas
Com base na situação levantada, perguntamos: 
Projete um DER do modelo de dados que consiga responder a cada uma das questões mencionadas acima.
Gere o script DDL para a criação de cada uma das tabelas representadas no DER. Envie-o com o nome “create_tables.sql”.  
Gere o código SQL para responder a cada uma das situações mencionadas acima sobre o modelo desenhado. Nome solicitado: “ business_responses.sql ”   
