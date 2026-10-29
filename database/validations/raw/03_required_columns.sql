SELECT 'erp_produtos' AS tabela, v.coluna, v.total_nulos
FROM (
    SELECT
        COUNT(*) FILTER (WHERE codigo IS NULL) AS codigo,
        COUNT(*) FILTER (WHERE descricao IS NULL) AS descricao,
        COUNT(*) FILTER (WHERE unidade_medida IS NULL) AS unidade_medida,
        COUNT(*) FILTER (WHERE categoria_id IS NULL) AS categoria_id,
        COUNT(*) FILTER (WHERE status_id IS NULL) AS status_id
    FROM raw.erp_produtos
) c
CROSS JOIN LATERAL (
    VALUES
        ('codigo', c.codigo),
        ('descricao', c.descricao),
        ('unidade_medida', c.unidade_medida),
        ('categoria_id', c.categoria_id),
        ('status_id', c.status_id)
) AS v(coluna, total_nulos)
WHERE v.total_nulos > 0

UNION ALL

SELECT 'erp_categorias', v.coluna, v.total_nulos
FROM (
    SELECT
        COUNT(*) FILTER (WHERE id IS NULL) AS id,
        COUNT(*) FILTER (WHERE descricao IS NULL) AS descricao
    FROM raw.erp_categorias
) c
CROSS JOIN LATERAL (
    VALUES ('id', c.id), ('descricao', c.descricao)
) AS v(coluna, total_nulos)
WHERE v.total_nulos > 0

UNION ALL

SELECT 'erp_status', v.coluna, v.total_nulos
FROM (
    SELECT
        COUNT(*) FILTER (WHERE id IS NULL) AS id,
        COUNT(*) FILTER (WHERE descricao IS NULL) AS descricao
    FROM raw.erp_status
) c
CROSS JOIN LATERAL (
    VALUES ('id', c.id), ('descricao', c.descricao)
) AS v(coluna, total_nulos)
WHERE v.total_nulos > 0

UNION ALL

SELECT 'erp_condicoes_pagamento', v.coluna, v.total_nulos
FROM (
    SELECT
        COUNT(*) FILTER (WHERE id IS NULL) AS id,
        COUNT(*) FILTER (WHERE descricao IS NULL) AS descricao
    FROM raw.erp_condicoes_pagamento
) c
CROSS JOIN LATERAL (
    VALUES ('id', c.id), ('descricao', c.descricao)
) AS v(coluna, total_nulos)
WHERE v.total_nulos > 0

UNION ALL

SELECT 'erp_parcelas_condicoes_pagamento', v.coluna, v.total_nulos
FROM (
    SELECT
        COUNT(*) FILTER (WHERE id IS NULL) AS id,
        COUNT(*) FILTER (WHERE condicao_pagamento_id IS NULL) AS condicao_pagamento_id,
        COUNT(*) FILTER (WHERE numero_parcela IS NULL) AS numero_parcela,
        COUNT(*) FILTER (WHERE prazo_dias IS NULL) AS prazo_dias,
        COUNT(*) FILTER (WHERE percentual IS NULL) AS percentual
    FROM raw.erp_parcelas_condicoes_pagamento
) c
CROSS JOIN LATERAL (
    VALUES
        ('id', c.id),
        ('condicao_pagamento_id', c.condicao_pagamento_id),
        ('numero_parcela', c.numero_parcela),
        ('prazo_dias', c.prazo_dias),
        ('percentual', c.percentual)
) AS v(coluna, total_nulos)
WHERE v.total_nulos > 0

UNION ALL

SELECT 'erp_entidades', v.coluna, v.total_nulos
FROM (
    SELECT
        COUNT(*) FILTER (WHERE id IS NULL) AS id,
        COUNT(*) FILTER (WHERE nome IS NULL) AS nome,
        COUNT(*) FILTER (WHERE tipo_entidade_id IS NULL) AS tipo_entidade_id
    FROM raw.erp_entidades
) c
CROSS JOIN LATERAL (
    VALUES
        ('id', c.id),
        ('nome', c.nome),
        ('tipo_entidade_id', c.tipo_entidade_id)
) AS v(coluna, total_nulos)
WHERE v.total_nulos > 0

UNION ALL

