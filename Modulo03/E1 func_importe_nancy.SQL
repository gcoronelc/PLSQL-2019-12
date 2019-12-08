create or replace FUNCTION scott.fn_importeVenta
(p_precio number,p_cantidad number,p_descuento number)
return number
is
   v_total number;
begin
   --proceso
   v_total :=(p_precio+p_cantidad)-p_descuento;
   --retorno
   RETURN v_total;
end;
/


Declare
  v_importeVenta number;
begin
  v_importeVenta:= SCOTT.fn_importeVenta(50,2,20);
  DBMS_OUTPUT.PUT_LINE('Importe venta: '||v_importeVenta);
  DBMS_OUTPUT.PUT_LINE('Ese es tu importe');
end;
/

