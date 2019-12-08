
-- Habilitar las salidas

SET SERVEROUTPUT ON


-- Bloque Anonimo

/*
  - No tiene nombre
  -  No se guarda en la BD
*/

begin
  dbms_output.put_line('Bienvenidos a mi mundo, ORACLE!!!');
end;
/


-- Función

create or replace function scott.fn_suma
( p_n1 number, p_n2 number ) 
return number
is
  v_suma number;
begin
  -- Proceso
  v_suma := p_n1 + p_n2;
  -- Retorno
  return v_suma;
end;
/


SELECT scott.fn_suma(45,67) "SUMA"
FROM DUAL;


declare
  v_suma number;
begin
  v_suma := scott.fn_suma(45,67);
  dbms_output.put_line('SUMA: ' || v_suma);
  dbms_output.put_line('Esto se pone bueno.');
end;
/


-- Ejercicio 1
/*
  Crear una función para calcular 
  el importe de una venta.
*/



-- Procedimiento

create or replace procedure scott.sp_venta
( 
  p_precio IN number, 
  p_cantidad IN number,
  p_importe OUT number,
  p_impuesto OUT number,
  p_total OUT number
)
is
begin
  -- Proceso
  p_total := p_precio * p_cantidad;
  p_importe := p_total / 1.18;
  p_impuesto := p_total - p_importe;
end;
/



declare
  v_importe number(10,2);
  v_impuesto number(10,2);
  v_total number(10,2);
begin
  -- Proceso
  scott.sp_venta(10, 11, v_importe, v_impuesto, v_total);
  -- Reporte
  dbms_output.put_line('IMPORTE: ' || v_importe);
  dbms_output.put_line('IMPUESTO: ' || v_impuesto);
  dbms_output.put_line('TOTAL: ' || v_importe);
  dbms_output.put_line('Esto se todo.');
end;
/


-- Ejercicio 2
/*
  Desarrollar un procedimiento para calcular
  el pronedio de un estuduante.
  Son 4 notas.
*/



-- Función que retorna el precio de un producto

CREATE OR REPLACE FUNCTION VENTAS.FN_GET_PRECIO
( p_idprod  in number) return number
is
  v_precio number;
begin
  -- Proceso
  select precio into v_precio
  from ventas.producto
  where idprod = p_idprod;
  -- Reporte
  return v_precio;
end;
/

select VENTAS.FN_GET_PRECIO(1002) PRECIO
from dual;



-- Ejercicio 3
/*
Desarrollar un procedimiento para consultar el nombre
de la moneda y el saldo de una cuenta.
Esquema: EUREKA
*/



CREATE OR REPLACE PROCEDURE EUREKA.SP_GET_DATOS_CUENTA
(
  P_CUENTA IN VARCHAR2,
  P_MONEDA OUT VARCHAR2,
  P_SALDO  OUT NUMBER
)
IS
BEGIN
  SELECT DEC_CUENSALDO, M.VCH_MONEDESCRIPCION
  INTO P_SALDO, P_MONEDA
  FROM EUREKA.MONEDA M 
  JOIN EUREKA.CUENTA C 
  ON M.CHR_MONECODIGO = C.CHR_MONECODIGO
  WHERE C.CHR_CUENCODIGO = P_CUENTA;
END;
/

DESC EUREKA.CUENTA;


DECLARE
  V_SALDO NUMBER;
  V_MONEDA VARCHAR2(50);
BEGIN
  -- Proceso
  EUREKA.SP_GET_DATOS_CUENTA('00100002', V_MONEDA, V_SALDO);
  -- Reporte
  DBMS_OUTPUT.PUT_LINE('SALDO: ' || V_SALDO);
  DBMS_OUTPUT.PUT_LINE('MONEDA: ' || V_MONEDA);
END;
/




CREATE OR REPLACE PROCEDURE EUREKA.SP_GET_DATOS_CUENTA_V2
(
  P_CUENTA IN EUREKA.CUENTA.CHR_CUENCODIGO%TYPE,
  P_MONEDA OUT EUREKA.MONEDA.VCH_MONEDESCRIPCION%TYPE,
  P_SALDO  OUT EUREKA.CUENTA.DEC_CUENSALDO%TYPE
)
IS
BEGIN
  SELECT DEC_CUENSALDO, M.VCH_MONEDESCRIPCION
  INTO P_SALDO, P_MONEDA
  FROM EUREKA.MONEDA M 
  JOIN EUREKA.CUENTA C 
  ON M.CHR_MONECODIGO = C.CHR_MONECODIGO
  WHERE C.CHR_CUENCODIGO = P_CUENTA;
END;
/



DECLARE
  V_SALDO EUREKA.CUENTA.DEC_CUENSALDO%TYPE;
  V_MONEDA EUREKA.MONEDA.VCH_MONEDESCRIPCION%TYPE;
BEGIN
  -- Proceso
  EUREKA.SP_GET_DATOS_CUENTA_V2('00100002', V_MONEDA, V_SALDO);
  -- Reporte
  DBMS_OUTPUT.PUT_LINE('SALDO: ' || V_SALDO);
  DBMS_OUTPUT.PUT_LINE('MONEDA: ' || V_MONEDA);
END;
/