SELECT 'erp_tipos_entidades', v.coluna, v.total_nulos
FROM (
    SELECT
        COUNT(*) FILTER (WHERE id IS NULL) AS id,
        COUNT(*) FILTER (WHERE descricao IS NULL) AS descricao
    FROM raw.erp_tipos_entidades
) c
CROSS JOIN LATERAL (
    VALUES ('id', c.id), ('descricao', c.descricao)
) AS v(coluna, total_nulos)
WHERE v.total_nulos > 0

UNION ALL

SELECT 'erp_pedidos_venda', v.coluna, v.total_nulos
FROM (
    SELECT
        COUNT(*) FILTER (WHERE id IS NULL) AS id,
        COUNT(*) FILTER (WHERE cliente_id IS NULL) AS cliente_id,
        COUNT(*) FILTER (WHERE data_pedido IS NULL) AS data_pedido,
        COUNT(*) FILTER (WHERE status_id IS NULL) AS status_id,
        COUNT(*) FILTER (WHERE condicao_pagamento_id IS NULL) AS condicao_pagamento_id,
        COUNT(*) FILTER (WHERE valor_total IS NULL) AS valor_total
    FROM raw.erp_pedidos_venda
) c
CROSS JOIN LATERAL (
    VALUES
        ('id', c.id),
        ('cliente_id', c.cliente_id),
        ('data_pedido', c.data_pedido),
        ('status_id', c.status_id),
        ('condicao_pagamento_id', c.condicao_pagamento_id),
        ('valor_total', c.valor_total)
) AS v(coluna, total_nulos)
WHERE v.total_nulos > 0

UNION ALL

SELECT 'erp_itens_pedidos_venda', v.coluna, v.total_nulos
FROM (
    SELECT
        COUNT(*) FILTER (WHERE id IS NULL) AS id,
        COUNT(*) FILTER (WHERE pedido_id IS NULL) AS pedido_id,
        COUNT(*) FILTER (WHERE produto_id IS NULL) AS produto_id,
        COUNT(*) FILTER (WHERE quantidade IS NULL) AS quantidade,
        COUNT(*) FILTER (WHERE preco_unitario IS NULL) AS preco_unitario
    FROM raw.erp_itens_pedidos_venda
) c
CROSS JOIN LATERAL (
    VALUES
        ('id', c.id),
        ('pedido_id', c.pedido_id),
        ('produto_id', c.produto_id),
        ('quantidade', c.quantidade),
        ('preco_unitario', c.preco_unitario)
) AS v(coluna, total_nulos)
WHERE v.total_nulos > 0

UNION ALL

SELECT 'erp_status_pedidos_venda', v.coluna, v.total_nulos
FROM (
    SELECT
        COUNT(*) FILTER (WHERE id IS NULL) AS id,
        COUNT(*) FILTER (WHERE descricao IS NULL) AS descricao
    FROM raw.erp_status_pedidos_venda
) c
CROSS JOIN LATERAL (
    VALUES ('id', c.id), ('descricao', c.descricao)
) AS v(coluna, total_nulos)
WHERE v.total_nulos > 0

UNION ALL

SELECT 'erp_tabelas_preco', v.coluna, v.total_nulos
FROM (
    SELECT
        COUNT(*) FILTER (WHERE id IS NULL) AS id,
        COUNT(*) FILTER (WHERE nome IS NULL) AS nome,
        COUNT(*) FILTER (WHERE vigencia_inicio IS NULL) AS vigencia_inicio,
        COUNT(*) FILTER (WHERE status_id IS NULL) AS status_id
    FROM raw.erp_tabelas_preco
) c
CROSS JOIN LATERAL (
    VALUES
        ('id', c.id),
        ('nome', c.nome),
        ('vigencia_inicio', c.vigencia_inicio),
        ('status_id', c.status_id)
) AS v(coluna, total_nulos)
WHERE v.total_nulos > 0

UNION ALL

SELECT 'erp_status_tabelas_preco', v.coluna, v.total_nulos
FROM (
    SELECT
        COUNT(*) FILTER (WHERE id IS NULL) AS id,
        COUNT(*) FILTER (WHERE descricao IS NULL) AS descricao
    FROM raw.erp_status_tabelas_preco
) c
CROSS JOIN LATERAL (
    VALUES ('id', c.id), ('descricao', c.descricao)
) AS v(coluna, total_nulos)
WHERE v.total_nulos > 0

UNION ALL

