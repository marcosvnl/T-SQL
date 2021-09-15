--inserinto novos produtos

--inserir uma cliente
INSERT INTO tb_Clientes VALUES (
	'Marcos Vinicius', 
	'1985-03-18', 
	'M', 
	'Rua Pedro Padovani, 185',
	'São Paulo',
	'SP',
	'11 123456789',
	'11 9123456789'
);

--inserir uma venda
INSERT INTO tb_Vendas VALUES(
	1,
	'2021-08-03'
);

INSERT INTO tb_Vendas VALUES(
	1,
	GETDATE() -- PEGAR DATA DO DIA
);

--inserir uma venda
INSERT INTO tb_ProdutoVenda VALUES(
	1,
	1,
	3
);
SELECT * FROM tb_ProdutoVenda