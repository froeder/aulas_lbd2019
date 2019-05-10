-- ? FUNÇÕES

-- SINTAXE

-- * Para importar
CREATE LANGUAGE <nome_linguagem>
HANDLER <funcao_hndler> ;

CREATE OR REPLACE FUNCTION nome (prametros)

RETURN AS $$
DECLARE declaracao_variaveis 

begin
  COMANDOS
end;

$$LANGUAGE nome_linguagem ;

-- Varáveis

nome_variavel tipo_dado :=valor_inicial ;

-- TIPO PRAMETRO

IN parametro de entrada
OUT parametro de saida
INOUT ambos

-- TIPO DE DADO

Os mesmo do postgres

-- ! PARA CHAMAR A FUNÇÃO

select fn_nome() ;

-- EXEMPLO

CREATE OR REPLACE FUNCTION fn_subtrair (a decimal, b decimal)

RETURNS decimal AS $$
DECLARE 
resultado decimal(10,2) ;
begin
  resultado := a - b ;
  return resultado ;

end;

$$LANGUAGE 'plpgsql' ;

SELECT fn_subtrair() ;


-- ? PRA DISPARAR EXEÇÃO

RAISE NOTICE 

-- ? ABORTA TUDO QUE TIVER PRA BAIXO


-- ! ESTRUSTURAS

IF / THEN / ELSE
LOOP while / for 

-- * for each

FOR variavel IN [REVERSE] expressao ... expressao loop
  instrucoes 
end loop