USE [Projeto Meli]

CREATE TABLE Cliente(
	id_cliente INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    email VARCHAR(255) NOT NULL,
    nome VARCHAR(255) NOT NULL,
    sobrenome VARCHAR(255) NOT NULL,
    sexo VARCHAR(50) NOT NULL,
    endereço VARCHAR(255) NOT NULL,
    data_nascimento DATE NOT NULL,
    telefone VARCHAR(20) NOT NULL

);

CREATE TABLE Categoria (
    id_categoria INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    nome VARCHAR(255) NOT NULL,
    descrição TEXT NOT NULL,
	caminho VARCHAR(255) NOT NULL
);

CREATE TABLE Item (
    id_item INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    nome VARCHAR(255) NOT NULL,
    descricao TEXT NOT NULL,
    preco DECIMAL(10, 2) NOT NULL,
    status VARCHAR(50) NOT NULL,
    data_cancelamento DATE,
    id_categoria INT,
    id_vendedor INT,
    FOREIGN KEY (id_categoria) REFERENCES Categoria(id_categoria),
    FOREIGN KEY (id_vendedor) REFERENCES Cliente(id_cliente)
);

CREATE TABLE Pedido (
    id_pedido INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    data_pedido DATE NOT NULL,
    quantidade INT NOT NULL,
    id_item INT,
    id_comprador INT,
    FOREIGN KEY (id_item) REFERENCES Item(id_item),
    FOREIGN KEY (id_comprador) REFERENCES Cliente(id_cliente)
);