import psycopg
from config.connections import criar_conexao_destino

destino = criar_conexao_destino()


try:
    with destino.connect() as conexao:
        with open("../../data/exports/produtos_erp.csv", "r", encoding="utf-8") as arquivo_csv:
            cursor = conexao.cursor()
            cursor.copy_expert(
                """
                COPY produtos (codigo, descricao, unidade_medida, estoque_minimo, estoque_maximo, categoria_id, status_id)
                FROM STDIN WITH CSV HEADER DELIMITER ';'
                """,
                arquivo_csv
            )
            conexao.commit()
            print("Dados inseridos com sucesso na tabela produtos do banco de dados destino.")



except Exception as e:
    print(f"Erro ao conectar ao banco de dados destino e processar a inserção dos dados: {e}")