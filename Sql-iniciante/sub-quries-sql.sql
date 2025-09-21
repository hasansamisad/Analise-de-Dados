-- =====================================================
-- NESTED QUERIES (SUBQUERIES) EM SQL
-- =====================================================
-- Subquery: uma consulta dentro de outra consulta
-- Pode retornar: um único valor, uma lista de valores ou uma tabela
-- =====================================================

-- =========================================
-- 1️⃣ Subquery retornando UM VALOR
-- =========================================
-- Exemplo: selecionar clientes com idade acima da média
SELECT nome, idade
FROM clientes
WHERE idade > (
    SELECT AVG(idade) FROM clientes
);
-- A subquery "SELECT AVG(idade) FROM clientes" retorna apenas um valor (a média)
-- Esse valor é usado na condição da query externa


-- =========================================
-- 2️⃣ Subquery retornando VÁRIOS VALORES
-- =========================================
-- Exemplo: selecionar clientes que moram em cidades com mais de 2 clientes
SELECT nome, cidade
FROM clientes
WHERE cidade IN (
    SELECT cidade
    FROM clientes
    GROUP BY cidade
    HAVING COUNT(*) > 2
);
-- A subquery retorna várias cidades
-- A query externa seleciona todos os clientes que moram nessas cidades


-- =========================================
-- 3️⃣ Subquery na CLAUSULA FROM (TABELA DERIVADA)
-- =========================================
-- Exemplo: calcular a idade média por cidade e selecionar cidades acima da média geral
SELECT cidade, media_idade
FROM (
    SELECT cidade, AVG(idade) AS media_idade
    FROM clientes
    GROUP BY cidade
) AS tabela_cidade
WHERE media_idade > (
    SELECT AVG(idade) FROM clientes
);
-- Aqui a subquery na FROM cria uma "tabela temporária"
-- A query externa filtra os resultados dessa tabela temporária


-- =========================================
-- 4️⃣ Subquery correlacionada
-- =========================================
-- Exemplo: selecionar clientes cuja idade é maior que a média da sua cidade
SELECT nome, cidade, idade
FROM clientes c1
WHERE idade > (
    SELECT AVG(idade)
    FROM clientes c2
    WHERE c2.cidade = c1.cidade
);
-- A subquery depende da linha da query externa (c1)
-- Para cada cliente, calcula a média de idade da cidade correspondente


-- =========================================
-- 5️⃣ Subquery em INSERT
-- =========================================
-- Exemplo: criar uma tabela de clientes adultos (idade >= 18)
INSERT INTO clientes_adultos (nome, idade)
SELECT nome, idade
FROM clientes
WHERE idade >= (
    SELECT 18
);
-- Subquery aqui é trivial, mas pode ser mais complexa
-- Permite usar valores calculados dinamicamente


-- =========================================
-- 6️⃣ Subquery em UPDATE
-- =========================================
-- Exemplo: atualizar status de clientes acima da média de idade
UPDATE clientes
SET status = 'Sênior'
WHERE idade > (
    SELECT AVG(idade) FROM clientes
);


-- =========================================
-- 7️⃣ Subquery em DELETE
-- =========================================
-- Exemplo: deletar clientes que moram em cidades com apenas 1 cliente
DELETE FROM clientes
WHERE cidade IN (
    SELECT cidade
    FROM clientes
    GROUP BY cidade
    HAVING COUNT(*) = 1
);

-- =====================================================
-- RESUMO RÁPIDO
-- =====================================================
-- 1️⃣ Subqueries podem retornar:
--     - Um valor único (usado em =, >, <, etc.)
--     - Uma lista de valores (usado em IN)
--     - Uma tabela (usado em FROM)
-- 2️⃣ Subquery correlacionada depende da query externa
-- 3️⃣ Pode ser usada em SELECT, WHERE, FROM, INSERT, UPDATE, DELETE
