SELECT 'erp_produtos' AS tabela, 'PK' AS tipo_validacao,
       codigo::TEXT AS chave_duplicada, COUNT(*) AS ocorrencias
FROM raw.erp_produtos
GROUP BY codigo HAVING COUNT(*) > 1

UNION ALL

SELECT 'erp_categorias', 'PK', id::TEXT, COUNT(*)
FROM raw.erp_categorias
GROUP BY id HAVING COUNT(*) > 1

UNION ALL

SELECT 'erp_status', 'PK', id::TEXT, COUNT(*)
FROM raw.erp_status
GROUP BY id HAVING COUNT(*) > 1

UNION ALL

SELECT 'erp_condicoes_pagamento', 'PK', id::TEXT, COUNT(*)
FROM raw.erp_condicoes_pagamento
GROUP BY id HAVING COUNT(*) > 1

UNION ALL

SELECT 'erp_parcelas_condicoes_pagamento', 'PK', id::TEXT, COUNT(*)
FROM raw.erp_parcelas_condicoes_pagamento
GROUP BY id HAVING COUNT(*) > 1

UNION ALL

SELECT 'erp_entidades', 'PK', id::TEXT, COUNT(*)
FROM raw.erp_entidades
GROUP BY id HAVING COUNT(*) > 1

UNION ALL

SELECT 'erp_tipos_entidades', 'PK', id::TEXT, COUNT(*)
FROM raw.erp_tipos_entidades
GROUP BY id HAVING COUNT(*) > 1

UNION ALL

SELECT 'erp_pedidos_venda', 'PK', id::TEXT, COUNT(*)
FROM raw.erp_pedidos_venda
GROUP BY id HAVING COUNT(*) > 1

UNION ALL

SELECT 'erp_itens_pedidos_venda', 'PK', id::TEXT, COUNT(*)
FROM raw.erp_itens_pedidos_venda
GROUP BY id HAVING COUNT(*) > 1

UNION ALL

SELECT 'erp_status_pedidos_venda', 'PK', id::TEXT, COUNT(*)
FROM raw.erp_status_pedidos_venda
GROUP BY id HAVING COUNT(*) > 1

UNION ALL

SELECT 'erp_tabelas_preco', 'PK', id::TEXT, COUNT(*)
FROM raw.erp_tabelas_preco
GROUP BY id HAVING COUNT(*) > 1

UNION ALL

SELECT 'erp_status_tabelas_preco', 'PK', id::TEXT, COUNT(*)
FROM raw.erp_status_tabelas_preco
GROUP BY id HAVING COUNT(*) > 1

UNION ALL

SELECT 'erp_itens_tabelas_preco', 'PK', id::TEXT, COUNT(*)
FROM raw.erp_itens_tabelas_preco
GROUP BY id HAVING COUNT(*) > 1

UNION ALL

SELECT 'erp_pedidos_compra', 'PK', id::TEXT, COUNT(*)
FROM raw.erp_pedidos_compra
GROUP BY id HAVING COUNT(*) > 1

UNION ALL

SELECT 'erp_itens_pedidos_compra', 'PK', id::TEXT, COUNT(*)
FROM raw.erp_itens_pedidos_compra
GROUP BY id HAVING COUNT(*) > 1

UNION ALL

SELECT 'erp_status_pedidos_compra', 'PK', id::TEXT, COUNT(*)
FROM raw.erp_status_pedidos_compra
GROUP BY id HAVING COUNT(*) > 1

UNION ALL

SELECT 'erp_contas_receber', 'PK', id::TEXT, COUNT(*)
FROM raw.erp_contas_receber
GROUP BY id HAVING COUNT(*) > 1

UNION ALL

SELECT 'erp_contas_pagar', 'PK', id::TEXT, COUNT(*)
FROM raw.erp_contas_pagar
GROUP BY id HAVING COUNT(*) > 1

UNION ALL

SELECT 'erp_parcelas_receber', 'PK', id::TEXT, COUNT(*)
FROM raw.erp_parcelas_receber
GROUP BY id HAVING COUNT(*) > 1

UNION ALL

SELECT 'erp_parcelas_pagar', 'PK', id::TEXT, COUNT(*)
FROM raw.erp_parcelas_pagar
GROUP BY id HAVING COUNT(*) > 1


-- =========================
-- CHAVES PRIMARIAS - WMS
-- =========================

UNION ALL

SELECT 'wms_produtos', 'PK', codigo::TEXT, COUNT(*)
FROM raw.wms_produtos
GROUP BY codigo HAVING COUNT(*) > 1

UNION ALL

SELECT 'wms_categorias', 'PK', id::TEXT, COUNT(*)
FROM raw.wms_categorias
GROUP BY id HAVING COUNT(*) > 1

