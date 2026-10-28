SELECT 'erp_produtos' AS tabela, COUNT(*) AS total
FROM raw.erp_produtos

UNION ALL

SELECT 'erp_categorias', COUNT(*)
FROM raw.erp_categorias

UNION ALL

SELECT 'erp_status', COUNT(*)
FROM raw.erp_status

UNION ALL

SELECT 'erp_condicoes_pagamento', COUNT(*)
FROM raw.erp_condicoes_pagamento

UNION ALL

SELECT 'erp_parcelas_condicoes_pagamento', COUNT(*)
FROM raw.erp_parcelas_condicoes_pagamento

UNION ALL

SELECT 'erp_entidades', COUNT(*)
FROM raw.erp_entidades

UNION ALL

SELECT 'erp_tipos_entidades', COUNT(*)
FROM raw.erp_tipos_entidades

UNION ALL

SELECT 'erp_pedidos_venda', COUNT(*)
FROM raw.erp_pedidos_venda

UNION ALL

SELECT 'erp_itens_pedidos_venda', COUNT(*)
FROM raw.erp_itens_pedidos_venda

UNION ALL

SELECT 'erp_status_pedidos_venda', COUNT(*)
FROM raw.erp_status_pedidos_venda

UNION ALL

SELECT 'erp_tabelas_preco', COUNT(*)
FROM raw.erp_tabelas_preco

UNION ALL

SELECT 'erp_status_tabelas_preco', COUNT(*)
FROM raw.erp_status_tabelas_preco

UNION ALL

SELECT 'erp_itens_tabelas_preco', COUNT(*)
FROM raw.erp_itens_tabelas_preco

UNION ALL

SELECT 'erp_pedidos_compra', COUNT(*)
FROM raw.erp_pedidos_compra

UNION ALL

SELECT 'erp_itens_pedidos_compra', COUNT(*)
FROM raw.erp_itens_pedidos_compra

UNION ALL

SELECT 'erp_status_pedidos_compra', COUNT(*)
FROM raw.erp_status_pedidos_compra

UNION ALL

SELECT 'erp_contas_receber', COUNT(*)
FROM raw.erp_contas_receber

UNION ALL

SELECT 'erp_contas_pagar', COUNT(*)
FROM raw.erp_contas_pagar

UNION ALL

SELECT 'erp_parcelas_receber', COUNT(*)
FROM raw.erp_parcelas_receber

UNION ALL

SELECT 'erp_parcelas_pagar', COUNT(*)
FROM raw.erp_parcelas_pagar

UNION ALL

SELECT 'wms_produtos', COUNT(*)
FROM raw.wms_produtos

UNION ALL

SELECT 'wms_categorias', COUNT(*)
FROM raw.wms_categorias

UNION ALL

SELECT 'wms_status', COUNT(*)
FROM raw.wms_status

UNION ALL

SELECT 'wms_localizadores', COUNT(*)
FROM raw.wms_localizadores

UNION ALL

SELECT 'wms_tipos_localizadores', COUNT(*)
FROM raw.wms_tipos_localizadores

UNION ALL

SELECT 'wms_estoque', COUNT(*)
FROM raw.wms_estoque

UNION ALL

SELECT 'wms_movimentacoes', COUNT(*)
FROM raw.wms_movimentacoes

UNION ALL

SELECT 'wms_tipos_movimentacoes', COUNT(*)
FROM raw.wms_tipos_movimentacoes

UNION ALL

SELECT 'wms_entidades', COUNT(*)
FROM raw.wms_entidades

UNION ALL

SELECT 'wms_tipos_entidades', COUNT(*)
FROM raw.wms_tipos_entidades

UNION ALL

SELECT 'wms_pedidos_saida', COUNT(*)
FROM raw.wms_pedidos_saida

UNION ALL

SELECT 'wms_status_pedidos', COUNT(*)
FROM raw.wms_status_pedidos

UNION ALL

SELECT 'wms_itens_pedidos', COUNT(*)
FROM raw.wms_itens_pedidos

UNION ALL

SELECT 'wms_movimentacoes_pedidos', COUNT(*)
FROM raw.wms_movimentacoes_pedidos

UNION ALL

SELECT 'wms_recebimentos', COUNT(*)
FROM raw.wms_recebimentos

UNION ALL

SELECT 'wms_status_recebimentos', COUNT(*)
FROM raw.wms_status_recebimentos

UNION ALL

SELECT 'wms_itens_recebimentos', COUNT(*)
FROM raw.wms_itens_recebimentos

UNION ALL

SELECT 'wms_alocacoes', COUNT(*)
FROM raw.wms_alocacoes

UNION ALL

SELECT 'wms_movimentacoes_alocacoes', COUNT(*)
FROM raw.wms_movimentacoes_alocacoes

UNION ALL

SELECT 'wms_expedicoes', COUNT(*)
FROM raw.wms_expedicoes

UNION ALL

SELECT 'wms_status_expedicoes', COUNT(*)
FROM raw.wms_status_expedicoes

UNION ALL

SELECT 'wms_itens_expedicoes', COUNT(*)
FROM raw.wms_itens_expedicoes

UNION ALL

SELECT 'wms_movimentacoes_expedicoes', COUNT(*)
FROM raw.wms_movimentacoes_expedicoes

UNION ALL

SELECT 'wms_inventarios', COUNT(*)
FROM raw.wms_inventarios

UNION ALL

SELECT 'wms_status_inventarios', COUNT(*)
FROM raw.wms_status_inventarios

UNION ALL

SELECT 'wms_itens_inventarios', COUNT(*)
FROM raw.wms_itens_inventarios

UNION ALL

SELECT 'wms_movimentacoes_inventarios', COUNT(*)
FROM raw.wms_movimentacoes_inventarios

ORDER BY tabela;