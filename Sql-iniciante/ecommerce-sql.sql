create database ecommerce;

use ecommerce;

create table clients (
	idClient int auto_increment primary key,
    Fname varchar(10),
    Minit char(3),
    Lname varchar(20),
    CPF char(11) not null,
    Address varchar(30),
    constraint unique_cpf_client unique (CPF)
);

desc clients;

show tables; 

create table Products (
	idProduct int auto_increment primary key,
    Pname varchar(10),
	classification_kids bool default false,
    category enum("Eletrônico", "Vestimenta", "Alimentos","Móveis") not null,
    avaliação float default 0,
    size varchar(10)
);

desc Products;

-- tabela de pagamentos para ser refinada

create table payments(
	idClient int,
    idPayment int,
    typePayment enum("Boleto", "Cartão", "Dois cartões"),
    limitAvaible float,
    primary key(idClient, idPayment)
);

-- tabela de pedidos

CREATE TABLE orders(
	idOrder int auto_increment primary key,
    idOrderClient int,
    orderStatus enum("Cancelado", "Confirmado", "Em processamento") default "Em processamento",
	orderDescription varchar(255),
    sendValue float default 10,
    paymentCash bool default false,
    constraint fk_order_client foreign key (idOrderClient) references clients(idClient)
);
desc orders;


-- criar tabela estoque
CREATE TABLE productStorage(
	idProductStorage int auto_increment primary key,
    storageLocation varchar(255),
    quanty int default 0
);

create table supplier(
	idSupplier int auto_increment primary key,
    SocialName varchar(255) not null,
    CNPJ char(15) not null,
    contact char(11) not null,
    constraint unique_supplier unique (CNPJ)
);
desc supplier;

-- criar tabela vendedor
create table seller(
	idSeller int auto_increment primary key,
    SocialName varchar(255) not null,
    AbstName varchar(255),
    CNPJ char(15),
    CPF char(11),
    location varchar(255),
    contact char(11) not null,
    constraint unique_cnpj_seller unique (CNPJ),
    constraint unique_cpf_seller unique (CPF)
);

desc seller;

create table productSeller(
	idPseller int,
    idProduct int,
    prodQuantity int default 1,
    primary key (idPseller, idProduct),
    constraint fk_product_seller foreign key (idPseller) references seller(idSeller),
    constraint fk_product_product foreign key (idProduct) references Products(idProduct)
);

desc productSeller;

create table productOrder(
	idPOproduct int,
    idPOorder int,
    poQuantity int default 1,
    poStatus enum("Disponível", "Sem estoque") default "Disponível",
    primary key (idPOproduct, idPOorder),
    constraint fk_productOrder_seller foreign key (idPOproduct) references Products(idProduct),
    constraint fk_productOrder_product foreign key (idPOorder) references orders(idOrder)
 );

create table storageLocation(
	idLproduct int,
    idLstorage int,
    location varchar(255) not null,
    primary key (idLproduct, idLstorage),
    constraint fk_storage_location_product foreign key (idLproduct) references Products(idProduct),
    constraint fk_storage_location_storage foreign key (idLstorage) references productStorage(idProductStorage)
);

create table productSupplier(
	idPsSupplier int,
    idPsProduct int,
    quantity int not null,
    primary key (idPsSupplier, idPsProduct),
    constraint fk_product_supplier_supplier foreign key (idPsSupplier) references supplier(idSupplier),
	constraint fk_product_supplier_product foreign key (idPsProduct) references Products(idProduct)
);

desc productSupplier;

show tables;


-- buscando constraints do banco de dados
show databases;
use information_schema;
show tables;
desc referential_constraints;
select * from referential_constraints where constraint_schema = "ecommerce";




