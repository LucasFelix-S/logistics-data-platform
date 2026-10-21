from pathlib import Path
from psycopg import sql
from src.config.connections import criar_conexao_psycopg_destino

DIRETORIO_EXPORTACAO = (Path(__file__).resolve().parents[2] / "data" / "exports" / "erp")

CARGAS_ERP = {
    "produtos_erp.csv": {
        "tabela": "erp_produtos",
        "colunas": ("codigo", "descricao", "unidade_medida", "estoque_minimo", "estoque_maximo", "categoria_id", "status_id",),
    },
    "categorias_erp.csv": {
        "tabela": "erp_categorias",
        "colunas": ("id", "descricao"),
    },
    "status_erp.csv": {
        "tabela": "erp_status",
        "colunas": ("id", "descricao"),
    },
    "condicoes_pagamento_erp.csv": {
        "tabela": "erp_condicoes_pagamento",
        "colunas": ("id", "descricao"),
    },
    "tipos_entidades_erp.csv": {
        "tabela": "erp_tipos_entidades",
        "colunas": ("id", "descricao"),
    },
    "entidades_erp.csv": {
        "tabela": "erp_entidades",
        "colunas": ("id", "nome", "tipo_entidade_id"),
    },
    "status_pedidos_venda_erp.csv": {
        "tabela": "erp_status_pedidos_venda",
        "colunas": ("id", "descricao"),
    },
    "status_tabelas_preco_erp.csv": {
        "tabela": "erp_status_tabelas_preco",
        "colunas": ("id", "descricao"),
    },
    "pedidos_compra_erp.csv": {
        "tabela": "erp_pedidos_compra",
        "colunas": ("id", "fornecedor_id", "data_pedido", "status_id", "previsao_entrega",),
    },
    "status_pedidos_compra_erp.csv": {
        "tabela": "erp_status_pedidos_compra",
        "colunas": ("id", "descricao"),
    },
    "parcelas_condicoes_pagamento_erp.csv": {
        "tabela": "erp_parcelas_condicoes_pagamento",
        "colunas": ("id", "condicao_pagamento_id", "numero_parcela", "prazo_dias", "percentual",),
    },
    "itens_pedidos_venda_erp.csv": {
        "tabela": "erp_itens_pedidos_venda",
        "colunas": ("id", "pedido_id", "produto_id", "quantidade", "preco_unitario", "desconto",),
    },
    "pedidos_venda_erp.csv": {
        "tabela": "erp_pedidos_venda",
        "colunas": ("id", "cliente_id", "data_pedido", "status_id", "condicao_pagamento_id", "valor_total",),
    },
    "itens_pedidos_compra_erp.csv": {
        "tabela": "erp_itens_pedidos_compra",
        "colunas": ("id", "pedido_id", "produto_id", "quantidade", "custo_unitario",),
    },
    "itens_tabelas_preco_erp.csv": {
        "tabela": "erp_itens_tabelas_preco",
        "colunas": ("id", "tabela_id", "produto_id", "preco"),
    },
    "contas_receber_erp.csv": {
        "tabela": "erp_contas_receber",
        "colunas": ("id", "pedido_venda_id", "valor"),
    },
    "contas_pagar_erp.csv": {
        "tabela": "erp_contas_pagar",
        "colunas": ("id", "pedido_compra_id", "valor"),
    },
    "parcelas_receber_erp.csv": {
        "tabela": "erp_parcelas_receber",
        "colunas": ("id", "numero_parcela", "conta_receber_id", "valor", "vencimento", "pagamento",),
    },
    "parcelas_pagar_erp.csv": {
        "tabela": "erp_parcelas_pagar",
        "colunas": ("id", "numero_parcela", "conta_pagar_id", "valor", "vencimento", "pagamento",),
    },
    "tabelas_preco_erp.csv": {
        "tabela": "erp_tabelas_preco",
        "colunas": ("id", "nome", "vigencia_inicio", "vigencia_fim", "status_id",),
    },
}

def carregar_csv(
    conexao,
    arquivo_csv: Path,
    tabela_destino: str,
    colunas: tuple[str, ...],
) -> None:
    """Carrega um CSV usando COPY FROM STDIN."""

    if not arquivo_csv.is_file():
        raise FileNotFoundError(
            f"Arquivo CSV não encontrado: {arquivo_csv}"
        )

    if not colunas:
        raise ValueError(
            f"Nenhuma coluna definida para {tabela_destino}."
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


def executar_cargas() -> None:
    """Executa todas as cargas ERP em uma única transação."""

    with criar_conexao_psycopg_destino() as conexao:

        for nome_arquivo, configuracao in CARGAS_ERP.items():
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
                f"Carga executada: {arquivo_csv.name} "
                f"-> {tabela_destino}"
            )

    print(
        f"Carga do ERP concluída: "
        f"{len(CARGAS_ERP)} tabelas processadas."
    )


if __name__ == "__main__":
    executar_carga()