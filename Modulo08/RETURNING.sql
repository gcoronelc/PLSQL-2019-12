create or replace procedure educa.sp_new_demo
( p_dato in varchar2, p_id out nocopy number )
is
begin
  insert into educa.demo( id, dato)
  values( educa.sq_demo.nextval, p_dato )
  RETURNING id into p_id;
  commit;
end;
/

set serveroutput on

declare
  v_id number(10);
begin
  educa.sp_new_demo('EGCC YO MISMO SOY!!!', v_id);
  dbms_output.put_line( 'id: ' || v_id );
end;
/

select * from educa.demo;

  