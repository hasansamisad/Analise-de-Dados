show databases;

Create database oficina;
use oficina;

create table cliente (
	idCliente int auto_increment primary key,
    nome varchar(40) not null,
    telefone varchar(20) not null,
    email varchar(30),
    endereco varchar(100) not null,
    data_cadastro datetime default current_timestamp
);

create table clientePF(
	idCliente int primary key,
    cpf char(11) not null,
    constraint cpf_unique_clientePF unique(cpf),
    constraint fk_cpf_idCliente foreign key (idCliente) references cliente(idCliente)
);

create table clientePJ (
	idCliente int  primary key,
    cnpj char(14) not null,
    constraint cnpj_unique_clientePJ unique(cnpj),
    constraint fk_clientePJ foreign key (idCliente) references cliente(idCliente)
);

create table veiculo (
	idCliente int not null,
	placa varchar(8) not null primary key,
    marca varchar(15),
    modelo varchar(25),
    ano_fabricacao year not null,
    cor varchar(15),
    quilometragem int not null,
    constraint fk_cliente_veiculo foreign key(idCliente) references cliente(idCliente)
); 

create table equipe_mecanicos(
	id_equipe_mecanico int auto_increment primary key,
	nome_equipe varchar(10),
    especialidade varchar(15) unique
);

create table mecanico(
	id_mecanico int auto_increment primary key,
    nome varchar(30) not null,
    endereco varchar(100),
    salario decimal(10,2) not null,
    id_equipe_mecanico int,
    constraint fk_equipe foreign key (id_equipe_mecanico) references equipe_mecanicos(id_equipe_mecanico)
	on delete set null
);

