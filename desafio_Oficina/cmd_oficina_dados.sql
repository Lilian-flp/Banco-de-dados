show databases;
use oficina;

insert into cliente values('1','jose almeida','159857496','jose@teste.com','15935745685'),
						  ('2','joao correia','159857496','joao@teste.com','36925814778'),
                          ('3','marcelo ribeiro','159857441','marceloe@teste.com','14725836985'),
                          ('4','almeida silva','159852578','almeida@teste.com','35715978945');

insert into mecanico values ('1','joaquim','12','eletrica','159857496','joaquim@teste'),
							('2','mauro','13','motor','159857797','mauro@teste');


insert into estoque values ('1','autopecasIbrasileira','12345678910123','pecas eleticas','painel solar'),
						   ('2','acaia auto pecas','78945612310023','pastilh de freio','pastilhas'),
                           ('3','fujimura','32165498700012','correia dentada fiat','correia dentadar');


insert into manutencao values ('1','preventiva'),
							  ('2','freios'),
                              ('3','rotativa pneus');
                              
insert into reparo values ('1','freio'),
						  ('2','suspencao'),
                          ('3','motor'),
                          ('4','ar condicionado');
                          
  insert into servico values ('1',null,'1','reparo bfjwbvcbw'),                   
							  ('2','1',null,'reparo bfjwbvcbw'),
                              ('3',null,'2','reparo bfjwbvcbw'),
                              ('4','3',null,'reparo bfjwbvcbw');
                        

insert into Ordem values ('1','2','1','1','2','1234','2025+01+02','150','100','pendente','bhvhjfbvhbvue','2025-01-05'),
						 ('2','4','2','1','2','258','2024-12-20','200','300','finalizado','bjhbvjhsdbvhj','2024-12-24'),
                         ('3','3','2','2','4','159','2024-11-20','540','200','finalizado','jbbvbwbv','2024-11-25');
                         
                        
