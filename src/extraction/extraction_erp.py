import pandas as pd
from pathlib import Path
from src.config.connections import criar_conexao_origem

DIRETORIO_EXPORTACAO = (
    Path(__file__).resolve().parents[2] / "data" / "exports"
)

origem = criar_conexao_origem()

CONSULTAS_ERP = {
    "produtos_erp": """
        SELECT
            A.codigo,
            A.descricao,
            A.unidade_medida,
            A.estoque_minimo,
            A.estoque_maximo,
            A.categoria_id,
            A.status_id
        FROM erp.produtos A
    """,

    "categorias_erp": """
        SELECT
            A.id,
            A.descricao
        FROM erp.categorias A
    """,

    "status_erp": """
        SELECT
            A.id,
            A.descricao
        FROM erp.status A
    """,

    "condicoes_pagamento_erp": """
        SELECT
            A.id,
            A.descricao
        FROM erp.condicoes_pagamento A
    """,

    "tipos_entidades_erp": """
        SELECT
            A.id,
            A.descricao
        FROM erp.tipos_entidades A
    """,

    "entidades_erp": """
        SELECT
            A.id,
            A.nome,
            A.tipo_entidade_id
        FROM erp.entidades A
    """,

    "status_pedidos_venda_erp": """
        SELECT
            A.id,
            A.descricao
        FROM erp.status_pedidos_venda A
    """,

    "status_tabelas_preco_erp": """
        SELECT
            A.id,
            A.descricao
        FROM erp.status_tabelas_preco A
    """,

    "pedidos_compra_erp": """
        SELECT
            A.id,
            A.fornecedor_id,
            A.data_pedido,
            A.status_id,
            A.previsao_entrega
        FROM erp.pedidos_compra A
    """,

    "status_pedidos_compra_erp": """
        SELECT
            A.id,
            A.descricao
        FROM erp.status_pedidos_compra A
    """,

    "parcelas_condicoes_pagamento_erp": """
        SELECT
            A.id,
            A.condicao_pagamento_id,
            A.numero_parcela,
            A.prazo_dias,
            A.percentual
        FROM erp.parcelas_condicoes_pagamento A
    """,

    "itens_pedidos_venda_erp": """
        SELECT
            A.id,
            A.pedido_id,
            A.produto_id,
            A.quantidade,
            A.preco_unitario,
            A.desconto
        FROM erp.itens_pedidos_venda A
    """,

    "pedidos_venda_erp": """
        SELECT
            A.id,
            A.cliente_id,
            A.data_pedido,
            A.status_id,
            A.condicao_pagamento_id,
            A.valor_total
        FROM erp.pedidos_venda A
    """,

    "itens_pedidos_compra_erp": """
        SELECT
            A.id,
            A.pedido_id,
            A.produto_id,
            A.quantidade,
            A.custo_unitario
        FROM erp.itens_pedidos_compra A
    """,

    "itens_tabelas_preco_erp": """
        SELECT
            A.id,
            A.tabela_id,
            A.produto_id,
            A.preco
        FROM erp.itens_tabelas_preco A
    """,

    "contas_receber_erp": """
        SELECT
            A.id,
            A.pedido_venda_id,
            A.valor
        FROM erp.contas_receber A
    """,

    "contas_pagar_erp": """
        SELECT
            A.id,
            A.pedido_compra_id,
            A.valor
        FROM erp.contas_pagar A
    """,

    "parcelas_receber_erp": """
        SELECT
            A.id,
            A.numero_parcela,
            A.conta_receber_id,
            A.valor,
            A.vencimento,
            A.pagamento
        FROM erp.parcelas_receber A
    """,

    "parcelas_pagar_erp": """
        SELECT
            A.id,
            A.numero_parcela,
            A.conta_pagar_id,
            A.valor,
            A.vencimento,
            A.pagamento
        FROM erp.parcelas_pagar A
    """,

    "tabelas_preco_erp": """
        SELECT
            A.id,
            A.nome,
            A.vigencia_inicio,
            A.vigencia_fim,
            A.status_id
        FROM erp.tabelas_preco A
    """
}


try:
    DIRETORIO_EXPORTACAO = (Path(__file__).resolve().parents[2] / "data" / "exports")

    with origem.connect() as conexao:

        for nome_arquivo, consulta in CONSULTAS_ERP.items():

            dados = pd.read_sql_query(consulta, conexao)

            arquivo_exportacao = (
                DIRETORIO_EXPORTACAO / f"{nome_arquivo}.csv"
            )

            dados.to_csv(
                arquivo_exportacao,
                index=False,
                sep=";",
                encoding="utf-8"
            )

            print(
                f"Extração concluída: {nome_arquivo}.csv "
                f"({len(dados)} registros)"
            )

finally:
    origem.dispose()