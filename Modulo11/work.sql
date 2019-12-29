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

drop trigger scott.tr_demo_01;


