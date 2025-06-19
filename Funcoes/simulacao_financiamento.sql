CREATE DEFINER=`root`@`localhost` FUNCTION `simulacao_financiamento`(veiculo_id INT, taxa_juros DECIMAL(4,4), prazo INT) RETURNS decimal(10,2)
    DETERMINISTIC
BEGIN
    DECLARE preco_veiculo DECIMAL(10,2);
    DECLARE preco_total DECIMAL(10,2);
    
    -- Preço do veículo a ser financiado
    SELECT preco
    INTO preco_veiculo
    FROM tabela_veiculos
    WHERE tabela_veiculos.veiculo_id = veiculo_id
    LIMIT 1;
        
    -- Cálculo do Preço Total da simulação de financiamento
    SET preco_total = preco_veiculo*(1 + taxa_juros)*prazo;
    
    RETURN preco_total;
END