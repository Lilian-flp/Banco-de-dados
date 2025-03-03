show databases;
use oficina;
show tables;

select * from cliente;

select * from mecanico;

select * from estoque;

select * from reparo;

select * from manutencao;

desc servico;
select * from servico;

-- reparo
select r.descricaoRep, s.descricaoServ from servico s, reparo r
where  s.idReparo = r.idReparo;

-- manutencao
select m.descricaoManu, s.descricaoServ from servico s, manutencao m
where  s.idManutencao = m.idManutencao;


select * from Ordem;
desc Ordem;

select c.nomeC as 'Cliente', m.nomeM as 'Mercanico',
e.nomeE as 'Peca',s.descricaoServ as 'Servico', o.dataEmissao as 'Data Entrada', o.dataConclusao as 'Data Finalização',
o.statusOrdem as 'Status', o.descricao as 'Descricao', o.valorPeca as 'Preco', o.valorMobra as 'Mão de Obra',
sum(o.valorPeca + o.valorMobra) as 'Total'
from cliente c, mecanico m, estoque e, Ordem o, servico s
where o.idCliente = c.idCliente and  o.idMecanico = m.idMecanico and o.idEstoque = e.idEstoque and o.idServico = s.idServico
group by o.idOrdem
order by dataConclusao desc;

-- idOrdem as 'Ordem de Servico', valorPeca as 'Preco', valorMobra as 'Mão de Obra', sum(valorPeca + valorMobra
select idOrdem, dataConclusao, sum(valorPeca + valorMobra) as 'total' from Ordem
group by idOrdem, dataConclusao
having sum(valorPeca + valorMobra) >200;

