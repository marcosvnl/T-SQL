SELECT V.cdVendas, C.nmCliente,P.cdProduto, P.nmProduto, PV.qtProduto, P.vlProduto, qtProduto * vlProduto AS qtValorTotalProduto 
FROM tb_Produtos P
INNER JOIN tb_ProdutoVenda PV ON P.cdProduto = PV.cdProduto
INNER JOIN tb_Vendas V ON PV.cdVendas = V.cdVendas
INNER JOIN tb_Clientes C ON V.cdCliente = C.cdCliente

UNION ALL

SELECT V.cdVendas, C.nmCliente, NULL, 'Total produtos - Total vendas', SUM(PV.qtProduto) TotalProduto, NULL, SUM(P.vlProduto * PV.qtProduto) TotalVenda
FROM tb_Produtos P
INNER JOIN tb_ProdutoVenda PV ON P.cdProduto = PV.cdProduto
INNER JOIN tb_Vendas V ON PV.cdVendas = V.cdVendas
INNER JOIN tb_Clientes C ON V.cdCliente = C.cdCliente
GROUP BY V.cdVendas, C.nmCliente 
--EXEMPLO PARA DIDADICA DO UNION ALL, NÃO UTILIZAR ESSA GAMBIARA EM PROJETOS
