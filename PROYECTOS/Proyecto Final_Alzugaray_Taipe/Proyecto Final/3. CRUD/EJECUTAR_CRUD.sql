--INSERTAR
SET serveroutput ON;
DECLARE
  P_CL_DNI        VARCHAR2(8);
  P_CL_NOMBRE     VARCHAR2(25);
  P_CL_TELEFONO   VARCHAR2(9);
  P_CL_SEXO       VARCHAR2(1);
  P_CL_FECHA_NAC  DATE;
  P_CL_DIRECCION  VARCHAR2(50);
  P_COD_RESPUESTA NUMBER;
  P_MENSAJE       VARCHAR2(200);
BEGIN
  P_CL_DNI        :='06512447';
  P_CL_NOMBRE     :='YOLANDA JORGES RUIZ';
  P_CL_TELEFONO   :='996652145';
  P_CL_SEXO       :='F';
  P_CL_FECHA_NAC  :='22/10/1970';
  P_CL_DIRECCION  :='AV. LOS PROCERES 310';
  P_COD_RESPUESTA := NULL;
  P_MENSAJE       :=NULL;
  PKG_CRUD_CLIENTE.SP_INSERTAR_CLIENTE ( P_CL_DNI, P_CL_NOMBRE, P_CL_TELEFONO, P_CL_SEXO, P_CL_FECHA_NAC, P_CL_DIRECCION, P_COD_RESPUESTA, P_MENSAJE) ;
  dbms_output.put_line(P_COD_RESPUESTA || ', ' || P_MENSAJE);
END;
/
select * from tbl_cliente;
----------------------------------------------------------------------------------------
---ACTUALIZAR
DECLARE
  P_CL_IDCLIENTE  NUMBER;
  P_CL_NOMBRE     VARCHAR2(25);
  P_CL_TELEFONO   VARCHAR2(9);
  P_CL_SEXO       VARCHAR2(1);
  P_CL_FECHA_NAC  DATE;
  P_CL_DIRECCION  VARCHAR2(50);
  P_COD_RESPUESTA NUMBER;
  P_MENSAJE       VARCHAR2(200);
BEGIN
  P_CL_IDCLIENTE  := 106;
  P_CL_NOMBRE     := 'MARIA JORGES RUIZ';
  P_CL_TELEFONO   := '961842132';
  P_CL_SEXO       := 'F';
  P_CL_FECHA_NAC  := '22/10/1970';
  P_CL_DIRECCION  := 'AV. LOS PROCERES 310';
  P_COD_RESPUESTA := NULL;
  P_MENSAJE       := NULL;
  PKG_CRUD_CLIENTE.SP_MODIFICAR_CLIENTE ( P_CL_IDCLIENTE, P_CL_NOMBRE, P_CL_TELEFONO, P_CL_SEXO, P_CL_FECHA_NAC, P_CL_DIRECCION, P_COD_RESPUESTA, P_MENSAJE) ;
  dbms_output.put_line(P_COD_RESPUESTA || ', ' || P_MENSAJE);
END;
/

----------------------------------------------------------------------------------
--ELIMINAR
DECLARE
  P_CL_IDCLIENTE  NUMBER;
  P_COD_RESPUESTA NUMBER;
  P_MENSAJE       VARCHAR2(200);
BEGIN
  P_CL_IDCLIENTE  := 106;
  P_COD_RESPUESTA := NULL;
  P_MENSAJE       := NULL;
  PKG_CRUD_CLIENTE.SP_ELIMINAR_CLIENTE ( P_CL_IDCLIENTE, P_COD_RESPUESTA, P_MENSAJE) ;
  dbms_output.put_line(P_COD_RESPUESTA || ', ' || P_MENSAJE);
END;
/
SELECT * FROM TBL_CLIENTE;
------------------------------------------------------------------------------------------
--LEER SOLO REGISTRO
DECLARE
  P_CL_IDCLIENTE NUMBER;
  P_CURSOR SYS_REFCURSOR ;
  P_COD_RESPUESTA NUMBER;
  P_MENSAJE       VARCHAR2(200);
  reg TBL_CLIENTE%rowtype;
BEGIN
  P_CL_IDCLIENTE  := 104;
  P_CURSOR        := NULL;
  P_COD_RESPUESTA := NULL;
  P_MENSAJE       :=NULL;
  PKG_CRUD_CLIENTE.SP_LISTAR_CLIENTE_ID ( P_CL_IDCLIENTE, P_CURSOR, P_COD_RESPUESTA, P_MENSAJE);
  LOOP
    IF P_CURSOR%isopen THEN
      FETCH P_CURSOR INTO reg;
      EXIT
    WHEN P_CURSOR%NOTFOUND;
      -- Mostrar fila
      dbms_output.put_line(reg.CL_DNI || ', ' || reg.CL_NOMBRE);
      CLOSE P_CURSOR;
    ELSE
      EXIT;
    END IF;
    -- Leer fila
  END LOOP;
  dbms_output.put_line(P_COD_RESPUESTA || ', ' || P_MENSAJE);
END;
/

------------------------------------------------------------------------------------------
--LEER VARIOS REGISTROS
DECLARE
  P_CURSOR SYS_REFCURSOR;
  P_COD_RESPUESTA NUMBER;
  P_MENSAJE       VARCHAR2(200);
  reg TBL_CLIENTE%rowtype;
BEGIN
  P_CURSOR        := NULL;
  P_COD_RESPUESTA := NULL;
  P_MENSAJE       := NULL;
  PKG_CRUD_CLIENTE.SP_LISTAR_CLIENTES ( P_CURSOR, P_COD_RESPUESTA , P_MENSAJE );
  LOOP
    IF P_CURSOR%isopen THEN
      FETCH P_CURSOR INTO reg;
      EXIT
    WHEN P_CURSOR%NOTFOUND;
      -- Mostrar fila
      dbms_output.put_line(reg.CL_IDCLIENTE || ', ' || reg.CL_DNI || ', ' || reg.CL_NOMBRE || ', ' || reg.CL_TELEFONO);
    ELSE
      EXIT;
    END IF;
    -- Leer fila
  END LOOP;
  dbms_output.put_line(P_COD_RESPUESTA || ', ' || P_MENSAJE);
END;
/