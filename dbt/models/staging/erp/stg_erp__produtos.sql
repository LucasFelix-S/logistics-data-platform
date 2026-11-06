SELECT
    codigo AS produto_id,
    UPPER(TRIM(descricao)) AS descricao,
    UPPER(TRIM(unidade_medida)) AS unidade_medida,
    estoque_minimo,
    estoque_maximo,
    categoria_id,
    status_id
FROM {{ source('erp', 'produtos') }}