SELECT 'erp_itens_tabelas_preco', v.coluna, v.total_nulos
FROM (
    SELECT
        COUNT(*) FILTER (WHERE id IS NULL) AS id,
        COUNT(*) FILTER (WHERE tabela_id IS NULL) AS tabela_id,
        COUNT(*) FILTER (WHERE produto_id IS NULL) AS produto_id,
        COUNT(*) FILTER (WHERE preco IS NULL) AS preco
    FROM raw.erp_itens_tabelas_preco
) c
CROSS JOIN LATERAL (
    VALUES
        ('id', c.id),
        ('tabela_id', c.tabela_id),
        ('produto_id', c.produto_id),
        ('preco', c.preco)
) AS v(coluna, total_nulos)
WHERE v.total_nulos > 0

UNION ALL

SELECT 'erp_pedidos_compra', v.coluna, v.total_nulos
FROM (
    SELECT
        COUNT(*) FILTER (WHERE id IS NULL) AS id,
        COUNT(*) FILTER (WHERE fornecedor_id IS NULL) AS fornecedor_id,
        COUNT(*) FILTER (WHERE data_pedido IS NULL) AS data_pedido,
        COUNT(*) FILTER (WHERE status_id IS NULL) AS status_id,
        COUNT(*) FILTER (WHERE previsao_entrega IS NULL) AS previsao_entrega
    FROM raw.erp_pedidos_compra
) c
CROSS JOIN LATERAL (
    VALUES
        ('id', c.id),
        ('fornecedor_id', c.fornecedor_id),
        ('data_pedido', c.data_pedido),
        ('status_id', c.status_id),
        ('previsao_entrega', c.previsao_entrega)
) AS v(coluna, total_nulos)
WHERE v.total_nulos > 0

UNION ALL

SELECT 'erp_itens_pedidos_compra', v.coluna, v.total_nulos
FROM (
    SELECT
        COUNT(*) FILTER (WHERE id IS NULL) AS id,
        COUNT(*) FILTER (WHERE pedido_id IS NULL) AS pedido_id,
        COUNT(*) FILTER (WHERE produto_id IS NULL) AS produto_id,
        COUNT(*) FILTER (WHERE quantidade IS NULL) AS quantidade,
        COUNT(*) FILTER (WHERE custo_unitario IS NULL) AS custo_unitario
    FROM raw.erp_itens_pedidos_compra
) c
CROSS JOIN LATERAL (
    VALUES
        ('id', c.id),
        ('pedido_id', c.pedido_id),
        ('produto_id', c.produto_id),
        ('quantidade', c.quantidade),
        ('custo_unitario', c.custo_unitario)
) AS v(coluna, total_nulos)
WHERE v.total_nulos > 0

UNION ALL

SELECT 'erp_status_pedidos_compra', v.coluna, v.total_nulos
FROM (
    SELECT
        COUNT(*) FILTER (WHERE id IS NULL) AS id,
        COUNT(*) FILTER (WHERE descricao IS NULL) AS descricao
    FROM raw.erp_status_pedidos_compra
) c
CROSS JOIN LATERAL (
    VALUES ('id', c.id), ('descricao', c.descricao)
) AS v(coluna, total_nulos)
WHERE v.total_nulos > 0

UNION ALL

SELECT 'erp_contas_receber', v.coluna, v.total_nulos
FROM (
    SELECT
        COUNT(*) FILTER (WHERE id IS NULL) AS id,
        COUNT(*) FILTER (WHERE pedido_venda_id IS NULL) AS pedido_venda_id,
        COUNT(*) FILTER (WHERE valor IS NULL) AS valor
    FROM raw.erp_contas_receber
) c
CROSS JOIN LATERAL (
    VALUES
        ('id', c.id),
        ('pedido_venda_id', c.pedido_venda_id),
        ('valor', c.valor)
) AS v(coluna, total_nulos)
WHERE v.total_nulos > 0

UNION ALL

SELECT 'erp_contas_pagar', v.coluna, v.total_nulos
FROM (
    SELECT
        COUNT(*) FILTER (WHERE id IS NULL) AS id,
        COUNT(*) FILTER (WHERE pedido_compra_id IS NULL) AS pedido_compra_id,
        COUNT(*) FILTER (WHERE valor IS NULL) AS valor
    FROM raw.erp_contas_pagar
) c
CROSS JOIN LATERAL (
    VALUES
        ('id', c.id),
        ('pedido_compra_id', c.pedido_compra_id),
        ('valor', c.valor)
) AS v(coluna, total_nulos)
WHERE v.total_nulos > 0

UNION ALL

