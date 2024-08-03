# Projeto de E-commerce
Este repositório contém o esquema lógico de um banco de dados para um sistema de e-commerce. O objetivo é fornecer uma estrutura robusta para gerenciar clientes, produtos, pedidos, pagamentos, fornecedores e vendedores. O banco de dados foi modelado para suportar operações típicas de um sistema de comércio eletrônico e inclui exemplos de consultas SQL para testar e interagir com o banco de dados.

Contexto
O sistema de e-commerce foi projetado para gerenciar os seguintes aspectos:

### Clientes:
 Informações sobre clientes, diferenciando pessoas físicas (PF) e jurídicas (PJ).
### Produtos:
 Detalhes dos produtos disponíveis para venda, incluindo categorias e avaliações.
### Pedidos: 
Informações sobre pedidos feitos pelos clientes, incluindo status e métodos de pagamento.
### Pagamentos:
 Registro das formas de pagamento utilizadas pelos clientes.
### Fornecedores: 
Dados sobre fornecedores que fornecem produtos para o e-commerce.
### Vendedores:
 Informações sobre vendedores que também podem ser fornecedores.
Esquema Lógico do Banco de Dados
Tabelas
Clientes (clients)

idCliente (INT, PK, AUTO_INCREMENT): Identificador único do cliente.
fname (VARCHAR): Primeiro nome do cliente.
Minit (CHAR): Inicial do meio nome.
Lname (CHAR): Sobrenome do cliente.
CPF (CHAR): CPF do cliente (único).
Address (VARCHAR): Endereço do cliente.
Produtos (product)

idProduct (INT, PK, AUTO_INCREMENT): Identificador único do produto.
Pname (VARCHAR): Nome do produto.
classification_kids (BOOL): Indica se o produto é para crianças.
category (ENUM): Categoria do produto (Eletrônico, Vestimenta, Brinquedo, Alimentos, Móveis).
avaliacao (FLOAT): Avaliação do produto.
size (VARCHAR): Tamanho do produto (se aplicável).
Pedidos (orders)

idOrder (INT, PK, AUTO_INCREMENT): Identificador único do pedido.
idOrderClient (INT, FK): Identificador do cliente (referência à tabela clients).
ordersStatus (ENUM): Status do pedido (Cancelado, Confirmado, Em processamento).
ordersDescription (VARCHAR): Descrição do pedido.
sendValue (FLOAT): Valor do envio.
paymentCash (BOOL): Indica se o pagamento foi em dinheiro.
Pagamentos (payments)

idClient (INT, FK): Identificador do cliente (referência à tabela clients).
id_payment (INT, PK): Identificador único do pagamento.
typePayment (ENUM): Tipo de pagamento (Boleto, Cartão, Dois cartões).
limitAvaliable (FLOAT): Limite disponível para o pagamento.
Estoque (productStorage)

idProdStorage (INT, PK, AUTO_INCREMENT): Identificador único do armazenamento.
storageLocation (VARCHAR): Localização do armazenamento.
quantity (INT): Quantidade disponível.
Fornecedores (supplier)

idSupplier (INT, PK, AUTO_INCREMENT): Identificador único do fornecedor.
socialName (VARCHAR): Nome social do fornecedor.
CNPJ (CHAR): CNPJ do fornecedor (único).
contact (CHAR): Contato do fornecedor.
Vendedores (seller)

idSeller (INT, PK, AUTO_INCREMENT): Identificador único do vendedor.
SocialName (VARCHAR): Nome social do vendedor.
CNPJ (CHAR): CNPJ do vendedor (único).
CPF (CHAR): CPF do vendedor (opcional).
location (VARCHAR): Localização do vendedor.
contact (CHAR): Contato do vendedor.
Relacionamento Produto-Vendedor (productSeller)

idPseller (INT, FK): Identificador do vendedor (referência à tabela seller).
idPproduct (INT, FK): Identificador do produto (referência à tabela product).
prodQuantity (INT): Quantidade do produto fornecido pelo vendedor.
Relacionamento Pedido-Produto (productOrder)

idPOproduct (INT, FK): Identificador do produto (referência à tabela product).
idPOorder (INT, FK): Identificador do pedido (referência à tabela orders).
poQuantity (INT): Quantidade do produto no pedido.
poStatus (ENUM): Status do produto no pedido (Disponível, Sem estoque).
Localização do Armazenamento (storageLocation)

idLproduct (INT, FK): Identificador do produto (referência à tabela product).
idLstorage (INT, FK): Identificador do armazenamento (referência à tabela productStorage).
location (VARCHAR): Localização específica do armazenamento.