UNION ALL

SELECT 'wms_status', 'PK', id::TEXT, COUNT(*)
FROM raw.wms_status
GROUP BY id HAVING COUNT(*) > 1

UNION ALL

SELECT 'wms_localizadores', 'PK', id::TEXT, COUNT(*)
FROM raw.wms_localizadores
GROUP BY id HAVING COUNT(*) > 1

UNION ALL

SELECT 'wms_tipos_localizadores', 'PK', id::TEXT, COUNT(*)
FROM raw.wms_tipos_localizadores
GROUP BY id HAVING COUNT(*) > 1

UNION ALL

SELECT 'wms_estoque', 'PK', id::TEXT, COUNT(*)
FROM raw.wms_estoque
GROUP BY id HAVING COUNT(*) > 1

UNION ALL

SELECT 'wms_movimentacoes', 'PK', id::TEXT, COUNT(*)
FROM raw.wms_movimentacoes
GROUP BY id HAVING COUNT(*) > 1

UNION ALL

SELECT 'wms_tipos_movimentacoes', 'PK', id::TEXT, COUNT(*)
FROM raw.wms_tipos_movimentacoes
GROUP BY id HAVING COUNT(*) > 1

UNION ALL

SELECT 'wms_entidades', 'PK', id::TEXT, COUNT(*)
FROM raw.wms_entidades
GROUP BY id HAVING COUNT(*) > 1

UNION ALL

SELECT 'wms_tipos_entidades', 'PK', id::TEXT, COUNT(*)
FROM raw.wms_tipos_entidades
GROUP BY id HAVING COUNT(*) > 1

UNION ALL

SELECT 'wms_pedidos_saida', 'PK', id::TEXT, COUNT(*)
FROM raw.wms_pedidos_saida
GROUP BY id HAVING COUNT(*) > 1

UNION ALL

SELECT 'wms_status_pedidos', 'PK', id::TEXT, COUNT(*)
FROM raw.wms_status_pedidos
GROUP BY id HAVING COUNT(*) > 1

UNION ALL

SELECT 'wms_itens_pedidos', 'PK', id::TEXT, COUNT(*)
FROM raw.wms_itens_pedidos
GROUP BY id HAVING COUNT(*) > 1

UNION ALL

SELECT 'wms_movimentacoes_pedidos', 'PK', id::TEXT, COUNT(*)
FROM raw.wms_movimentacoes_pedidos
GROUP BY id HAVING COUNT(*) > 1

UNION ALL

SELECT 'wms_recebimentos', 'PK', id::TEXT, COUNT(*)
FROM raw.wms_recebimentos
GROUP BY id HAVING COUNT(*) > 1

UNION ALL

SELECT 'wms_status_recebimentos', 'PK', id::TEXT, COUNT(*)
FROM raw.wms_status_recebimentos
GROUP BY id HAVING COUNT(*) > 1

UNION ALL

SELECT 'wms_itens_recebimentos', 'PK', id::TEXT, COUNT(*)
FROM raw.wms_itens_recebimentos
GROUP BY id HAVING COUNT(*) > 1

UNION ALL

SELECT 'wms_alocacoes', 'PK', id::TEXT, COUNT(*)
FROM raw.wms_alocacoes
GROUP BY id HAVING COUNT(*) > 1

UNION ALL

SELECT 'wms_movimentacoes_alocacoes', 'PK', id::TEXT, COUNT(*)
FROM raw.wms_movimentacoes_alocacoes
GROUP BY id HAVING COUNT(*) > 1

UNION ALL

SELECT 'wms_expedicoes', 'PK', id::TEXT, COUNT(*)
FROM raw.wms_expedicoes
GROUP BY id HAVING COUNT(*) > 1

UNION ALL

SELECT 'wms_status_expedicoes', 'PK', id::TEXT, COUNT(*)
FROM raw.wms_status_expedicoes
GROUP BY id HAVING COUNT(*) > 1

UNION ALL

SELECT 'wms_itens_expedicoes', 'PK', id::TEXT, COUNT(*)
FROM raw.wms_itens_expedicoes
GROUP BY id HAVING COUNT(*) > 1

UNION ALL

SELECT 'wms_movimentacoes_expedicoes', 'PK', id::TEXT, COUNT(*)
FROM raw.wms_movimentacoes_expedicoes
GROUP BY id HAVING COUNT(*) > 1

UNION ALL

SELECT 'wms_inventarios', 'PK', id::TEXT, COUNT(*)
FROM raw.wms_inventarios
GROUP BY id HAVING COUNT(*) > 1

UNION ALL

