show databases;
create database oficina;
use oficina;

create table cliente (
	idCliente int auto_increment primary key,
    nomeC varchar(50) null,
    contatoC varchar(15) null,
    emailC varchar(50),
    cpf char(11) null,
    constraint unique_cpf unique (cpf)
);

create table mecanico(
	idMecanico int auto_increment primary key,
    nomeM varchar(50) null,
    codigo int null,
    especialidade varchar(30) null,
    contatoM varchar(20) null,
    emailM varchar(50)
);

create table Ordem (
	idOrdem int auto_increment primary key,
    idCliente int,
    idMecanico int,
    idEstoque int,
    idServico int,
    numero int null, 
    dataEmissao date null,
    valorPeca float null,
    valorMobra float null,
    statusOrdem varchar(20) null,
    descricao varchar(200),
    dataConclusao date,
    constraint fk_idCliente foreign key(idCliente) references cliente (idCliente),
    constraint fk_idMecanico foreign key(idMecanico) references mecanico (idMecanico),
    constraint fk_idEstoque foreign key(idEstoque) references estoque (idEstoque),
	constraint fk_idServico foreign key(idServico) references servico (idServico)
);

show tables;

create table estoque(
	idEstoque int auto_increment primary key,
    fornecedor varchar(50),
    cnpj char(14),
    descricao varchar(100),
    nomeE varchar(50),
    constraint unique_cnpj unique (cnpj)
);

create table servico (
	idServico int auto_increment primary key,
    idManutencao int,
    idReparo int,
    descricaoServ varchar(200),
    constraint fk_manutencao foreign key(idManutencao) references manutencao (idManutencao),
    constraint fk_reparo foreign key (idReparo) references reparo(idReparo)
);

create table manutencao(
	idManutencao int auto_increment primary key,
    descricaoManu varchar(200)
);

create table reparo (
	idReparo int auto_increment primary key,
    descricaoRep varchar(200) 
);


