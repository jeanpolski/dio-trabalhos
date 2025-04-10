-- RECUPERANDO INFORMAÇÕES

-- Aqui identificamos todos os clientes, PJ e PF.
SELECT c.idCLIENTE AS id_cliente, 
	c.tipocliente AS tipo_cliente, 
	razaosocialCLIENTEPJ AS razao_social, 
	cnpjCLIENTEPJ AS CNPJ, 
	concat(Pnome,' ', Mnome,' ', sobrenome) AS nome_completo, 
	CPF
FROM CLIENTE c 
LEFT JOIN clientepf pf ON pf.cliente_idCLIENTE = c.idcliente
LEFT JOIN clientepj pj ON pj.cliente_idCLIENTE = c.idcliente
ORDER BY tipo_cliente DESC;

select * from clientepj;
select * from clientepf;
select * from cliente;

-- Atualizando valor incorreto, havia um PJ cadastrado como PF.
UPDATE CLIENTE 
SET tipoCLIENTE = 'PJ'
WHERE idCLIENTE = 10;

-- Quantos pedidos foram feitos por cada cliente?
-- Aqui recuperamos nome, cpf, razao social, cnpj e o total de pedidos realizados por cada um deles.
SELECT concat(Pnome,' ',Mnome,' ',sobrenome) AS nome_completo, 
	cpf,
	NULL AS razao_social,
	NULL AS cnpj,
	COUNT(p.idPEDIDO) AS total_pedidos
FROM pedido p
JOIN clientepf pf ON p.CLIENTE_idCLIENTE = pf.CLIENTE_idCLIENTE
GROUP BY pf.Pnome, pf.Mnome, pf.Sobrenome, pf.cpf
UNION
SELECT 
	NULL AS nome_completo,
    NULL AS cpf,
    pj.razaosocialCLIENTEPJ AS razao_social,
    pj.cnpjCLIENTEPJ AS cnpj,
    COUNT(p.idPEDIDO) AS total_pedidos
FROM pedido p
JOIN clientepj pj ON p.cliente_idCLIENTE = pj.cliente_idCLIENTE
GROUP BY
	razao_social, cnpj;
--
-- Aqui, temos uma lista mais direta dos clientes, sejam pessoas jurídicas ou físicas.
SELECT 
    COALESCE(CONCAT(pf.Pnome, ' ', pf.Mnome, ' ', pf.Sobrenome), pj.razaosocialCLIENTEPJ) AS nome_cliente,
    COUNT(p.idPEDIDO) AS total_pedidos
FROM 
    PEDIDO p
LEFT JOIN clientepf pf ON p.cliente_idCLIENTE = pf.cliente_idCLIENTE
LEFT JOIN clientepj pj ON p.cliente_idCLIENTE = pj.cliente_idCLIENTE
GROUP BY 
    nome_cliente;
    
-- Algum vendedor também é fornecedor?
-- Agrupamos aqui por CNPJ e razão social, vendedores que também são fornecedores.
SELECT cnpjVENDEDOR AS cnpj, razaosocialVENDEDOR AS razao_social
FROM vendedor
WHERE cnpjVENDEDOR IN (
	SELECT cnpjFORNECEDOR 
    FROM fornecedor)
GROUP BY cnpj, razao_social;
-- Não há nenhum fornecedor que também seja um vendedor.

-- Relação de produtos fornecedores e estoques;
SHOW TABLES;
SELECT * FROM fornecedor;
SELECT * FROM estoque;
SELECT * FROM produto;
SELECT * FROM fornecedor_has_produto;
SELECT * FROM estoque_has_produto;

-- Aqui recuperamos id do produto, sua descrição, id do estoque e onde fica localizado, fornecedor e seu CNPJ, e a quantidade atual em estoque.
SELECT p.idPRODUTO AS id_produto, p.descricaoPRODUTO AS descricao_produto,
	e.idESTOQUE AS id_estoque, e.localESTOQUE AS local_estoque,
    f.razaosocialFORNECEDOR AS razao_social, cnpjFORNECEDOR AS cnpj,
    ehp.quantidadeESTOQUE
FROM produto p
JOIN fornecedor_has_produto fhp ON p.idPRODUTO = fhp.PRODUTO_idPRODUTO
JOIN fornecedor f ON f.idFORNECEDOR = fhp.FORNECEDOR_idFORNECEDOR
JOIN estoque_has_produto ehp ON ehp.PRODUTO_idPRODUTO = p.idPRODUTO
JOIN estoque e ON e.idEstoque = ehp.ESTOQUE_idESTOQUE
ORDER BY p.idPRODUTO;
--

-- Relação de nomes dos fornecedores e nomes dos produtos
SHOW TABLES;
SELECT * FROM fornecedor;
SELECT * FROM fornecedor_has_produto;
SELECT * FROM produto;

SELECT f.razaosocialFORNECEDOR AS razao_social, cnpjFORNECEDOR AS cnpj,
	p.idPRODUTO, p.categoriaPRODUTO AS categoria, descricaoPRODUTO AS descricao_produto
FROM produto p
JOIN fornecedor_has_produto fhp ON fhp.PRODUTO_idPRODUTO = p.idPRODUTO
JOIN fornecedor f ON f.idFORNECEDOR = fhp.FORNECEDOR_idFORNECEDOR
ORDER BY razao_social;
-- Recuperamos razao social e o cnpj do fornecedor e os produtos que ele oferece.