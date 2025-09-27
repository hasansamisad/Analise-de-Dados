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

create table Products (
	idProduct int auto_increment primary key,
    Pname varchar(10),
	classification_kids bool default false,
    category enum("Eletrônico", "Vestimenta", "Alimentos","Móveis") not null,
    avaliação float default 0,
    size varchar(10)
);

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

-- criar tabela estoque
CREATE TABLE productsStorages(
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