SELECT 'erp_parcelas_receber', v.coluna, v.total_nulos
FROM (
    SELECT
        COUNT(*) FILTER (WHERE id IS NULL) AS id,
        COUNT(*) FILTER (WHERE numero_parcela IS NULL) AS numero_parcela,
        COUNT(*) FILTER (WHERE conta_receber_id IS NULL) AS conta_receber_id,
        COUNT(*) FILTER (WHERE valor IS NULL) AS valor,
        COUNT(*) FILTER (WHERE vencimento IS NULL) AS vencimento
    FROM raw.erp_parcelas_receber
) c
CROSS JOIN LATERAL (
    VALUES
        ('id', c.id),
        ('numero_parcela', c.numero_parcela),
        ('conta_receber_id', c.conta_receber_id),
        ('valor', c.valor),
        ('vencimento', c.vencimento)
) AS v(coluna, total_nulos)
WHERE v.total_nulos > 0

UNION ALL

SELECT 'erp_parcelas_pagar', v.coluna, v.total_nulos
FROM (
    SELECT
        COUNT(*) FILTER (WHERE id IS NULL) AS id,
        COUNT(*) FILTER (WHERE numero_parcela IS NULL) AS numero_parcela,
        COUNT(*) FILTER (WHERE conta_pagar_id IS NULL) AS conta_pagar_id,
        COUNT(*) FILTER (WHERE valor IS NULL) AS valor,
        COUNT(*) FILTER (WHERE vencimento IS NULL) AS vencimento
    FROM raw.erp_parcelas_pagar
) c
CROSS JOIN LATERAL (
    VALUES
        ('id', c.id),
        ('numero_parcela', c.numero_parcela),
        ('conta_pagar_id', c.conta_pagar_id),
        ('valor', c.valor),
        ('vencimento', c.vencimento)
) AS v(coluna, total_nulos)
WHERE v.total_nulos > 0


-- =========================
-- WMS
-- =========================

UNION ALL

SELECT 'wms_produtos', v.coluna, v.total_nulos
FROM (
    SELECT
        COUNT(*) FILTER (WHERE codigo IS NULL) AS codigo,
        COUNT(*) FILTER (WHERE descricao IS NULL) AS descricao,
        COUNT(*) FILTER (WHERE unidade_medida IS NULL) AS unidade_medida,
        COUNT(*) FILTER (WHERE categoria_id IS NULL) AS categoria_id,
        COUNT(*) FILTER (WHERE status_id IS NULL) AS status_id
    FROM raw.wms_produtos
) c
CROSS JOIN LATERAL (
    VALUES
        ('codigo', c.codigo),
        ('descricao', c.descricao),
        ('unidade_medida', c.unidade_medida),
        ('categoria_id', c.categoria_id),
        ('status_id', c.status_id)
) AS v(coluna, total_nulos)
WHERE v.total_nulos > 0

UNION ALL

SELECT 'wms_categorias', v.coluna, v.total_nulos
FROM (
    SELECT
        COUNT(*) FILTER (WHERE id IS NULL) AS id,
        COUNT(*) FILTER (WHERE descricao IS NULL) AS descricao
    FROM raw.wms_categorias
) c
CROSS JOIN LATERAL (
    VALUES ('id', c.id), ('descricao', c.descricao)
) AS v(coluna, total_nulos)
WHERE v.total_nulos > 0

UNION ALL

SELECT 'wms_status', v.coluna, v.total_nulos
FROM (
    SELECT
        COUNT(*) FILTER (WHERE id IS NULL) AS id,
        COUNT(*) FILTER (WHERE descricao IS NULL) AS descricao
    FROM raw.wms_status
) c
CROSS JOIN LATERAL (
    VALUES ('id', c.id), ('descricao', c.descricao)
) AS v(coluna, total_nulos)
WHERE v.total_nulos > 0

UNION ALL

SELECT 'wms_localizadores', v.coluna, v.total_nulos
FROM (
    SELECT
        COUNT(*) FILTER (WHERE id IS NULL) AS id,
        COUNT(*) FILTER (WHERE descricao IS NULL) AS descricao,
        COUNT(*) FILTER (WHERE corredor IS NULL) AS corredor,
        COUNT(*) FILTER (WHERE modulo IS NULL) AS modulo,
        COUNT(*) FILTER (WHERE nivel IS NULL) AS nivel,
        COUNT(*) FILTER (WHERE tipo_localizador_id IS NULL) AS tipo_localizador_id
    FROM raw.wms_localizadores
) c
CROSS JOIN LATERAL (
    VALUES
        ('id', c.id),
        ('descricao', c.descricao),
        ('corredor', c.corredor),
        ('modulo', c.modulo),
        ('nivel', c.nivel),
        ('tipo_localizador_id', c.tipo_localizador_id)
) AS v(coluna, total_nulos)
WHERE v.total_nulos > 0

