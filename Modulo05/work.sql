-- Consultar los datos de un empleado

create or replace function scott.fn_get_emp
( p_empno scott.emp.empno%type )
return scott.emp%rowtype
is
  v_emp scott.emp%RowType;
begin
  select * into v_emp
  from scott.emp
  where empno = p_empno;
  return v_emp;
end;
/

select * from scott.emp;

set serveroutput on

declare
  r scott.emp%rowtype;
begin
  r := scott.fn_get_emp( 7369 );
  dbms_output.put_line('Nombre: ' || r.ename);
  dbms_output.put_line('Sueldo: ' || r.sal);
end;




