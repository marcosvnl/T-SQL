--SELEÇÃO DE PRODUTOS

SELECT V.cdVendas,
	   C.nmCliente,
	   P.cdProduto, 
	   P.nmProduto, 
	   PV.qtProduto, 
	   P.vlProduto, 
	   qtProduto * vlProduto AS qtValorTotalProduto,
	   TOTAL_VENDAS.TotalProduto,
	   TOTAL_VENDAS.TotalVenda
FROM tb_Produtos P
INNER JOIN tb_ProdutoVenda PV ON P.cdProduto = PV.cdProduto
INNER JOIN tb_Vendas V ON PV.cdVendas = V.cdVendas
INNER JOIN tb_Clientes C ON V.cdCliente = C.cdCliente

INNER JOIN(
	SELECT V.cdVendas, SUM(PV.qtProduto) TotalProduto, SUM(P.vlProduto * PV.qtProduto) TotalVenda
	FROM tb_Produtos P
	INNER JOIN tb_ProdutoVenda PV ON P.cdProduto = PV.cdProduto
	INNER JOIN tb_Vendas V ON PV.cdVendas = V.cdVendas
	GROUP BY V.cdVendas
) TOTAL_VENDAS ON V.cdVendas = TOTAL_VENDAS.cdVendas