UNION ALL

SELECT 'wms_tipos_localizadores', v.coluna, v.total_nulos
FROM (
    SELECT
        COUNT(*) FILTER (WHERE id IS NULL) AS id,
        COUNT(*) FILTER (WHERE descricao IS NULL) AS descricao
    FROM raw.wms_tipos_localizadores
) c
CROSS JOIN LATERAL (
    VALUES ('id', c.id), ('descricao', c.descricao)
) AS v(coluna, total_nulos)
WHERE v.total_nulos > 0

UNION ALL

SELECT 'wms_estoque', v.coluna, v.total_nulos
FROM (
    SELECT
        COUNT(*) FILTER (WHERE id IS NULL) AS id,
        COUNT(*) FILTER (WHERE produto_id IS NULL) AS produto_id,
        COUNT(*) FILTER (WHERE localizador_id IS NULL) AS localizador_id,
        COUNT(*) FILTER (WHERE quantidade IS NULL) AS quantidade
    FROM raw.wms_estoque
) c
CROSS JOIN LATERAL (
    VALUES
        ('id', c.id),
        ('produto_id', c.produto_id),
        ('localizador_id', c.localizador_id),
        ('quantidade', c.quantidade)
) AS v(coluna, total_nulos)
WHERE v.total_nulos > 0

UNION ALL

SELECT 'wms_movimentacoes', v.coluna, v.total_nulos
FROM (
    SELECT
        COUNT(*) FILTER (WHERE id IS NULL) AS id,
        COUNT(*) FILTER (WHERE produto_id IS NULL) AS produto_id,
        COUNT(*) FILTER (WHERE quantidade IS NULL) AS quantidade,
        COUNT(*) FILTER (WHERE tipo_movimentacao_id IS NULL) AS tipo_movimentacao_id,
        COUNT(*) FILTER (WHERE data_movimentacao IS NULL) AS data_movimentacao
    FROM raw.wms_movimentacoes
) c
CROSS JOIN LATERAL (
    VALUES
        ('id', c.id),
        ('produto_id', c.produto_id),
        ('quantidade', c.quantidade),
        ('tipo_movimentacao_id', c.tipo_movimentacao_id),
        ('data_movimentacao', c.data_movimentacao)
) AS v(coluna, total_nulos)
WHERE v.total_nulos > 0

UNION ALL

SELECT 'wms_tipos_movimentacoes', v.coluna, v.total_nulos
FROM (
    SELECT
        COUNT(*) FILTER (WHERE id IS NULL) AS id,
        COUNT(*) FILTER (WHERE descricao IS NULL) AS descricao
    FROM raw.wms_tipos_movimentacoes
) c
CROSS JOIN LATERAL (
    VALUES ('id', c.id), ('descricao', c.descricao)
) AS v(coluna, total_nulos)
WHERE v.total_nulos > 0

UNION ALL

SELECT 'wms_entidades', v.coluna, v.total_nulos
FROM (
    SELECT
        COUNT(*) FILTER (WHERE id IS NULL) AS id,
        COUNT(*) FILTER (WHERE nome IS NULL) AS nome,
        COUNT(*) FILTER (WHERE tipo_entidade_id IS NULL) AS tipo_entidade_id
    FROM raw.wms_entidades
) c
CROSS JOIN LATERAL (
    VALUES
        ('id', c.id),
        ('nome', c.nome),
        ('tipo_entidade_id', c.tipo_entidade_id)
) AS v(coluna, total_nulos)
WHERE v.total_nulos > 0

UNION ALL

SELECT 'wms_tipos_entidades', v.coluna, v.total_nulos
FROM (
    SELECT
        COUNT(*) FILTER (WHERE id IS NULL) AS id,
        COUNT(*) FILTER (WHERE descricao IS NULL) AS descricao
    FROM raw.wms_tipos_entidades
) c
CROSS JOIN LATERAL (
    VALUES ('id', c.id), ('descricao', c.descricao)
) AS v(coluna, total_nulos)
WHERE v.total_nulos > 0

