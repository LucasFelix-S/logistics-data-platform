from pathlib import Path
from src.config.connections import criar_conexao_psycopg_destino

def carregar_csv(
    arquivo_csv: Path,
    tabela_destino: str,
    colunas: tuple[str, ...],
) -> None:

    if not arquivo_csv.is_file():
        raise FileNotFoundError(
            f"Arquivo não encontrado: {arquivo_csv}"
        )

    lista_colunas = ", ".join(colunas)

    comando_copy = f"""
        COPY {tabela_destino} ({lista_colunas})
        FROM STDIN
        WITH (
            FORMAT CSV,
            HEADER TRUE,
            DELIMITER ';'
        )
    """

    with criar_conexao_psycopg_destino() as conexao:
        with conexao.cursor() as cursor:
            with cursor.copy(comando_copy) as copy:
                with arquivo_csv.open(
                    "r",
                    encoding="utf-8",
                    newline=""
                ) as arquivo:

                    while bloco := arquivo.read(1024 * 1024):
                        copy.write(bloco)

    print(
        f"Carga concluída: {arquivo_csv.name} "
        f"→ {tabela_destino}"
    )


if __name__ == "__main__":

    raiz_projeto = Path(__file__).resolve().parents[2]

    arquivo = (raiz_projeto / "data" / "exports" / "produtos_erp.csv")

    carregar_csv(
        arquivo_csv=arquivo,
        tabela_destino="raw.erp_produtos",
        colunas=("codigo", "descricao", "unidade_medida", "estoque_minimo", "estoque_maximo", "categoria_id", "status_id"),
    )

    #... aqui eu posso seguir com as demais inserções, sem precisar repetir todo o fluxo que está na função "carregar_csv"