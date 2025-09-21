/* ===================================================
   RESUMO DE SQL - PRINCIPAIS TÓPICOS E COMANDOS
   =================================================== */

/* ------------------------------
   CRIAÇÃO DE DATABASE E USO
------------------------------ */

drop database loja;

-- Criar um banco de dados
CREATE DATABASE loja;

-- Escolher o banco para usar
USE loja;


/* ------------------------------
   CRIAÇÃO DE TABELAS
------------------------------ */
drop table clientes;

-- Criar tabela de clientes
CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT, -- Chave primária única
    nome VARCHAR(100) NOT NULL,                -- Nome do cliente (não pode ser nulo)
    email VARCHAR(150) UNIQUE,                 -- Email único
   data_cadastro DATE DEFAULT (CURDATE())       -- Data com valor padrão de hoje
);

-- Criar tabela de pedidos
CREATE TABLE pedidos (
    id_pedido INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT,                            -- FK para relacionar cliente
    valor DECIMAL(10,2) NOT NULL,              -- Valor do pedido
    data_pedido DATETIME DEFAULT NOW(),        -- Data e hora do pedido
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente) -- Criação de chave estrangeira
);


/* ------------------------------
   INSERINDO DADOS
------------------------------ */
-- Inserindo clientes
INSERT INTO clientes (nome, email)
VALUES ('João Silva', 'joao@email.com'),
       ('Maria Souza', 'maria@email.com');

-- Inserindo pedidos
INSERT INTO pedidos (id_cliente, valor)
VALUES (1, 150.75),
       (2, 300.00);


/* ------------------------------
   SELEÇÃO DE DADOS
------------------------------ */
-- Selecionar tudo
SELECT * FROM clientes;

-- Selecionar colunas específicas
SELECT nome, email FROM clientes;

-- Filtrar com WHERE
SELECT * FROM pedidos
WHERE valor > 200;

-- Ordenar com ORDER BY
SELECT * FROM pedidos
ORDER BY valor DESC;

-- Limitar resultados (MySQL)
SELECT * FROM clientes
LIMIT 1;


/* ------------------------------
   JUNÇÃO DE TABELAS
------------------------------ */
-- INNER JOIN (apenas correspondências)
SELECT c.nome, p.valor, p.data_pedido
FROM clientes c
INNER JOIN pedidos p ON c.id_cliente = p.id_cliente;

-- LEFT JOIN (traz todos os clientes mesmo sem pedidos)
SELECT c.nome, p.valor
FROM clientes c
LEFT JOIN pedidos p ON c.id_cliente = p.id_cliente;


/* ------------------------------
   FUNÇÕES DE AGREGAÇÃO
------------------------------ */
-- Contagem de registros
SELECT COUNT(*) AS total_clientes FROM clientes;

-- Soma de valores
SELECT SUM(valor) AS total_vendido FROM pedidos;

-- Média de valores
SELECT AVG(valor) AS media_valores FROM pedidos;

-- Agrupamento por cliente
SELECT id_cliente, SUM(valor) AS total_cliente
FROM pedidos
GROUP BY id_cliente
HAVING SUM(valor) > 200; -- Filtra após o agrupamento


/* ------------------------------
   ATUALIZAR E DELETAR
------------------------------ */
-- Atualizar um cliente
UPDATE clientes
SET email = 'novoemail@email.com'
WHERE id_cliente = 1;

-- Deletar um cliente
DELETE FROM clientes
WHERE id_cliente = 2;


/* ------------------------------
   VIEWS (visões)
------------------------------ */
-- Criar uma view com resumo de vendas por cliente
CREATE VIEW resumo_vendas AS
SELECT c.nome, SUM(p.valor) AS total_gasto
FROM clientes c
INNER JOIN pedidos p ON c.id_cliente = p.id_cliente
GROUP BY c.nome;


/* ------------------------------
   USUÁRIOS E PERMISSÕES (MySQL)
------------------------------ */
-- Criar um usuário
CREATE USER 'usuario1'@'localhost' IDENTIFIED BY 'senha123';

-- Dar permissão de SELECT em uma tabela
GRANT SELECT ON loja.clientes TO 'usuario1'@'localhost';

-- Remover permissão
REVOKE SELECT ON loja.clientes FROM 'usuario1'@'localhost';
