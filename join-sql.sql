-- ===============================
-- JOINs em SQL: Resumo Prático
-- ===============================

-- Suponha 2 tabelas de exemplo:

-- Employees (funcionários)
-- id | name   | department_id
-- ---------------------------
-- 1  | Ana    | 10
-- 2  | João   | 20
-- 3  | Maria  | NULL
-- 4  | Pedro  | 30

-- Departments (departamentos)
-- id | dept_name
-- ----------------
-- 10 | RH
-- 20 | TI
-- 30 | Financeiro
-- 40 | Marketing


-- ======================================
-- 1) INNER JOIN: retorna apenas registros
-- que têm correspondência em ambas as tabelas
-- ======================================
SELECT e.name, d.dept_name
FROM Employees e
INNER JOIN Departments d ON e.department_id = d.id;

-- Resultado: lista só funcionários que têm departamento válido (exclui Maria).
-- Uso comum: quando queremos apenas os "casos válidos" (interseção entre tabelas).


-- ======================================
-- 2) LEFT JOIN: todos os registros da tabela da esquerda,
-- e os correspondentes da direita (se existirem)
-- ======================================
SELECT e.name, d.dept_name
FROM Employees e
LEFT JOIN Departments d ON e.department_id = d.id;

-- Resultado: traz todos os funcionários,
-- mesmo que não tenham departamento (Maria aparece com NULL no dept_name).
-- Uso comum: quando os dados da esquerda são obrigatórios,
-- mas os da direita podem faltar.


-- ======================================
-- 3) RIGHT JOIN: todos os registros da tabela da direita,
-- e os correspondentes da esquerda (se existirem)
-- ======================================
SELECT e.name, d.dept_name
FROM Employees e
RIGHT JOIN Departments d ON e.department_id = d.id;

-- Resultado: lista todos os departamentos,
-- mesmo que não tenham funcionários (Marketing aparece com NULL em name).
-- Uso comum: quando os dados da direita são prioritários
-- e queremos ver mesmo os sem correspondência.


-- ======================================
-- 4) FULL OUTER JOIN: une os dois lados
-- trazendo todos os registros, com NULL onde não houver correspondência
-- (Obs: nem todo SGBD suporta diretamente, ex. MySQL não tem nativo)
-- ======================================
SELECT e.name, d.dept_name
FROM Employees e
FULL OUTER JOIN Departments d ON e.department_id = d.id;

-- Resultado: traz todos os funcionários e todos os departamentos,
-- mesmo sem correspondência (Maria e Marketing aparecem).
-- Uso comum: relatórios de auditoria, checar faltantes em ambos os lados.


-- ======================================
-- 5) CROSS JOIN: produto cartesiano
-- combina todas as linhas de uma tabela com todas da outra
-- ======================================
SELECT e.name, d.dept_name
FROM Employees e
CROSS JOIN Departments d;

-- Resultado: 4 funcionários x 4 departamentos = 16 combinações.
-- Uso comum: gerar combinações, matrizes, cenários (ex. preços por moeda).


-- ======================================
-- 6) SELF JOIN: join da tabela com ela mesma
-- usado para relacionar registros da mesma entidade
-- ======================================
-- Exemplo: gerente e subordinado na mesma tabela
-- (suponha que Employees tenha um campo manager_id)
SELECT e.name AS funcionario, m.name AS gerente
FROM Employees e
LEFT JOIN Employees m ON e.manager_id = m.id;

-- Uso comum: hierarquias, estruturas organizacionais, árvores de categorias.


-- ======================================
-- 7) JOIN com múltiplas tabelas
-- ======================================
SELECT e.name, d.dept_name, l.city
FROM Employees e
INNER JOIN Departments d ON e.department_id = d.id
INNER JOIN Locations l ON d.location_id = l.id;

-- Uso comum: quando queremos enriquecer a informação
-- juntando mais de 2 tabelas no mesmo relatório.

