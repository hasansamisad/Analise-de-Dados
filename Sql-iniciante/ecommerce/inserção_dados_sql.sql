-- inserção de dados e queries
use ecommerce;

show tables;

-- idClient, Fname, Minit, Lname, CPF, Address
insert into clients (Fname, Minit, Lname, CPF, Address)
values 
('Maria','M','Silva',12346789,'rua silva de prata 29, Carangola - Cidade das flores'),
('Matheus','O','Pimentel',987654321,'rua alameda das flores 28, Centro - Cidade das flores'),
('Ricardo','K','Silva',456789513,'avenida alice de castro 89, Centro - Cidade das flores'),
('Julia','S','Franca',789123456,'rua maria das dores 42, Centro - Cidade das flores'),
('Roberta','G','Assis',987456321,'avenida koller 19, Centro - Cidade das flores'),
('Isabela','M','Cruz',654789123,'rua alameda das flores 28, Centro - Cidade das flores');

-- idProduct, Pname, classification_kids boolean, category('Eletrônico','Vestuário','Brinquedos','Alimentos','Móveis'), avaliacao, size
insert into product (Pname, classification_kids, category, avaliacao, size) values
('Fone de ouvido',false,'Eletrônico',4,null),
('Barbie Elsa',true,'Brinquedos',3,null),
('Body Carters',true,'Vestuário',5,null),
('Microfone Vedo',false,'Eletrônico',4,null),
('Sofá retrátil',false,'Móveis',3,'3x57x80'),
('Farinha de arroz',false,'Alimentos',2,null),
('Fire Stick Amazon',false,'Eletrônico',3,null);

delete from orders where idOrderClient in (1,2,3,4);

insert into orders (idOrderClient, orderStatus, orderDescription, sendValue, paymentCash) values
    (1, default, 'compra via aplicativo', null, 1),
    (2, default, 'compra via aplicativo', 50, 0),
    (3, 'Confirmado', null, null, 1),
    (4, default, 'compra via web site', 150, 0);

-- idProduct, idPorder, poQuantity, poStatus
select * from orders;

insert into productOrder (idPOproduct, idPOorder, poQuantity, poStatus) values
    (1,1,2,null),
    (2,1,1,null),
    (1,2,1,null);

-- storageLocation, quantity
insert into productStorage (storageLocation, quantity) values
    ('Rio de Janeiro', 1000),
    ('Rio de Janeiro', 500),
    ('São Paulo', 10),
    ('São Paulo', 100),
    ('São Paulo', 10),
    ('Brasília', 60);

-- idProduct, idLStorage, location
insert into storageLocation (idLproduct, idLStorage, location) values
    (1, 2, 'RJ'),
    (2, 6, 'GO');
    
    
-- Inserindo fornecedores na tabela supplier
insert into supplier (SocialName, CNPJ, contact) values
('Almeida e Filhos', '123456789123456', '219587474'),
('Eletrônicos Silva', '854519649143457', '219854784'),
('Eletrônicos Valma', '934568793495695', '219754474');

-- idPsSupplier, idPsProduct, quantity
insert into productSupplier (idPsSupplier, idPsProduct, quantity) values
    (1,2,500),
    (1,2,400),
    (2,4,633),
    (3,3,5),
    (2,5,10);

-- idSeller, SocialName, AbstName, CNPJ, CPF, location, contact
insert into seller (SocialName, AbstName, CNPJ, CPF, location, contact) values
    ('Tech electronics', null, 123456789456321, null, 'Rio de Janeiro', 219946287),
    ('Botique Durgas', null, null, 123456783, 'Rio de Janeiro', 219567895),
    ('Kids World', null, 456789123654485, null, 'São Paulo', 1198657484);

select * from seller;


