
SET TERMOUT OFF
SET ECHO OFF

-------------- NIVEL -----------------
INSERT INTO	NIVEL(idnivel,descripcion)VALUES(1,'PREGRADO');
INSERT INTO	NIVEL(idnivel,descripcion)VALUES(2,'POSGRADO');

------------- CLIENTE --------------

INSERT INTO	CLIENTE(idcliente,apellidos,nombres,correo,telefono,dni)VALUES(1,'MALLMA INGA','ANALI', 'anali@htomail.com','123892888','16047909');
INSERT INTO	CLIENTE(idcliente,apellidos,nombres,correo,telefono,dni)VALUES(2,'TAMARA RAMIREZ','WILSON','wilson@htomail.com','121237873','16099569');
INSERT INTO	CLIENTE(idcliente,apellidos,nombres,correo,telefono,dni)VALUES(3,'BENAVIDES VASQUEZ','HELLEN MIRIA', 'hellen@htomail.com','','16150480');
INSERT INTO	CLIENTE(idcliente,apellidos,nombres,correo,telefono,dni)VALUES(4,'GARCIA REYES','TANIA CAROLINA', 'tania@htomail.com','123844843','16161824');
INSERT INTO	CLIENTE(idcliente,apellidos,nombres,correo,telefono,dni)VALUES(5,'LEON LOPEZ','MARINA SUSANA','mar@htomail.com','837347123','16376070');
INSERT INTO	CLIENTE(idcliente,apellidos,nombres,correo,telefono,dni)VALUES(6,'LONGA VIA','JULY MILAGRITO','mila@htomail.com','778437123','16441350');
INSERT INTO	CLIENTE(idcliente,apellidos,nombres,correo,telefono,dni)VALUES(7,'CARRERA VELASQUEZ','ISAAC','issac@htomail.com','','16451871');
INSERT INTO	CLIENTE(idcliente,apellidos,nombres,correo,telefono,dni)VALUES(8,'ALVAREZ SALAZAR','YASHIRA MERCED','yashira@htomail.com','939428493','16553071');
INSERT INTO	CLIENTE(idcliente,apellidos,nombres,correo,telefono,dni)VALUES(9,'JARA CATIRE','YEXENIA SANDY','sandy@htomail.com','238483274','16556070');
INSERT INTO	CLIENTE(idcliente,apellidos,nombres,correo,telefono,dni)VALUES(10,'MORALES HERNANDEZ','STEFANY VIVI','stefany@htomail.com','938439489','16552125');
INSERT INTO	CLIENTE(idcliente,apellidos,nombres,correo,telefono,dni)VALUES(11,'JULCA HARO','MERCEDES JANNET','jannet@htomail.com','834948498','16654689');
INSERT INTO	CLIENTE(idcliente,apellidos,nombres,correo,telefono,dni)VALUES(12,'VASQUEZ SILVA','CINDY PIERINA','cindy@htomail.com','','16653277');
INSERT INTO	CLIENTE(idcliente,apellidos,nombres,correo,telefono,dni)VALUES(13,'BRAVO MATA','LILIAN','lili@htomail.com','948893483','16725197');
INSERT INTO	CLIENTE(idcliente,apellidos,nombres,correo,telefono,dni)VALUES(14,'CERVANTES CASTILLO','MAYRA','mayra@htomail.com','339483894','16755232');
INSERT INTO	CLIENTE(idcliente,apellidos,nombres,correo,telefono,dni)VALUES(15,'CHANGANA LA CRUZ', 'ABIGAIL MELIS','abigail@htomail.com','238483948','16773975');
INSERT INTO	CLIENTE(idcliente,apellidos,nombres,correo,telefono,dni)VALUES(16,'CERNA LLUSHO','BRIAN ROBERT','bryan@htomail.com','443493899','16799015');
INSERT INTO	CLIENTE(idcliente,apellidos,nombres,correo,telefono,dni)VALUES(17,'DIONICIO CAMPOS', 'HENRY ','henry@htomail.com','398434828','16853703');
INSERT INTO	CLIENTE(idcliente,apellidos,nombres,correo,telefono,dni)VALUES(18,'ROJAS MARIN','KATHERIN AMALIA','amalia@htomail.com','349823984','16856428');
INSERT INTO	CLIENTE(idcliente,apellidos,nombres,correo,telefono,dni)VALUES(19,'RAMIREZ TORRES','LLUBITZA  ANAIS','anais@htomail.com','','16937148');
INSERT INTO	CLIENTE(idcliente,apellidos,nombres,correo,telefono,dni)VALUES(20,'BUSTAMANTE BLAS','LEYDI ANAIS','leydy@htomail.com','584829848','16937155');
INSERT INTO	CLIENTE(idcliente,apellidos,nombres,correo,telefono,dni)VALUES(21,'LAZARO PALMA','RUSBEL OSTERLING','rus@htomail.com','843982984','16966939');
INSERT INTO	CLIENTE(idcliente,apellidos,nombres,correo,telefono,dni)VALUES(22,'CHERRES PACORA','STEEFANNY ALEJA','steef@htomail.com','653733293','16988874');
INSERT INTO	CLIENTE(idcliente,apellidos,nombres,correo,telefono,dni)VALUES(23,'RODAS CARO','SAMUEL ARTURO','sam@htomail.com','148347247','16994641');
INSERT INTO	CLIENTE(idcliente,apellidos,nombres,correo,telefono,dni)VALUES(24,'LOZANO VALVERDE' ,'CRISTHIAN JUNI','cristh@htomail.com','248492834','17091932');
INSERT INTO	CLIENTE(idcliente,apellidos,nombres,correo,telefono,dni)VALUES(25,'NUNEZ SANCHEZ','MILI MIRIM','mil3@htomail.com','489284988','17098270');

