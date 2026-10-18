import pandas as pd
from pathlib import Path
from src.config.connections import criar_conexao_origem

DIRETORIO_EXPORTACAO = (
    Path(__file__).resolve().parents[2] / "data" / "exports"
)

origem = criar_conexao_origem()

CONSULTAS_WMS = {
    "produtos_wms": """
        SELECT
            A.codigo,
            A.descricao,
            A.unidade_medida,
            A.estoque_minimo,
            A.estoque_maximo,
            A.categoria_id,
            A.status_id
        FROM wms.produtos A
    """,

    "categorias_wms": """
        SELECT
            A.id,
            A.descricao
        FROM wms.categorias A
    """,

    "status_wms": """
        SELECT
            A.id,
            A.descricao
        FROM wms.status A
    """,

    "tipos_localizadores_wms": """
        SELECT
            A.id,
            A.descricao
        FROM wms.tipos_localizadores A
    """,

    "localizadores_wms": """
        SELECT
            A.id,
            A.descricao,
            A.corredor,
            A.modulo,
            A.nivel,
            A.tipo_localizador_id
        FROM wms.localizadores A
    """,

    "tipos_movimentacoes_wms": """
        SELECT
            A.id,
            A.descricao
        FROM wms.tipos_movimentacoes A
    """,

    "estoque_wms": """
        SELECT
            A.id,
            A.produto_id,
            A.localizador_id,
            A.lote,
            A.validade,
            A.quantidade
        FROM wms.estoque A
    """,

    "movimentacoes_wms": """
        SELECT
            A.id,
            A.produto_id,
            A.lote,
            A.validade,
            A.quantidade,
            A.localizador_origem,
            A.localizador_destino,
            A.tipo_movimentacao_id,
            A.data_movimentacao
        FROM wms.movimentacoes A
    """,

    "entidades_wms": """
        SELECT
            A.id,
            A.nome,
            A.tipo_entidade_id
        FROM wms.entidades A
    """,

    "tipos_entidades_wms": """
        SELECT
            A.id,
            A.descricao
        FROM wms.tipos_entidades A
    """,

    "pedidos_saida_wms": """
        SELECT
            A.id,
            A.pedido_venda_erp_id,
            A.data_pedido,
            A.entidade_id,
            A.status_pedido_id
        FROM wms.pedidos_saida A
    """,

    "status_pedidos_wms": """
        SELECT
            A.id,
            A.descricao
        FROM wms.status_pedidos A
    """,

    "itens_pedidos_wms": """
        SELECT
            A.id,
            A.pedido_id,
            A.produto_id,
            A.quantidade
        FROM wms.itens_pedidos A
    """,

    "movimentacoes_pedidos_wms": """
        SELECT
            A.id,
            A.pedido_id,
            A.movimentacao_id
        FROM wms.movimentacoes_pedidos A
    """,

    "recebimentos_wms": """
        SELECT
            A.id,
            A.data_recebimento,
            A.entidade_id,
            A.status_recebimento_id
        FROM wms.recebimentos A
    """,

    "status_recebimentos_wms": """
        SELECT
            A.id,
            A.descricao
        FROM wms.status_recebimentos A
    """,

    "itens_recebimentos_wms": """
        SELECT
            A.id,
            A.recebimento_id,
            A.produto_id,
            A.lote,
            A.validade,
            A.quantidade_esperada,
            A.quantidade_confirmada
        FROM wms.itens_recebimentos A
    """,

    "alocacoes_wms": """
        SELECT
            A.id,
            A.recebimento_id,
            A.produto_id,
            A.localizador_id,
            A.lote,
            A.validade,
            A.quantidade
        FROM wms.alocacoes A
    """,

    "movimentacoes_alocacoes_wms": """
        SELECT
            A.id,
            A.alocacao_id,
            A.movimentacao_id
        FROM wms.movimentacoes_alocacoes A
    """,

    "expedicoes_wms": """
        SELECT
            A.id,
            A.data_expedicao,
            A.pedido_id,
            A.status_expedicao_id
        FROM wms.expedicoes A
    """,

    "status_expedicoes_wms": """
        SELECT
            A.id,
            A.descricao
        FROM wms.status_expedicoes A
    """,

    "itens_expedicoes_wms": """
        SELECT
            A.id,
            A.expedicao_id,
            A.produto_id,
            A.lote,
            A.validade,
            A.quantidade_esperada,
            A.quantidade_confirmada
        FROM wms.itens_expedicoes A
    """,

    "movimentacoes_expedicoes_wms": """
        SELECT
            A.id,
            A.expedicao_id,
            A.movimentacao_id
        FROM wms.movimentacoes_expedicoes A
    """,

    "inventarios_wms": """
        SELECT
            A.id,
            A.data_inventario,
            A.status_inventario_id
        FROM wms.inventarios A
    """,

    "status_inventarios_wms": """
        SELECT
            A.id,
            A.descricao
        FROM wms.status_inventarios A
    """,

    "itens_inventarios_wms": """
        SELECT
            A.id,
            A.inventario_id,
            A.produto_id,
            A.localizador_id,
            A.lote,
            A.validade,
            A.quantidade_congelada,
            A.quantidade_contada
        FROM wms.itens_inventarios A
    """,

    "movimentacoes_inventarios_wms": """
        SELECT
            A.id,
            A.inventario_id,
            A.movimentacao_id
        FROM wms.movimentacoes_inventarios A
    """
}


try:
    DIRETORIO_EXPORTACAO = (Path(__file__).resolve().parents[2] / "data" / "exports" / "wms")

    with origem.connect() as conexao:

        for nome_arquivo, consulta in CONSULTAS_WMS.items():

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