UNION ALL

SELECT 'wms_pedidos_saida', v.coluna, v.total_nulos
FROM (
    SELECT
        COUNT(*) FILTER (WHERE id IS NULL) AS id,
        COUNT(*) FILTER (WHERE pedido_venda_erp_id IS NULL) AS pedido_venda_erp_id,
        COUNT(*) FILTER (WHERE data_pedido IS NULL) AS data_pedido,
        COUNT(*) FILTER (WHERE entidade_id IS NULL) AS entidade_id,
        COUNT(*) FILTER (WHERE status_pedido_id IS NULL) AS status_pedido_id
    FROM raw.wms_pedidos_saida
) c
CROSS JOIN LATERAL (
    VALUES
        ('id', c.id),
        ('pedido_venda_erp_id', c.pedido_venda_erp_id),
        ('data_pedido', c.data_pedido),
        ('entidade_id', c.entidade_id),
        ('status_pedido_id', c.status_pedido_id)
) AS v(coluna, total_nulos)
WHERE v.total_nulos > 0

UNION ALL

SELECT 'wms_status_pedidos', v.coluna, v.total_nulos
FROM (
    SELECT
        COUNT(*) FILTER (WHERE id IS NULL) AS id,
        COUNT(*) FILTER (WHERE descricao IS NULL) AS descricao
    FROM raw.wms_status_pedidos
) c
CROSS JOIN LATERAL (
    VALUES ('id', c.id), ('descricao', c.descricao)
) AS v(coluna, total_nulos)
WHERE v.total_nulos > 0

UNION ALL

SELECT 'wms_itens_pedidos', v.coluna, v.total_nulos
FROM (
    SELECT
        COUNT(*) FILTER (WHERE id IS NULL) AS id,
        COUNT(*) FILTER (WHERE pedido_id IS NULL) AS pedido_id,
        COUNT(*) FILTER (WHERE produto_id IS NULL) AS produto_id,
        COUNT(*) FILTER (WHERE quantidade IS NULL) AS quantidade
    FROM raw.wms_itens_pedidos
) c
CROSS JOIN LATERAL (
    VALUES
        ('id', c.id),
        ('pedido_id', c.pedido_id),
        ('produto_id', c.produto_id),
        ('quantidade', c.quantidade)
) AS v(coluna, total_nulos)
WHERE v.total_nulos > 0

UNION ALL

SELECT 'wms_movimentacoes_pedidos', v.coluna, v.total_nulos
FROM (
    SELECT
        COUNT(*) FILTER (WHERE id IS NULL) AS id,
        COUNT(*) FILTER (WHERE pedido_id IS NULL) AS pedido_id,
        COUNT(*) FILTER (WHERE movimentacao_id IS NULL) AS movimentacao_id
    FROM raw.wms_movimentacoes_pedidos
) c
CROSS JOIN LATERAL (
    VALUES
        ('id', c.id),
        ('pedido_id', c.pedido_id),
        ('movimentacao_id', c.movimentacao_id)
) AS v(coluna, total_nulos)
WHERE v.total_nulos > 0

UNION ALL

SELECT 'wms_recebimentos', v.coluna, v.total_nulos
FROM (
    SELECT
        COUNT(*) FILTER (WHERE id IS NULL) AS id,
        COUNT(*) FILTER (WHERE data_recebimento IS NULL) AS data_recebimento,
        COUNT(*) FILTER (WHERE status_recebimento_id IS NULL) AS status_recebimento_id
    FROM raw.wms_recebimentos
) c
CROSS JOIN LATERAL (
    VALUES
        ('id', c.id),
        ('data_recebimento', c.data_recebimento),
        ('status_recebimento_id', c.status_recebimento_id)
) AS v(coluna, total_nulos)
WHERE v.total_nulos > 0

UNION ALL

SELECT 'wms_status_recebimentos', v.coluna, v.total_nulos
FROM (
    SELECT
        COUNT(*) FILTER (WHERE id IS NULL) AS id,
        COUNT(*) FILTER (WHERE descricao IS NULL) AS descricao
    FROM raw.wms_status_recebimentos
) c
CROSS JOIN LATERAL (
    VALUES ('id', c.id), ('descricao', c.descricao)
) AS v(coluna, total_nulos)
WHERE v.total_nulos > 0

UNION ALL

