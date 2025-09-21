/* ===================================================
   RESUMO DE FUNÇÕES EM SQL
   =================================================== */

/* ------------------------------
   FUNÇÕES NUMÉRICAS
------------------------------ */
SELECT 
    ABS(-10) AS absoluto,        -- Valor absoluto → 10
    CEIL(10.2) AS teto,          -- Arredonda para cima → 11
    FLOOR(10.8) AS piso,         -- Arredonda para baixo → 10
    ROUND(10.567, 2) AS arred,   -- Arredonda com 2 casas → 10.57
    POWER(2,3) AS potencia,      -- 2³ = 8
    MOD(10,3) AS resto;          -- Resto da divisão (10 % 3 = 1)


/* ------------------------------
   FUNÇÕES DE TEXTO (STRING)
------------------------------ */
SELECT 
    UPPER('sql') AS maiusculo,       -- Converte para MAIÚSCULO
    LOWER('SQL') AS minusculo,       -- Converte para minúsculo
    LENGTH('texto') AS tamanho,      -- Número de caracteres
    CONCAT('João', ' ', 'Silva') AS nome_completo, -- Junta strings
    SUBSTRING('Database', 1, 4) AS parte,  -- Pega 4 primeiros caracteres → "Data"
    TRIM('   teste   ') AS limpo,    -- Remove espaços extras
    REPLACE('2025-09-21', '-', '/') AS troca; -- Substitui caracteres


/* ------------------------------
   FUNÇÕES DE DATA E HORA
------------------------------ */
SELECT 
    CURDATE() AS data_atual,         -- Data atual (AAAA-MM-DD)
    CURTIME() AS hora_atual,         -- Hora atual (HH:MM:SS)
    NOW() AS data_hora,              -- Data e hora atuais
    YEAR(NOW()) AS ano,              -- Extrai ano
    MONTH(NOW()) AS mes,             -- Extrai mês
    DAY(NOW()) AS dia,               -- Extrai dia
    DATE_ADD(CURDATE(), INTERVAL 10 DAY) AS mais_10_dias, -- Soma 10 dias
    DATEDIFF('2025-12-31', CURDATE()) AS dias_restantes;  -- Diferença de dias entre datas


/* ------------------------------
   FUNÇÕES DE AGREGAÇÃO
   (usadas com GROUP BY normalmente)
------------------------------ */
SELECT 
    COUNT(*) AS total_registros,     -- Conta registros
    SUM(valor) AS soma_valores,      -- Soma dos valores
    AVG(valor) AS media_valores,     -- Média dos valores
    MIN(valor) AS menor_valor,       -- Valor mínimo
    MAX(valor) AS maior_valor        -- Valor máximo
FROM pedidos;


/* ------------------------------
   FUNÇÕES DE CONTROLE (CONDICIONAIS)
------------------------------ */
SELECT 
    IF(valor > 100, 'Caro', 'Barato') AS categoria,   -- Condicional simples
    CASE 
        WHEN valor < 100 THEN 'Baixo'
        WHEN valor BETWEEN 100 AND 500 THEN 'Médio'
        ELSE 'Alto'
    END AS classificacao
FROM pedidos;
