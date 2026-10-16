import pandas as pd
from pathlib import Path
from src.config.connections import criar_conexao_origem

DIRETORIO_EXPORTACAO = (Path(__file__).resolve().parents[2] / "data" / "exports")

origem = criar_conexao_origem()

try:
    with origem.connect() as conexao:
#
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
        
        arquivo_produto_erp = DIRETORIO_EXPORTACAO / "produtos_erp.csv"

        dados_produtos.to_csv(
            arquivo_produto_erp, 
            index=False, 
            sep=";", 
            encoding="utf-8")


#
        dados_categoria = pd.read_sql_query(
            """
                SELECT
                    A.id,
                    A.descricao
                FROM erp.categorias A
            """, conexao)

        arquivo_categoria_erp = DIRETORIO_EXPORTACAO / "categorias_erp.csv"


        dados_categoria.to_csv(
            arquivo_categoria_erp,
            index=False,
            sep=";",
            encoding="utf-8")


#
        dados_status = pd.read_sql_query(
            """
                SELECT
                    A.id,
                    A.descricao
                FROM erp.status A
            """, conexao)

        arquivo_status_erp = DIRETORIO_EXPORTACAO / "status_erp.csv"

        dados_status.to_csv(
            arquivo_status_erp,
            index=False,
            sep=";",
            encoding="utf-8"
        )


#
    dados_condicoes_pagamento = pd.read_sql_query(
        """
            SELECT
                A.id,
                A.descricao
            FROM erp.condicoes_pagamento A
        """, conexao)

    arquivo_condicoes_pagamento_erp = DIRETORIO_EXPORTACAO / "condicoes_pagamento_erp.csv"

    dados_condicoes_pagamento.to_csv(
        arquivo_condicoes_pagamento_erp,
        index=False,
        sep=";",
        encoding="utf-8"
    )


#
    dados_tipos_entidades = pd.read_sql_query(
        """
            SELECT
                A.id,
                A.descricao
            FROM erp.tipos_entidades A
        """, conexao)

    arquivo_dados_tipos_entidades_erp = DIRETORIO_EXPORTACAO / "tipos_entidades_erp.csv"

    dados_tipos_entidades.to_csv(
        arquivo_dados_tipos_entidades_erp,
        index=False,
        sep=";",
        encoding="utf-8"
    )


#
    dados_entidades = pd.read_sql_query(
        """
            SELECT
                A.id,
                A.nome,
                A.tipo_entidade_id
            FROM erp.entidades A
        """, conexao)

    arquivo_dados_entidades_erp = DIRETORIO_EXPORTACAO / "entidades_erp.csv"

    dados_entidades.to_csv(
        arquivo_dados_entidades_erp,
        index=False,
        sep=";",
        encoding="utf-8"
    )


#
    dados_status_pedidos_venda = pd.read_sql_query(
        """
            SELECT
                A.id,
                A.descricao              
            FROM status_pedidos_venda A
        """, conexao)

    arquivo_status_pedidos_venda_erp = DIRETORIO_EXPORTACAO / "status_pedidos_venda_erp.csv"

    dados_status_pedidos_venda.to_csv(
        arquivo_status_pedidos_venda_erp,
        index=False,
        sep=";",
        encoding="utf-8"
    )



#
    dados_status_tabelas_preco = pd.read_sql_query(
        """
            SELECT
                A.id,
                A.descricao
            FROM erp.status_tabelas_preco A
        """, conexao)

    arquivo_status_tabelas_preco_erp = DIRETORIO_EXPORTACAO / "status_tabelas_preco_erp.csv"

    dados_status_tabelas_preco.to_csv(
        arquivo_status_tabelas_preco_erp,
        index=False,
        sep=";",
        encoding="utf-8"
    )


#
    dados_pedidos_compra = pd.read_sql_query(
        """
            SELECT
                A.id,
                A.fornecedor_id,
                A.data_pedido,
                A.status_id,
                A.previsao_entrega
            FROM erp.pedidos_compra A
        """, conexao)

    arquivo_pedidos_compra_erp = DIRETORIO_EXPORTACAO / "pedidos_compra_erp.csv"

    dados_pedidos_compra.to_csv(
        arquivo_pedidos_compra_erp,
        index=False,
        sep=";",
        encoding="utf-8"
    )


#
    dados_status_pedidos_compra = pd.read_sql_query(
        """
            SELECT
                A.id,
                A.descricao
            FROM erp.status_pedidos_compra A
        """, conexao)

    arquivo_status_pedidos_compra_erp = DIRETORIO_EXPORTACAO / "status_pedidos_compra_erp.csv"

    dados_status_pedidos_compra.to_csv(
        arquivo_status_pedidos_compra_erp,
        index=False,
        sep=";",
        encoding="utf-8"
    )


#
    dados_parcelas_condicoes_pagamento = pd.read_sql_query(
        """
            SELECT
                A.id,
                A.condicao_pagamento_id,
                A.numero_parcela,
                A.prazo_dias,
                A.percentual
            FROM erp.parcelas_condicoes_pagamento A
        """ ,conexao)

    arquivo_parcelas_condicoes_pagamento_erp = DIRETORIO_EXPORTACAO / "parcelas_condicoes_pagamento_erp.csv"

    dados_parcelas_condicoes_pagamento.to_csv(
        arquivo_parcelas_condicoes_pagamento_erp,
        index=False,
        sep=";",
        encoding="utf-8"
    )


