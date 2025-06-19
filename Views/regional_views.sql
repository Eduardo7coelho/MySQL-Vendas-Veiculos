-- Vendas ordenadas por mês - Estados
CREATE VIEW go_historico_vendas AS
SELECT YEAR(vendas.data_venda) AS ano,
MONTH(vendas.data_venda) AS mes,
v.modelo,
SUM(v.preco) AS Preco_veiculo
FROM tabela_vendas vendas
JOIN tabela_veiculos v ON v.veiculo_id = vendas.veiculo_id
JOIN tabela_fornecedores f ON f.fornecedor_id = v.fornecedor_id
WHERE f.estado = 'Goiás'
GROUP BY YEAR(data_venda), MONTH(data_venda), v.modelo
ORDER BY MONTH(data_venda);

CREATE VIEW sp_historico_vendas AS
SELECT YEAR(vendas.data_venda) AS ano,
MONTH(vendas.data_venda) AS mes,
v.modelo,
SUM(v.preco) AS Preco_veiculo
FROM tabela_vendas vendas
JOIN tabela_veiculos v ON v.veiculo_id = vendas.veiculo_id
JOIN tabela_fornecedores f ON f.fornecedor_id = v.fornecedor_id
WHERE f.estado = 'São Paulo'
GROUP BY YEAR(data_venda), MONTH(data_venda), v.modelo
ORDER BY MONTH(data_venda);

CREATE VIEW mg_historico_vendas AS
SELECT YEAR(vendas.data_venda) AS ano,
MONTH(vendas.data_venda) AS mes,
v.modelo,
SUM(v.preco) AS Preco_veiculo
FROM tabela_vendas vendas
JOIN tabela_veiculos v ON v.veiculo_id = vendas.veiculo_id
JOIN tabela_fornecedores f ON f.fornecedor_id = v.fornecedor_id
WHERE f.estado = 'Minas Gerais'
GROUP BY YEAR(data_venda), MONTH(data_venda), v.modelo
ORDER BY MONTH(data_venda);

CREATE VIEW ba_historico_vendas AS
SELECT YEAR(vendas.data_venda) AS ano,
MONTH(vendas.data_venda) AS mes,
v.modelo,
SUM(v.preco) AS Preco_veiculo
FROM tabela_vendas vendas
JOIN tabela_veiculos v ON v.veiculo_id = vendas.veiculo_id
JOIN tabela_fornecedores f ON f.fornecedor_id = v.fornecedor_id
WHERE f.estado = 'Bahia'
GROUP BY YEAR(data_venda), MONTH(data_venda), v.modelo
ORDER BY MONTH(data_venda);

-- Total de vendas por mês
CREATE VIEW go_faturamento_mensal AS
SELECT YEAR(vendas.data_venda) AS ano,
MONTH(vendas.data_venda) AS mes,
SUM(v.preco) AS Total_venda
FROM tabela_vendas vendas
JOIN tabela_veiculos v ON v.veiculo_id = vendas.veiculo_id
JOIN tabela_fornecedores f ON f.fornecedor_id = v.fornecedor_id
WHERE f.estado = 'Goiás'
GROUP BY YEAR(vendas.data_venda), MONTH(vendas.data_venda)
ORDER BY MONTH(vendas.data_venda);

CREATE VIEW sp_faturamento_mensal AS
SELECT YEAR(vendas.data_venda) AS ano,
MONTH(vendas.data_venda) AS mes,
SUM(v.preco) AS Total_venda
FROM tabela_vendas vendas
JOIN tabela_veiculos v ON v.veiculo_id = vendas.veiculo_id
JOIN tabela_fornecedores f ON f.fornecedor_id = v.fornecedor_id
WHERE f.estado = 'São Paulo'
GROUP BY YEAR(vendas.data_venda), MONTH(vendas.data_venda)
ORDER BY MONTH(vendas.data_venda);

CREATE VIEW mg_faturamento_mensal AS
SELECT YEAR(vendas.data_venda) AS ano,
MONTH(vendas.data_venda) AS mes,
SUM(v.preco) AS Total_venda
FROM tabela_vendas vendas
JOIN tabela_veiculos v ON v.veiculo_id = vendas.veiculo_id
JOIN tabela_fornecedores f ON f.fornecedor_id = v.fornecedor_id
WHERE f.estado = 'Minas Gerais'
GROUP BY YEAR(vendas.data_venda), MONTH(vendas.data_venda)
ORDER BY MONTH(vendas.data_venda);

