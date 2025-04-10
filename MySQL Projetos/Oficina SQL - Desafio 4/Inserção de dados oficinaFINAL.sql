-- INSERÇÃO DE DADOS

-- CLIENTE
INSERT INTO CLIENTE (idCLIENTE, nome_cliente, cpf_cliente) VALUES
(1, 'João da Silva', '12345678901'),
(2, 'Maria Oliveira', '98765432100'),
(3, 'Carlos Andrade', '11122233344'),
(4, 'Fernanda Costa', '55566677788'),
(5, 'Lucas Mendes', '99988877766'),
(6, 'Patrícia Rocha', '44433322211');

-- VEICULO
INSERT INTO VEICULO (idVEICULO, nome_veiculo, placa_veiculo, CLIENTE_idCLIENTE) VALUES
(1, 'Civic', 'ABC-1234', 1),
(2, 'Gol', 'XYZ-5678', 2),
(3, 'Corolla', 'DEF-4321', 3),
(4, 'Onix', 'HIJ-8765', 4),
(5, 'HB20', 'KLM-1357', 5),
(6, 'Fiesta', 'NOP-2468', 6);

-- EQUIPE
INSERT INTO EQUIPE (idEQUIPE, numero_equipe) VALUES
(1, 101),
(2, 102),
(3, 103);

-- MECANICO
INSERT INTO MECANICO (idMECANICO, codigo_mecanico, nome_mecanico, endereco_mecanico, especialidade_mecanico, EQUIPE_idEQUIPE) VALUES
(1, 'MEC001', 'Carlos Souza', 'Rua A, 123', 'Motor', 1),
(2, 'MEC002', 'Ana Lima', 'Rua B, 456', 'Freio', 1),
(3, 'MEC003', 'Paulo Mendes', 'Rua C, 789', 'Elétrica', 2),
(4, 'MEC004', 'Juliana Silva', 'Rua D, 321', 'Suspensão', 2),
(5, 'MEC005', 'Ricardo Lopes', 'Rua E, 654', 'Transmissão', 3);

-- SERVICO
INSERT INTO SERVICO (idSERVICO, nome_servico, valor_servico) VALUES
(1, 'Troca de óleo', 150.00),
(2, 'Revisão de freios', 300.00),
(3, 'Alinhamento', 100.00),
(4, 'Balanceamento', 90.00),
(5, 'Troca de amortecedores', 400.00),
(6, 'Verificação elétrica', 200.00);

-- PECA
INSERT INTO PECA (idPECA, valor_peca, nome_peca, descricao_peca) VALUES
(1, 120.00, 'Pastilha de Freio', 'Pastilha dianteira cerâmica'),
(2, 80.00, 'Filtro de Óleo', 'Filtro motor 1.6'),
(3, 200.00, 'Amortecedor', 'Amortecedor traseiro'),
(4, 60.00, 'Velas de ignição', 'Conjunto com 4 velas'),
(5, 150.00, 'Bateria 60Ah', 'Bateria automotiva padrão'),
(6, 50.00, 'Correia dentada', 'Correia de borracha reforçada');

-- SERVICO_has_PECA
INSERT INTO SERVICO_has_PECA (SERVICO_idSERVICO, PECA_idPECA, quantidade) VALUES
(1, 2, 1),   -- Troca de óleo → 1 Filtro de óleo
(2, 1, 2),   -- Revisão de freios → 2 Pastilhas
(3, 4, 4),   -- Alinhamento → Velas de ignição
(4, 6, 1),   -- Balanceamento → Correia dentada
(5, 3, 2),   -- Troca de amortecedores → 2 Amortecedores
(6, 5, 1);   -- Verificação elétrica → 1 Bateria

-- ORDEMSERVICO
INSERT INTO ORDEMSERVICO (
    idORDEMSERVICO, numero_ordemservico, data_inicio_ordemservico, data_finalizacao_ordemservico,
    valor_ordemservico, status_ordemservico, EQUIPE_idEQUIPE, CLIENTE_idCLIENTE, VEICULO_idVEICULO
) VALUES
(1, 1001, '2025-04-01', '2025-04-02', 230.00, 'Finalizado', 1, 1, 1),
(2, 1002, '2025-04-03', '2025-04-03', 320.00, 'Finalizado', 2, 2, 2),
(3, 1003, '2025-04-04', '2025-04-05', 250.00, 'Finalizado', 3, 3, 3),
(4, 1004, '2025-04-06', NULL, 90.00, 'Em andamento', 1, 4, 4),
(5, 1005, '2025-04-07', NULL, 400.00, 'Aguardando Peças', 2, 5, 5),
(6, 1006, '2025-04-08', NULL, 200.00, 'Aberto', 3, 6, 6);

-- ORDEMSERVICO_has_SERVICO
INSERT INTO ORDEMSERVICO_has_SERVICO (ORDEMSERVICO_idORDEMSERVICO, SERVICO_idSERVICO, valortotal) VALUES
(1, 1, 150.00),  -- Troca de óleo
(1, 3, 100.00),  -- Alinhamento
(2, 2, 300.00),  -- Revisão freios
(3, 4, 90.00),   -- Balanceamento
(3, 6, 200.00),  -- Verificação elétrica
(4, 4, 90.00),   -- Balanceamento
(5, 5, 400.00),  -- Troca de amortecedor
(6, 6, 200.00);  -- Verificação elétrica

