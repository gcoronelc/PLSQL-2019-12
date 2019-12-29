CREATE OR REPLACE PACKAGE SISUNI.PKG_GENERAR_VENTA
  /*+=======================================================================================+
  |                          Copyright (c) 2019 TAIPE - ALZUGARAY                           |
  +=========================================================================================+
  |                                                                                         |
  | DESCRIPTION : Procedimiento para la generación de nuevas ventas.                        |
  |                                                                                         |
  | History                                                                                 |
  | When          Who                 What                                                  |
  | ----------    ------------------- ------------------------------------------------------|
  | 27/12/2019    Melissa Taipe        Workshop PL/SQL SISUNI                               |
  |=========================================================================================+*/
AS
  --CREAR VENTA
  PROCEDURE SP_CREAR_VENTA(
      P_DV_IDVENTA    IN NUMBER,
      P_DV_IDPRODUCTO IN NUMBER,
      P_DV_CANTIDAD   IN NUMBER,
      P_DV_PRECIO     IN NUMBER,
      P_MENSAJE OUT NOCOPY VARCHAR2 );
END PKG_GENERAR_VENTA;
/