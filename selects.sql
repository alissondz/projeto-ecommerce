USE ecommerce;

-- Inserção de dados na tabela Clients
INSERT INTO clients (Fname, Minit, Lname, CPF, Address)
VALUES
    ('Maria', 'M', 'Silva', '12346789', 'rua silva de prata 29, Carangola Cidade das flores'),
    ('Matheus', 'O', 'Pimentel', '987654321', 'rua alemeda 289, Centro Cidade das flores'),
    ('Ricardo', 'F', 'Silva', '45678913', 'avenida alemeda vinha 1009, Centro Cidade das flores'),
    ('Julia', 'S', 'França', '789123456', 'Trua lareijras 861, Centro Cidade das flores'),
    ('Roberta', 'G', 'Assis', '90745631', 'avenidade koller 19, Centro Cidade das Flores'), 
    ('Isabela', 'M', 'Cruz', '654789123', 'rua alemeda das flores 28, Centro Cidade das flores');

-- Inserção de dados na tabela Product
INSERT INTO product (Pname, classification_kids, category, avaliacao, size)
VALUES
    ('Fone de ouvido', false, 'Eletronico', 4, null),
    ('Barbie Elsa', true, 'Brinquedo', 3, null),
    ('Body Carters', true, 'Vestimenta', 5, null),
    ('Microfone Vedo - Youtuber', false, 'Eletronico', 4, null),
    ('Sofa retrátil', false, 'Moveis', 3, '31x57x80'),
    ('Farinha de arroz', false, 'Alimentos', 2, null),
    ('Fire Stick Amazon', false, 'Eletronico', 3, null);

-- Inserção de dados na tabela Orders
INSERT INTO orders (idOrderClient, ordersStatus, ordersDescription, sendValue, paymentCash) VALUES
    (1, 'Em processamento', 'compra via aplicativo', null, 1),
    (2, 'Em processamento', 'compra via aplicativo', 50, 0),
    (3, 'Confirmado', null, null, 1),
    (4, 'Em processamento', 'compra via web site', 150, 0);

-- Inserção de dados na tabela ProductOrder
INSERT INTO productOrder (idPOproduct, idPOorder, poQuantity, poStatus) VALUES
    (1, 1, 2, 'Disponivel'),
    (2, 1, 1, 'Disponivel'),
    (3, 2, 1, 'Disponivel');

-- Inserção de dados na tabela ProductStorage
INSERT INTO productStorage (storageLocation, quantity) VALUES
    ('Rio de Janeiro', 1000),
    ('Rio de Janeiro', 500),
    ('São Paulo', 10),
    ('São Paulo', 100),
    ('São Paulo', 10),
    ('Brasília', 60);

-- Inserção de dados na tabela StorageLocation
INSERT INTO storageLocation (idLproduct, idLstorage, location) VALUES
    (1, 1, 'RJ'),
    (2, 2, 'RJ');

-- Inserção de dados na tabela ProductSeller
INSERT INTO seller (SocialName, CNPJ, CPF, location, contact) VALUES
    ('Seller One', '12345678901', '123456789', 'Rua A', '987654321'),
    ('Seller Two', '22345678901', '223456789', 'Rua B', '987654322');
    
    
 -- Recuperações simples com SELECT Statement   
SELECT * FROM clients;
SELECT * FROM product;
SELECT * FROM orders;
-- Filtros com WHERE Statement

-- Copiar código
SELECT * FROM clients WHERE fname = 'Maria';
SELECT * FROM product WHERE category = 'Eletronico';
-- Expressões para gerar atributos derivados

-- Copiar código
SELECT idOrder, sendValue, sendValue * 1.10 AS totalValueWithTax FROM orders;
-- Ordenações dos dados com ORDER BY

-- Copiar código
SELECT * FROM clients ORDER BY Lname;
SELECT * FROM product ORDER BY avaliacao DESC;
-- Condições de filtros aos grupos – HAVING Statement

-- Copiar código
SELECT idCliente, COUNT(*) AS totalOrders
FROM orders
GROUP BY idOrderClient
HAVING totalOrders > 1;
-- Junções entre tabelas para fornecer uma perspectiva mais complexa dos dados

-- Copiar código
-- Quantos pedidos foram feitos por cada cliente?
SELECT c.idCliente, c.fname, COUNT(o.idOrder) AS numOrders
FROM clients c
JOIN orders o ON c.idCliente = o.idOrderClient
GROUP BY c.idCliente, c.fname;

-- Algum vendedor também é fornecedor?
SELECT s.SocialName
FROM seller s
JOIN supplier sp ON s.CNPJ = sp.CNPJ;

-- Relação de produtos fornecedores e estoques
SELECT p.Pname, ps.quantity
FROM product p
JOIN productStorage ps ON p.idProduct = ps.idProdStorage;

-- Relação de nomes dos fornecedores e nomes dos produtos
SELECT sp.socialName, p.Pname
FROM supplier sp
JOIN product p ON sp.idSupplier = p.idProduct;