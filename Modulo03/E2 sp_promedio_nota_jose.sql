/*EJERCICIO 2 - Desarrollar un sp para calcular el promedio de un estudiante, son 4 notas*/
CREATE OR REPLACE PROCEDURE scott.sp_calcular_nota (
  p_nota1      IN    NUMBER,
  p_nota2      IN    NUMBER,
  p_nota3      IN    NUMBER,
  p_nota4      IN    NUMBER,
  p_promedio   OUT   NUMBER
) IS
BEGIN
--PROCESO
  p_promedio := ( p_nota1 + p_nota2 + p_nota3 + p_nota4 ) / 4;
END;
/



DECLARE
  v_nota1       NUMBER;
  v_nota2      NUMBER;
  v_nota3      NUMBER;
  v_nota4      NUMBER;
  v_promedio   NUMBER;
BEGIN
  -- Datos
  v_nota1 := 15;
  v_nota2 := 18;
  v_nota3 := 14;
  v_nota4 := 10;  
  --PROCESO
  scott.sp_calcular_nota(v_nota1, v_nota2, v_nota3, v_nota4, v_promedio);
   --SALIDA
  dbms_output.put_line('TU NOTA FINAL ES: ' || v_promedio);
END;
/


