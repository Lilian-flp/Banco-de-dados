show databases ;
use ecommerce;
show tables;

-- tabela cliente
insert into Pfisica values ('1','15935745698','142583697','aparecida','Floriano'),
							('2','25835745689','251473698','lilian','silva'),
							('3','36925814789','157894563','maria','candida');

insert into Pjuridica values ('1','02550279000102','CONFECÇÕES LTDA'),
							 ('2','72142110000107','COMERCIO DE ARTIGOS'),
                             ('3','03708604000185','LUNARDELLI-ME');
                             
-- insert into clienteteste values ('1','1', null,'fisica','rua sei la','199857423','aparecida@teste');
							
insert into cliente values  ('1','1', null,'fisica','rua sei la','199857423','aparecida@teste'),
							('2',null,'1','Juridica','nadaa haver','11985741236','confeccaoes@teste'),
							('3','2',null,'fisica','maria pozza ','19923695847','lilian@teste'),
							('4',null,'2','Juridica','cla em cima','15987851236','comercioaart@teste'),
							('5','3',null,'fisica','la embaixo','1198564774','mariacandida@teste'),
							('6',null,'3','Juridica','no meio','1125369874','lunardeli@teste');
-- select pessoa fisica
select f.nomePfisica, f.sobrenomePfisica, f.cpf, f.rg, c.emailCliente, c.contatoCliente from cliente c, Pfisica f
	where c.idFisica = f.idFisica;

-- tabela produto fornecedor estoque e vendedor
desc fornecedor;

select * from fornecedor;

insert into fornecedor values ('1','malha confeccoes','00790810000199','11985741236','malhaconf@malha.com.br','camisa polo'),
							  ('2','confeccoes santana','81714354000108','13985251478','santana@teste.com.br','short'),
							  ('3','eltrotec ltda','08165191000153','11987451236','eletro@teste.com.br','cabos usb'),
                              ('4','almeida sort','01625156000120','15965321489','sort@teste.com.br','capa G20');


desc estoque;
insert into estoque values ('1','2','deposito1','10'),
							('2','4','deposito3','5'),
                            ('3','1','deposito2','15'),
                            ('4','3','deposito1','20');
                            			
select * from estoque;
-- verificar quantidade de estoque disponivel, junto ao fonecedor e deposito
select f.razaoSocialFor, f.cnpjFonecedor, e.localEstoque, e.quantEstoque from estoque e, fornecedor f;

insert into vendedor values ('1','jose comercio','rua nao sei','1145783692','jose@teste','25817435962',null),
							('2','casa de malhas','pinheiros','1895246473','casamalhas@teste',null,'12345678910235'),
                            ('4','almeida sort','primeira','15965321489','sort@teste.com.br',null,'01625156000120');

select * from vendedor;							
  
insert into produto values ('1','2','3','eletronico','509','produdo para uso de escritorio, garantia de 1 ano'),
						   ('2','1','4','eletronico','50','casa para celular'),	
						   ('3','2','1','roupa','130','camisas polos tamanha 5');					

select v.razaoSocialVend, p.categoria, p.valorP, p.descricaoP from produto p, vendedor v ;

-- inserção dados tabela boleto, pix, cartao, pedido, entrega

insert into boleto values ('1','509','2025-02-01','2025-02-05'); 
insert into boleto values ('2','lilian','40','2025-01-10','2025-01-15','jasmin'); 

select * from boleto;
insert into cartao values ('1','123456789','2033-06-15','debito','159','50');

insert into pix values ('1','ecommerce','130');

-- insert into pedido values ('1','1',null,null,'1','1','2025-03-20','confirmado','produdo comprado para presente','15'),
insert into pedido values ('2','1',1,null,null,'1','2025-03-20','confirmado','produdo comprado para presente','15');

select * from pedido;


insert into entrega values('1','2','coletado','BR12345678');