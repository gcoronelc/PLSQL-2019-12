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

