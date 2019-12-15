
-- DECODE

SELECT DECODE(4, 1, 'UNO',
                    2, 'DOS',
                    3, 'TRES',
                    'NO SE') result
FROM DUAL;


SELECT E.*,
  DECODE(DEPTNO, 10, 'BIEN',
            20, 'MEJOR',
            30, 'GANADOR',
            'YA PERDISTE') result
FROM SCOTT.EMP E;


-- Ejercicio 1
/*
Desarrollar una función para calular 
el promedio de un alumno.
Son cuatro notas, se elimina la menor.
Esquema: SCOTT
*/

create or replace function scott.fn_menor
(p_n1 number, p_n2 number, p_n3 number, p_n4 number)
return number
as
  v_menor number := p_n1;
begin
  if v_menor > p_n2 then
    v_menor := p_n2;
  end if;
  if v_menor > p_n3 then
    v_menor := p_n3;
  end if;
  if v_menor > p_n4 then
    v_menor := p_n4;
  end if;
  return v_menor;
end;
/


create or replace function scott.fn_promedio
(p_n1 number, p_n2 number, p_n3 number, p_n4 number)
return number
as
  v_menor number;
  v_promedio number;
begin
  v_menor := scott.fn_menor(p_n1,p_n2,p_n3,p_n4);
  v_promedio := (p_n1 + p_n2 + p_n3 + p_n4 - v_menor) / 3;
  return v_promedio;
end;
/


select scott.fn_promedio(12,16,18,20) promedio
from dual;



create or replace function scott.fn_salario
(p_sal scott.emp.sal%type) return varchar2 
is  
  v_msg varchar2(40);  
begin  
  case   
    when (p_sal > 0 and p_sal <= 2500) then    
      v_msg := 'Salario Bajo';   
    when (p_sal > 2500 and p_sal <= 4000) then    
      v_msg := 'Salario Regular';   
    when (p_sal > 4000) then    
      v_msg := 'Salario Bueno';   
    else    
      v_msg := 'Caso Desconocido';  
  end case;  
  return v_msg; 
end;
/

