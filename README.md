# Sistema de Gestão de Vendas de Veículos

Este projeto implementa um sistema de gestão de vendas de veículos, com foco na administração de clientes, fornecedores, financiamentos e serviços pós-venda. O sistema utiliza o MySQL para o gerenciamento de dados e envolve a criação de tabelas, usuários e visualizações para facilitar o processamento e a análise dos dados.

## Tecnologias utilizadas
- MySQL: Sistema de gerenciamento de banco de dados utilizado.
- SQL: Linguagem utilizada no MySQL.

## Banco de Dados
- tabela_fornecedores: Informações sobre fornecedores de veículos.
- tabela_clientes: Informações sobre os clientes.
- tabela_veiculos: Dados sobre os veículos.
- tabela_vendas: Registros de vendas, vinculando clientes, veículos e financiamentos.
- tabela_servico_pos_venda: Registros de serviços pós-venda, como manutenção e reparo.
- tabela_financiamentos: Registros de financiamentos efetuados.

## Funções e Procedures:
- Função - conferir_financiamento: Verifica algum financiamento existente com base no ID de financiamento.
- Função - simulacao_financiamento: Simula o preço total de um financiamento. Recebe o valor financiado, taxa de juros e prazo retornando o valor total do financiamento.
- Procedure - registrar_venda: Responsável por registrar uma nova venda no sistema. Para vendas à vista, o valor financiado deve ser informado como zero, garantindo o correto processamento da transação.

## Consultas otimizadas e visualizações (views) para extrair informações importantes, como histórico de vendas, faturamento mensal, top 15 de vendas, e informações detalhadas de fornecedores.

## Usuários e Permissões:
Gestão de Usuários: Criação de usuários com permissões específicas para acesso e manipulação dos dados no banco.
- admin: Usuário administrador com todas as permissões.
- go_mkt, sp_mkt, mg_mkt, ba_mkt: Usuários da equipe de marketing, específicos para acesso às informações de faturamento e histórico de vendas por estado.
- vendedor: Permissões para inserção, atualização de vendas e uso da procedure "registrar_venda".
- gerente_geral: Permissões para gerenciamento de dados em todas as tabelas.

## Backups
- Backup Completo: O script sBackup_full.bat realiza um backup completo do banco de dados. Ele cria uma cópia de todos os dados e estrutura do banco de dados, garantindo que você tenha um backup total em caso de necessidade de recuperação.
- Backup Diferencial: O script sBackup_diferencial.bat faz um backup diferencial, copiando apenas as alterações feitas desde o último backup completo.
- Backup Incremental: O script sBackup_Incremental.bat realiza backups incrementais, copiando apenas as alterações feitas desde o último backup incremental.
  
## Autor

Desenvolvido por Eduardo Coelho.