SELECT 'wms_status_inventarios', 'PK', id::TEXT, COUNT(*)
FROM raw.wms_status_inventarios
GROUP BY id HAVING COUNT(*) > 1

UNION ALL

SELECT 'wms_itens_inventarios', 'PK', id::TEXT, COUNT(*)
FROM raw.wms_itens_inventarios
GROUP BY id HAVING COUNT(*) > 1

UNION ALL

SELECT 'wms_movimentacoes_inventarios', 'PK', id::TEXT, COUNT(*)
FROM raw.wms_movimentacoes_inventarios
GROUP BY id HAVING COUNT(*) > 1


-- =========================
-- UNIQUE COMPOSTAS - ERP
-- =========================

UNION ALL

SELECT
    'erp_parcelas_condicoes_pagamento',
    'UNIQUE',
    CONCAT(
        'condicao_pagamento_id=', condicao_pagamento_id,
        ', numero_parcela=', numero_parcela
    ),
    COUNT(*)
FROM raw.erp_parcelas_condicoes_pagamento
GROUP BY condicao_pagamento_id, numero_parcela
HAVING COUNT(*) > 1

UNION ALL

SELECT
    'erp_itens_tabelas_preco',
    'UNIQUE',
    CONCAT(
        'tabela_id=', tabela_id,
        ', produto_id=', produto_id
    ),
    COUNT(*)
FROM raw.erp_itens_tabelas_preco
GROUP BY tabela_id, produto_id
HAVING COUNT(*) > 1

UNION ALL

SELECT
    'erp_parcelas_receber',
    'UNIQUE',
    CONCAT(
        'conta_receber_id=', conta_receber_id,
        ', numero_parcela=', numero_parcela
    ),
    COUNT(*)
FROM raw.erp_parcelas_receber
GROUP BY conta_receber_id, numero_parcela
HAVING COUNT(*) > 1

UNION ALL

SELECT
    'erp_parcelas_pagar',
    'UNIQUE',
    CONCAT(
        'conta_pagar_id=', conta_pagar_id,
        ', numero_parcela=', numero_parcela
    ),
    COUNT(*)
FROM raw.erp_parcelas_pagar
GROUP BY conta_pagar_id, numero_parcela
HAVING COUNT(*) > 1


-- =========================
-- UNIQUE COMPOSTAS - WMS
-- =========================

UNION ALL

SELECT
    'wms_estoque',
    'UNIQUE',
    CONCAT(
        'produto_id=', produto_id,
        ', localizador_id=', localizador_id,
        ', lote=', lote
    ),
    COUNT(*)
FROM raw.wms_estoque
WHERE lote IS NOT NULL
GROUP BY produto_id, localizador_id, lote
HAVING COUNT(*) > 1

UNION ALL

SELECT
    'wms_itens_pedidos',
    'UNIQUE',
    CONCAT(
        'pedido_id=', pedido_id,
        ', produto_id=', produto_id
    ),
    COUNT(*)
FROM raw.wms_itens_pedidos
GROUP BY pedido_id, produto_id
HAVING COUNT(*) > 1

UNION ALL

SELECT
    'wms_movimentacoes_pedidos',
    'UNIQUE',
    CONCAT(
        'pedido_id=', pedido_id,
        ', movimentacao_id=', movimentacao_id
    ),
    COUNT(*)
FROM raw.wms_movimentacoes_pedidos
GROUP BY pedido_id, movimentacao_id
HAVING COUNT(*) > 1

UNION ALL

SELECT
    'wms_movimentacoes_alocacoes',
    'UNIQUE',
    CONCAT(
        'alocacao_id=', alocacao_id,
        ', movimentacao_id=', movimentacao_id
    ),
    COUNT(*)
FROM raw.wms_movimentacoes_alocacoes
GROUP BY alocacao_id, movimentacao_id
HAVING COUNT(*) > 1

UNION ALL

SELECT
    'wms_movimentacoes_expedicoes',
    'UNIQUE',
    CONCAT(
        'expedicao_id=', expedicao_id,
        ', movimentacao_id=', movimentacao_id
    ),
    COUNT(*)
FROM raw.wms_movimentacoes_expedicoes
GROUP BY expedicao_id, movimentacao_id
HAVING COUNT(*) > 1

UNION ALL

SELECT
    'wms_movimentacoes_inventarios',
    'UNIQUE',
    CONCAT(
        'inventario_id=', inventario_id,
        ', movimentacao_id=', movimentacao_id
    ),
    COUNT(*)
FROM raw.wms_movimentacoes_inventarios
GROUP BY inventario_id, movimentacao_id
HAVING COUNT(*) > 1

ORDER BY tabela, tipo_validacao, chave_duplicada;