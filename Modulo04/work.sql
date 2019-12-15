
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

drop table EUREKA.RESUMEN;

create global temporary table EUREKA.RESUMEN (
  -- id number primary key,   
  suc_codigo varchar2(10) primary key,
  suc_nombre varchar2(200),
  saldo_soles number(12,2),
  saldo_dolares number(12,2)
) on commit preserve rows; 


CREATE SEQUENCE eureka.SQ_RESUMEN;



CREATE OR REPLACE PROCEDURE EUREKA.CREAR_RESUMEN
IS
  v_ssoles number;
  v_sdolares number;
BEGIN
  -- Limpiar tabla
  delete from EUREKA.RESUMEN;
  -- Carga inicial de datos
  insert into EUREKA.RESUMEN(id,suc_codigo, suc_nombre)
  select eureka.SQ_RESUMEN.nextval,chr_sucucodigo, vch_sucunombre 
  from EUREKA.sucursal;
  -- Calcular saldos
  for r in (select * from EUREKA.RESUMEN) loop
    
    select sum(dec_cuensaldo) into v_ssoles 
    from eureka.cuenta
    where chr_monecodigo = '01'
    and chr_sucucodigo = r.suc_codigo;
    
    select sum(dec_cuensaldo) into v_sdolares 
    from eureka.cuenta
    where chr_monecodigo = '02'
    and chr_sucucodigo = r.suc_codigo;
    
    update EUREKA.RESUMEN
    set saldo_soles = nvl(v_ssoles,0), 
        saldo_dolares = nvl(v_sdolares,0)
    where id = r.id;
    
  end loop;
  commit;
END;
/



-- VARRAYS

DECLARE  
  -- Definimos los tipos de datos  
  TYPE AlumnosArray IS VARRAY(15) OF VARCHAR2(100);  
  TYPE NotasArray IS VARRAY(15) OF NUMBER(4);  
  -- Definiendo las variables  
  alumnos AlumnosArray;  
  notas   NotasArray; 
BEGIN  
  -- Creando los arreglos  
  alumnos := AlumnosArray('Gustavo','Lucero','Ricardo','Andrea','Laura');
  notas := NotasArray(20,18,16,10,15);  
  -- Propiedades
  dbms_output.PUT_LINE( 'PROPIEDADES'  );  
  dbms_output.PUT_LINE( 'COUNT:' || alumnos.COUNT);  
  dbms_output.PUT_LINE( 'LIMIT:' || alumnos.LIMIT);  
  
  alumnos.EXTEND;
  alumnos(6) := 'ANGEL';
  notas.EXTEND;
  notas(6) := 20;
  
  dbms_output.PUT_LINE( 'PROPIEDADES'  );  
  dbms_output.PUT_LINE( 'COUNT:' || alumnos.COUNT);  
  dbms_output.PUT_LINE( 'LIMIT:' || alumnos.LIMIT);  
  
  -- Mostrando los arreglos  
  dbms_output.PUT_LINE( 'DATOS' );  
  FOR i IN 1 .. alumnos.count LOOP   
    dbms_output.PUT_LINE( alumnos(i) || ' - ' || notas(i) );  
  END LOOP; 
END; 
/
     


-- TABLA ASOCIATIVA

DECLARE  
  TYPE ARRAY_NOTAS IS TABLE OF NUMBER   
  INDEX BY BINARY_INTEGER;  
  NOTAS ARRAY_NOTAS; 
BEGIN  
  -- CARGAR NOTAS  
  NOTAS(1) := 20;  
  NOTAS(2) := 18;  
  NOTAS(3) := 15;  
  NOTAS(4) := 17; 
  NOTAS(3) := 20;
  -- MOSTRAR NOTAS  
  FOR I IN 1..NOTAS.COUNT LOOP   
    DBMS_OUTPUT.PUT_LINE('NOTA ' || I || ': ' || NOTAS(I));  
  END LOOP; 
  
  
END; 
/



DECLARE  
  TYPE ARRAY_NOTAS IS TABLE OF NUMBER   
  INDEX BY BINARY_INTEGER;  
  NOTAS ARRAY_NOTAS; 
BEGIN  
  -- CARGAR NOTAS  
  NOTAS(1) := 20;  
  NOTAS(2) := 18;  
  NOTAS(3) := 15;  
  NOTAS(4) := 17; 
  NOTAS(8) := 20;
  -- INFORMACIÓN
  dbms_output.PUT_LINE( 'PROPIEDADES'  );  
  dbms_output.PUT_LINE( 'COUNT:' || NOTAS.COUNT());  
  dbms_output.PUT_LINE( 'LIMIT:' || NOTAS.LIMIT());
  
  -- MOSTRAR NOTAS  
  /*
  FOR I IN 1..NOTAS.COUNT LOOP   
    DBMS_OUTPUT.PUT_LINE('NOTA ' || I || ': ' || NOTAS(I));  
  END LOOP;   
  */
END; 
/
 


DECLARE  
	TYPE tabla_varchar2 IS TABLE OF VARCHAR2(100);  
	empleados   tabla_varchar2 := tabla_varchar2(); 
BEGIN  
	-- Tamaño Inicial  
	DBMS_OUTPUT.PUT_LINE('Tamaño Inicial: ' || empleados.COUNT);  
	-- Se añaden 4 elementos  
	empleados.EXTEND (4);  
	empleados (1) := 'Pepe';  
	empleados (2) := 'Elena';  
	empleados (3) := 'Carmen';  
	empleados (4) := 'Juan';  
	-- Se añade un elemento mas  empleados.EXTEND;  
	empleados (empleados.LAST) := 'Gustavo';  
	-- Tamaño Final  
	DBMS_OUTPUT.PUT_LINE('Tamaño Final: ' || empleados.COUNT);  
	-- Mostrar lista  
	FOR I IN 1 .. empleados.COUNT  LOOP   
		DBMS_OUTPUT.put_line ( empleados(I) );  
	END LOOP;
END;  
/


         