CREATE VIEW ba_faturamento_mensal AS
SELECT YEAR(vendas.data_venda) AS ano,
MONTH(vendas.data_venda) AS mes,
SUM(v.preco) AS Total_venda
FROM tabela_vendas vendas
JOIN tabela_veiculos v ON v.veiculo_id = vendas.veiculo_id
JOIN tabela_fornecedores f ON f.fornecedor_id = v.fornecedor_id
WHERE f.estado = 'Bahia'
GROUP BY YEAR(vendas.data_venda), MONTH(vendas.data_venda)
ORDER BY MONTH(vendas.data_venda);

-- Consulta dos veículos vendidos ordenados pelo preço, com limite de visualização,
-- ordenada do maior preço para o menor
CREATE VIEW go_top_15_vendas AS
SELECT c.nome AS Nome,
c.estado AS Estado_Cliente,
v.modelo AS Modelo,
v.marca AS Marca,
v.preco AS Preço,
f.valor_financiado AS "Valor financiado"
FROM tabela_clientes c
JOIN tabela_financiamentos f ON c.cliente_id = f.cliente_id
JOIN tabela_vendas vendas ON f.financiamento_id = vendas.financiamento_id
JOIN tabela_veiculos v ON vendas.veiculo_id = v.veiculo_id
JOIN tabela_fornecedores forn ON forn.fornecedor_id = v.fornecedor_id
WHERE forn.estado = 'Goiás'
ORDER BY preco DESC
LIMIT 15;

CREATE VIEW sp_top_15_vendas AS
SELECT c.nome AS Nome,
c.estado AS Estado_Cliente,
v.modelo AS Modelo,
v.marca AS Marca,
v.preco AS Preço,
f.valor_financiado AS "Valor financiado"
FROM tabela_clientes c
JOIN tabela_financiamentos f ON c.cliente_id = f.cliente_id
JOIN tabela_vendas vendas ON f.financiamento_id = vendas.financiamento_id
JOIN tabela_veiculos v ON vendas.veiculo_id = v.veiculo_id
JOIN tabela_fornecedores forn ON forn.fornecedor_id = v.fornecedor_id
WHERE forn.estado = 'São Paulo'
ORDER BY preco DESC
LIMIT 15;

CREATE VIEW mg_top_15_vendas AS
SELECT c.nome AS Nome,
c.estado AS Estado_Cliente,
v.modelo AS Modelo,
v.marca AS Marca,
v.preco AS Preço,
f.valor_financiado AS "Valor financiado"
FROM tabela_clientes c
JOIN tabela_financiamentos f ON c.cliente_id = f.cliente_id
JOIN tabela_vendas vendas ON f.financiamento_id = vendas.financiamento_id
JOIN tabela_veiculos v ON vendas.veiculo_id = v.veiculo_id
JOIN tabela_fornecedores forn ON forn.fornecedor_id = v.fornecedor_id
WHERE forn.estado = 'Minas Gerais'
ORDER BY preco DESC
LIMIT 15;

CREATE VIEW ba_top_15_vendas AS
SELECT c.nome AS Nome,
c.estado AS Estado_Cliente,
v.modelo AS Modelo,
v.marca AS Marca,
v.preco AS Preço,
f.valor_financiado AS "Valor financiado"
FROM tabela_clientes c
JOIN tabela_financiamentos f ON c.cliente_id = f.cliente_id
JOIN tabela_vendas vendas ON f.financiamento_id = vendas.financiamento_id
JOIN tabela_veiculos v ON vendas.veiculo_id = v.veiculo_id
JOIN tabela_fornecedores forn ON forn.fornecedor_id = v.fornecedor_id
WHERE forn.estado = 'Bahia'
ORDER BY preco DESC
LIMIT 15;

-- Consulta valor total dos carros de um fornecedor
CREATE VIEW go_fornecedores_patrimonio AS
SELECT forn.nome AS Nome,
forn.cidade AS Cidade,
forn.estado AS Estado,
SUM(v.preco) AS Valor_Total,
COUNT(*) AS Carros
FROM tabela_fornecedores forn
JOIN tabela_veiculos v ON forn.fornecedor_id = v.fornecedor_id
WHERE forn.estado = 'Goiás'
GROUP BY Nome, Cidade, Estado
ORDER BY Valor_Total DESC
LIMIT 10;

