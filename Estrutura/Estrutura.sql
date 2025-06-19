-- Criação do Banco de Dados

CREATE DATABASE IF NOT EXISTS Impetus_Veiculos;
USE Impetus_Veiculos;

CREATE TABLE tabela_fornecedores (
	fornecedor_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255),
    email VARCHAR(255),
    telefone VARCHAR(25),
    cnpj VARCHAR(255),
    cidade VARCHAR(50),
    estado VARCHAR(25)
);

CREATE TABLE tabela_clientes (
	cliente_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255),
    email VARCHAR(255),
    telefone VARCHAR(25),
    cidade VARCHAR(50),
    estado VARCHAR(25)
);

CREATE TABLE tabela_financiamentos (
	financiamento_id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT,
    banco VARCHAR(50),
    valor_financiado DECIMAL(10,2),
    taxa_juros DECIMAL(4,4),
    prazo INT,
    status_pagamento ENUM('pago', 'pendente', 'em atraso', 'parcialmente pago', 'cancelado'),
    FOREIGN KEY (cliente_id) REFERENCES tabela_clientes(cliente_id)
);

CREATE TABLE tabela_veiculos (
	veiculo_id INT AUTO_INCREMENT PRIMARY KEY,
    modelo VARCHAR(100),
    marca VARCHAR(50),
    lotação INT,
    ano INT,
    preco DECIMAL(10,2),
    cor VARCHAR(50),
    status VARCHAR(255),
    fornecedor_id INT,
    FOREIGN KEY (fornecedor_id) REFERENCES tabela_fornecedores(fornecedor_id)
);

CREATE TABLE tabela_vendas (
	venda_id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT,
    veiculo_id INT,
    data_venda DATE,
    financiamento_id INT,
    FOREIGN KEY (cliente_id) REFERENCES tabela_clientes(cliente_id),
    FOREIGN KEY (veiculo_id) REFERENCES tabela_veiculos(veiculo_id),
    FOREIGN KEY (financiamento_id) REFERENCES tabela_financiamentos(financiamento_id)
);

CREATE TABLE tabela_servico_pos_venda (
	servico_pos_venda_id INT AUTO_INCREMENT PRIMARY KEY,
    venda_id INT,
    data_servico DATE,
    tipo_servico ENUM('manutencao','reparo'),
    custo DECIMAL(10,2),
    FOREIGN KEY (venda_id) REFERENCES tabela_vendas(venda_id)
);