-------------------- ROL ---------------------------

INSERT INTO	ROL(idrol,nombre)VALUES(1,'CAJERO');
INSERT INTO	ROL(idrol,nombre)VALUES(2,'JEFECAJA');
INSERT INTO	ROL(idrol,nombre)VALUES(3,'ADMIN');

------------------ USUARIO -----------------------

INSERT INTO USUARIO(idusuario,nombres,apellidos,usuario,password,estado)VALUES(1,'PEDRO SAUL','SALAS LOPEZ'    ,'PEDROS' ,'12345' ,1);
INSERT INTO USUARIO(idusuario,nombres,apellidos,usuario,password,estado)VALUES(2,'LUCIA LIZ','CUEVA BELTRAN'  ,'LUCIAC' ,'56789' ,1);
INSERT INTO USUARIO(idusuario,nombres,apellidos,usuario,password,estado)VALUES(3,'MARCOS ELMER','JUAREZ ALBA'  ,'MARCOSJ','101112',1);
INSERT INTO USUARIO(idusuario,nombres,apellidos,usuario,password,estado)VALUES(4,'MARY','GONZALES CRUZ'       ,'MARYG',  '131415',1);
INSERT INTO USUARIO(idusuario,nombres,apellidos,usuario,password,estado)VALUES(5,'LUIS ERNERTO',' VALLEJO DIAZ','LUISV',  '161718',1);

---------------   USUARIO - ROL --------------------

INSERT INTO USUARIO_ROL(idusuario_rol,idrol,idusuario)VALUES(1,3,1);
INSERT INTO USUARIO_ROL(idusuario_rol,idrol,idusuario)VALUES(2,2,2);
INSERT INTO USUARIO_ROL(idusuario_rol,idrol,idusuario)VALUES(3,1,3);
INSERT INTO USUARIO_ROL(idusuario_rol,idrol,idusuario)VALUES(4,1,4);
INSERT INTO USUARIO_ROL(idusuario_rol,idrol,idusuario)VALUES(5,1,5);

-------------------  FACULTAD  -------------------------
                                               
