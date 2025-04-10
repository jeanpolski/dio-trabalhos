-- INSERÇÃO DE DADOS
INSERT INTO CLIENTE VALUES
(1, 'PF'),
(2, 'PJ'),
(3, 'PF'),
(4, 'PJ'),
(5, 'PF'),
(6, 'PJ'),
(7, 'PF'),
(8, 'PJ'),
(9, 'PF'),
(10, 'PF');

-- CLIENTEPF
INSERT INTO CLIENTEPF (idCLIENTE, Pnome, Mnome, Sobrenome, cpf, data_nascimento, enderecoCLIENTEPF, CLIENTE_idCLIENTE) VALUES
(1, 'Ana', 'L', 'Silva', '12345678901', '1990-05-10', 'Rua A, 100', 1),
(3, 'Carlos', 'B', 'Moraes', '32145698700', '1985-08-22', 'Rua B, 200', 3),
(5, 'Juliana', 'C', 'Almeida', '78945612399', '1992-12-15', 'Rua C, 300', 5),
(7, 'Pedro', 'J', 'Costa', '15975348621', '1997-07-01', 'Rua D, 400', 7),
(9, 'Larissa', 'R', 'Oliveira', '25896314700', '2000-02-25', 'Rua E, 500', 9);

-- CLIENTEPJ
INSERT INTO CLIENTEPJ (idCLIENTEPJ, razaosocialCLIENTEPJ, cnpjCLIENTEPJ, enderecoCLIENTEPJ, CLIENTE_idCLIENTE) VALUES
(2, 'Tech Solutions LTDA', '12345678000190', 'Av. Central, 100', 2),
(4, 'Comercial Oeste SA', '98765432000100', 'Av. Oeste, 200', 4),
(6, 'Distribuidora Leste', '45678912000155', 'Av. Leste, 300', 6),
(8, 'Serviços Norte ME', '74185296000177', 'Av. Norte, 400', 8),
(10, 'Industria Sul EIRELI', '36925814000166', 'Av. Sul, 500', 10);

-- FORNECEDOR
INSERT INTO FORNECEDOR (idFORNECEDOR, razaosocialFORNECEDOR, cnpjFORNECEDOR, localFORNECEDOR) VALUES
(1, 'Fornecedor A', '11222333000191', 'SP'),
(2, 'Fornecedor B', '22333444000182', 'RJ'),
(3, 'Fornecedor C', '33444555000173', 'MG'),
(4, 'Fornecedor D', '44555666000164', 'BA'),
(5, 'Fornecedor E', '55666777000155', 'RS'),
(6, 'Fornecedor F', '66777888000146', 'SC'),
(7, 'Fornecedor G', '77888999000137', 'PR'),
(8, 'Fornecedor H', '88999000000128', 'GO'),
(9, 'Fornecedor I', '99000111000119', 'DF'),
(10, 'Fornecedor J', '10011222000100', 'PE');

-- VENDEDOR
INSERT INTO VENDEDOR (idVENDEDOR, razaosocialVENDEDOR, cnpjVENDEDOR, localVENDEDOR) VALUES
(1, 'Loja 1', '11111111000101', 'São Paulo'),
(2, 'Loja 2', '22222222000102', 'Rio de Janeiro'),
(3, 'Loja 3', '33333333000103', 'Curitiba'),
(4, 'Loja 4', '44444444000104', 'Fortaleza'),
(5, 'Loja 5', '55555555000105', 'Salvador'),
(6, 'Loja 6', '66666666000106', 'Manaus'),
(7, 'Loja 7', '77777777000107', 'Recife'),
(8, 'Loja 8', '88888888000108', 'Belo Horizonte'),
(9, 'Loja 9', '99999999000109', 'Porto Alegre'),
(10, 'Loja 10', '10101010000110', 'Brasília');

