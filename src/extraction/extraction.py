import pandas as pd
import psycopg2
from sqlalchemy import create_engine

origem = create_engine(
    "postgresql+psycopg://"
    f"{os.getenv('DB_USER')}:"
    f"{os.getenv('DB_PASSWORD')}@"
    f"{os.getenv('DB_HOST')}:"
    f"{os.getenv('DB_PORT')}/"
    f"{os.getenv('DB_NAME')}"
)

dados_produtos = pd.read_sql_query(
    "SELECT " \
    "   A.codigo " \
    "   ,A.descricao " \
    "   ,A.unidade_medida " \
    "   ,A.estoque_minimo " \
    "   ,A.estoque_maximo " \
    "   ,A.categoria_id " \
    "   ,A.status_id " \
    "FROM erp.produtos A", origem)

arquivo_produtos = "../../data/exports/produtos_erp.csv"
dados_produtos.to_csv(arquivo_produtos, index=False, sep=";", encoding="utf-8")