from pathlib import Path
from psycopg import sql
from src.config.connections import criar_conexao_psycopg_destino

DIRETORIO_EXPORTACAO = (Path(__file__).resolve().parents[2] / "data" / "exports" / "wms")

CARGAS_WMS = {
    'pass'
}

def carregar_csv(
    conexao,
    arquivo_csv: Path,
    tabela_destino: str,
    colunas:tuple[str, ...],
) -> None:
    """Carrega um CSV usando COPY FROM STDIN."""


    if not arquivo_csv is file():
        raise FileNotFoundError(
            f"Arquivo csv não encontrado: {arquivo_csv}"
        )

    if not colunas():
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
        sql.Sql(", ").join(
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
        f"{len(CARGAS_ERP)} tabelas processadas."
    )

if __name__ == "__main__":
    executar_carga