-- PRODUTO
INSERT INTO PRODUTO (idPRODUTO, categoriaPRODUTO, descricaoPRODUTO, valorPRODUTO) VALUES
(1, 'Eletrônico', 'Fone de ouvido', 150.0),
(2, 'Roupas', 'Camisa polo', 70.0),
(3, 'Escritório', 'Caneta tinteiro', 30.0),
(4, 'Casa', 'Panela antiaderente', 90.0),
(5, 'Games', 'Controle PS5', 300.0),
(6, 'Brinquedos', 'Quebra-cabeça', 40.0),
(7, 'Livros', 'Romance Clássico', 35.0),
(8, 'Beleza', 'Perfume', 120.0),
(9, 'Pet', 'Ração cachorro 10kg', 100.0),
(10, 'Ferramentas', 'Furadeira elétrica', 200.0);

-- FORNECEDOR_has_PRODUTO
INSERT INTO FORNECEDOR_has_PRODUTO (FORNECEDOR_idFORNECEDOR, PRODUTO_idPRODUTO) VALUES
(1, 1), 
(2, 2), 
(3, 3), 
(4, 4),
(5, 5);

-- VENDEDOR_has_PRODUTO
INSERT INTO VENDEDOR_has_PRODUTO (VENDEDOR_idVENDEDOR, PRODUTO_idPRODUTO, quantidade_produtoVENDEDOR) VALUES
(1, 1, 20), 
(2, 2, 15), 
(3, 3, 10), 
(4, 4, 5), 
(5, 5, 25);

-- ESTOQUE
INSERT INTO ESTOQUE (idESTOQUE, localESTOQUE) VALUES
(1, 'Depósito SP'), 
(2, 'Depósito RJ'), 
(3, 'Depósito MG'), 
(4, 'Depósito PR'), 
(5, 'Depósito RS');

-- ESTOQUE_has_PRODUTO
INSERT INTO ESTOQUE_has_PRODUTO (ESTOQUE_idESTOQUE, PRODUTO_idPRODUTO, quantidadeESTOQUE) VALUES
(1, 1, 50),
(2, 2, 40), 
(3, 3, 30), 
(4, 4, 20), 
(5, 5, 10);

-- PEDIDO
INSERT INTO PEDIDO (idPEDIDO, status_pedido, descricao_pedido, frete, forma_pagamento, status_pagamento, valor_pagamento, data_pagamento, CLIENTE_idCLIENTE) VALUES
(1, 'Em andamento', 'Compra de fone', 15.0, 'Cartão', 'Pago', 165.0, '2024-01-10', 1),
(2, 'Enviado', 'Camisa polo', 10.0, 'Pix', 'Pago', 80.0, '2024-01-11', 2),
(3, 'Entregue', 'Panela', 20.0, 'Boleto', 'Pago', 110.0, '2024-01-12', 3),
(4, 'Processando', 'Controle PS5', 25.0, 'Cartão', 'Pendente', 325.0, '2024-01-13', 4),
(5, 'Processando', 'Livro', 5.0, 'Pix', 'Pendente', 40.0, '2024-01-14', 5);

-- PEDIDO_has_PRODUTO
INSERT INTO PEDIDO_has_PRODUTO (PEDIDO_idPEDIDO, PRODUTO_idPRODUTO, quantidadePEDIDO, statusPEDIDO) VALUES
(1, 1, 1, 'Disponível'), 
(2, 2, 1, 'Disponível'), 
(3, 4, 1, 'Disponível'), 
(4, 5, 1, 'Disponível'), 
(5, 7, 1, 'Disponível');

-- ENTREGA
INSERT INTO ENTREGA (idENTREGA, codigo_entrega, status_entrega, PEDIDO_idPEDIDO) VALUES
(1, 'COD123', 'A caminho', 1),
(2, 'COD456', 'A caminho', 2),
(3, 'COD789', 'A caminho', 3),
(4, 'COD321', 'Processando', 4),
(5, 'COD654', 'Processando', 5);

