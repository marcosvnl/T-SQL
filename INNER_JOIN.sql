--Soma dos valores dos produtos

SELECT * FROM tb_ProdutoVenda;
SELECT * FROM tb_Produtos;

--Sele��o de dados com valores
--INNER JOIN (A JUN��O (M�IO))
--LEFT JOIN (S� A ESQUERA DA JUN��O)
--RIGHT JOIN (S� A DIREITA DA JUN��O)

SELECT * FROM tb_Produtos P INNER JOIN tb_ProdutoVenda PV
ON P.cdProduto = PV.cdProduto;

SELECT P.cdProduto, V.cdVendas, C.nmCliente, P.nmProduto, PV.qtProduto, P.vlProduto FROM tb_Produtos P
INNER JOIN tb_ProdutoVenda PV ON P.cdProduto = PV.cdProduto
INNER JOIN tb_Vendas V ON PV.cdVendas = V.cdVendas
INNER JOIN tb_Clientes C ON V.cdCliente = C.cdCliente