CREATE OR REPLACE PACKAGE SISUNI.PKG_CRUD_CLIENTE
  /*+=======================================================================================+
  |                          Copyright (c) 2019 TAIPE - ALZUGARAY                           |
  +=========================================================================================+
  |                                                                                         |
  | DESCRIPTION : Procedimientos para la creación, actualización y eliminación de           |
  |               clientes.                                                                 |
  |                                                                                         |
  | History                                                                                 |
  | When          Who                 What                                                  |
  | ----------    ------------------- ------------------------------------------------------|
  | 27/12/2019    Jose Alzugaray        Workshop PL/SQL SISUNI                              |
  |=========================================================================================+*/
AS
  --CREAR CLIENTE
  PROCEDURE SP_INSERTAR_CLIENTE(
      P_CL_DNI       IN TBL_CLIENTE.CL_DNI%TYPE,
      P_CL_NOMBRE    IN TBL_CLIENTE.CL_NOMBRE%TYPE,
      P_CL_TELEFONO  IN TBL_CLIENTE.CL_TELEFONO%TYPE,
      P_CL_SEXO      IN TBL_CLIENTE.CL_SEXO%TYPE,
      P_CL_FECHA_NAC IN TBL_CLIENTE.CL_FECHA_NAC%TYPE,
      P_CL_DIRECCION IN TBL_CLIENTE.CL_DIRECCION%TYPE,
      P_COD_RESPUESTA OUT NOCOPY NUMBER,
      P_MENSAJE OUT NOCOPY       VARCHAR2 );
      
  --ACTUALIZAR TBL_CLIENTE
  PROCEDURE SP_MODIFICAR_CLIENTE(
      P_CL_IDCLIENTE IN TBL_CLIENTE.CL_IDCLIENTE%TYPE,
      P_CL_NOMBRE    IN TBL_CLIENTE.CL_NOMBRE%TYPE,
      P_CL_TELEFONO  IN TBL_CLIENTE.CL_TELEFONO%TYPE,
      P_CL_SEXO      IN TBL_CLIENTE.CL_SEXO%TYPE,
      P_CL_FECHA_NAC IN TBL_CLIENTE.CL_FECHA_NAC%TYPE,
      P_CL_DIRECCION IN TBL_CLIENTE.CL_DIRECCION%TYPE,
      P_COD_RESPUESTA OUT NOCOPY NUMBER,
      P_MENSAJE OUT NOCOPY       VARCHAR2 );
      
  --ELIMINAR TBL_CLIENTE
  PROCEDURE SP_ELIMINAR_CLIENTE(
      P_CL_IDCLIENTE IN TBL_CLIENTE.CL_IDCLIENTE%TYPE,
      P_COD_RESPUESTA OUT NOCOPY NUMBER,
      P_MENSAJE OUT NOCOPY       VARCHAR2 );
      
  --LEER VARIOS REGISTROS
  PROCEDURE SP_LISTAR_CLIENTES(
      P_CURSOR OUT NOCOPY SYS_REFCURSOR,
      P_COD_RESPUESTA OUT NOCOPY NUMBER,
      P_MENSAJE OUT NOCOPY       VARCHAR2 );
      
  --LEER SOLO UN REGISTRO
  PROCEDURE SP_LISTAR_CLIENTE_ID(
    P_CL_IDCLIENTE IN TBL_CLIENTE.CL_IDCLIENTE%TYPE,
    P_CURSOR OUT NOCOPY SYS_REFCURSOR,
    P_COD_RESPUESTA OUT NOCOPY NUMBER,
    P_MENSAJE OUT NOCOPY       VARCHAR2 );
END PKG_CRUD_CLIENTE;
/