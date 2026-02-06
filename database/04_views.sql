CREATE VIEW vw_faturamento_geral AS
SELECT 
    ROUND(SUM(valor_total),2) AS faturamento_total,
    ROUND(AVG(valor_total),2) AS ticket_medio,
    COUNT(id_pedido) AS total_pedidos
FROM pedidos
WHERE id_status = 2;

SELECT * FROM vw_faturamento_geral;



CREATE VIEW vw_top_clientes AS
SELECT 
    c.id_cliente,
    c.nome,
    ROUND(SUM(p.valor_total),2) AS total_gasto,
    COUNT(p.id_pedido) AS qtd_pedidos
FROM clientes c
JOIN pedidos p 
    ON c.id_cliente = p.id_cliente
WHERE p.id_status = 2
GROUP BY c.id_cliente, c.nome
ORDER BY total_gasto DESC;

select * from vw_top_clientes;




CREATE VIEW vw_produtos_mais_vendidos AS
SELECT 
    pr.id_produto,
    pr.nome,
    SUM(ip.quantidade) AS total_vendido
FROM itens_pedidos ip
JOIN produtos pr 
    ON ip.id_produto = pr.id_produto
GROUP BY pr.id_produto, pr.nome
ORDER BY total_vendido DESC;

select * from vw_produtos_mais_vendidos;




CREATE VIEW vw_pedidos_detalhados AS
SELECT 
    p.id_pedido,
    c.nome AS cliente,
    p.valor_total,
    s.descricao AS status,
    p.data_pedido
FROM pedidos p
JOIN clientes c 
    ON p.id_cliente = c.id_cliente
JOIN status s 
    ON p.id_status = s.id_status;

select * from vw_pedidos_detalhados
