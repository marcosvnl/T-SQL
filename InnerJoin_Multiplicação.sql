SELECT P.cdProduto, V.cdVendas, C.nmCliente, P.nmProduto, PV.qtProduto, P.vlProduto,
PV.qtProduto * P.vlProduto AS TotalValues --Soma dos produtos vendidos passando TotalValues como nome da coluna 
FROM tb_Produtos P
INNER JOIN tb_ProdutoVenda PV ON P.cdProduto = PV.cdProduto
INNER JOIN tb_Vendas V ON PV.cdVendas = V.cdVendas
INNER JOIN tb_Clientes C ON V.cdCliente = C.cdCliente
