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