 show databases;
 create database ecommerce;
 use ecommerce;
 show tables;
 
create table cliente (
	idCliente int auto_increment primary key,
    idFisica int,
    idJuridica int,
 	tipoCliente enum('Fisica','Juridica') not null,
    endCliente varchar(100) not null,
    ContatoCliente varchar(20) not null,
    emailCliente varchar(40) not null,
    constraint fk_pessoa_fisica foreign key(idFisica) references Pfisica(idFisica),
    constraint fk_pessoa_juridica foreign key(idJuridica) references Pjuridica(idJuridica)
 );
 
select * from cliente;
 desc cliente;
  
 create table Pfisica(
	idFisica int auto_increment primary key,
    cpf char(11) not null,
    rg char(10),
    nomePfisica varchar(20),
    sobrenomePfisica varchar(20),
	constraint unique_cpf_fisica unique (cpf),
	constraint unique_rg_fisica unique (rg)
 );
  
 create table Pjuridica(
	idJuridica int auto_increment primary key,
    cnpjPJ char (14) not null,
    razaoSocialPJ varchar(50) not null,
	constraint unique_cnpj_juridica unique (cnpjPJ)
 );
 
 
 create table vendedor (
	idVendedor int auto_increment primary key,
    razaoSocialVend varchar(30) not null,
    endercoVend varchar(100),
    contatoVend varchar(20) not null, 
    emailVend varchar(40) not null,
    cpfVend char(11),
    cnpfVend char(14)
	-- constraint unique_cpfVend unique (cpfVend),
  --  constraint unique_cnpjVend unique (cnpjVend)
 );
 desc vendedor;

 create table fornecedor (
	idFornecedor int auto_increment primary key,
    razaoSocialFor varchar(40),
    cnpjFonecedor char(14) not null,
    contatoF varchar(20) not null,
    emailF varchar(40) not null,
    nomeProd varchar(100),
    constraint unique_cnpjFonecedor unique (cnpjFonecedor)
 );
 show tables;
 
 create table estoque (
	idEstoque int auto_increment primary key,
    idFornecedor int,
    localEstoque varchar(50),
    quantEstoque int,
    constraint fk_fornecedor foreign key (idFornecedor) references fornecedor(idFornecedor)
);
desc estoque;
 
 create table produto (
	idProduto int auto_increment primary key,
    idVendedor int,
    idEstoque int,
    categoria varchar(40),
    valorP float,
    descricaoP varchar (100),
    constraint fk_vendedor foreign key (idvendedor) references vendedor(idVendedor),
    constraint fk_estoque foreign key(idEstoque) references estoque(idEstoque)
 );
 
 show tables; 
 desc produto;
 
 drop tables entrega, boleto, pix,cartao,pedido;
 
 create table pedido (
	idPedido int auto_increment primary key,
    idCliente int,
    idBoleto int,
    idCartao int,
    idPix int,
    idProduto int,
    -- tipoPagmento enum('Boleto','Cartao','Pix'),
    dataEntrega date not null,
    statusPedido enum('Confirmado','Andamento','Cancelado') not null,
    descricao varchar(100),
    frete float not null,
    constraint fk_cliente foreign key(idCliente) references cliente (idCliente),
    constraint fk_boleto foreign key(idBoleto) references boleto(idBoleto),
	constraint fk_cartao foreign key(idCartao) references cartao(idCartao),
	constraint fk_pix foreign key(idPix) references pix(idPix),
	constraint fk_produto foreign key(idProduto) references produto(idProduto)
 );
 desc pedido;
 
 create table boleto (
	idBoleto int auto_increment primary key,
    valor float not null,
    dataVencBoleto date not null,
    dataGeradaBoleto date not null
 );
 
 
 create table cartao (
	idCartao int auto_increment primary key,
    numCartao varchar(10) not null,
    dataVencCartao date not null,
    formPag varchar(10) not null,
    cvv int not null,
    valorcartao float
 
 );
 
 
 create table pix (
	idPix int auto_increment primary key,
    chave varchar(100) not null,
    valorPix float not null
 
 );
 
 
 create table entrega (
	idEntrega int auto_increment primary key,
    idPedido int,
	statusEntrega enum('Coletado','Enviado','Entregue'),
    codRastreio varchar(20),
    constraint fk_pedido foreign key(idPedido) references pedido(idPedido)
 
 );
 
 show tables;
 
 
 
 