#
    dados_itens_pedidos_venda = pd.read_sql_query(
        """
            SELECT
                A.id,
                A.pedido_id,
                A.produto_id,
                A.quantidade,
                A.preco_unitario,
                A.desconto
            FROM erp.itens_pedidos_venda A
        """, conexao)

    arquivo_itens_pedidos_venda_erp = DIRETORIO_EXPORTACAO / "itens_pedidos_venda_erp.csv"

    dados_itens_pedidos_venda.to_csv(
        arquivo_itens_pedidos_venda_erp,
        index=False,
        sep=";",
        encoding="utf-8"
    )


#
    dados_pedidos_venda = pd.read_sql_query(
        """
            SELECT
                A.id,
                A.cliente_id,
                A.data_pedido,
                A.status_id,
                A.condicao_pagamento_id,
                A.valor_total
            FROM erp.pedidos_venda A
        """, conexao)

    arquivo_pedidos_venda_erp = DIRETORIO_EXPORTACAO / "pedidos_venda_erp.csv"

    dados_pedidos_venda.to_csv(
        arquivo_pedidos_venda_erp,
        index=False,
        sep=";",
        encoding="utf-8"
    )


#
    dados_itens_pedidos_compra = pd.read_sql_query(
        """
            SELECT
                A.id,
                A.pedido_id,
                A.produto_id,
                A.quantidade,
                A.custo_unitario
            FROM erp.itens_pedidos_compra A
        """, conexao)

    arquivo_itens_pedidos_compra_erp = DIRETORIO_EXPORTACAO / "itens_pedidos_compra_erp.csv"

    dados_itens_pedidos_compra.to_csv(
        arquivo_itens_pedidos_compra_erp,
        index=False,
        sep=";",
        encoding="utf-8"
    )


#
    dados_itens_tabelas_preco = pd.read_sql_query(
        """
            SELECT
                A.id,
                A.tabela_id,
                A.produto_id,
                A.preco
            FROM erp.itens_tabelas_preco A
        """, conexao)

    arquivo_itens_tabelas_preco_erp = DIRETORIO_EXPORTACAO / "itens_tabelas_preco_erp.csv"

    dados_itens_tabelas_preco.to_csv(
        arquivo_itens_tabelas_preco_erp,
        index=False,
        sep=";",
        encoding="utf-8"
    )


#
    dados_contas_receber = pd.read_sql_query(
        """
            SELECT
                A.id,
                A.pedido_venda_id,
                A.valor
            FROM erp.contas_receber A
        """, conexao)

    arquivo_contas_receber_erp = DIRETORIO_EXPORTACAO / "contas_receber_erp.csv"

    dados_contas_receber.to_csv(
        arquivo_contas_receber_erp,
        index=False,
        sep=";",
        encoding="utf-8"
    )


#
    dados_contas_pagar = pd.read_sql_query(
        """
            SELECT
                A.id,
                A.pedido_compra_id,
                A.valor
            FROM erp.contas_pagar A
        """, conexao)

    arquivo_contas_pagar_erp = DIRETORIO_EXPORTACAO / "contas_pagar_erp.csv"

    dados_contas_pagar.to_csv(
        arquivo_contas_pagar_erp,
        index=False,
        sep=";",
        encoding="utf-8"
    )


#
    dados_parcelas_receber = pd.read_sql_query(
        """
            SELECT
                A.id,
                A.numero_parcela,
                A.conta_receber_id,
                A.valor,
                A.vencimento,
                A.pagamento
            FROM erp.parcelas_receber A
        """, conexao)

    arquivo_parcelas_receber_erp = DIRETORIO_EXPORTACAO / "parcelas_receber_erp.csv"

    dados_parcelas_receber.to_csv(
        arquivo_parcelas_receber_erp,
        index=False,
        sep=";",
        encoding="utf-8"
    )


#
    dados_parcelas_pagar = pd.read_sql_query(
        """
            SELECT
                A.id,
                A.numero_parcela,
                A.conta_pagar_id,
                A.valor,
                A.vencimento,
                A.pagamento
            FROM erp.parcelas_pagar A
        """, conexao)

    arquivo_parcelas_pagar_erp = DIRETORIO_EXPORTACAO / "parcelas_pagar_erp.csv"

    dados_parcelas_pagar.to_csv(
        arquivo_parcelas_pagar_erp,
        index=False,
        sep=";",
        encoding="utf-8"
    )


#
    dados_tabelas_preco = pd.read_sql_query(
        """
            SELECT
                A.id,
                A.nome,
                A.vigencia_inicio,
                A.vigencia_fim,
                A.status_id
            FROM erp.tabelas_preco A
        """, conexao)

    arquivo_tabelas_preco_erp = DIRETORIO_EXPORTACAO / "tabelas_preco_erp.csv"

    dados_tabelas_preco.to_csv(
        arquivo_tabelas_preco_erp,
        index=False,
        sep=";",
        encoding="utf-8"
    )

finally:
    origem.dispose()