INSERT INTO FACULTAD(idfacultad,descripcion,idnivel)VALUES(1,'BROMATOLOGiA Y NUTRICION',1);
INSERT INTO FACULTAD(idfacultad,descripcion,idnivel)VALUES(2,'CIENCIAS AGRARIAS E INDUSTRIAS ALIMENTARIAS',1);
INSERT INTO FACULTAD(idfacultad,descripcion,idnivel)VALUES(3,'CIENCIAS',1);
INSERT INTO FACULTAD(idfacultad,descripcion,idnivel)VALUES(4,'CIENCIAS ADMINISTRATIVAS Y TURISMO',1);
INSERT INTO FACULTAD(idfacultad,descripcion,idnivel)VALUES(5,'CIENCIAS CONTABLES, ECONOMICAS Y FINANCIERAS',1);
INSERT INTO FACULTAD(idfacultad,descripcion,idnivel)VALUES(6,'CIENCIAS SOCIALES',1);
INSERT INTO FACULTAD(idfacultad,descripcion,idnivel)VALUES(7,'DERECHO Y CIENCIAS POLiTICAS',1);
INSERT INTO FACULTAD(idfacultad,descripcion,idnivel)VALUES(8,'EDUCACION',1);
INSERT INTO FACULTAD(idfacultad,descripcion,idnivel)VALUES(9,'INGENIERiA INDUSTRIAL, SISTEMAS E INFORMATICA',1);
INSERT INTO FACULTAD(idfacultad,descripcion,idnivel)VALUES(15,'ESTADiSTICA',1);
INSERT INTO FACULTAD(idfacultad,descripcion,idnivel)VALUES(23,'INGENIERIA PESQUERA',1);
INSERT INTO FACULTAD(idfacultad,descripcion,idnivel)VALUES(24,'INGENIERiA QUiMICA Y METALURGICA',1);
INSERT INTO FACULTAD(idfacultad,descripcion,idnivel)VALUES(25,'MEDICINA HUMANA',1);
INSERT INTO FACULTAD(idfacultad,descripcion,idnivel)VALUES(26,'INGENIERiA AMBIENTAL',1);
INSERT INTO FACULTAD(idfacultad,descripcion,idnivel)VALUES(27,'UNIDAD DE BROMATOLOGiA Y NUTRICION',2);
INSERT INTO FACULTAD(idfacultad,descripcion,idnivel)VALUES(28,'UNIDAD DE CIENCIAS AGRARIAS E INDUSTRIAS ALIMENTARIAS',2);
INSERT INTO FACULTAD(idfacultad,descripcion,idnivel)VALUES(30,'UNIDAD DE CIENCIAS',2);
INSERT INTO FACULTAD(idfacultad,descripcion,idnivel)VALUES(31,'UNIDAD DE CIENCIAS ADMINISTRATIVAS Y TURISMO',2);
INSERT INTO FACULTAD(idfacultad,descripcion,idnivel)VALUES(32,'UNIDAD DE CIENCIAS CONTABLES, ECONOMICAS Y FINANCIERAS',2);
INSERT INTO FACULTAD(idfacultad,descripcion,idnivel)VALUES(33,'UNIDAD DE CIENCIAS SOCIALES',2);
INSERT INTO FACULTAD(idfacultad,descripcion,idnivel)VALUES(34,'UNIDAD DE DERECHO Y CIENCIAS POLiTICAS',2);
INSERT INTO FACULTAD(idfacultad,descripcion,idnivel)VALUES(35,'UNIDAD DE EDUCACION',2);
INSERT INTO FACULTAD(idfacultad,descripcion,idnivel)VALUES(36,'UNIDAD DE INGENIERiA INDUSTRIAL, SISTEMAS E INFORMATICA',2);
INSERT INTO FACULTAD(idfacultad,descripcion,idnivel)VALUES(38,'UNIDAD DE ESTADiSTICA',2);
INSERT INTO FACULTAD(idfacultad,descripcion,idnivel)VALUES(39,'UNIDAD DE INGENIERIA PESQUERA',2);
INSERT INTO FACULTAD(idfacultad,descripcion,idnivel)VALUES(40,'UNIDAD DE INGENIERiA QUiMICA Y METALURGICA',2);
INSERT INTO FACULTAD(idfacultad,descripcion,idnivel)VALUES(41,'UNIDAD DE MEDICINA HUMANA',2);
INSERT INTO FACULTAD(idfacultad,descripcion,idnivel)VALUES(42,'UNIDAD DE INGENIERiA AMBIENTAL',2);

--------------------  ESCUELA ------------------------

