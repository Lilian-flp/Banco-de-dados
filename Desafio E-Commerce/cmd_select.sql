show databases;
use ecommerce;
show tables;

-- pessoa fisica
select f.nomePfisica, f.sobrenomePfisica, f.cpf, f.rg, c.emailCliente, c.contatoCliente from cliente c, Pfisica f
		where c.idFisica = f.idFisica;
        
 -- pessoa juridica   
 desc Pjuridica;
 select j.razaoSocialPJ, j.cnpjPJ, c.ContatoCliente, c.emailCliente  from cliente c, Pjuridica j
		where c.idJuridica = j.idJuridica;


-- verificar quantidade de estoque disponivel, junto ao fonecedor e deposito
desc fornecedor;
desc estoque;
select f.razaoSocialFor as 'Fornecedor', f.cnpjFonecedor as 'CNPJ', e.localEstoque as 'Deposito', f.nomeProd as 'Produto', e.quantEstoque as 'Quantidade'
		from estoque e, fornecedor f
		where e.idFornecedor = f.idFornecedor;
        
-- contar quantidade de poduto disponivel 


 -- verificar tabelas de produtos 
 desc vendedor;
 desc produto;
 desc estoque;
 desc fornecedor;
 select v.razaoSocialVend as 'Vendedor', f.nomeProd as 'Produto', p.valorP as 'Valor', p.descricaoP as 'Descricao'
		from produto p, vendedor v, fornecedor f, estoque e
		where p.idvendedor = v.idVendedor and p.idEstoque = e.idEstoque and e.idFornecedor = f.idFornecedor;
        
-- verificar pedidos Juridico
desc pedido;
desc produto;
desc fornecedor;
desc estoque;
desc cliente;
select * from pedido;
select v.razaoSocialVend as 'Vendedor', j.razaoSocialPJ as 'Cliente', f.nomeProd as 'Produto', 
		p.categoria as 'Categoria', p.valorP as 'Preço', p.descricaoP as 'Descricao'
		from produto p, vendedor v, pedido d, cliente c, fornecedor f, estoque e, Pfisica s, Pjuridica j
		where p.idvendedor = v.idVendedor and p.idEstoque = e.idEstoque and e.idFornecedor = f.idFornecedor 
        and p.idProduto = d.idProduto and d.idCliente = c.idCliente and c.idJuridica = j.idJuridica
        order by cliente;
        
        
 -- pessoa fisica  
 desc pedido;
 select* from pedido;
 select * from cliente;
	select v.razaoSocialVend as 'Vendedor', s.nomePfisica as 'Cliente', f.nomeProd as 'Produto', p.valorP as 'Preço', p.descricaoP as 'Descricao'
		from produto p, vendedor v, pedido d, cliente c, fornecedor f, estoque e, Pfisica s
		where d.idProduto = p.idProduto and p.idVendedor = v.idVendedor
        and p.idEstoque = e.idEstoque and e.idFornecedor = f.idFornecedor 
		and d.idCliente = c.idCliente and c.idFisica = s.idFisica
        order by cliente;
        
-- venda por boleto	
select * from boleto;

	select v.razaoSocialVend as 'Vendedor', s.nomePfisica as 'Cliente', f.nomeProd as 'Produto', 
		p.valorP as 'Preço', b.dataVencBoleto as 'Data Vencimento', b.dataGeradaBoleto as 'Data Boleto'
		from produto p, vendedor v, pedido d, cliente c, fornecedor f, estoque e, Pfisica s, boleto b
		where d.idProduto = p.idProduto and p.idVendedor = v.idVendedor
        and p.idEstoque = e.idEstoque and e.idFornecedor = f.idFornecedor 
		and d.idCliente = c.idCliente and c.idFisica = s.idFisica
        and d.idBoleto = b.idBoleto
        order by cliente;
        
        
        -- venda por cartao	
select * from cartao;

	select v.razaoSocialVend as 'Vendedor', s.nomePfisica as 'Cliente', f.nomeProd as 'Produto', 
		p.valorP as 'Preço', a.formPag as 'Pagamento'
		from produto p, vendedor v, pedido d, cliente c, fornecedor f, estoque e, Pfisica s, cartao a
		where d.idProduto = p.idProduto and p.idVendedor = v.idVendedor
        and p.idEstoque = e.idEstoque and e.idFornecedor = f.idFornecedor 
		and d.idCliente = c.idCliente and c.idFisica = s.idFisica
        and d.idCartao = a.idCartao
        order by cliente;
        
        
                -- venda por pix	
select * from pix;

	select v.razaoSocialVend as 'Vendedor', s.nomePfisica as 'Cliente', f.nomeProd as 'Produto', 
		p.valorP as 'Preço'
		from produto p, vendedor v, pedido d, cliente c, fornecedor f, estoque e, Pfisica s, pix i
		where d.idProduto = p.idProduto and p.idVendedor = v.idVendedor
        and p.idEstoque = e.idEstoque and e.idFornecedor = f.idFornecedor 
		and d.idCliente = c.idCliente and c.idFisica = s.idFisica
        and d.idPix = i.idPix
        order by cliente;
        
        
  -- verificaçao tabela entrega      
select * from entrega;

select s.nomePfisica as 'Cliente', f.nomeProd as 'Produto', p.valorP as 'Preço', t.statusEntrega as 'Status', t.codRastreio as 'Codigo Rastreio'
		from produto p, vendedor v, pedido d, cliente c, fornecedor f, estoque e, Pfisica s, entrega t
		where d.idProduto = p.idProduto and p.idVendedor = v.idVendedor
        and p.idEstoque = e.idEstoque and e.idFornecedor = f.idFornecedor 
		and d.idCliente = c.idCliente and c.idFisica = s.idFisica
        and t.idPedido = d.idPedido
        order by cliente;
        
-- verificar quantidade de estoque e valor total
select f.nomeProd, f.razaoSocialFor, sum(e.quantEstoque * p.valorP)   as 'Valor Total'
from estoque e, fornecedor f, produto p
where e.idFornecedor = f.idFornecedor and e.idEstoque = p.idEstoque
group by  nomeProd, razaoSocialFor;
-- order by estoque;

-- verificação com having

select sum(quantEstoque ) as 'Quantidade'
from estoque 
group by  quantEstoque
having sum(quantEstoque)>5;

-- verificar fornecedor e cliente
desc vendedor;
desc fornecedor;

select v.cnpfVend, f.cnpjFonecedor from fornecedor f
inner join vendedor v on v.cnpfVend = f.cnpjFonecedor
order by cnpfVend ;

select * from vendedor;

