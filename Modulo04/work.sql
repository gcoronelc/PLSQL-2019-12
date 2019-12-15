
-- DECODE

SELECT DECODE(4, 1, 'UNO',
                    2, 'DOS',
                    3, 'TRES',
                    'NO SE') result
FROM DUAL;


SELECT E.*,
  DECODE(DEPTNO, 10, 'BIEN',
            20, 'MEJOR',
            30, 'GANADOR',
            'YA PERDISTE') result
FROM SCOTT.EMP E;


-- Ejercicio 1
/*
Desarrollar una función para calular 
el promedio de un alumno.
Son cuatro notas, se elimina la menor.
Esquema: SCOTT
*/

create or replace function scott.fn_menor
(p_n1 number, p_n2 number, p_n3 number, p_n4 number)
return number
as
  v_menor number := p_n1;
begin
  if v_menor > p_n2 then
    v_menor := p_n2;
  end if;
  if v_menor > p_n3 then
    v_menor := p_n3;
  end if;
  if v_menor > p_n4 then
    v_menor := p_n4;
  end if;
  return v_menor;
end;
/


create or replace function scott.fn_promedio
(p_n1 number, p_n2 number, p_n3 number, p_n4 number)
return number
as
  v_menor number;
  v_promedio number;
begin
  v_menor := scott.fn_menor(p_n1,p_n2,p_n3,p_n4);
  v_promedio := (p_n1 + p_n2 + p_n3 + p_n4 - v_menor) / 3;
  return v_promedio;
end;
/


select scott.fn_promedio(12,16,18,20) promedio
from dual;



create or replace function scott.fn_salario
(p_sal scott.emp.sal%type) return varchar2 
is  
  v_msg varchar2(40);  
begin  
  case   
    when (p_sal > 0 and p_sal <= 2500) then    
      v_msg := 'Salario Bajo';   
    when (p_sal > 2500 and p_sal <= 4000) then    
      v_msg := 'Salario Regular';   
    when (p_sal > 4000) then    
      v_msg := 'Salario Bueno';   
    else    
      v_msg := 'Caso Desconocido';  
  end case;  
  return v_msg; 
end;
/

select e.*, scott.fn_salario(sal) "Tipo de Salario"
from scott.emp e;


-- LOOP

SET SERVEROUTPUT ON

declare
  cont number := 0;
begin
  loop
    dbms_output.put_line('ALIANZA CAMPEON');
    cont := cont + 1;
    exit when cont >= 10;
  end loop;
end;
/


-- FOR

create or replace function SCOTT.FN_FACT 
( n number ) return number 
is  
  f number := 1; 
begin  
  for k in 2 .. n loop   
    f := f * k;  
  end loop;  
  return f; 
end; 
/ 

SELECT SCOTT.FN_FACT(5) FROM DUAL;

BEGIN
  FOR N IN 1..10 LOOP
    DBMS_OUTPUT.PUT_LINE( 'FACTORIAL DE ' || N || ' ES '
      || SCOTT.FN_FACT(N) );
  END LOOP;
END;
/


-- Aplicación de Tabla temporal

create global temporary table EUREKA.RESUMEN (
  id number primary key,   
  suc_codigo varchar2(10),
  suc_nombre varchar2(200),
  saldo_soles number(12,2),
  saldo_dolares number(12,2)
) on commit preserve rows; 


CREATE SEQUENCE eureka.SQ_RESUMEN;



CREATE OR REPLACE PROCEDURE EUREKA.CREAR_RESUMEN
IS
BEGIN
  -- Limpiar tabla
  delete from EUREKA.RESUMEN;
  -- Carga inicial de datos
  insert into EUREKA.RESUMEN(id,suc_codigo, suc_nombre)
  select eureka.SQ_RESUMEN.nextval,chr_sucucodigo, vch_sucunombre 
  from EUREKA.sucursal;
  -- Calcular saldos
  -- caso 1
END;
/


call EUREKA.CREAR_RESUMEN();


select * from EUREKA.RESUMEN;


         



         
         