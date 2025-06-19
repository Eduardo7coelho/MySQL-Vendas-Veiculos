CREATE DEFINER=`root`@`localhost` FUNCTION `conferir_financiamento`(financiamento_id INT) RETURNS decimal(10,2)
    DETERMINISTIC
BEGIN
    DECLARE preco_veiculo DECIMAL(10,2);
    DECLARE val_financiado DECIMAL(10,2);
    DECLARE preco_total DECIMAL(10,2);
    DECLARE juros DECIMAL(4,4);
    DECLARE prazo_fin INT;
	DECLARE fin_existe INT DEFAULT 0;
    
    -- Verificar se o ID de financiamento existe
    SELECT COUNT(*)
    INTO fin_existe
    FROM tabela_financiamentos
    WHERE tabela_financiamentos.financiamento_id = financiamento_id;
    
	IF fin_existe = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Financiamento ID inexistente.';
    END IF;
    
    -- Dados usados no cálculo do Preço Total do Veículo
    SELECT valor_financiado, prazo, taxa_juros
    INTO val_financiado, prazo_fin, juros
    FROM tabela_financiamentos
    WHERE tabela_financiamentos.financiamento_id = financiamento_id
    LIMIT 1;
    
	SELECT preco
    INTO preco_veiculo
    FROM tabela_veiculos
    JOIN
        tabela_vendas ON tabela_veiculos.veiculo_id = tabela_vendas.veiculo_id
	JOIN
        tabela_financiamentos ON tabela_vendas.financiamento_id = tabela_financiamentos.financiamento_id
	WHERE tabela_financiamentos.financiamento_id = financiamento_id
    LIMIT 1;
    
    -- Cálculo do preço total do veículo financiado
    SET preco_total = preco_veiculo + val_financiado*(1 + juros)*prazo_fin;
    
    RETURN preco_total;
END