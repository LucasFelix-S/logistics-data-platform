/*
  Seed para popular o banco de dados com dados de exemplo.
  Informação: Todos os comentários adicionados manualmente como mecanismo de referência para a criação da seed para o banco de dados.
-- Comando: psql -h <host> -p <porta> -U <usuario> -d logistics -f copy_load.sql
-- Se os CSVs estiverem em outro lugar, ajuste o prefixo 'data/':
-- Pre-requisitos: schemas criados (schema_erp.sql, schema_wms.sql) e base vazia.
*/

-- ================= ERP (ordem respeita as FKs) =================
\copy erp.categorias FROM 'data/erp/categorias.csv' CSV HEADER
\copy erp.status FROM 'data/erp/status.csv' CSV HEADER
\copy erp.tipos_entidades FROM 'data/erp/tipos_entidades.csv' CSV HEADER
\copy erp.condicoes_pagamento FROM 'data/erp/condicoes_pagamento.csv' CSV HEADER
\copy erp.parcelas_condicoes_pagamento FROM 'data/erp/parcelas_condicoes_pagamento.csv' CSV HEADER
\copy erp.status_pedidos_venda FROM 'data/erp/status_pedidos_venda.csv' CSV HEADER
\copy erp.status_pedidos_compra FROM 'data/erp/status_pedidos_compra.csv' CSV HEADER
\copy erp.status_tabelas_preco FROM 'data/erp/status_tabelas_preco.csv' CSV HEADER
\copy erp.entidades FROM 'data/erp/entidades.csv' CSV HEADER
\copy erp.produtos FROM 'data/erp/produtos.csv' CSV HEADER
\copy erp.tabelas_preco FROM 'data/erp/tabelas_preco.csv' CSV HEADER
\copy erp.itens_tabelas_preco FROM 'data/erp/itens_tabelas_preco.csv' CSV HEADER
\copy erp.pedidos_venda FROM 'data/erp/pedidos_venda.csv' CSV HEADER
\copy erp.itens_pedidos_venda FROM 'data/erp/itens_pedidos_venda.csv' CSV HEADER
\copy erp.pedidos_compra FROM 'data/erp/pedidos_compra.csv' CSV HEADER
\copy erp.itens_pedidos_compra FROM 'data/erp/itens_pedidos_compra.csv' CSV HEADER
\copy erp.contas_receber FROM 'data/erp/contas_receber.csv' CSV HEADER
\copy erp.parcelas_receber FROM 'data/erp/parcelas_receber.csv' CSV HEADER
\copy erp.contas_pagar FROM 'data/erp/contas_pagar.csv' CSV HEADER
\copy erp.parcelas_pagar FROM 'data/erp/parcelas_pagar.csv' CSV HEADER

-- ================= WMS =================
\copy wms.categorias FROM 'data/wms/categorias.csv' CSV HEADER
\copy wms.status FROM 'data/wms/status.csv' CSV HEADER
\copy wms.tipos_entidades FROM 'data/wms/tipos_entidades.csv' CSV HEADER
\copy wms.entidades FROM 'data/wms/entidades.csv' CSV HEADER
\copy wms.produtos FROM 'data/wms/produtos.csv' CSV HEADER
\copy wms.tipos_localizadores FROM 'data/wms/tipos_localizadores.csv' CSV HEADER
\copy wms.tipos_movimentacoes FROM 'data/wms/tipos_movimentacoes.csv' CSV HEADER
\copy wms.status_pedidos FROM 'data/wms/status_pedidos.csv' CSV HEADER
\copy wms.status_recebimentos FROM 'data/wms/status_recebimentos.csv' CSV HEADER
\copy wms.status_expedicoes FROM 'data/wms/status_expedicoes.csv' CSV HEADER
\copy wms.status_inventarios FROM 'data/wms/status_inventarios.csv' CSV HEADER
\copy wms.localizadores FROM 'data/wms/localizadores.csv' CSV HEADER
\copy wms.pedidos_saida FROM 'data/wms/pedidos_saida.csv' CSV HEADER
\copy wms.itens_pedidos FROM 'data/wms/itens_pedidos.csv' CSV HEADER
\copy wms.movimentacoes FROM 'data/wms/movimentacoes.csv' CSV HEADER
\copy wms.recebimentos FROM 'data/wms/recebimentos.csv' CSV HEADER
\copy wms.itens_recebimentos FROM 'data/wms/itens_recebimentos.csv' CSV HEADER
\copy wms.alocacoes FROM 'data/wms/alocacoes.csv' CSV HEADER
\copy wms.estoque FROM 'data/wms/estoque.csv' CSV HEADER
\copy wms.movimentacoes_alocacoes FROM 'data/wms/movimentacoes_alocacoes.csv' CSV HEADER
\copy wms.movimentacoes_pedidos FROM 'data/wms/movimentacoes_pedidos.csv' CSV HEADER
\copy wms.expedicoes FROM 'data/wms/expedicoes.csv' CSV HEADER
\copy wms.itens_expedicoes FROM 'data/wms/itens_expedicoes.csv' CSV HEADER
\copy wms.movimentacoes_expedicoes FROM 'data/wms/movimentacoes_expedicoes.csv' CSV HEADER
\copy wms.inventarios FROM 'data/wms/inventarios.csv' CSV HEADER
\copy wms.itens_inventarios FROM 'data/wms/itens_inventarios.csv' CSV HEADER
\copy wms.movimentacoes_inventarios FROM 'data/wms/movimentacoes_inventarios.csv' CSV HEADER

