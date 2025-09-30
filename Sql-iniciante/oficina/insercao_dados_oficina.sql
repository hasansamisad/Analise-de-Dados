use oficina;

-- Clientes base
insert into cliente (nome, telefone, email, endereco) values
('João Silva', '11988887777', 'joao@email.com', 'Rua A, 123'),
('Maria Oliveira', '21977776666', 'maria@email.com', 'Rua B, 456'),
('Oficina X Ltda', '1133332222', 'contato@oficinax.com', 'Av. Central, 1000'),
('Carlos Souza', '11955554444', 'carlos@email.com', 'Rua C, 789'),
('Mecânica Turbo SA', '1132109876', 'adm@turbo.com', 'Av. Industrial, 200');

-- Especificações PF
insert into clientePF (idCliente, cpf) values
(1, '12345678901'),
(2, '98765432100'),
(4, '11122233344');

-- Especificações PJ
insert into clientePJ (idCliente, cnpj) values
(3, '12345678000199'),
(5, '98765432000188');

insert into veiculo (idCliente, placa, marca, modelo, ano_fabricacao, cor, quilometragem) values
(1, 'ABC1234', 'Fiat', 'Uno', 2015, 'Prata', 80000),
(2, 'XYZ5678', 'VW', 'Gol', 2018, 'Branco', 45000),
(3, 'KLM4321', 'Chevrolet', 'Onix', 2020, 'Preto', 30000),
(4, 'QWE9876', 'Toyota', 'Corolla', 2017, 'Cinza', 60000),
(5, 'RTY2468', 'Ford', 'Ka', 2016, 'Vermelho', 75000);

insert into equipe_mecanicos (nome_equipe, especialidade) values
('Equipe A', 'Motor'),
('Equipe B', 'Elétrica'),
('Equipe C', 'Funilaria');

insert into mecanico (nome, endereco, salario, id_equipe_mecanico) values
('Pedro Mecânico', 'Rua D, 321', 3500.00, 1),
('Ana Técnica', 'Rua E, 654', 4000.00, 2),
('José Pintor', 'Rua F, 987', 3200.00, 3);

insert into ordem_servico (idCliente, placa, id_mecanico, diagnosticos, forma_pagamento, data_abertura, situacao) values
(1, 'ABC1234', 1, 'Troca de correia dentada', 'Cartão', '2025-09-01 09:00:00', 'Concluída'),
(2, 'XYZ5678', 2, 'Problema no sistema elétrico', 'Dinheiro', '2025-09-05 10:30:00', 'Em andamento'),
(3, 'KLM4321', 3, 'Amassado na lateral direita', 'Pix', '2025-09-10 14:00:00', 'Aberta'),
(4, 'QWE9876', 1, 'Troca de óleo e filtros', 'Cartão', '2025-09-12 08:15:00', 'Concluída'),
(5, 'RTY2468', 2, 'Bateria descarregando', 'Dinheiro', '2025-09-15 16:45:00', 'Cancelada');

insert into servico (tipo, descricao, valor, tempoEstimado, categoria, garantiaDias) values
('Troca de correia', 'Substituição da correia dentada', 600.00, 3, 'Motor', 90),
('Revisão elétrica', 'Verificação completa do sistema elétrico', 350.00, 2, 'Elétrica', 60),
('Funilaria lateral', 'Conserto de amassado na lateral', 1200.00, 5, 'Funilaria', 180),
('Troca de óleo', 'Troca de óleo e filtro de óleo', 150.00, 1, 'Revisão', 30),
('Troca de bateria', 'Substituição da bateria do veículo', 500.00, 2, 'Elétrica', 365);

insert into peca (nomePeca, codigoPeca, fabricante, valor, quantidadeEstoque, garantiaMeses) values
('Correia Dentada', 'CD001', 'Gates', 200.00, 10, 12),
('Bateria 60Ah', 'BT060', 'Moura', 450.00, 5, 24),
('Filtro de Óleo', 'FO123', 'Fram', 30.00, 20, 6),
('Óleo 5W30 1L', 'OL5W30', 'Lubrax', 40.00, 50, 12),
('Paralama Direito', 'PD789', 'Chevrolet', 800.00, 2, 12);

insert into ordem_servico_servico (id_ordem, idServico, quantidade, valor_unitario) values
(1, 1, 1, 600.00),
(2, 2, 1, 350.00),
(3, 3, 1, 1200.00),
(4, 4, 1, 150.00),
(5, 5, 1, 500.00);

insert into ordem_servico_peca (id_ordem, idPeca, quantidade, valor_unitario) values
(1, 1, 1, 200.00), -- Correia Dentada
(2, 2, 1, 450.00), -- Bateria
(4, 3, 1, 30.00),  -- Filtro de Óleo
(4, 4, 4, 40.00),  -- 4 litros de óleo
(3, 5, 1, 800.00); -- Paralama
