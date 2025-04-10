-- RECUPERAÇÃO DE DADOS

-- Quais são os veículos e quem são seus donos?
SELECT v.nome_veiculo, v.placa_veiculo,
	c.nome_cliente
FROM VEICULO v
JOIN CLIENTE c ON c.idCLIENTE = v.CLIENTE_idCLIENTE
ORDER BY c.nome_cliente;

-- Lista de OrdemServico, com status, nome do cliente e seu carro.
SELECT os.numero_ordemservico, os.status_ordemservico,
	c.nome_cliente,
    v.nome_veiculo, v.placa_veiculo
FROM ORDEMSERVICO os
JOIN CLIENTE c ON c.idCLIENTE = os.CLIENTE_idCLIENTE
JOIN VEICULO v ON v.CLIENTE_idCLIENTE = os.CLIENTE_idCLIENTE;

-- Lista de equipes de mecanicos.
SELECT m.nome_mecanico,
	e.numero_equipe
FROM MECANICO m
JOIN EQUIPE e ON e.idEQUIPE = m.EQUIPE_idEQUIPE;

-- Quais peças foram usadas em X serviço?
SELECT p.nome_peca, p.valor_peca,
	shp.quantidade,
	s.nome_servico, s.valor_servico,
	(p.valor_peca * shp.quantidade + s.valor_servico) AS valor_total
FROM PECA p 
JOIN SERVICO_has_PECA shp ON shp.PECA_idPECA = p.idPECA
JOIN SERVICO s ON shp.SERVICO_idSERVICO = s.idSERVICO
WHERE s.nome_servico = 'Alinhamento';

-- Qual equipe realizou mais ordens de serviço?
SELECT e.numero_equipe, 
	COUNT(os.idORDEMSERVICO) AS total_OS
FROM EQUIPE e
JOIN ORDEMSERVICO os ON os.EQUIPE_idEQUIPE = e.idEQUIPE
GROUP BY e.numero_equipe
ORDER BY total_OS;

SHOW TABLES;
SELECT * FROM equipe;
SELECT * FROM ordemservico;
SELECT * FROM peca;


