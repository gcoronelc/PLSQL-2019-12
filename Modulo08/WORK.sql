-- GRAN ERROR

BEGIN
  CREATE TABLE SCOTT.DEMO(NOMBRE VARCHAR2(200));
END;
/


-- EXECUTE IMMEDIATE

create or replace procedure SCOTT.SP_EXECUTE( cmd varchar2)
is
begin
  execute immediate cmd;
end;
/


GRANT CREATE TABLE TO SCOTT;


CALL SCOTT.SP_EXECUTE(
  'create table SCOTT.TABLA ( id number, dato varchar2(30))' 
);
/





