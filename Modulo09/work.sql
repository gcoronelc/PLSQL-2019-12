-- PARAMETRO TIPO IN


create or replace function scott.fn_doble
( p_n in number ) return number
is
begin
  p_n := p_n * 2;
  return p_n;
end;
/

/*
Function FN_DOBLE compilado

LINE/COL  ERROR
--------- -------------------------------------------------------------
5/3       PL/SQL: Statement ignored
5/3       PLS-00363: la expresión 'P_N' no se puede utilizar como destino de asignación
Errores: comprobar log de compilador
*/

create or replace function scott.fn_doble
( p_n in number ) return number
is
  v_doble number;
begin
  v_doble := p_n * 2;
  return v_doble;
end;
/

/*
Function FN_DOBLE compilado
*/

select scott.fn_doble(5) doble from dual;




-- PARAMETRO TIPO OUT

create or replace procedure scott.sp_doble
( p_ok in number, p_num in number, p_doble out number )
is
begin
  p_doble := p_num * 2;
  dbms_output.put_line('Doble (x): ' || p_doble);
  if p_ok <> 1 then
    RAISE_APPLICATION_ERROR(-20000, 'Se ha producido un error, jejeje!!!!');
  end if;
end;
/


set serveroutput on;

declare 
  v_num number := 5;
  v_doble number := 777;
begin
  dbms_output.put_line('Numero (1): ' || v_num);
  dbms_output.put_line('Doble (1): ' || v_doble);
  scott.sp_doble( 1, v_num, v_doble );
  dbms_output.put_line('Numero (2): ' || v_num);
  dbms_output.put_line('Doble (2): ' || v_doble);
exception
  when others then
    dbms_output.put_line('Numero (3): ' || v_num);
    dbms_output.put_line('Doble (3): ' || v_doble);
end;
/

/*
Numero (1): 5
Doble (1): 777
Doble (x): 10
Numero (2): 5
Doble (2): 10

Procedimiento PL/SQL terminado correctamente.
*/

declare 
  v_num number := 5;
  v_doble number := 777;
begin
  dbms_output.put_line('Numero (1): ' || v_num);
  dbms_output.put_line('Doble (1): ' || v_doble);
  scott.sp_doble( -1, v_num, v_doble );
  dbms_output.put_line('Numero (2): ' || v_num);
  dbms_output.put_line('Doble (2): ' || v_doble);
exception
  when others then
    dbms_output.put_line('Numero (3): ' || v_num);
    dbms_output.put_line('Doble (3): ' || v_doble);
end;
/

/*
Numero (1): 5
Doble (1): 777
Doble (x): 10
Numero (3): 5
Doble (3): 777

Procedimiento PL/SQL terminado correctamente.
*/



-- USO DE NOCOPY
-- Se recomienda usar NOCOPY para parámetros de tipo OUT

create or replace procedure scott.sp_doble
( p_ok in number, p_num in number, p_doble out NOCOPY number )
is
begin
  p_doble := p_num * 2;
  dbms_output.put_line('Doble (x): ' || p_doble);
  if p_ok <> 1 then
    RAISE_APPLICATION_ERROR(-20000, 'Se ha producido un error, jejeje!!!!');
  end if;
end;
/


-- Prueba 01

declare 
  v_num number := 5;
  v_doble number := 777;
begin
  dbms_output.put_line('Numero (1): ' || v_num);
  dbms_output.put_line('Doble (1): ' || v_doble);
  scott.sp_doble( 1, v_num, v_doble );
  dbms_output.put_line('Numero (2): ' || v_num);
  dbms_output.put_line('Doble (2): ' || v_doble);
exception
  when others then
    dbms_output.put_line('Numero (3): ' || v_num);
    dbms_output.put_line('Doble (3): ' || v_doble);
end;
/

/*
Numero (1): 5
Doble (1): 777
Doble (x): 10
Numero (2): 5
Doble (2): 10

Procedimiento PL/SQL terminado correctamente.
*/


-- Prueba 02

declare 
  v_num number := 5;
  v_doble number := 777;
begin
  dbms_output.put_line('Numero (1): ' || v_num);
  dbms_output.put_line('Doble (1): ' || v_doble);
  scott.sp_doble( -1, v_num, v_doble );
  dbms_output.put_line('Numero (2): ' || v_num);
  dbms_output.put_line('Doble (2): ' || v_doble);
exception
  when others then
    dbms_output.put_line('Numero (3): ' || v_num);
    dbms_output.put_line('Doble (3): ' || v_doble);
end;
/

/*
Numero (1): 5
Doble (1): 777
Doble (x): 10
Numero (3): 5
Doble (3): 10

Procedimiento PL/SQL terminado correctamente.
*/

