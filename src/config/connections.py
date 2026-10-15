import os
import psycopg
from dotenv import load_dotenv
from sqlalchemy import create_engine
from sqlalchemy.engine import URL

load_dotenv()

def criar_conexao_origem():
    url = URL.create(
        "postgresql+psycopg",
        username=os.getenv("DB_USER"),
        password=os.getenv("DB_PASSWORD"),
        host=os.getenv("DB_HOST"),
        port=int(os.getenv("DB_PORT")),
        database=os.getenv("DB_NAME"),
    )

    return create_engine(url)


def criar_conexao_destino():
    url = URL.create(
        "postgresql+psycopg",
        username=os.getenv("DW_USER"),
        password=os.getenv("DW_PASSWORD"),
        host=os.getenv("DW_HOST"),
        port=int(os.getenv("DW_PORT")),
        database=os.getenv("DW_NAME"),
    )

    return create_engine(url)


def criar_conexao_psycopg_origem():
    return psycopg.connect(
        host=os.getenv("DB_HOST"),
        port=os.getenv("DB_PORT"),
        dbname=os.getenv("DB_NAME"),
        user=os.getenv("DB_USER"),
        password=os.getenv("DB_PASSWORD"),
    )


def criar_conexao_psycopg_destino():
    return psycopg.connect(
        host=os.getenv("DW_HOST"),
        port=os.getenv("DW_PORT"),
        dbname=os.getenv("DW_NAME"),
        user=os.getenv("DW_USER"),
        password=os.getenv("DW_PASSWORD"),
    )