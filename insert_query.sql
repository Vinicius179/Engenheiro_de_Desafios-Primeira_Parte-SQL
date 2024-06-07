INSERT INTO Cliente (email, nome, sobrenome, sexo, endereço, data_nascimento, telefone)
VALUES 
('joao.silva@example.com', 'João', 'Silva', 'Masculino', 'Rua A, 123', '1980-01-01', '123456789'),
('maria.santos@example.com', 'Maria', 'Santos', 'Feminino', 'Rua B, 456', '1990-02-02', '987654321'),
('carlos.pereira@example.com', 'Carlos', 'Pereira', 'Masculino', 'Rua C, 789', '1985-03-03', '456789123'),
('ana.oliveira@example.com', 'Ana', 'Oliveira', 'Feminino', 'Rua D, 101', '1995-04-04', '789123456'),
('luiz.costa@example.com', 'Luiz', 'Costa', 'Masculino', 'Rua E, 202', '1988-05-05', '321654987'),
('claudia.rodrigues@example.com', 'Claudia', 'Rodrigues', 'Feminino', 'Rua F, 303', '1992-06-06', '654987321'),
('marcos.almeida@example.com', 'Marcos', 'Almeida', 'Masculino', 'Rua G, 404', '1983-07-07', '987321654'),
('beatriz.souza@example.com', 'Beatriz', 'Souza', 'Feminino', 'Rua H, 505', '1994-08-08', '321987654'),
('antonio.fernandes@example.com', 'Antonio', 'Fernandes', 'Masculino', 'Rua I, 606', '1986-09-09', '654123987'),
('renata.lima@example.com', 'Renata', 'Lima', 'Feminino', 'Rua J, 707', '1991-10-10', '987654321');
SELECT * FROM Cliente;

INSERT INTO Categoria (nome, descrição, caminho)
VALUES 
('Celulares e Smartphones', 'Categoria de dispositivos eletrônicos', 'Home > Celulares e Smartphones'),
('Roupas', 'Categoria de vestuário', 'Home > Roupas'),
('Livros', 'Categoria de livros e publicações', 'Home > Livros'),
('Móveis', 'Categoria de móveis e decoração', 'Home > Móveis'),
('Brinquedos', 'Categoria de brinquedos e jogos', 'Home > Brinquedos'),
('Beleza', 'Categoria de produtos de beleza', 'Home > Beleza'),
('Esportes', 'Categoria de artigos esportivos', 'Home > Esportes'),
('Ferramentas', 'Categoria de ferramentas e construção', 'Home > Ferramentas'),
('Alimentos', 'Categoria de alimentos e bebidas', 'Home > Alimentos'),
('Automotivo', 'Categoria de produtos automotivos', 'Home > Automotivo');

INSERT INTO Item (nome, descricao, preco, status, data_cancelamento, id_categoria, id_vendedor)
VALUES 
('Iphone 11', 'Smartphone de última geração', 1299.99, 'ativo', NULL, 1, 1),
('Samsung', 'Smartphone de última geração', 1449.99, 'ativo', NULL, 1, 2),
('Motorola', 'Smartphone de última geração', 999.99, 'ativo', NULL, 1, 3),
('Iphone 12', 'Smartphone de última geração', 1999.99, 'ativo', NULL, 1, 4),
('Iphone 13', 'Smartphone de última geração', 2999.99, 'ativo', NULL, 1, 5),
('Perfume', 'Perfume importado', 199.99, 'ativo', NULL, 6, 2),
('Bola de Futebol', 'Bola oficial de futebol', 99.99, 'ativo', NULL, 7, 4),
('Furadeira', 'Furadeira elétrica', 299.99, 'ativo', NULL, 8, 6),
('Chocolate', 'Chocolate ao leite', 9.99, 'ativo', NULL, 9, 8),
('Pneu', 'Pneu para carro', 399.99, 'ativo', NULL, 10, 10);

INSERT INTO Pedido (data_pedido, quantidade, id_item, id_comprador)
VALUES 
('2020-01-01', 1, 1, 8),
('2020-01-02', 1, 1, 6),
('2020-01-03', 1, 3, 2),
('2020-01-04', 1, 4, 7),
('2020-03-05', 3, 2, 9),
('2020-04-06', 2, 6, 1),
('2020-01-07', 1, 7, 3),
('2020-01-08', 1, 3, 5),
('2020-01-09', 4, 9, 7),
('2020-01-10', 2, 10, 9);

SELECT * FROM Cliente;
SELECT * FROM Categoria;
SELECT * FROM Item;
SELECT * FROM Pedido;
