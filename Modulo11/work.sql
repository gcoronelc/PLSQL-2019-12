-- Demo 01

create or replace trigger scott.tr_demo_01
after update on scott.emp
begin
  dbms_output.put_line('Algo esta cambiando');
end;
/

select * from scott.emp;

update scott.emp
set sal = 8888
where empno = 5656;

update scott.emp
set sal = 8888
where empno = 67890;

update scott.emp
set sal = sal + 100;

drop trigger scott.tr_demo_01;

-- Demo 02

create or replace trigger scott.tr_demo_02
after update on scott.emp
for each row
begin
  dbms_output.put_line('Un registro se ha modificado');
end;
/

update scott.emp
set sal = 8888
where empno = 5656;

update scott.emp
set sal = 8888
where empno = 67890;

update scott.emp
set sal = sal + 100;

drop trigger scott.tr_demo_02;




-- FUNCIONES LOGICAS

CREATE OR REPLACE TRIGGER SCOTT.tr_DEMO_03
AFTER INSERT OR DELETE OR UPDATE ON SCOTT.emp
BEGIN
  if inserting then
    dbms_output.put_line( 'nuevo empleado se ha insertado' );
  Elsif updating then
    dbms_output.put_line( 'un empleado se ha modificado' );
  Elsif deleting then
    dbms_output.put_line( 'un empleado se ha eliminado' );
  end if;
  IF UPDATING('SAL') THEN
    dbms_output.put_line( 'HA CAMBIADO EL SALARIO' );
    
  END IF;
END tr_DEMO_03;
/


INSERT INTO SCOTT.EMP(EMPNO,ENAME,SAL)
VALUES(7878,'GUSTAVO',6767);

UPDATE SCOTT.EMP
SET SAL = 7676
WHERE EMPNO = 7878;

UPDATE SCOTT.EMP
SET ENAME = 'ANGEL'
WHERE EMPNO = 7878;

DELETE SCOTT.EMP 
WHERE EMPNO = 7878;

DROP TRIGGER SCOTT.tr_DEMO_03;

-- REGISTROS OLD Y NEW

CREATE OR REPLACE TRIGGER SCOTT.tr_DEMO_04
AFTER INSERT OR DELETE OR UPDATE ON SCOTT.emp
FOR EACH ROW
BEGIN
  if inserting then
    dbms_output.put_line( 'nuevo empleado se ha insertado' );
  Elsif updating then
    dbms_output.put_line( 'un empleado se ha modificado' );
  Elsif deleting then
    dbms_output.put_line( 'un empleado se ha eliminado' );
  end if;
  IF UPDATING('SAL') THEN
    dbms_output.put_line( 'HA CAMBIADO EL SALARIO' );
    dbms_output.put_line( 'DE: ' || :OLD.SAL ||  ' A: ' || :NEW.SAL);
  END IF;
END tr_DEMO_03;
/


INSERT INTO SCOTT.EMP(EMPNO,ENAME,SAL)
VALUES(7878,'GUSTAVO',6767);

UPDATE SCOTT.EMP
SET SAL = 8888
WHERE EMPNO = 7878;

DROP TRIGGER SCOTT.tr_DEMO_04;



-- DESENCADENANTE DE SUSTITUCIÓN

Create Or Replace View SCOTT.v_empleados As
Select e.empno, e.ename, d.deptno, d.dname
From SCOTT.emp e Inner Join SCOTT.dept d
On e.deptno = d.deptno;

SELECT * FROM SCOTT.v_empleados;

CREATE OR REPLACE TRIGGER SCOTT.TR_DEMO_05
INSTEAD OF INSERT ON SCOTT.v_empleados
BEGIN
  dbms_output.put_line('ALGO ESTA PASANDO');
END;
/

INSERT INTO SCOTT.v_empleados(EMPNO,ENAME)
VALUES(8989,'GUSTAVO');

SELECT * FROM SCOTT.EMP
WHERE EMPNO = 8989;

DROP TRIGGER SCOTT.TR_DEMO_05;


-- TRIGGER: OTRO EJEMPLO 

Create Or Replace Trigger SCOTT.TR_DEMO_06
Instead Of Insert Or Delete On SCOTT.v_empleados
For Each Row
Declare
  cuenta Number;
Begin
  If Inserting Then
    Select Count(*) Into cuenta 
    From SCOTT.dept Where deptno = :new.deptno;
    If cuenta = 0 Then
      Insert Into SCOTT.dept(deptno,dname)
      Values(:New.deptno, :New.dname);
    End If;
    Select Count(*) Into cuenta 
    From SCOTT.emp Where empno = :new.empno;
    If cuenta = 0 Then
      Insert Into SCOTT.emp(empno,ename,deptno)
      Values(:New.empno, :New.ename, :New.deptno);
    End If;
  Elsif Deleting Then
    Delete From SCOTT.emp Where empno = :old.empno;
  End If;
End TR_DEMO_06;
/

SELECT * FROM SCOTT.EMP
WHERE EMPNO = 8989;

SELECT * FROM SCOTT.dept
WHERE deptno = 99;

SELECT * FROM SCOTT.v_empleados;


INSERT INTO SCOTT.v_empleados(EMPNO,ENAME,DEPTNO,DNAME)
VALUES(8999,'NANCY',99,'JUEGOS');


DROP TRIGGER SCOTT.TR_DEMO_06;



