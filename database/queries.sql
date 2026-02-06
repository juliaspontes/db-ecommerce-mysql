/*
Business Queries for E-commerce Database
Author: Julia Pontes
*/

-- Ranking de produtos mais vendidos
SELECT 
    pr.nome,
    SUM(ip.quantidade) AS total_vendido
FROM itens_pedidos ip
JOIN produtos pr 
    ON ip.id_produto = pr.id_produto
GROUP BY pr.nome
ORDER BY total_vendido DESC;

-- Faturamento total
SELECT 
    SUM(valor_total) AS faturamento_total
FROM pedidos
WHERE id_status = 2;

-- Faturamento Mensal
SELECT 
    DATE_FORMAT(data_pedido, '%Y-%m') AS mes,
    ROUND(SUM(valor_total),2) AS faturamento
FROM pedidos
WHERE id_status = 2
GROUP BY mes
ORDER BY mes;

-- Ticket médio
SELECT 
    ROUND(AVG(valor_total),2) AS ticket_medio
FROM pedidos
WHERE id_status = 2;

-- Lista de pedidos com clientes
SELECT 
    p.id_pedido,
    c.nome,
    p.valor_total,
    s.descricao AS status,
    p.data_pedido
FROM pedidos p
JOIN clientes c 
    ON p.id_cliente = c.id_cliente
JOIN status s 
    ON p.id_status = s.id_status
ORDER BY p.data_pedido DESC;

-- Cliente com maior número de pedidos
SELECT 
    c.nome,
    COUNT(p.id_pedido) AS total_pedidos
FROM clientes c
JOIN pedidos p 
    ON c.id_cliente = p.id_cliente
GROUP BY c.nome
ORDER BY total_pedidos DESC
LIMIT 1;


