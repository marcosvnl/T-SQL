SELECT C.nmCliente, SUM(PV.qtProduto) TotalProduto, SUM(P.vlProduto * PV.qtProduto) TotalVenda
FROM tb_Produtos P
INNER JOIN tb_ProdutoVenda PV ON P.cdProduto = PV.cdProduto
INNER JOIN tb_Vendas V ON PV.cdVendas = V.cdVendas
INNER JOIN tb_Clientes C ON V.cdCliente = C.cdCliente
GROUP BY C.nmCliente 
--Sum é um tipo de agrupamento, por isso usamos o grup by para add a coluna nmCliente q esta fora do agrupamento SUM 
