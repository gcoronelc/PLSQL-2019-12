
CREATE OR REPLACE PACKAGE scott.pk_demo as

  function suma( n1 in number, n2 in number ) return number;

  function suma( n1 in number, n2 in number, n3 number ) return number;
  
  function suma( v1 in number, v2 in number ) return number;
  
END pk_demo;
/


CREATE OR REPLACE PACKAGE BODY scott.pk_demo as

function suma( n1 in number, n2 in number ) return number
as
  rtn number;
begin
  rtn := n1 + n2;
  return rtn;
end;

function suma( n1 in number, n2 in number, n3 number ) return number
as
  rtn number;
begin
  rtn := n1 + n2 + n3;
  return rtn;
end;

function suma( v1 in number, v2 in number ) return number
as
  rtn number;
begin
  rtn := v1 + v2 + 100;
  return rtn;
end;

END pk_demo;
/



select 
  scott.pk_demo.suma(n1=>56,n2=>78) suma1,
  scott.pk_demo.suma(56,78,76) suma1,
  scott.pk_demo.suma(v1=>56,v2=>78) suma1,
  scott.pk_demo.suma(n1=>56,n2=>78,n3=>76) suma1
from dual;

