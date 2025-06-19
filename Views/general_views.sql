-- Vendas ordenadas por mês
CREATE VIEW historico_vendas AS
SELECT YEAR(vendas.data_venda) AS ano,
MONTH(vendas.data_venda) AS mes,
v.modelo,
SUM(v.preco) AS Preco_veiculo
FROM tabela_vendas vendas
JOIN tabela_veiculos v ON v.veiculo_id = vendas.veiculo_id
GROUP BY YEAR(data_venda), MONTH(data_venda), v.modelo
ORDER BY MONTH(data_venda);

-- Total de vendas por mês
CREATE VIEW faturamento_mensal AS
SELECT YEAR(vendas.data_venda) AS ano,
MONTH(vendas.data_venda) AS mes,
SUM(v.preco) AS Total_venda
FROM tabela_vendas vendas
JOIN tabela_veiculos v ON v.veiculo_id = vendas.veiculo_id
GROUP BY YEAR(vendas.data_venda), MONTH(vendas.data_venda)
ORDER BY MONTH(vendas.data_venda);

-- Consulta dos finaciamentos, acima de tal valor
CREATE VIEW financiamento_maior_35k AS
SELECT c.nome AS Nome,
c.email AS 'E-mail',
SUM(f.valor_financiado) AS Total_financiado
FROM tabela_clientes c
JOIN tabela_financiamentos f ON c.cliente_id = f.cliente_id
GROUP BY c.cliente_id
HAVING total_financiado > 35000
ORDER BY total_financiado DESC;

-- Consulta dos veículos vendidos ordenados pelo preço, com limite de visualização,
-- ordenada do maior preço para o menor
CREATE VIEW top_15_vendas AS
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
ORDER BY preco DESC
LIMIT 15;

-- Consulta da quantidade de fornecedores por estado
CREATE VIEW fornecedores_estado AS
SELECT estado AS Estado, COUNT(*) AS Quantidade_fornecedores
FROM tabela_fornecedores
GROUP BY estado
ORDER BY Quantidade_fornecedores DESC;

-- Consulta valor total dos carros de um fornecedor
CREATE VIEW fornecedores_patrimonio AS
SELECT forn.nome AS Nome,
forn.cidade AS Cidade,
forn.estado AS Estado,
SUM(v.preco) AS Valor_Total,
COUNT(*) AS Carros
FROM tabela_fornecedores forn
JOIN tabela_veiculos v ON forn.fornecedor_id = v.fornecedor_id
GROUP BY Nome, Cidade, Estado
ORDER BY Valor_Total DESC
LIMIT 10;

-- Consulta total de vendas de um fornecedor
CREATE VIEW top_10_fornecedores_vendas AS
SELECT forn.nome AS Nome,
forn.cidade AS Cidade,
forn.estado AS Estado,
SUM(v.preco) AS Valor_Total,
COUNT(*) AS Vendas
FROM tabela_vendas vendas
JOIN tabela_veiculos v ON vendas.veiculo_id = v.veiculo_id
JOIN tabela_fornecedores forn ON v.fornecedor_id = forn.fornecedor_id
GROUP BY Nome, Cidade, Estado
ORDER BY Valor_Total DESC
LIMIT 10;

-- Vendas por Estado
CREATE VIEW ranking_vendas_estado AS
SELECT forn.estado AS Estado,
SUM(v.preco) AS Valor_Total,
COUNT(*) AS Vendas
FROM tabela_vendas vendas
JOIN tabela_veiculos v ON vendas.veiculo_id = v.veiculo_id
JOIN tabela_fornecedores forn ON v.fornecedor_id = forn.fornecedor_id
GROUP BY Estado
ORDER BY Valor_Total DESC;

-- Serviços Pós venda (spv) por Estado
CREATE VIEW ranking_spv_estado AS
SELECT forn.estado AS Estado,
SUM(v.preco) AS Valor_Total,
COUNT(*) AS Vendas
FROM tabela_vendas vendas
JOIN tabela_veiculos v ON vendas.veiculo_id = v.veiculo_id
JOIN tabela_fornecedores forn ON v.fornecedor_id = forn.fornecedor_id
GROUP BY Estado
ORDER BY Valor_Total DESC;

-- Histórico de faturamento em serviços pós venda (spv)
CREATE VIEW historico_svp AS
SELECT YEAR(data_servico) AS Ano,
MONTH(data_servico) AS Mês,
SUM(custo) AS Faturamento
FROM tabela_servico_pos_venda
GROUP BY Ano, Mês
ORDER BY Ano, Mês;

-- Consulta faturamento em serviços pós venda (spv) por tipo de serviço
CREATE VIEW faturamento_tipo_svp AS
SELECT tipo_servico AS Serviço,
SUM(custo) AS Faturamento
FROM tabela_servico_pos_venda
GROUP BY Serviço
ORDER BY Faturamento DESC;