SELECT 'wms_itens_recebimentos', v.coluna, v.total_nulos
FROM (
    SELECT
        COUNT(*) FILTER (WHERE id IS NULL) AS id,
        COUNT(*) FILTER (WHERE recebimento_id IS NULL) AS recebimento_id,
        COUNT(*) FILTER (WHERE produto_id IS NULL) AS produto_id,
        COUNT(*) FILTER (WHERE quantidade_esperada IS NULL) AS quantidade_esperada,
        COUNT(*) FILTER (WHERE quantidade_confirmada IS NULL) AS quantidade_confirmada
    FROM raw.wms_itens_recebimentos
) c
CROSS JOIN LATERAL (
    VALUES
        ('id', c.id),
        ('recebimento_id', c.recebimento_id),
        ('produto_id', c.produto_id),
        ('quantidade_esperada', c.quantidade_esperada),
        ('quantidade_confirmada', c.quantidade_confirmada)
) AS v(coluna, total_nulos)
WHERE v.total_nulos > 0

UNION ALL

SELECT 'wms_alocacoes', v.coluna, v.total_nulos
FROM (
    SELECT
        COUNT(*) FILTER (WHERE id IS NULL) AS id,
        COUNT(*) FILTER (WHERE recebimento_id IS NULL) AS recebimento_id,
        COUNT(*) FILTER (WHERE produto_id IS NULL) AS produto_id,
        COUNT(*) FILTER (WHERE localizador_id IS NULL) AS localizador_id,
        COUNT(*) FILTER (WHERE quantidade IS NULL) AS quantidade
    FROM raw.wms_alocacoes
) c
CROSS JOIN LATERAL (
    VALUES
        ('id', c.id),
        ('recebimento_id', c.recebimento_id),
        ('produto_id', c.produto_id),
        ('localizador_id', c.localizador_id),
        ('quantidade', c.quantidade)
) AS v(coluna, total_nulos)
WHERE v.total_nulos > 0

UNION ALL

SELECT 'wms_movimentacoes_alocacoes', v.coluna, v.total_nulos
FROM (
    SELECT
        COUNT(*) FILTER (WHERE id IS NULL) AS id,
        COUNT(*) FILTER (WHERE alocacao_id IS NULL) AS alocacao_id,
        COUNT(*) FILTER (WHERE movimentacao_id IS NULL) AS movimentacao_id
    FROM raw.wms_movimentacoes_alocacoes
) c
CROSS JOIN LATERAL (
    VALUES
        ('id', c.id),
        ('alocacao_id', c.alocacao_id),
        ('movimentacao_id', c.movimentacao_id)
) AS v(coluna, total_nulos)
WHERE v.total_nulos > 0

UNION ALL

SELECT 'wms_expedicoes', v.coluna, v.total_nulos
FROM (
    SELECT
        COUNT(*) FILTER (WHERE id IS NULL) AS id,
        COUNT(*) FILTER (WHERE data_expedicao IS NULL) AS data_expedicao,
        COUNT(*) FILTER (WHERE pedido_id IS NULL) AS pedido_id,
        COUNT(*) FILTER (WHERE status_expedicao_id IS NULL) AS status_expedicao_id
    FROM raw.wms_expedicoes
) c
CROSS JOIN LATERAL (
    VALUES
        ('id', c.id),
        ('data_expedicao', c.data_expedicao),
        ('pedido_id', c.pedido_id),
        ('status_expedicao_id', c.status_expedicao_id)
) AS v(coluna, total_nulos)
WHERE v.total_nulos > 0

UNION ALL

SELECT 'wms_status_expedicoes', v.coluna, v.total_nulos
FROM (
    SELECT
        COUNT(*) FILTER (WHERE id IS NULL) AS id,
        COUNT(*) FILTER (WHERE descricao IS NULL) AS descricao
    FROM raw.wms_status_expedicoes
) c
CROSS JOIN LATERAL (
    VALUES ('id', c.id), ('descricao', c.descricao)
) AS v(coluna, total_nulos)
WHERE v.total_nulos > 0

UNION ALL

