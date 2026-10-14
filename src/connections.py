import os
from dotenv import load_dotenv
from sqlalchemy import create_engine

load_dotenv()


def criar_conexao_origem():
    return create_engine(
        "postgresql+psycopg://"
        f"{os.getenv('DB_USER')}:"
        f"{os.getenv('DB_PASSWORD')}@"
        f"{os.getenv('DB_HOST')}:"
        f"{os.getenv('DB_PORT')}/"
        f"{os.getenv('DB_NAME')}"
    )


def criar_conexao_destino():
    return create_engine(
        "postgresql+psycopg://"
        f"{os.getenv('DW_USER')}:"
        f"{os.getenv('DW_PASSWORD')}@"
        f"{os.getenv('DW_HOST')}:"
        f"{os.getenv('DW_PORT')}/"
        f"{os.getenv('DW_NAME')}"
    )