SET SERVEROUTPUT ON

DECLARE
  CURSOR C_DEMO IS SELECT * FROM SCOTT.DEPT;
  V_DEPTNO SCOTT.DEPT.DEPTNO%TYPE;
  V_DNAME SCOTT.DEPT.DNAME%TYPE;
  V_LOC SCOTT.DEPT.LOC%TYPE;
BEGIN
  OPEN C_DEMO;
  DBMS_OUTPUT.PUT_LINE('Fila: ' || c_demo%rowcount);
  -- Fila 1
  FETCH C_DEMO INTO V_DEPTNO, V_DNAME, V_LOC;
  DBMS_OUTPUT.PUT_LINE('Fila: ' || c_demo%rowcount);
  DBMS_OUTPUT.PUT_LINE(V_DEPTNO || ' - ' 
    || V_DNAME || ' - ' || V_LOC);
  -- Fila 2
  FETCH C_DEMO INTO V_DEPTNO, V_DNAME, V_LOC;
  DBMS_OUTPUT.PUT_LINE('Fila: ' || c_demo%rowcount);
  DBMS_OUTPUT.PUT_LINE(V_DEPTNO || ' - ' 
    || V_DNAME || ' - ' || V_LOC);
  -- Fila 3
  FETCH C_DEMO INTO V_DEPTNO, V_DNAME, V_LOC;
  DBMS_OUTPUT.PUT_LINE('Fila: ' || c_demo%rowcount);
  DBMS_OUTPUT.PUT_LINE(V_DEPTNO || ' - ' 
    || V_DNAME || ' - ' || V_LOC);
  CLOSE C_DEMO;
END;
/


-- bucle simple
DECLARE
  CURSOR C_DEMO IS SELECT * FROM SCOTT.DEPT;
  V_DEPT scott.DEPT%rowtype;
BEGIN
  OPEN C_DEMO;
  LOOP
    FETCH C_DEMO INTO V_DEPT;
    EXIT WHEN C_DEMO%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE('Fila: ' || c_demo%rowcount);
    DBMS_OUTPUT.PUT_LINE(V_DEPT.DEPTNO || ' - ' ||
    V_DEPT.DNAME || ' - ' || V_DEPT.LOC);
  END LOOP;
  CLOSE C_DEMO;
END;
/

-- bucle WHILE
DECLARE
  CURSOR C_DEMO IS SELECT * FROM SCOTT.DEPT;
  V_DEPT scott.DEPT%rowtype;
BEGIN
  OPEN C_DEMO;
  FETCH C_DEMO INTO V_DEPT;
  WHILE C_DEMO%FOUND LOOP
      DBMS_OUTPUT.PUT_LINE(
        c_demo%rowcount || '.- ' || V_DEPT.DEPTNO || 
    ' - ' || V_DEPT.DNAME || ' - ' || V_DEPT.LOC
    );
    FETCH C_DEMO INTO V_DEPT;
  END LOOP;
  CLOSE C_DEMO;
END;
/



-- bucle FOR
DECLARE
  CURSOR C_DEMO IS SELECT * FROM SCOTT.DEPT;
BEGIN
  FOR R IN C_DEMO LOOP
    DBMS_OUTPUT.PUT_LINE( 
      R.DEPTNO || ' - ' || R.DNAME || ' - ' || R.LOC
    );
  END LOOP;
END;
/




-- Ejercicio
/*
Desarrollar un procedimiento que retorne
los movimientos de una cuenta.
Esquema: EUREKA
*/

create or replace procedure eureka.sp_get_movimientos
( 
  p_cuenta in  eureka.cuenta.chr_cuencodigo%type,
  p_cursor out sys_refcursor
)
as
begin
  open p_cursor for 
  select * from eureka.movimiento
  where chr_cuencodigo = p_cuenta;
end;
/


declare
  v_cursor sys_refcursor;
  v_reg eureka.movimiento%rowtype;
begin
  eureka.sp_get_movimientos( '00100002', v_cursor );
  loop
    fetch v_cursor into v_reg;
    exit when v_cursor%notfound;
    dbms_output.put_line(
      v_reg.int_movinumero || ' - ' ||
      v_reg.chr_tipocodigo || ' - ' ||
      v_reg.dec_moviimporte
    );
  end loop;
  close v_cursor;
end;
/


-- cursores implicitos

begin
  update scott.emp
  set sal = sal * 0.9;
  dbms_output.put_line('Filas afectadas: ' || SQL%rowcount);
  rollback;
end;
/


create or replace procedure SCOTT.SP_UPDATE_SAL
( P_CODIGO number, P_INCREMENTO number)
is
begin
  update SCOTT.emp
  set sal = sal + P_INCREMENTO
  where empno = P_CODIGO;
  if sql%notfound then
    dbms_output.put_line('CODIGO no existe');
  else
    commit;
    dbms_output.put_line('proceso ok');
  end if;
end;
/


CALL SCOTT.SP_UPDATE_SAL(7339,100);



DECLARE
  CURSOR C_MOV ( P_CUENTA VARCHAR2) IS
  select * from eureka.movimiento
  where chr_cuencodigo = P_CUENTA;
BEGIN
  FOR R IN C_MOV('00100001') LOOP
    dbms_output.put_line(
      R.int_movinumero || ' - ' ||
      R.chr_tipocodigo || ' - ' ||
      R.dec_moviimporte
    );
  END LOOP;
END;
/




