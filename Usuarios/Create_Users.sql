CREATE USER 'admin'@'localhost' IDENTIFIED BY 'Brasil@2025';
REVOKE ALL PRIVILEGES ON *.* FROM 'admin'@'localhost';

GRANT ALL PRIVILEGES ON `impetus_veiculos`.* TO 'admin'@'localhost' WITH GRANT OPTION;

FLUSH PRIVILEGES;

FLUSH PRIVILEGES;

-- Marketing Estados
-- Goiás
CREATE USER 'go_mkt'@'localhost' IDENTIFIED BY 'Go-2456';
REVOKE ALL PRIVILEGES ON *.* FROM 'go_mkt'@'localhost';

GRANT SELECT ON `impetus_veiculos`.`go_faturamento_mensal`
TO 'go_mkt'@'localhost' WITH GRANT OPTION;
GRANT SELECT ON `impetus_veiculos`.`go_fornecedores_patrimonio`
TO 'go_mkt'@'localhost' WITH GRANT OPTION;
GRANT SELECT ON `impetus_veiculos`.`go_historico_vendas`
TO 'go_mkt'@'localhost' WITH GRANT OPTION;
GRANT SELECT ON `impetus_veiculos`.`go_top_10_fornecedores_vendas`
TO 'go_mkt'@'localhost' WITH GRANT OPTION;
GRANT SELECT ON `impetus_veiculos`.`go_top_15_vendas`
TO 'go_mkt'@'localhost' WITH GRANT OPTION;

-- São Paulo
CREATE USER 'sp_mkt'@'localhost' IDENTIFIED BY 'Sp-2456';
REVOKE ALL PRIVILEGES ON *.* FROM 'sp_mkt'@'localhost';

GRANT SELECT ON `impetus_veiculos`.`sp_faturamento_mensal`
TO 'sp_mkt'@'localhost' WITH GRANT OPTION;
GRANT SELECT ON `impetus_veiculos`.`sp_fornecedores_patrimonio`
TO 'sp_mkt'@'localhost' WITH GRANT OPTION;
GRANT SELECT ON `impetus_veiculos`.`sp_historico_vendas`
TO 'sp_mkt'@'localhost' WITH GRANT OPTION;
GRANT SELECT ON `impetus_veiculos`.`sp_top_10_fornecedores_vendas`
TO 'sp_mkt'@'localhost' WITH GRANT OPTION;
GRANT SELECT ON `impetus_veiculos`.`sp_top_15_vendas`
TO 'sp_mkt'@'localhost' WITH GRANT OPTION;

-- Minas Gerais
CREATE USER 'mg_mkt'@'localhost' IDENTIFIED BY 'Mg-2456';
REVOKE ALL PRIVILEGES ON *.* FROM 'mg_mkt'@'localhost';

GRANT SELECT ON `impetus_veiculos`.`mg_faturamento_mensal`
TO 'mg_mkt'@'localhost' WITH GRANT OPTION;
GRANT SELECT ON `impetus_veiculos`.`mg_fornecedores_patrimonio`
TO 'mg_mkt'@'localhost' WITH GRANT OPTION;
GRANT SELECT ON `impetus_veiculos`.`mg_historico_vendas`
TO 'mg_mkt'@'localhost' WITH GRANT OPTION;
GRANT SELECT ON `impetus_veiculos`.`mg_top_10_fornecedores_vendas`
TO 'mg_mkt'@'localhost' WITH GRANT OPTION;
GRANT SELECT ON `impetus_veiculos`.`mg_top_15_vendas`
TO 'mg_mkt'@'localhost' WITH GRANT OPTION;

-- Bahia
CREATE USER 'ba_mkt'@'localhost' IDENTIFIED BY 'Ba-2456';
REVOKE ALL PRIVILEGES ON *.* FROM 'ba_mkt'@'localhost';

GRANT SELECT ON `impetus_veiculos`.`ba_faturamento_mensal`
TO 'ba_mkt'@'localhost' WITH GRANT OPTION;
GRANT SELECT ON `impetus_veiculos`.`ba_fornecedores_patrimonio`
TO 'ba_mkt'@'localhost' WITH GRANT OPTION;
GRANT SELECT ON `impetus_veiculos`.`ba_historico_vendas`
TO 'ba_mkt'@'localhost' WITH GRANT OPTION;
GRANT SELECT ON `impetus_veiculos`.`ba_top_10_fornecedores_vendas`
TO 'ba_mkt'@'localhost' WITH GRANT OPTION;
GRANT SELECT ON `impetus_veiculos`.`ba_top_15_vendas`
TO 'ba_mkt'@'localhost' WITH GRANT OPTION;

-- Vendedores
CREATE USER 'vendedor'@'localhost' IDENTIFIED BY 'Vendedor-2456';
REVOKE ALL PRIVILEGES ON *.* FROM 'vendedor'@'localhost';

GRANT INSERT, UPDATE ON `impetus_veiculos`.`tabela_vendas` TO 'vendedor'@'localhost';
GRANT EXECUTE ON PROCEDURE `impetus_veiculos`.`registrar_venda`
TO 'vendedor'@'localhost';

CREATE USER 'gerente_geral'@'localhost' IDENTIFIED BY 'Gerente-2456';
GRANT SELECT, INSERT, UPDATE, DELETE ON banco_dados.* TO 'gerente_geral'@'localhost';