INSERT INTO ESCUELA(idescuela,descripcion,idfacultad)VALUES(1,'INGENIERIA DE SISTEMAS',9);
INSERT INTO ESCUELA(idescuela,descripcion,idfacultad)VALUES(2,'INGENIERIA INDUSTRIAL',9);
INSERT INTO ESCUELA(idescuela,descripcion,idfacultad)VALUES(3,'INGENIERIA QUIMICA',24);
INSERT INTO ESCUELA(idescuela,descripcion,idfacultad)VALUES(4,'INGENIERIA METALURGICA',24);
INSERT INTO ESCUELA(idescuela,descripcion,idfacultad)VALUES(5,'INGENIERiA INFORMATICA',9);
INSERT INTO ESCUELA(idescuela,descripcion,idfacultad)VALUES(6,'MATEMATICA APLICADA',3);
INSERT INTO ESCUELA(idescuela,descripcion,idfacultad)VALUES(7,'CIENCIAS DE LA COMUNICACION',6);
INSERT INTO ESCUELA(idescuela,descripcion,idfacultad)VALUES(8,'TRABAJO SOCIAL',6);
INSERT INTO ESCUELA(idescuela,descripcion,idfacultad)VALUES(9,'SOCIOLOGIA',6);
INSERT INTO ESCUELA(idescuela,descripcion,idfacultad)VALUES(10,'DERECHO Y CIENCIAS POLiTICAS',7);
INSERT INTO ESCUELA(idescuela,descripcion,idfacultad)VALUES(11,'MEDICINA HUMANA',25);
INSERT INTO ESCUELA(idescuela,descripcion,idfacultad)VALUES(12,'ENFERMERIA',25);
INSERT INTO ESCUELA(idescuela,descripcion,idfacultad)VALUES(13,'ADMINISTRACION',4);
INSERT INTO ESCUELA(idescuela,descripcion,idfacultad)VALUES(14,'ECONOMIA Y FINANZAS',5);
INSERT INTO ESCUELA(idescuela,descripcion,idfacultad)VALUES(15,'CIENCIAS CONTABLES Y FINANCIERAS',5);
INSERT INTO ESCUELA(idescuela,descripcion,idfacultad)VALUES(16,'AGRONOMIA',2);
INSERT INTO ESCUELA(idescuela,descripcion,idfacultad)VALUES(17,'ZOOTECNIA',2);
INSERT INTO ESCUELA(idescuela,descripcion,idfacultad)VALUES(18,'INGENIERIA PESQUERA',23);
INSERT INTO ESCUELA(idescuela,descripcion,idfacultad)VALUES(19,'INGENIERIA EN IND.ALIMENTARIA',2);
INSERT INTO ESCUELA(idescuela,descripcion,idfacultad)VALUES(20,'BROMATOLOGIA Y NUTRICION',1);
INSERT INTO ESCUELA(idescuela,descripcion,idfacultad)VALUES(21,'EDUCACION',8);
INSERT INTO ESCUELA(idescuela,descripcion,idfacultad)VALUES(22,'CULTURA FiSICA Y DEPORTES',3);
INSERT INTO ESCUELA(idescuela,descripcion,idfacultad)VALUES(39,'ESTADISTICA E INFORMATICA',3);
INSERT INTO ESCUELA(idescuela,descripcion,idfacultad)VALUES(44,'GESTION EN TURISMO Y HOTELERiA',4);
INSERT INTO ESCUELA(idescuela,descripcion,idfacultad)VALUES(47,'FISICA',3);
INSERT INTO ESCUELA(idescuela,descripcion,idfacultad)VALUES(48,'INGENIERiA AMBIENTAL',26);
INSERT INTO ESCUELA(idescuela,descripcion,idfacultad)VALUES(49,'INGENIERIA CIVIL',3);
INSERT INTO ESCUELA(idescuela,descripcion,idfacultad)VALUES(50,'NEGOCIOS INTERNACIONALES',4);
INSERT INTO ESCUELA(idescuela,descripcion,idfacultad)VALUES(51,'INGENIERiA ELECTRONICA',3);
INSERT INTO ESCUELA(idescuela,descripcion,idfacultad)VALUES(52,'BIOLOGIA CON MENCION EN BIOTECNOLOGIA',3);
INSERT INTO ESCUELA(idescuela,descripcion,idfacultad)VALUES(53,'OFICINA DE ECONOMIA Y CONTABILIDAD',1);
INSERT INTO ESCUELA(idescuela,descripcion,idfacultad)VALUES(54,'INGENIERIA ACUICOLA',23);---
INSERT INTO ESCUELA(idescuela,descripcion,idfacultad)VALUES(55,'Maestria en NutriciOn Clinica',27);
INSERT INTO ESCUELA(idescuela,descripcion,idfacultad)VALUES(56,'Maestria en Tecnologia de Alimentos',28);
INSERT INTO ESCUELA(idescuela,descripcion,idfacultad)VALUES(57,'Maestria en Turismo sostenible',31);
INSERT INTO ESCUELA(idescuela,descripcion,idfacultad)VALUES(58,'Maestria en Gestion empresarial',31);
INSERT INTO ESCUELA(idescuela,descripcion,idfacultad)VALUES(59,'Maestria en Gestion publica',31);
INSERT INTO ESCUELA(idescuela,descripcion,idfacultad)VALUES(60,'Maestria en Direccion de Recursos Humanos',31);
INSERT INTO ESCUELA(idescuela,descripcion,idfacultad)VALUES(61,'Maestria en Finanzas y valores',32);
INSERT INTO ESCUELA(idescuela,descripcion,idfacultad)VALUES(62,'Maestria en Costos y Presupuestos',32);
INSERT INTO ESCUELA(idescuela,descripcion,idfacultad)VALUES(63,'Maestria en Derecho Penal y Comercial',34);
INSERT INTO ESCUELA(idescuela,descripcion,idfacultad)VALUES(64,'Maestria en Ciencias Penales',34);
INSERT INTO ESCUELA(idescuela,descripcion,idfacultad)VALUES(65,'Maestria en Derecho de la empresa',34);
INSERT INTO ESCUELA(idescuela,descripcion,idfacultad)VALUES(66,'Maestria en Gobierno de Tecnologias de la Informacion',36);
INSERT INTO ESCUELA(idescuela,descripcion,idfacultad)VALUES(67,'Maestria en Gestion de la informacion',36);
INSERT INTO ESCUELA(idescuela,descripcion,idfacultad)VALUES(68,'Maestria en Inteligencia de Negocios',36);
INSERT INTO ESCUELA(idescuela,descripcion,idfacultad)VALUES(69,'Maestria en Fisiologia',41);
INSERT INTO ESCUELA(idescuela,descripcion,idfacultad)VALUES(70,'Maestria en Epidemiologia',41);
INSERT INTO ESCUELA(idescuela,descripcion,idfacultad)VALUES(71,'Maestria en Gerencia de Servicios de Salud',41);
INSERT INTO ESCUELA(idescuela,descripcion,idfacultad)VALUES(72,'Maestria en Neurociencias',41);
INSERT INTO ESCUELA(idescuela,descripcion,idfacultad)VALUES(73,'Maestria en NutriciOn: MenciOn en NutriciOn Clinica',41);
INSERT INTO ESCUELA(idescuela,descripcion,idfacultad)VALUES(74,'Maestria en Politicas y PlanificaciOn en Salud',41);
INSERT INTO ESCUELA(idescuela,descripcion,idfacultad)VALUES(75,'Maestria en Salud Publica',41);

