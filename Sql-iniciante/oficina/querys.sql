use oficina;

show tables;

select * from cliente;
select * from veiculo;
select * from equipe_mecanicos;
select * from mecanico;
select * from ordem_servico;

desc ordem_servico;


select c.nome, v.marca, v.modelo, v.cor, v.placa, os.diagnosticos, os.situacao 
from cliente c
inner join veiculo v ON v.idCliente = c.idCliente
inner join ordem_servico os ON os.placa = v.placa;

select c.nome, v.marca, v.modelo, v.placa from cliente c 
inner join veiculo v ON v.idCliente = c.idCliente;

select c.nome, v.marca, v.modelo, v.placa from cliente c 
inner join veiculo v ON v.idCliente = c.idCliente
where c.nome = "João Silva";


select(select count(*) from clientePf) as total_clientepf,
(select count(*) from clientePj) as total_clientepj;

SELECT o.id_ordem, c.nome AS cliente, v.placa, m.nome AS mecanico, o.situacao
FROM ordem_servico o
JOIN cliente c ON o.idCliente = c.idCliente
JOIN veiculo v ON o.placa = v.placa
LEFT JOIN mecanico m ON o.id_mecanico = m.id_mecanico
WHERE o.situacao = 'Em andamento';

SELECT s.tipo, COUNT(*) AS qtd
FROM ordem_servico_servico oss
JOIN servico s ON oss.idServico = s.idServico
GROUP BY s.tipo
ORDER BY qtd DESC
LIMIT 5;

SELECT o.id_ordem, c.nome AS cliente,
       COALESCE(SUM(oss.quantidade * oss.valor_unitario),0) +
       COALESCE(SUM(osp.quantidade * osp.valor_unitario),0) AS total_faturado
FROM ordem_servico o
JOIN cliente c ON o.idCliente = c.idCliente
LEFT JOIN ordem_servico_servico oss ON o.id_ordem = oss.id_ordem
LEFT JOIN ordem_servico_peca osp ON o.id_ordem = osp.id_ordem
GROUP BY o.id_ordem, c.nome;


 