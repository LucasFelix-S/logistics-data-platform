from pathlib import Path
from psycopg import sql
from src.config.connections import criar_conexao_psycopg_destino

DIRETORIO_EXPORTACAO = (Path(__file__).resolve().parents[2] / "data" / "exports" / "wms")

CARGAS_WMS = {
    "produtos_wms.csv": {
        "tabela": "wms_produtos",
        "colunas": ("codigo", "descricao", "unidade_medida", "estoque_minimo", "estoque_maximo", "categoria_id", "status_id",
        ),
    },
    "categorias_wms.csv": {
        "tabela": "wms_categorias",
        "colunas": ("id", "descricao"),
    },
    "status_wms.csv": {
        "tabela": "wms_status",
        "colunas": ("id", "descricao"),
    },
    "localizadores_wms.csv": {
        "tabela": "wms_localizadores",
        "colunas": ("id","descricao", "corredor", "modulo", "nivel", "tipo_localizador_id",),
    },
    "tipos_localizadores_wms.csv": {
        "tabela": "wms_tipos_localizadores",
        "colunas": ("id", "descricao"),
    },
    "estoque_wms.csv": {
        "tabela": "wms_estoque",
        "colunas": ("id", "produto_id", "localizador_id", "lote", "validade", "quantidade",),
    },
    "movimentacoes_wms.csv": {
        "tabela": "wms_movimentacoes",
        "colunas": ("id", "produto_id", "lote", "validade", "quantidade", "localizador_origem", "localizador_destino", "tipo_movimentacao_id", "data_movimentacao",),
    },
    "tipos_movimentacoes_wms.csv": {
        "tabela": "wms_tipos_movimentacoes",
        "colunas": ("id", "descricao"),
    },
    "entidades_wms.csv": {
        "tabela": "wms_entidades",
        "colunas": ("id", "nome", "tipo_entidade_id"),
    },
    "tipos_entidades_wms.csv": {
        "tabela": "wms_tipos_entidades",
        "colunas": ("id", "descricao"),
    },
    "pedidos_saida_wms.csv": {
        "tabela": "wms_pedidos_saida",
        "colunas": ("id", "pedido_venda_erp_id", "data_pedido", "entidade_id", "status_pedido_id",),
    },
    "status_pedidos_wms.csv": {
        "tabela": "wms_status_pedidos",
        "colunas": ("id", "descricao"),
    },
    "itens_pedidos_wms.csv": {
        "tabela": "wms_itens_pedidos",
        "colunas": ("id", "pedido_id", "produto_id", "quantidade",),
    },
    "movimentacoes_pedidos_wms.csv": {
        "tabela": "wms_movimentacoes_pedidos",
        "colunas": ("id", "pedido_id", "movimentacao_id",),
    },
    "recebimentos_wms.csv": {
        "tabela": "wms_recebimentos",
        "colunas": ("id", "data_recebimento", "entidade_id", "status_recebimento_id",),
    },
    "status_recebimentos_wms.csv": {
        "tabela": "wms_status_recebimentos",
        "colunas": ("id", "descricao"),
    },
    "itens_recebimentos_wms.csv": {
        "tabela": "wms_itens_recebimentos",
        "colunas": ("id", "recebimento_id", "produto_id", "lote", "validade", "quantidade_esperada", "quantidade_confirmada",),
    },
    "alocacoes_wms.csv": {
        "tabela": "wms_alocacoes",
        "colunas": ("id", "recebimento_id", "produto_id", "localizador_id", "lote", "validade", "quantidade",),
    },
    "movimentacoes_alocacoes_wms.csv": {
        "tabela": "wms_movimentacoes_alocacoes",
        "colunas": ("id", "alocacao_id", "movimentacao_id",),
    },
    "expedicoes_wms.csv": {
        "tabela": "wms_expedicoes",
        "colunas": ("id", "data_expedicao", "pedido_id", "status_expedicao_id",),
    },
    "status_expedicoes_wms.csv": {
        "tabela": "wms_status_expedicoes",
        "colunas": ("id", "descricao"),
    },
    "itens_expedicoes_wms.csv": {
        "tabela": "wms_itens_expedicoes",
        "colunas": ("id", "expedicao_id", "produto_id", "lote", "validade", "quantidade_esperada","quantidade_confirmada",),
    },
    "movimentacoes_expedicoes_wms.csv": {
        "tabela": "wms_movimentacoes_expedicoes",
        "colunas": ("id", "expedicao_id", "movimentacao_id",),
    },
    "inventarios_wms.csv": {
        "tabela": "wms_inventarios",
        "colunas": ("id", "data_inventario", "status_inventario_id",),
    },
    "status_inventarios_wms.csv": {
        "tabela": "wms_status_inventarios",
        "colunas": ("id", "descricao"),
    },
    "itens_inventarios_wms.csv": {
        "tabela": "wms_itens_inventarios",
        "colunas": ("id", "inventario_id", "produto_id", "localizador_id", "lote", "validade", "quantidade_congelada", "quantidade_contada",),
    },
    "movimentacoes_inventarios_wms.csv": {
        "tabela": "wms_movimentacoes_inventarios",
        "colunas": ("id", "inventario_id", "movimentacao_id",),
    },
}

def carregar_csv(
    conexao,
    arquivo_csv: Path,
    tabela_destino: str,
    colunas:tuple[str, ...],
) -> None:
    """Carrega um CSV usando COPY FROM STDIN."""


    if not arquivo_csv.is_file():
        raise FileNotFoundError(
            f"Arquivo csv não encontrado: {arquivo_csv}"
        )

    if not colunas:
        raise ValueError(
            f"Nenhuma coluna definida para: {tabela_destino}"
        )

    schema, nome_tabela = tabela_destino.split(".", maxsplit=1)

    comando_copy = sql.SQL(
        """
        COPY {}.{} ({})
        FROM STDIN
        WITH (
            FORMAT CSV,
            HEADER TRUE,
            DELIMITER ';',
            ENCODING 'UTF8'
        )
        """
    ).format(
        sql.Identifier(schema),
        sql.Identifier(nome_tabela),
        sql.SQL(", ").join(
            sql.Identifier(coluna) for coluna in colunas
        ),
    )

    with conexao.cursor() as cursor:
        with cursor.copy(comando_copy) as copy:
            with arquivo_csv.open(
                "r",
                encoding="utf-8",
                newline="",
            ) as arquivo:

                while bloco := arquivo.read(1024 * 1024):
                    copy.write(bloco)

def executar_carga () -> None:
    """Executa todas as cargas WMS em uma única transação"""

    with criar_conexao_psycopg_destino() as conexao:

        for nome_arquivo, configuracao in CARGAS_WMS.items():
            arquivo_csv = DIRETORIO_EXPORTACAO / nome_arquivo

            tabela_destino = (
                f"raw.{configuracao['tabela']}"
            )

            carregar_csv(
                conexao=conexao,
                arquivo_csv=arquivo_csv,
                tabela_destino=tabela_destino,
                colunas=configuracao["colunas"],
            )

            print(
                f"Carga executada {arquivo_csv.name}"
                f"-> {tabela_destino}"
            )

    print(
        f"Carga do WMS concluída: "
        f"{len(CARGAS_WMS)} tabelas processadas."
    )

if __name__ == "__main__":
    executar_carga()