------------------  CONCEPTO  -------------------------

INSERT INTO CONCEPTO(idconcepto,descripcion,precio)VALUES(1,'CARNET UNIVERSITARIO',16);      
INSERT INTO CONCEPTO(idconcepto,descripcion,precio)VALUES(2,'CARNET BIBLIOTECA CENTRAL',15);
INSERT INTO CONCEPTO(idconcepto,descripcion,precio)VALUES(3,'TRASLADO INTERNO',400);
INSERT INTO CONCEPTO(idconcepto,descripcion,precio)VALUES(4,'TRASLADO EXTERNO',400);
INSERT INTO CONCEPTO(idconcepto,descripcion,precio)VALUES(5,'CONSTANCIA INGRESO REGULAR',50);
INSERT INTO CONCEPTO(idconcepto,descripcion,precio)VALUES(6,'CONSTANCIA INGRESO C.P.U.',80);
INSERT INTO CONCEPTO(idconcepto,descripcion,precio)VALUES(7,'TRASLADO-POS GRADO OTRAS UNIV.',430);
INSERT INTO CONCEPTO(idconcepto,descripcion,precio)VALUES(8,'CONSTANCIAS - OTROS',15);
INSERT INTO CONCEPTO(idconcepto,descripcion,precio)VALUES(9,'CERTIFICADO DE ESTUDIOS',150);
INSERT INTO CONCEPTO(idconcepto,descripcion,precio)VALUES(10,'CONSTANCIA DE EGRESADO',30);
INSERT INTO CONCEPTO(idconcepto,descripcion,precio)VALUES(11,'CONSTANCIA DE INGRESO',50);
INSERT INTO CONCEPTO(idconcepto,descripcion,precio)VALUES(12,'CONSTANCIA RECORD ACADEMICO',15);
INSERT INTO CONCEPTO(idconcepto,descripcion,precio)VALUES(13,'CONSTANCIA PRACT. PRE PROF.',30);
INSERT INTO CONCEPTO(idconcepto,descripcion,precio)VALUES(14,'CONSTANCIA ORDEN DE MERITO',15);
INSERT INTO CONCEPTO(idconcepto,descripcion,precio)VALUES(15,'CONSTANCIA TERCIO SUPERIOR',15);
INSERT INTO CONCEPTO(idconcepto,descripcion,precio)VALUES(16,'CONSTANCIA PLAN DE ESTUDIOS',30);
INSERT INTO CONCEPTO(idconcepto,descripcion,precio)VALUES(17,'CONST.OPTADO GRADO ACAD.TITULO PROF',100);
INSERT INTO CONCEPTO(idconcepto,descripcion,precio)VALUES(18,'CERTIFICADO DE NEGATIVIDAD',10);
INSERT INTO CONCEPTO(idconcepto,descripcion,precio)VALUES(19,'DUPLICADO DE DIPLOMA DE GRADOS Y/O TITULO',1700);
INSERT INTO CONCEPTO(idconcepto,descripcion,precio)VALUES(20,'DIPLOMA DE GRADO - MAGISTER',550);
INSERT INTO CONCEPTO(idconcepto,descripcion,precio)VALUES(21,'DERECHOS DE BACHILLER',415);
INSERT INTO CONCEPTO(idconcepto,descripcion,precio)VALUES(22,'SUBSANACION DE CURSO',30);
INSERT INTO CONCEPTO(idconcepto,descripcion,precio)VALUES(23,'COSTO  DE INSCRIPCION MAESTRIA',170);
INSERT INTO CONCEPTO(idconcepto,descripcion,precio)VALUES(24,'CARPETA-DE POST. MAESTRIA Y/O DOCTORADO',30);
INSERT INTO CONCEPTO(idconcepto,descripcion,precio)VALUES(25,'CARPETA - TRAMITE GRADOS MAGIST',30);
INSERT INTO CONCEPTO(idconcepto,descripcion,precio)VALUES(26,'DERECHO DE DIPLOMA DE GRADO DE MAESTRO',550);
INSERT INTO CONCEPTO(idconcepto,descripcion,precio)VALUES(27,'INFORME DE PRACTICAS',10);
INSERT INTO CONCEPTO(idconcepto,descripcion,precio)VALUES(28,'TESIS',500);
INSERT INTO CONCEPTO(idconcepto,descripcion,precio)VALUES(29,'DERECHO DE SUSTENTACION',50);
INSERT INTO CONCEPTO(idconcepto,descripcion,precio)VALUES(30,'DERECHO DE TITULO',390);
INSERT INTO CONCEPTO(idconcepto,descripcion,precio)VALUES(31,'MATRICULA',60);
INSERT INTO CONCEPTO(idconcepto,descripcion,precio)VALUES(32,'RESERVA DE MATRICULA',50);
INSERT INTO CONCEPTO(idconcepto,descripcion,precio)VALUES(33,'RECIBO POR DERECHO DE TRAMITE',1);
INSERT INTO CONCEPTO(idconcepto,descripcion,precio)VALUES(34,'CONSTANCIA DE MATRICULA',30);