-- ================= Ajusta sequences (colunas IDENTITY) =================
/*
    * Esses comandos são importantes para garantir que as colunas IDENTITY (geradas automaticamente) continuem funcionando corretamente após a inserção de dados 
diretamente nas tabelas. Eles ajustam o valor da sequência para o próximo valor disponível, evitando conflitos de chave primária.
    * Por exemplo, se você inserir manualmente registros com IDs específicos, a sequência pode não estar atualizada, 
e o próximo valor gerado automaticamente pode entrar em conflito com os IDs existentes. Portanto, é uma boa prática executar esses comandos após a inserção de dados.
*/
SELECT setval(pg_get_serial_sequence('erp.categorias','id'), (SELECT max(id) FROM erp.categorias));
SELECT setval(pg_get_serial_sequence('erp.status','id'), (SELECT max(id) FROM erp.status));
SELECT setval(pg_get_serial_sequence('erp.tipos_entidades','id'), (SELECT max(id) FROM erp.tipos_entidades));
SELECT setval(pg_get_serial_sequence('erp.condicoes_pagamento','id'), (SELECT max(id) FROM erp.condicoes_pagamento));
SELECT setval(pg_get_serial_sequence('erp.parcelas_condicoes_pagamento','id'), (SELECT max(id) FROM erp.parcelas_condicoes_pagamento));
SELECT setval(pg_get_serial_sequence('erp.entidades','id'), (SELECT max(id) FROM erp.entidades));
SELECT setval(pg_get_serial_sequence('erp.produtos','codigo'), (SELECT max(codigo) FROM erp.produtos));
SELECT setval(pg_get_serial_sequence('erp.pedidos_venda','id'), (SELECT max(id) FROM erp.pedidos_venda));
SELECT setval(pg_get_serial_sequence('erp.itens_pedidos_venda','id'), (SELECT max(id) FROM erp.itens_pedidos_venda));
SELECT setval(pg_get_serial_sequence('erp.status_pedidos_venda','id'), (SELECT max(id) FROM erp.status_pedidos_venda));
SELECT setval(pg_get_serial_sequence('erp.tabelas_preco','id'), (SELECT max(id) FROM erp.tabelas_preco));
SELECT setval(pg_get_serial_sequence('erp.status_tabelas_preco','id'), (SELECT max(id) FROM erp.status_tabelas_preco));
SELECT setval(pg_get_serial_sequence('erp.itens_tabelas_preco','id'), (SELECT max(id) FROM erp.itens_tabelas_preco));
SELECT setval(pg_get_serial_sequence('erp.pedidos_compra','id'), (SELECT max(id) FROM erp.pedidos_compra));
SELECT setval(pg_get_serial_sequence('erp.itens_pedidos_compra','id'), (SELECT max(id) FROM erp.itens_pedidos_compra));
SELECT setval(pg_get_serial_sequence('erp.status_pedidos_compra','id'), (SELECT max(id) FROM erp.status_pedidos_compra));
SELECT setval(pg_get_serial_sequence('erp.contas_receber','id'), (SELECT max(id) FROM erp.contas_receber));
SELECT setval(pg_get_serial_sequence('erp.contas_pagar','id'), (SELECT max(id) FROM erp.contas_pagar));
SELECT setval(pg_get_serial_sequence('erp.parcelas_receber','id'), (SELECT max(id) FROM erp.parcelas_receber));
SELECT setval(pg_get_serial_sequence('erp.parcelas_pagar','id'), (SELECT max(id) FROM erp.parcelas_pagar));
SELECT setval(pg_get_serial_sequence('wms.categorias','id'), (SELECT max(id) FROM wms.categorias));
SELECT setval(pg_get_serial_sequence('wms.status','id'), (SELECT max(id) FROM wms.status));
SELECT setval(pg_get_serial_sequence('wms.tipos_entidades','id'), (SELECT max(id) FROM wms.tipos_entidades));
SELECT setval(pg_get_serial_sequence('wms.entidades','id'), (SELECT max(id) FROM wms.entidades));
SELECT setval(pg_get_serial_sequence('wms.produtos','codigo'), (SELECT max(codigo) FROM wms.produtos));
SELECT setval(pg_get_serial_sequence('wms.tipos_localizadores','id'), (SELECT max(id) FROM wms.tipos_localizadores));
SELECT setval(pg_get_serial_sequence('wms.tipos_movimentacoes','id'), (SELECT max(id) FROM wms.tipos_movimentacoes));
SELECT setval(pg_get_serial_sequence('wms.localizadores','id'), (SELECT max(id) FROM wms.localizadores));
SELECT setval(pg_get_serial_sequence('wms.status_pedidos','id'), (SELECT max(id) FROM wms.status_pedidos));
SELECT setval(pg_get_serial_sequence('wms.status_recebimentos','id'), (SELECT max(id) FROM wms.status_recebimentos));
SELECT setval(pg_get_serial_sequence('wms.status_expedicoes','id'), (SELECT max(id) FROM wms.status_expedicoes));
SELECT setval(pg_get_serial_sequence('wms.status_inventarios','id'), (SELECT max(id) FROM wms.status_inventarios));
SELECT setval(pg_get_serial_sequence('wms.pedidos_saida','id'), (SELECT max(id) FROM wms.pedidos_saida));
SELECT setval(pg_get_serial_sequence('wms.itens_pedidos','id'), (SELECT max(id) FROM wms.itens_pedidos));
SELECT setval(pg_get_serial_sequence('wms.movimentacoes','id'), (SELECT max(id) FROM wms.movimentacoes));
SELECT setval(pg_get_serial_sequence('wms.movimentacoes_pedidos','id'), (SELECT max(id) FROM wms.movimentacoes_pedidos));
SELECT setval(pg_get_serial_sequence('wms.recebimentos','id'), (SELECT max(id) FROM wms.recebimentos));
SELECT setval(pg_get_serial_sequence('wms.itens_recebimentos','id'), (SELECT max(id) FROM wms.itens_recebimentos));
SELECT setval(pg_get_serial_sequence('wms.alocacoes','id'), (SELECT max(id) FROM wms.alocacoes));
SELECT setval(pg_get_serial_sequence('wms.movimentacoes_alocacoes','id'), (SELECT max(id) FROM wms.movimentacoes_alocacoes));
SELECT setval(pg_get_serial_sequence('wms.estoque','id'), (SELECT max(id) FROM wms.estoque));
SELECT setval(pg_get_serial_sequence('wms.expedicoes','id'), (SELECT max(id) FROM wms.expedicoes));
SELECT setval(pg_get_serial_sequence('wms.itens_expedicoes','id'), (SELECT max(id) FROM wms.itens_expedicoes));
SELECT setval(pg_get_serial_sequence('wms.movimentacoes_expedicoes','id'), (SELECT max(id) FROM wms.movimentacoes_expedicoes));
SELECT setval(pg_get_serial_sequence('wms.inventarios','id'), (SELECT max(id) FROM wms.inventarios));
SELECT setval(pg_get_serial_sequence('wms.itens_inventarios','id'), (SELECT max(id) FROM wms.itens_inventarios));
SELECT setval(pg_get_serial_sequence('wms.movimentacoes_inventarios','id'), (SELECT max(id) FROM wms.movimentacoes_inventarios));
