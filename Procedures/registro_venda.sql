CREATE PROCEDURE registrar_venda (IN cliente_id INT,
IN veiculo_id INT, IN valor_final DECIMAL(10,2))
BEGIN
    DECLARE vMensagem VARCHAR(100);

	INSERT INTO tabela_vendas(cliente_id, veiculo_id, data_venda, valor_final)
    VALUES (cliente_id, veiculo_id, data_venda, valor_final)
    
    SET vMensagem = 'Venda registrada com sucesso.';
	SELECT vMensagem;
END