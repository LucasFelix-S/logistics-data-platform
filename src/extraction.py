import pandas as pd
from connections import criar_conexao_origem

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
        """, origem)

        dados_produtos.to_csv(
            "../../data/exports/produtos_erp.csv", 
            index=False, 
            sep=";", 
            encoding="utf-8")

        #... aqui eu posso seguir com as demais extrações

finally:
    origem.dispose()