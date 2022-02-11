SELECT 
 MIN(p.valor_plano) AS faturamento_minimo,
 MAX(p.valor_plano) AS faturamento_maximo,
 ROUND(AVG(p.valor_plano), 2) AS faturamento_medio,
 SUM(p.valor_plano) AS faturamento_total
FROM planos AS p
JOIN usuarios AS u
ON p.plano_id = u.plano_id;

-- Quando o JOIN é feito, as funções matemáticas se baseiam nos valores entre as duas tabelas