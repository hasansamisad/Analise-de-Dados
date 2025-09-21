-- =========================================
-- 1️⃣ Operadores Lógicos
-- =========================================
-- AND, OR, NOT
SELECT * 
FROM clientes
WHERE cidade = 'São Paulo' AND idade > 30; -- Ambos devem ser verdadeiros

SELECT * 
FROM clientes
WHERE cidade = 'São Paulo' OR idade > 30; -- Pelo menos um verdadeiro

SELECT * 
FROM clientes
WHERE NOT cidade = 'São Paulo'; -- Inverte a condição


-- =========================================
-- 2️⃣ UNION
-- =========================================
-- Combina resultados de duas consultas, removendo duplicados
SELECT nome FROM clientes_pf
UNION
SELECT nome FROM clientes_pj;

-- Para manter duplicados, use UNION ALL
SELECT nome FROM clientes_pf
UNION ALL
SELECT nome FROM clientes_pj;


-- =========================================
-- 3️⃣ INTERSECT (não suportado diretamente no MySQL < 8.0)
-- =========================================
-- MySQL usa INNER JOIN ou EXISTS para simular INTERSECT
SELECT nome FROM clientes_pf AS pf
WHERE EXISTS (
    SELECT 1 FROM clientes_pj AS pj
    WHERE pj.nome = pf.nome
);

-- Outra forma usando INNER JOIN
SELECT pf.nome
FROM clientes_pf pf
INNER JOIN clientes_pj pj ON pf.nome = pj.nome;


-- =========================================
-- 4️⃣ EXCEPT (não suportado diretamente no MySQL < 8.0)
-- =========================================
-- MySQL usa LEFT JOIN + IS NULL para simular EXCEPT
SELECT pf.nome
FROM clientes_pf pf
LEFT JOIN clientes_pj pj ON pf.nome = pj.nome
WHERE pj.nome IS NULL;
-- Resultado: nomes em clientes_pf que não estão em clientes_pj