CREATE VIEW sp_fornecedores_patrimonio AS
SELECT forn.nome AS Nome,
forn.cidade AS Cidade,
forn.estado AS Estado,
SUM(v.preco) AS Valor_Total,
COUNT(*) AS Carros
FROM tabela_fornecedores forn
JOIN tabela_veiculos v ON forn.fornecedor_id = v.fornecedor_id
WHERE forn.estado = 'São Paulo'
GROUP BY Nome, Cidade, Estado
ORDER BY Valor_Total DESC
LIMIT 10;

CREATE VIEW mg_fornecedores_patrimonio AS
SELECT forn.nome AS Nome,
forn.cidade AS Cidade,
forn.estado AS Estado,
SUM(v.preco) AS Valor_Total,
COUNT(*) AS Carros
FROM tabela_fornecedores forn
JOIN tabela_veiculos v ON forn.fornecedor_id = v.fornecedor_id
WHERE forn.estado = 'Minas Gerais'
GROUP BY Nome, Cidade, Estado
ORDER BY Valor_Total DESC
LIMIT 10;

CREATE VIEW ba_fornecedores_patrimonio AS
SELECT forn.nome AS Nome,
forn.cidade AS Cidade,
forn.estado AS Estado,
SUM(v.preco) AS Valor_Total,
COUNT(*) AS Carros
FROM tabela_fornecedores forn
JOIN tabela_veiculos v ON forn.fornecedor_id = v.fornecedor_id
WHERE forn.estado = 'Bahia'
GROUP BY Nome, Cidade, Estado
ORDER BY Valor_Total DESC
LIMIT 10;

-- Consulta total de vendas de um fornecedor
CREATE VIEW go_top_10_fornecedores_vendas AS
SELECT forn.nome AS Nome,
forn.cidade AS Cidade,
forn.estado AS Estado,
SUM(v.preco) AS Valor_Total,
COUNT(*) AS Vendas
FROM tabela_vendas vendas
JOIN tabela_veiculos v ON vendas.veiculo_id = v.veiculo_id
JOIN tabela_fornecedores forn ON v.fornecedor_id = forn.fornecedor_id
WHERE forn.estado = 'Goiás'
GROUP BY Nome, Cidade, Estado
ORDER BY Valor_Total DESC
LIMIT 10;

CREATE VIEW sp_top_10_fornecedores_vendas AS
SELECT forn.nome AS Nome,
forn.cidade AS Cidade,
forn.estado AS Estado,
SUM(v.preco) AS Valor_Total,
COUNT(*) AS Vendas
FROM tabela_vendas vendas
JOIN tabela_veiculos v ON vendas.veiculo_id = v.veiculo_id
JOIN tabela_fornecedores forn ON v.fornecedor_id = forn.fornecedor_id
WHERE forn.estado = 'São Paulo'
GROUP BY Nome, Cidade, Estado
ORDER BY Valor_Total DESC
LIMIT 10;

CREATE VIEW mg_top_10_fornecedores_vendas AS
SELECT forn.nome AS Nome,
forn.cidade AS Cidade,
forn.estado AS Estado,
SUM(v.preco) AS Valor_Total,
COUNT(*) AS Vendas
FROM tabela_vendas vendas
JOIN tabela_veiculos v ON vendas.veiculo_id = v.veiculo_id
JOIN tabela_fornecedores forn ON v.fornecedor_id = forn.fornecedor_id
WHERE forn.estado = 'Minas Gerais'
GROUP BY Nome, Cidade, Estado
ORDER BY Valor_Total DESC
LIMIT 10;

CREATE VIEW ba_top_10_fornecedores_vendas AS
SELECT forn.nome AS Nome,
forn.cidade AS Cidade,
forn.estado AS Estado,
SUM(v.preco) AS Valor_Total,
COUNT(*) AS Vendas
FROM tabela_vendas vendas
JOIN tabela_veiculos v ON vendas.veiculo_id = v.veiculo_id
JOIN tabela_fornecedores forn ON v.fornecedor_id = forn.fornecedor_id
WHERE forn.estado = 'Bahia'
GROUP BY Nome, Cidade, Estado
ORDER BY Valor_Total DESC
LIMIT 10;