SELECT 'wms_itens_expedicoes', v.coluna, v.total_nulos
FROM (
    SELECT
        COUNT(*) FILTER (WHERE id IS NULL) AS id,
        COUNT(*) FILTER (WHERE expedicao_id IS NULL) AS expedicao_id,
        COUNT(*) FILTER (WHERE produto_id IS NULL) AS produto_id,
        COUNT(*) FILTER (WHERE quantidade_esperada IS NULL) AS quantidade_esperada,
        COUNT(*) FILTER (WHERE quantidade_confirmada IS NULL) AS quantidade_confirmada
    FROM raw.wms_itens_expedicoes
) c
CROSS JOIN LATERAL (
    VALUES
        ('id', c.id),
        ('expedicao_id', c.expedicao_id),
        ('produto_id', c.produto_id),
        ('quantidade_esperada', c.quantidade_esperada),
        ('quantidade_confirmada', c.quantidade_confirmada)
) AS v(coluna, total_nulos)
WHERE v.total_nulos > 0

UNION ALL

SELECT 'wms_movimentacoes_expedicoes', v.coluna, v.total_nulos
FROM (
    SELECT
        COUNT(*) FILTER (WHERE id IS NULL) AS id,
        COUNT(*) FILTER (WHERE expedicao_id IS NULL) AS expedicao_id,
        COUNT(*) FILTER (WHERE movimentacao_id IS NULL) AS movimentacao_id
    FROM raw.wms_movimentacoes_expedicoes
) c
CROSS JOIN LATERAL (
    VALUES
        ('id', c.id),
        ('expedicao_id', c.expedicao_id),
        ('movimentacao_id', c.movimentacao_id)
) AS v(coluna, total_nulos)
WHERE v.total_nulos > 0

UNION ALL

SELECT 'wms_inventarios', v.coluna, v.total_nulos
FROM (
    SELECT
        COUNT(*) FILTER (WHERE id IS NULL) AS id,
        COUNT(*) FILTER (WHERE data_inventario IS NULL) AS data_inventario,
        COUNT(*) FILTER (WHERE status_inventario_id IS NULL) AS status_inventario_id
    FROM raw.wms_inventarios
) c
CROSS JOIN LATERAL (
    VALUES
        ('id', c.id),
        ('data_inventario', c.data_inventario),
        ('status_inventario_id', c.status_inventario_id)
) AS v(coluna, total_nulos)
WHERE v.total_nulos > 0

UNION ALL

SELECT 'wms_status_inventarios', v.coluna, v.total_nulos
FROM (
    SELECT
        COUNT(*) FILTER (WHERE id IS NULL) AS id,
        COUNT(*) FILTER (WHERE descricao IS NULL) AS descricao
    FROM raw.wms_status_inventarios
) c
CROSS JOIN LATERAL (
    VALUES ('id', c.id), ('descricao', c.descricao)
) AS v(coluna, total_nulos)
WHERE v.total_nulos > 0

UNION ALL

SELECT 'wms_itens_inventarios', v.coluna, v.total_nulos
FROM (
    SELECT
        COUNT(*) FILTER (WHERE id IS NULL) AS id,
        COUNT(*) FILTER (WHERE inventario_id IS NULL) AS inventario_id,
        COUNT(*) FILTER (WHERE produto_id IS NULL) AS produto_id,
        COUNT(*) FILTER (WHERE localizador_id IS NULL) AS localizador_id,
        COUNT(*) FILTER (WHERE quantidade_congelada IS NULL) AS quantidade_congelada,
        COUNT(*) FILTER (WHERE quantidade_contada IS NULL) AS quantidade_contada
    FROM raw.wms_itens_inventarios
) c
CROSS JOIN LATERAL (
    VALUES
        ('id', c.id),
        ('inventario_id', c.inventario_id),
        ('produto_id', c.produto_id),
        ('localizador_id', c.localizador_id),
        ('quantidade_congelada', c.quantidade_congelada),
        ('quantidade_contada', c.quantidade_contada)
) AS v(coluna, total_nulos)
WHERE v.total_nulos > 0

UNION ALL

SELECT 'wms_movimentacoes_inventarios', v.coluna, v.total_nulos
FROM (
    SELECT
        COUNT(*) FILTER (WHERE id IS NULL) AS id,
        COUNT(*) FILTER (WHERE inventario_id IS NULL) AS inventario_id,
        COUNT(*) FILTER (WHERE movimentacao_id IS NULL) AS movimentacao_id
    FROM raw.wms_movimentacoes_inventarios
) c
CROSS JOIN LATERAL (
    VALUES
        ('id', c.id),
        ('inventario_id', c.inventario_id),
        ('movimentacao_id', c.movimentacao_id)
) AS v(coluna, total_nulos)
WHERE v.total_nulos > 0

ORDER BY tabela, coluna;