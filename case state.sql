-- Exemplo usando a tabela fictícia "Employees"
-- Estrutura simplificada:
-- Employees(id, name, department, salary, bonus, tornado, precipitation)

-- 1) Classificar salários em faixas
SELECT 
    name,
    salary,
    CASE 
        WHEN salary < 3000 THEN 'Baixo'
        WHEN salary BETWEEN 3000 AND 7000 THEN 'Médio'
        ELSE 'Alto'
    END AS salary_range
FROM Employees;
-- Situação comum: criar categorias a partir de valores numéricos (faixas salariais, idades, notas, etc.)

-----------------------------------------------------------

-- 2) Substituir valores nulos (tratamento de dados ausentes)
SELECT 
    name,
    COALESCE(bonus, 0) AS bonus_original,
    CASE 
        WHEN bonus IS NULL THEN 'Sem bônus'
        ELSE 'Com bônus'
    END AS bonus_status
FROM Employees;
-- Situação comum: quando queremos tratar NULLs de forma mais legível para relatórios.

-----------------------------------------------------------

-- 3) Condição dentro de agregações (zero/null trick)
SELECT 
    department,
    -- soma apenas salários maiores que 5000
    SUM(CASE WHEN salary > 5000 THEN salary ELSE 0 END) AS high_salary_total,
    -- soma apenas salários menores ou iguais a 5000
    SUM(CASE WHEN salary <= 5000 THEN salary ELSE 0 END) AS low_salary_total
FROM Employees
GROUP BY department;
-- Situação comum: separar cálculos agregados (SUM, COUNT, AVG) em categorias diferentes dentro da mesma query.

-----------------------------------------------------------

-- 4) Contar quantos funcionários estão em cada situação
SELECT 
    department,
    COUNT(CASE WHEN salary > 5000 THEN 1 END) AS above_5000,
    COUNT(CASE WHEN salary <= 5000 THEN 1 END) AS below_or_equal_5000
FROM Employees
GROUP BY department;
-- Situação comum: contar registros com base em condições específicas.

-----------------------------------------------------------

-- 5) Exemplo inspirado no "zero/null trick" do seu print
SELECT 
    year,
    month,
    -- Soma de precipitação em dias com tornado
    SUM(CASE WHEN tornado = 1 THEN precipitation ELSE 0 END) AS tornado_precipitation,
    -- Soma de precipitação em dias sem tornado
    SUM(CASE WHEN tornado = 0 THEN precipitation ELSE 0 END) AS non_tornado_precipitation
FROM station_data
GROUP BY year, month;
-- Situação comum: separar métricas em colunas diferentes para facilitar análise de relatórios.
