SELECT * FROM itens_notas_fiscais WHERE QUANTIDADE > 60 AND PRECO <= 3

SELECT * FROM tabela_de_clientes WHERE NOME LIKE '%Mattos'

/*
(NOT ((3 > 2) OR (4 >= 5)) AND (5 > 4) ) OR (9 > 0)
(NOT ((Verdadeiro) OR (Falso)) AND (Verdadeiro) ) OR (Verdadeiro)
(NOT (Verdadeiro) AND (Verdadeiro) ) OR (Verdadeiro)
(Falso AND Verdadeiro) OR (Verdadeiro)
(Falso) OR (Verdadeiro)
Verdadeiro
*/

--Evita trazer dados repetidos 
SELECT DISTINCT BAIRRO FROM tabela_de_clientes WHERE CIDADE = 'Rio de Janeiro'
--Limita quantidade de linhas que deve ser exibida
SELECT * FROM notas_fiscais  WHERE DATA_VENDA = '2017-01-01' limit 10
--Ordena de forma decrescente ou ascendente
SELECT * FROM itens_notas_fiscais WHERE codigo_do_produto = '1101035' ORDER BY QUANTIDADE DESC

/*
SUM: SOMA
MAX: MÁXIMO
MIN: MÍNIMO
AVG: MÉDIA
COUNT: CONTA OCORRÊNCIAS
*/
SELECT MAX(`QUANTIDADE`) as 'MAIOR QUANTIDADE' FROM itens_notas_fiscais WHERE `CODIGO_DO_PRODUTO` = '1101035' ;

SELECT COUNT(*) FROM itens_notas_fiscais WHERE codigo_do_produto = '1101035' AND QUANTIDADE = 99;

--HAVING
    SELECT CPF, COUNT(*) FROM notas_fiscais
    WHERE YEAR(DATA_VENDA) = 2016
    GROUP BY CPF
    HAVING COUNT(*) > 2000

--Case When
    SELECT NOME,
    CASE WHEN YEAR(data_de_nascimento) < 1990 THEN 'Velho'WHEN YEAR(data_de_nascimento) >= 1990 AND
    YEAR(data_de_nascimento) <= 1995 THEN 'Jovens' 
    ELSE 'Crianças' END
    FROM tabela_de_clientes

--inner join
SELECT YEAR(DATA_VENDA), SUM(QUANTIDADE * PRECO) AS FATURAMENTO
FROM notas_fiscais NF INNER JOIN itens_notas_fiscais INF 
ON NF.NUMERO = INF.NUMERO
GROUP BY YEAR(DATA_VENDA)

--RIGHT JOIN
SELECT YEAR(DATA_VENDA), SUM(QUANTIDADE * PRECO) AS FATURAMENTO
FROM notas_fiscais NF RIGHT JOIN itens_notas_fiscais INF 
ON NF.NUMERO = INF.NUMERO
GROUP BY YEAR(DATA_VENDA)

--LEFT JOIN
SELECT YEAR(DATA_VENDA), SUM(QUANTIDADE * PRECO) AS FATURAMENTO
FROM notas_fiscais NF LEFT JOIN itens_notas_fiscais INF 
ON NF.NUMERO = INF.NUMERO
GROUP BY YEAR(DATA_VENDA)

--FULL JOIN
SELECT tabela_de_vendedores.BAIRRO,
tabela_de_vendedores.NOME, DE_FERIAS,
tabela_de_clientes.BAIRRO,
tabela_de_clientes.NOME  FROM tabela_de_vendedores FULL JOIN tabela_de_clientes
ON tabela_de_vendedores.BAIRRO = tabela_de_clientes.BAIRRO;

--CROSS JOIN , <-Funciona no mysql
SELECT tabela_de_vendedores.BAIRRO,
tabela_de_vendedores.NOME, DE_FERIAS,
tabela_de_clientes.BAIRRO,
tabela_de_clientes.NOME  FROM tabela_de_vendedores , tabela_de_clientes;
