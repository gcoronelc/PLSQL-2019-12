/*
PROBLEMA 1:
--------------
DETERMINAR LA CANTIDAD Y MONTO TOTAL DE PAGOS 
REALIZADOS POR CLIENTES, ESCUELA Y FACULTAD 
ENTRE EN UN MES,A�O Y NIVEL DETERMINADO.
*/

CREATE OR REPLACE PROCEDURE LISTAR_CANTIDAD_MONTO_PAGOS
(
        P_ANNO IN NUMBER,
        P_MES IN NUMBER,
        P_TIPONIVEL IN NIVEL.DESCRIPCION%TYPE,
        P_CURSOR OUT SYS_REFCURSOR
)
AS
        BEGIN
                    
                    OPEN P_CURSOR
                    FOR
                    SELECT C.NOMBRES,
                          E.DESCRIPCION,
                          F.DESCRIPCION,
                          N.DESCRIPCION,
                          COUNT(*),
                          SUM(R.IMPORTE)
                    FROM CLIENTE C JOIN RECIBO R ON C.IDCLIENTE=R.IDCLIENTE
                                                     JOIN RECIBODETALLE RD ON R.IDRECIBO=RD.IDRECIBO
                                                     JOIN ESCUELA E ON RD.IDESCUELA=E.IDESCUELA
                                                     JOIN FACULTAD F ON E.IDFACULTAD=F.IDFACULTAD
                                                     JOIN NIVEL N ON F.IDNIVEL=N.IDNIVEL
                    WHERE 
                                TO_CHAR(R.FECHA,'YYYY')=P_ANNO AND
                                TO_CHAR(R.FECHA,'MM')=P_MES AND
                                N.DESCRIPCION=P_TIPONIVEL 
                    GROUP BY C.NOMBRES,E.DESCRIPCION,F.DESCRIPCION,N.DESCRIPCION;
                    
        END;
/


DECLARE

        V_CURSOR SYS_REFCURSOR;
        V_NOMBRE CLIENTE.NOMBRES%TYPE;
        V_ESCUELA ESCUELA.DESCRIPCION%TYPE;
        V_FACULTAD FACULTAD.DESCRIPCION%TYPE;
        V_NIVEL NIVEL.DESCRIPCION%TYPE;
        V_CANTIDAD_TRAMITES NUMBER;
        V_MONTO_TOTAL NUMBER;
        
        BEGIN
        
                LISTAR_CANTIDAD_MONTO_PAGOS(2019,1,'PREGRADO',V_CURSOR);
                
                
                DBMS_OUTPUT.PUT_LINE('NOMBRE CLIENTE'|| '|' ||'ESCUELA'|| '|' ||'FACULTAD' || '|' ||'NIVEL' || '|' ||'CANTIDAD DE TRAMITES' || '|' ||'MONTO TOTAL');
                DBMS_OUTPUT.PUT_LINE('----------------------------------------------------------------------------------------------------------------------------------------------------------------------');
                
                LOOP
                            FETCH V_CURSOR INTO V_NOMBRE,V_ESCUELA,V_FACULTAD,V_NIVEL,V_CANTIDAD_TRAMITES,V_MONTO_TOTAL;
                            EXIT WHEN V_CURSOR%NOTFOUND;
                            
                            DBMS_OUTPUT.PUT_LINE(V_NOMBRE|| '-' ||V_ESCUELA || '-' ||V_FACULTAD || '-' ||V_NIVEL || '-' ||V_CANTIDAD_TRAMITES || '-' ||V_MONTO_TOTAL);
                            
                END LOOP;
                CLOSE V_CURSOR;
        END;
/


/*
PROBLEMA 2:
--------------
REGISTRAR EN UNA TABLA TEMPORAL EL CODIGO DEL CLIENTE,NOMBRE DEL CLIENTE,
LA CANTIDAD Y MONTO TOTAL DE PAGOS REALIZADOS POR LOS CLIENTES
*/