-------------------   RECIBO   ---------------------------

INSERT INTO RECIBO(idrecibo,fecha,importe,idcliente,idusuario)VALUES(1,to_date('20080106 16:27:48','YYYYMMDD HH24:MI:SS'),400,2,3);
INSERT INTO RECIBO(idrecibo,fecha,importe,idcliente,idusuario)VALUES(2,to_date('20180108 14:21:12','YYYYMMDD HH24:MI:SS'),152,4,2);
INSERT INTO RECIBO(idrecibo,fecha,importe,idcliente,idusuario)VALUES(3,to_date('20190105 13:15:30','YYYYMMDD HH24:MI:SS'),30,7,4);
INSERT INTO RECIBO(idrecibo,fecha,importe,idcliente,idusuario)VALUES(4,to_date('20090109 10:30:25','YYYYMMDD HH24:MI:SS'),16,2,5);
INSERT INTO RECIBO(idrecibo,fecha,importe,idcliente,idusuario)VALUES(5,to_date('20170111 12:45:12','YYYYMMDD HH24:MI:SS'),45,8,5);
INSERT INTO RECIBO(idrecibo,fecha,importe,idcliente,idusuario)VALUES(6,to_date('20170107 12:45:12','YYYYMMDD HH24:MI:SS'),76,4,4);
INSERT INTO RECIBO(idrecibo,fecha,importe,idcliente,idusuario)VALUES(7,to_date('20190105 13:27:48','YYYYMMDD HH24:MI:SS'),15,10,3);
INSERT INTO RECIBO(idrecibo,fecha,importe,idcliente,idusuario)VALUES(8,to_date('20190109 14:21:12','YYYYMMDD HH24:MI:SS'),432,2,2);
INSERT INTO RECIBO(idrecibo,fecha,importe,idcliente,idusuario)VALUES(9,to_date('20180111 13:15:30','YYYYMMDD HH24:MI:SS'),550,12,4);
INSERT INTO RECIBO(idrecibo,fecha,importe,idcliente,idusuario)VALUES(10,to_date('20180113 11:30:25','YYYYMMDD HH24:MI:SS'),170,15,5);
INSERT INTO RECIBO(idrecibo,fecha,importe,idcliente,idusuario)VALUES(11,to_date('20170110 09:45:12','YYYYMMDD HH24:MI:SS'),60,7,5);
INSERT INTO RECIBO(idrecibo,fecha,importe,idcliente,idusuario)VALUES(12,to_date('20160105 12:45:12','YYYYMMDD HH24:MI:SS'),0,12,4);
INSERT INTO RECIBO(idrecibo,fecha,importe,idcliente,idusuario)VALUES(13,to_date('20160106 09:27:48','YYYYMMDD HH24:MI:SS'),150,13,3);
INSERT INTO RECIBO(idrecibo,fecha,importe,idcliente,idusuario)VALUES(14,to_date('20160109 14:21:12','YYYYMMDD HH24:MI:SS'),60,15,4);
INSERT INTO RECIBO(idrecibo,fecha,importe,idcliente,idusuario)VALUES(15,to_date('20160101 08:15:30','YYYYMMDD HH24:MI:SS'),63,16,4);
INSERT INTO RECIBO(idrecibo,fecha,importe,idcliente,idusuario)VALUES(16,to_date('20180103 10:30:25','YYYYMMDD HH24:MI:SS'),60,10,3);
INSERT INTO RECIBO(idrecibo,fecha,importe,idcliente,idusuario)VALUES(17,to_date('20180111 08:45:12','YYYYMMDD HH24:MI:SS'),550,17,5);
INSERT INTO RECIBO(idrecibo,fecha,importe,idcliente,idusuario)VALUES(18,to_date('20190112 12:45:12','YYYYMMDD HH24:MI:SS'),50,18,4);
INSERT INTO RECIBO(idrecibo,fecha,importe,idcliente,idusuario)VALUES(19,to_date('20190106 07:27:48','YYYYMMDD HH24:MI:SS'),50,19,5);
INSERT INTO RECIBO(idrecibo,fecha,importe,idcliente,idusuario)VALUES(20,to_date('20180103 14:21:12','YYYYMMDD HH24:MI:SS'),62,20,4);
INSERT INTO RECIBO(idrecibo,fecha,importe,idcliente,idusuario)VALUES(21,to_date('20190112 08:15:30','YYYYMMDD HH24:MI:SS'),430,18,3);
INSERT INTO RECIBO(idrecibo,fecha,importe,idcliente,idusuario)VALUES(22,to_date('20180111 10:30:25','YYYYMMDD HH24:MI:SS'),550,12,5);
INSERT INTO RECIBO(idrecibo,fecha,importe,idcliente,idusuario)VALUES(23,to_date('20080110 06:45:12','YYYYMMDD HH24:MI:SS'),1,23,3);
INSERT INTO RECIBO(idrecibo,fecha,importe,idcliente,idusuario)VALUES(24,to_date('20090101 12:45:12','YYYYMMDD HH24:MI:SS'),30,21,3);

