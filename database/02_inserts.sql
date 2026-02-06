INSERT INTO categorias (descricao) VALUES
('Eletrônicos'),
('Roupas'),
('Casa e Cozinha'),
('Livros');

INSERT INTO status (descricao) VALUES
('Pendente'),
('Pago'),
('Enviado'),
('Entregue'),
('Cancelado');

INSERT INTO clientes 
(nome, cpf, email, telefone, data_nascimento, data_cadastro)
VALUES
('Julia Pontes','12345678901','julia@email.com','11999999999','2001-07-27',NOW()),
('Carlos Silva','98765432100','carlos@email.com','11988888888','1995-03-10',NOW()),
('Marina Souza','45612378900','marina@email.com','11977777777','1998-11-02',NOW());

INSERT INTO enderecos
(id_cliente, rua, numero, complemento, cidade, estado, cep)
VALUES
(1,'Rua das Flores','123','Apto 12','São Paulo','SP','01000-000'),
(2,'Av Paulista','1500',NULL,'São Paulo','SP','01310-000'),
(3,'Rua Azul','45','Casa','Campinas','SP','13000-000');

INSERT INTO produtos
(nome, descricao, preco, estoque, id_categoria, ativo)
VALUES
('Notebook Dell','16GB RAM, SSD 512GB',4500.00,10,1,TRUE),
('Camiseta Básica','Algodão, várias cores',59.90,100,2,TRUE),
('Air Fryer','5L, 110v',399.00,25,3,TRUE),
('Livro SQL','Aprenda banco de dados',89.90,50,4,TRUE);

INSERT INTO pedidos
(id_cliente, data_pedido, valor_total, id_status)
VALUES
(1,NOW(),4589.90,2),
(2,NOW(),59.90,1);

INSERT INTO itens_pedidos
(id_pedido, id_produto, quantidade, preco_unitario)
VALUES
(1,1,1,4500.00),
(1,4,1,89.90),
(2,2,1,59.90);

INSERT INTO entregas
(id_pedido, codigo_rastreio, data_envio, data_prevista, id_status)
VALUES
(1,'BR123456789','2025-02-05','2025-02-10','3');
