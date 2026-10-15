import pandas as pd
from pathlib import Path
from src.config.connections import criar_conexao_origem

DIRETORIO_EXPORTACAO = (Path(__file__).resolve().parents[2] / "data" / "exports")

origem = criar_conexao_origem()

try:
    with origem.connect() as conexao:
        dados_produtos = pd.read_sql_query(
        """
            SELECT
                A.codigo,
                A.descricao,
                A.unidade_medida,
                A.estoque_minimo,
                A.estoque_maximo,
                A.categoria_id,
                A.status_id
            FROM erp.produtos A
        """, conexao)

        arquivo_csv = DIRETORIO_EXPORTACAO / "produtos_erp.csv"

        dados_produtos.to_csv(
            arquivo_csv, 
            index=False, 
            sep=";", 
            encoding="utf-8")

        #... aqui eu posso seguir com as demais extrações

finally:
    conexao.dispose()