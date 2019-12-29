--transaccion simple

CREATE OR REPLACE PROCEDURE InformeVentas(
ini integer,
fin integer,

C_vista OUT SYS_REFCURSOR
    )
IS
BEGIN    
    OPEN C_vista FOR    
    SELECT to_char(fecha,'YYYY')año,to_char(fecha,'MM')MES,idusuario,sum(importe)
    FROM recibo
    group by to_char(fecha,'YYYY'),to_char(fecha,'MM'),idusuario
    having to_char(fecha,'YYYY')>=ini and to_char(fecha,'YYYY')<=fin;
END;

--codigo de prueba
var usercur refcursor
exec InformeVentas(2008,2020,:usercur)
print usercur