-------------------   RECIBO DETALLE  ---------------------------

INSERT INTO RECIBODETALLE(idrecibodetalle,cantidad,precio,idrecibo,idconcepto,idescuela)VALUES(1,1,400,1,3,1);
INSERT INTO RECIBODETALLE(idrecibodetalle,cantidad,precio,idrecibo,idconcepto,idescuela)VALUES(2,2,2,2,33,13);
INSERT INTO RECIBODETALLE(idrecibodetalle,cantidad,precio,idrecibo,idconcepto,idescuela)VALUES(3,1,150,2,9,13);
INSERT INTO RECIBODETALLE(idrecibodetalle,cantidad,precio,idrecibo,idconcepto,idescuela)VALUES(4,1,30,3,10,49);
INSERT INTO RECIBODETALLE(idrecibodetalle,cantidad,precio,idrecibo,idconcepto,idescuela)VALUES(5,1,1,4,33,20);
INSERT INTO RECIBODETALLE(idrecibodetalle,cantidad,precio,idrecibo,idconcepto,idescuela)VALUES(6,1,15,4,14,20);
INSERT INTO RECIBODETALLE(idrecibodetalle,cantidad,precio,idrecibo,idconcepto,idescuela)VALUES(7,1,30,5,10,1);
INSERT INTO RECIBODETALLE(idrecibodetalle,cantidad,precio,idrecibo,idconcepto,idescuela)VALUES(8,1,15,5,12,1);
INSERT INTO RECIBODETALLE(idrecibodetalle,cantidad,precio,idrecibo,idconcepto,idescuela)VALUES(9,2,60,6,34,10);
INSERT INTO RECIBODETALLE(idrecibodetalle,cantidad,precio,idrecibo,idconcepto,idescuela)VALUES(10,1,16,6,1,10);
INSERT INTO RECIBODETALLE(idrecibodetalle,cantidad,precio,idrecibo,idconcepto,idescuela)VALUES(11,1,15,7,14,14);
INSERT INTO RECIBODETALLE(idrecibodetalle,cantidad,precio,idrecibo,idconcepto,idescuela)VALUES(12,1,430,8,7,61);
INSERT INTO RECIBODETALLE(idrecibodetalle,cantidad,precio,idrecibo,idconcepto,idescuela)VALUES(13,2,2,8,33,61);
INSERT INTO RECIBODETALLE(idrecibodetalle,cantidad,precio,idrecibo,idconcepto,idescuela)VALUES(14,1,550,9,26,64);
INSERT INTO RECIBODETALLE(idrecibodetalle,cantidad,precio,idrecibo,idconcepto,idescuela)VALUES(15,1,170,10,23,75);
INSERT INTO RECIBODETALLE(idrecibodetalle,cantidad,precio,idrecibo,idconcepto,idescuela)VALUES(16,1,60,11,31,58);
INSERT INTO RECIBODETALLE(idrecibodetalle,cantidad,precio,idrecibo,idconcepto,idescuela)VALUES(17,1,150,13,9,7 );
INSERT INTO RECIBODETALLE(idrecibodetalle,cantidad,precio,idrecibo,idconcepto,idescuela)VALUES(18,1,60,14,31,12);
INSERT INTO RECIBODETALLE(idrecibodetalle,cantidad,precio,idrecibo,idconcepto,idescuela)VALUES(19,1,60,15,31,11);
INSERT INTO RECIBODETALLE(idrecibodetalle,cantidad,precio,idrecibo,idconcepto,idescuela)VALUES(20,3,3,15,33,2 );
INSERT INTO RECIBODETALLE(idrecibodetalle,cantidad,precio,idrecibo,idconcepto,idescuela)VALUES(21,2,60,16,34,20);
INSERT INTO RECIBODETALLE(idrecibodetalle,cantidad,precio,idrecibo,idconcepto,idescuela)VALUES(22,1,550,17,26,68);
INSERT INTO RECIBODETALLE(idrecibodetalle,cantidad,precio,idrecibo,idconcepto,idescuela)VALUES(23,1,50,18,32,44);
INSERT INTO RECIBODETALLE(idrecibodetalle,cantidad,precio,idrecibo,idconcepto,idescuela)VALUES(24,1,50,19,32,7 );
INSERT INTO RECIBODETALLE(idrecibodetalle,cantidad,precio,idrecibo,idconcepto,idescuela)VALUES(25,1,60,20,31,13);
INSERT INTO RECIBODETALLE(idrecibodetalle,cantidad,precio,idrecibo,idconcepto,idescuela)VALUES(26,2,2,20,33,13);
INSERT INTO RECIBODETALLE(idrecibodetalle,cantidad,precio,idrecibo,idconcepto,idescuela)VALUES(27,1,430,21,7,64);
INSERT INTO RECIBODETALLE(idrecibodetalle,cantidad,precio,idrecibo,idconcepto,idescuela)VALUES(28,1,550,22,26,64);
INSERT INTO RECIBODETALLE(idrecibodetalle,cantidad,precio,idrecibo,idconcepto,idescuela)VALUES(29,1,1,23,33,8 );
INSERT INTO RECIBODETALLE(idrecibodetalle,cantidad,precio,idrecibo,idconcepto,idescuela)VALUES(30,1,30,24,10,10);

commit;
