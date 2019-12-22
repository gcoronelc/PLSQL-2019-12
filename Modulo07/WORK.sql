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








