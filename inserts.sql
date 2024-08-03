

CREATE DATABASE ecommerce;
USE ecommerce;

-- Tabela Clients
CREATE TABLE clients (
    idCliente INT AUTO_INCREMENT PRIMARY KEY,
    fname VARCHAR(10),
    Minit CHAR(3),
    Lname CHAR(11),
    CPF CHAR(11) NOT NULL,
    Address VARCHAR(255),
    CONSTRAINT unique_cpf_client UNIQUE (CPF)
);

-- Tabela Product
CREATE TABLE product (
    idProduct INT AUTO_INCREMENT PRIMARY KEY,
    Pname VARCHAR(150) NOT NULL,
    classification_kids BOOL DEFAULT FALSE,
    category ENUM('Eletronico','Vestimenta','Brinquedo','Alimentos','Moveis') NOT NULL,
    avaliacao FLOAT DEFAULT 0,
    size VARCHAR(10)
);

-- Tabela Payments
CREATE TABLE payments (
    idClient INT,
    id_payment INT,
    typePayment ENUM('Boleto','Cartao','Dois cartoes'),
    limitAvaliable FLOAT,
    PRIMARY KEY(idClient, id_payment)
);

-- Tabela Orders
CREATE TABLE orders (
    idOrder INT AUTO_INCREMENT PRIMARY KEY,
    idOrderClient INT,
    ordersStatus ENUM('Cancelado','Confirmado','Em processamento') DEFAULT 'Em processamento',
    ordersDescription VARCHAR(255),
    sendValue FLOAT DEFAULT 10,
    paymentCash BOOL DEFAULT FALSE,
    CONSTRAINT fk_orders_client FOREIGN KEY (idOrderClient) REFERENCES clients(idCliente)
);

-- Tabela ProductStorage
CREATE TABLE productStorage (
    idProdStorage INT AUTO_INCREMENT PRIMARY KEY,
    storageLocation VARCHAR(255),
    quantity INT DEFAULT 0
);

-- Tabela Supplier
CREATE TABLE supplier (
    idSupplier INT AUTO_INCREMENT PRIMARY KEY,
    socialName VARCHAR(255) NOT NULL,
    CNPJ CHAR(15) NOT NULL,
    contact CHAR(11) NOT NULL,
    CONSTRAINT unique_supplier UNIQUE (CNPJ)
);

-- Tabela Seller
CREATE TABLE seller (
    idSeller INT AUTO_INCREMENT PRIMARY KEY,
    SocialName VARCHAR(255) NOT NULL,
    CNPJ CHAR(11) NOT NULL,
    CPF CHAR(9),
    location VARCHAR(255),
    contact CHAR(11) NOT NULL,
    CONSTRAINT unique_cnpj_seller UNIQUE(CNPJ),
    CONSTRAINT unique_cpf_seller UNIQUE(CPF)
);

-- Tabela ProductSeller
CREATE TABLE productSeller (
    idPseller INT,
    idPproduct INT,
    prodQuantity INT DEFAULT 1,
    PRIMARY KEY (idPseller, idPproduct),
    CONSTRAINT fk_product_seller FOREIGN KEY (idPseller) REFERENCES seller(idSeller),
    CONSTRAINT fk_product_product FOREIGN KEY (idPproduct) REFERENCES product(idProduct)
);

-- Tabela ProductOrder
CREATE TABLE productOrder (
    idPOproduct INT,
    idPOorder INT,
    poQuantity INT DEFAULT 1,
    poStatus ENUM('Disponivel','Sem estoque') DEFAULT 'Disponivel',
    PRIMARY KEY (idPOproduct, idPOorder),
    CONSTRAINT fk_productorder_product FOREIGN KEY (idPOproduct) REFERENCES product(idProduct),
    CONSTRAINT fk_productorder_order FOREIGN KEY (idPOorder) REFERENCES orders(idOrder)
);

-- Tabela StorageLocation
CREATE TABLE storageLocation (
    idLproduct INT,
    idLstorage INT,
    location VARCHAR(255) NOT NULL,
    PRIMARY KEY (idLproduct, idLstorage),
    CONSTRAINT fk_storage_location_product FOREIGN KEY (idLproduct) REFERENCES product(idProduct),
    CONSTRAINT fk_storage_location_storage FOREIGN KEY (idLstorage) REFERENCES productStorage(idProdStorage)
);