CREATE  GLOBAL TEMPORARY TABLE T_SEGUIMIENTO_CLIENTES
ON COMMIT PRESERVE ROWS
AS
        SELECT  IDCLIENTE AS CODIGO_CLIENTE,
                       NOMBRES AS NOMBRE_CLIENTE,
                       5000 AS CANTIDAD_PAGOS,
                       6000 AS MONTO_TOTAL
        FROM CLIENTE
        WHERE 1=0;

--CONSULTAR TABLA--
SELECT * FROM T_SEGUIMIENTO_CLIENTES;

--ELIMINAR TABLA--
TRUNCATE TABLE T_SEGUIMIENTO_CLIENTES;
DROP TABLE T_SEGUIMIENTO_CLIENTES;

DROP TRIGGER ACTUALIZAR_CONSOLIDADO_PAGOS;

CREATE OR REPLACE TRIGGER ACTUALIZAR_CONSOLIDADO_PAGOS
BEFORE INSERT OR DELETE
ON RECIBO
FOR EACH ROW

                BEGIN
                            
                            IF INSERTING THEN
                                        
                                        DBMS_OUTPUT.PUT_LINE('SE HA INSERTADO UN REGISTRO!!');
                                                                            
                                        DELETE  FROM T_SEGUIMIENTO_CLIENTES WHERE CODIGO_CLIENTE = :NEW.IDCLIENTE;
                                        
                                        INSERT INTO T_SEGUIMIENTO_CLIENTES(CODIGO_CLIENTE,NOMBRE_CLIENTE,CANTIDAD_PAGOS,MONTO_TOTAL) 
                                                SELECT C.IDCLIENTE,C.NOMBRES,COUNT(*) TOTAL,SUM(R.IMPORTE) 
                                                FROM RECIBO R JOIN CLIENTE C ON R.IDCLIENTE=C.IDCLIENTE
                                                WHERE C.IDCLIENTE=:NEW.IDCLIENTE
                                                GROUP BY C.IDCLIENTE,C.NOMBRES;
                                                             
                            END IF;
                            
                            
                            IF DELETING THEN
                            
                                         DBMS_OUTPUT.PUT_LINE('SE HA ELIMINADO UN REGISTRO!!');
                            
                                         DELETE FROM T_SEGUIMIENTO_CLIENTES WHERE CODIGO_CLIENTE = :OLD.IDCLIENTE;

                                        INSERT INTO T_SEGUIMIENTO_CLIENTES(CODIGO_CLIENTE,NOMBRE_CLIENTE,CANTIDAD_PAGOS,MONTO_TOTAL) 
                                        SELECT C.IDCLIENTE,C.NOMBRES,COUNT(*),SUM(R.IMPORTE) 
                                        FROM RECIBO R JOIN CLIENTE C ON R.IDCLIENTE=C.IDCLIENTE
                                        WHERE C.IDCLIENTE=:OLD.IDCLIENTE
                                        GROUP BY C.IDCLIENTE,C.NOMBRES;
                                        

                            END IF;
                          
                END;
/

SELECT * FROM RECIBO
WHERE IDCLIENTE=4;

SELECT * FROM T_SEGUIMIENTO_CLIENTES;

--INSERTAMOS--

INSERT INTO RECIBO(IDRECIBO,FECHA,IMPORTE,IDCLIENTE,IDUSUARIO) VALUES (27,'14/02/19',5500,4,2);

INSERT INTO RECIBO(IDRECIBO,FECHA,IMPORTE,IDCLIENTE,IDUSUARIO) VALUES (28,'15/02/19',100,4,2);

INSERT INTO RECIBO(IDRECIBO,FECHA,IMPORTE,IDCLIENTE,IDUSUARIO) VALUES (29,'16/02/19',100,4,2);


/*ERROR AL ELIMINAR*/
DELETE RECIBO
WHERE IDRECIBO=28;






