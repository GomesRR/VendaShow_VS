CREATE OR ALTER PROCEDURE ST_GRAVAVENDAS (
    ID_VENDEDOR    INTEGER,
    VL_SUB_TOTAL   NUMERIC(8,2),
    VL_DESCONTO    NUMERIC(8,2),
    VL_ACRESCIMO   NUMERIC(8,2),
    VL_TOTAL       NUMERIC(8,2),
    PE_DESCONTO    NUMERIC(8,4),
    PE_ACRESCIMO   NUMERIC(8,4),
	ID_CLIENTE     INTEGER,
	TP_FORMA_PAGAMENTO CHAR(1)
)
RETURNS (
    ID_VENDA_OUT   INTEGER
)
AS
DECLARE VARIABLE NOVO_ID INTEGER;
BEGIN
  BEGIN
    NOVO_ID = NEXT VALUE FOR GEN_ID_VENDA;

    INSERT INTO VENDAS (
      ID_VENDA,
      ID_VENDEDOR,
      VL_SUB_TOTAL,
      VL_DESCONTO,
      VL_ACRESCIMO,
      VL_TOTAL,
      PE_DESCONTO,
      PE_ACRESCIMO,
	  ID_CLIENTE,
	  TP_FORMA_PAGAMENTO
    )
    VALUES (
      :NOVO_ID,
      :ID_VENDEDOR,
      :VL_SUB_TOTAL,
      :VL_DESCONTO,
      :VL_ACRESCIMO,
      :VL_TOTAL,
      :PE_DESCONTO,
      :PE_ACRESCIMO,
	  :ID_CLIENTE,
	  :TP_FORMA_PAGAMENTO
    );

    ID_VENDA_OUT = NOVO_ID;
  WHEN ANY DO
    BEGIN
      ID_VENDA_OUT = -1;
    END
  END
END