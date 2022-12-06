create schema practica_modelado authorization oodhuafv;

--- tabla currency
create table practica_modelado.currency(
	idcurrency varchar (10) not null, -- primary key
	nombre  varchar (200) not null
);

alter table practica_modelado.currency
add constraint idcurrency_PK primary key (idcurrency);

--- tabla aseguradora

create table practica_modelado.aseguradora(
	idaseguradora varchar (10) not null, -- primary key
	nombre  varchar (200) not null
); 

alter table practica_modelado.aseguradora
add constraint idaseguradora_PK primary key (idaseguradora);

--- tabla tipo de poliza
create table practica_modelado.type_policy(
	idtype_policy varchar (10) not null, -- primary key
	nombre  varchar (200) not null
);

alter table practica_modelado.type_policy
add constraint idtype_policy_PK primary key (idtype_policy);

--- tabla poliza
create table practica_modelado.poliza(
	idpolicy varchar (10) not null, -- primary key
	policy_number varchar (200) not null, 
	idaseguradora varchar (10) not null, --foreign key
	idtype_policy varchar (10) not null, -- foreign key
	description varchar (200) not null
);

alter table practica_modelado.poliza
add constraint idpolicy_PK primary key (idpolicy);

-- FOREIGN KEYS DE POLIZA
alter table practica_modelado.poliza
add constraint poliza_idaseguradora_FK foreign key (idaseguradora)
references practica_modelado.aseguradora(idaseguradora);

alter table practica_modelado.poliza
add constraint idtype_policy_FK foreign key (idtype_policy)
references practica_modelado.type_policy(idtype_policy);

--- tabla de grupo empresarial
create table practica_modelado.grupoEmp(
	idgrupo varchar (10) not null, --primary key
	nombre varchar (200) not null
);

 alter table practica_modelado.grupoEmp
 add constraint idgrupo_PK primary key (idgrupo);
 

--- tabla de modelo
create table practica_modelado.modelo(
	idmodelo varchar (10) not null, --primary key
	modelo varchar (200) not null,
	marca varchar (200) not null,
	idgrupo varchar (10) not null --foreign key
);

 alter table practica_modelado.modelo
 add constraint idmodelo_PK primary key (idmodelo);

-- foreign key de Modelo
alter table practica_modelado.modelo
add constraint idgrupo_FK foreign key (idgrupo)
references practica_modelado.grupoEmp(idgrupo);
 
--- tabla de coche
create table practica_modelado.coche(
	idcoche varchar(10) not null,--- primary key
	idmodelo varchar (10) not null, --- Foregin Key
	color varchar (20) not null,
	matricula varchar (20) not null,
	idpolicy varchar (20) not null,--  foreign key MIRARRR
	actual_kilometers varchar(100) not null,
	dt_purchase date not null default '4000-01-01',
	importe integer not null,
	idcurrency varchar (10) not null--- Foreign Key
);
 alter table practica_modelado.coche
 add constraint idcoche_PK primary key (idcoche);


--- tabla revisiones

create table practica_modelado.revisiones(
	idrevision varchar (10) not null,-- primary key
	idcoche varchar (10) not null, -- foreign key 
	kilometers integer not null,
	dt_revi date not null default '4000-01-01',
	idpolicy varchar (10) not null,-- foreign key
	descripcion varchar (200) null
	
);

alter table practica_modelado.revisiones
add constraint idrevision_PK primary key (idrevision); -- pk-fk


--- FOREIGN KEYS

-- Foreign keys de coche
--idmodelo
alter table practica_modelado.coche
add constraint idmodelo_FK foreign key (idmodelo)
references practica_modelado.modelo(idmodelo);

--idcurrency
alter table practica_modelado.coche
add constraint idcurrency_FK foreign key (idcurrency)
references practica_modelado.currency(idcurrency);

--idpolicy
alter table practica_modelado.coche
add constraint idpolicy_FK foreign key (idpolicy)
references practica_modelado.poliza(idpolicy);

-- Foreign keys de revisiones
alter table practica_modelado.revisiones
add constraint idcoche_FK foreign key (idcoche)
references practica_modelado.coche(idcoche);

alter table practica_modelado.revisiones
add constraint idpolicy_FK foreign key (idpolicy)
references practica_modelado.poliza(idpolicy);



--- CARGAR DATOS.
---carga de datos de grupoEmp
insert into practica_modelado.grupoEmp (idgrupo, nombre) values('10','Renault-Nissan');
insert into practica_modelado.grupoEmp (idgrupo, nombre) values('11','Toyota');
insert into practica_modelado.grupoEmp (idgrupo, nombre) values('12','Volkswagen');
insert into practica_modelado.grupoEmp (idgrupo, nombre) values('13','PSA');






--carga de datos de currency
insert into practica_modelado.currency (idcurrency, nombre) values('6001','EURO');
insert into practica_modelado.currency (idcurrency, nombre) values('6002','DOLARES');
insert into practica_modelado.currency (idcurrency, nombre) values('6003','PESOS');
insert into practica_modelado.currency (idcurrency, nombre) values('6004','YENES');


-- carga de datos de aseguradora
insert into practica_modelado.aseguradora (idaseguradora, nombre) values('4004','Mapfre');
insert into practica_modelado.aseguradora (idaseguradora, nombre) values('4005','Quality Autos');
insert into practica_modelado.aseguradora (idaseguradora, nombre) values('4006','Atlantis');
insert into practica_modelado.aseguradora (idaseguradora, nombre) values('4007','Penelo');

--- carga de datos de type_policy
insert into practica_modelado.type_policy (idtype_policy, nombre) values('7001','A TERECEROS ');
insert into practica_modelado.type_policy (idtype_policy, nombre) values('7002','A TERCEROS AMPLIADA');
insert into practica_modelado.type_policy (idtype_policy, nombre) values('7003','A TODO RIESGO');


-- 

-- carga de datos de tabla modelo
insert into practica_modelado.modelo (idmodelo, modelo, marca, idgrupo) values( '1001','Pulsar','Nissan','10');
insert into practica_modelado.modelo (idmodelo, modelo, marca, idgrupo) values( '1002','Twingo','Renault','10');
insert into practica_modelado.modelo (idmodelo, modelo, marca, idgrupo) values( '1003','Dokker','Dacia ','10');
insert into practica_modelado.modelo (idmodelo, modelo, marca, idgrupo) values( '1004','Yaris','Toyota','11');
insert into practica_modelado.modelo (idmodelo, modelo, marca, idgrupo) values( '1005','Lexus NX','Lexus','11');
insert into practica_modelado.modelo (idmodelo, modelo, marca, idgrupo) values( '1006','Audi A3','Audi','12');
insert into practica_modelado.modelo (idmodelo, modelo, marca, idgrupo) values( '1007','Ibiza','Seat','12');
insert into practica_modelado.modelo (idmodelo, modelo, marca, idgrupo) values( '1008','Toledo','Seat','12');
insert into practica_modelado.modelo (idmodelo, modelo, marca, idgrupo) values( '1009','Leon','Seat','12');
insert into practica_modelado.modelo (idmodelo, modelo, marca, idgrupo) values( '1010','Fabia','Skoda','12');
insert into practica_modelado.modelo (idmodelo, modelo, marca, idgrupo) values( '1011','Caravelle','Volkswagen','12');
insert into practica_modelado.modelo (idmodelo, modelo, marca, idgrupo) values( '1012','Golf','Volkswagen','12');
insert into practica_modelado.modelo (idmodelo, modelo, marca, idgrupo) values( '1013','Golf Variant','Volkswagen','12');
insert into practica_modelado.modelo (idmodelo, modelo, marca, idgrupo) values( '1014','Tiguan','Volkswagen','12');
insert into practica_modelado.modelo (idmodelo, modelo, marca, idgrupo) values( '1015','C4 Picasso','Citroën','13');
insert into practica_modelado.modelo (idmodelo, modelo, marca, idgrupo) values( '1016','Berlingo','Citroën','13');
insert into practica_modelado.modelo (idmodelo, modelo, marca, idgrupo) values( '1017','e-208','Peugeot','13');
insert into practica_modelado.modelo (idmodelo, modelo, marca, idgrupo) values( '1018','Rifter','Peugeot','13');
insert into practica_modelado.modelo (idmodelo, modelo, marca, idgrupo) values( '1019','Corsa','Opel','13');
insert into practica_modelado.modelo (idmodelo, modelo, marca, idgrupo) values( '1020','Astra','Opel','13');

-- carga de datos de poliza*
insert into practica_modelado.poliza (idpolicy, policy_number, idaseguradora ,idtype_policy, description) values('5001','589661','4004','7003',' ');
insert into practica_modelado.poliza (idpolicy, policy_number, idaseguradora ,idtype_policy, description) values('5002','589662','4005','7001',' ');
insert into practica_modelado.poliza (idpolicy, policy_number, idaseguradora ,idtype_policy, description) values('5003','589663','4006','7002',' ');
insert into practica_modelado.poliza (idpolicy, policy_number, idaseguradora ,idtype_policy, description) values('5004','589664','4006','7002',' ');
insert into practica_modelado.poliza (idpolicy, policy_number, idaseguradora ,idtype_policy, description) values('5005','589665','4004','7003',' ');
insert into practica_modelado.poliza (idpolicy, policy_number, idaseguradora ,idtype_policy, description) values('5006','589666','4007','7002',' ');
insert into practica_modelado.poliza (idpolicy, policy_number, idaseguradora ,idtype_policy, description) values('5007','589667','4005','7001',' ');
insert into practica_modelado.poliza (idpolicy, policy_number, idaseguradora ,idtype_policy, description) values('5008','589668','4005','7001',' ');
insert into practica_modelado.poliza (idpolicy, policy_number, idaseguradora ,idtype_policy, description) values('5009','300250','4007','7002',' ');
insert into practica_modelado.poliza (idpolicy, policy_number, idaseguradora ,idtype_policy, description) values('5010','300251','4007','7002',' ');
insert into practica_modelado.poliza (idpolicy, policy_number, idaseguradora ,idtype_policy, description) values('5011','300252','4004','7003',' ');
insert into practica_modelado.poliza (idpolicy, policy_number, idaseguradora ,idtype_policy, description) values('5012','300253','4006','7002',' ');
insert into practica_modelado.poliza (idpolicy, policy_number, idaseguradora ,idtype_policy, description) values('5013','300254','4005','7002',' ');
insert into practica_modelado.poliza (idpolicy, policy_number, idaseguradora ,idtype_policy, description) values('5014','589674','4004','7003',' ');
insert into practica_modelado.poliza (idpolicy, policy_number, idaseguradora ,idtype_policy, description) values('5015','589675','4005','7002',' ');
insert into practica_modelado.poliza (idpolicy, policy_number, idaseguradora ,idtype_policy, description) values('5016','589676','4005','7002',' ');
insert into practica_modelado.poliza (idpolicy, policy_number, idaseguradora ,idtype_policy, description) values('5017','589677','4004','7003',' ');
insert into practica_modelado.poliza (idpolicy, policy_number, idaseguradora ,idtype_policy, description) values('5018','589678','4005','7002',' ');
insert into practica_modelado.poliza (idpolicy, policy_number, idaseguradora ,idtype_policy, description) values('5019','589679','4004','7002',' ');
insert into practica_modelado.poliza (idpolicy, policy_number, idaseguradora ,idtype_policy, description) values('5020','589680','4004','7003',' ');



--carga de datos de coche*
insert into practica_modelado.coche(idcoche, idmodelo, color, matricula, idpolicy, actual_kilometers, dt_purchase, importe, idcurrency) values ('3001','1001','AZUL','GR56584','5001','100000','2021-04-30','25000','6001' );
insert into practica_modelado.coche(idcoche, idmodelo, color, matricula, idpolicy, actual_kilometers, dt_purchase, importe, idcurrency) values ('3002','1002','AZUL','SD56585','5002','100568','2021-04-30','15000','6002' );
insert into practica_modelado.coche(idcoche, idmodelo, color, matricula, idpolicy, actual_kilometers, dt_purchase, importe, idcurrency) values ('3003','1003','NEGRO','SD56586','5003','100000','2021-04-30','18000','6003' );
insert into practica_modelado.coche(idcoche, idmodelo, color, matricula, idpolicy, actual_kilometers, dt_purchase, importe, idcurrency) values ('3004','1004','NEGRO','ER56587','5004','100570','2021-04-30','18000','6001' );
insert into practica_modelado.coche(idcoche, idmodelo, color, matricula, idpolicy, actual_kilometers, dt_purchase, importe, idcurrency) values ('3005','1005','NEGRO','SD56588','5005','100500','2021-05-15','25000','6001' );
insert into practica_modelado.coche(idcoche, idmodelo, color, matricula, idpolicy, actual_kilometers, dt_purchase, importe, idcurrency) values ('3006','1006','NEGRO','AS89656','5006','147850','2021-05-15','19000','6002' );
insert into practica_modelado.coche(idcoche, idmodelo, color, matricula, idpolicy, actual_kilometers, dt_purchase, importe, idcurrency) values ('3007','1007','NEGRO','ZX89657','5007','100573','2021-05-15','17000','6002' );
insert into practica_modelado.coche(idcoche, idmodelo, color, matricula, idpolicy, actual_kilometers, dt_purchase, importe, idcurrency) values ('3008','1008','NEGRO','AS89658','5008','125200','2021-05-15','17000','6004' );
insert into practica_modelado.coche(idcoche, idmodelo, color, matricula, idpolicy, actual_kilometers, dt_purchase, importe, idcurrency) values ('3009','1009','NEGRO','TG89659','5009','125200','2021-05-15','19500','6004' );
insert into practica_modelado.coche(idcoche, idmodelo, color, matricula, idpolicy, actual_kilometers, dt_purchase, importe, idcurrency) values ('3010','1010','NEGRO','GT89660','5010','100000','2021-09-26','19500','6001' );
insert into practica_modelado.coche(idcoche, idmodelo, color, matricula, idpolicy, actual_kilometers, dt_purchase, importe, idcurrency) values ('3011','1011','NEGRO','HT89661','5011','100000','2021-09-26','25000','6001' );
insert into practica_modelado.coche(idcoche, idmodelo, color, matricula, idpolicy, actual_kilometers, dt_purchase, importe, idcurrency) values ('3012','1012','NEGRO','JK96633','5012','100000','2021-09-26','18500','6001' );
insert into practica_modelado.coche(idcoche, idmodelo, color, matricula, idpolicy, actual_kilometers, dt_purchase, importe, idcurrency) values ('3013','1013','PLATINO','JK96634','5013','125200','2021-09-26','18500','6004' );
insert into practica_modelado.coche(idcoche, idmodelo, color, matricula, idpolicy, actual_kilometers, dt_purchase, importe, idcurrency) values ('3014','1014','PLATINO','TG89659','5014','125200','2021-10-01','25000','6004' );
insert into practica_modelado.coche(idcoche, idmodelo, color, matricula, idpolicy, actual_kilometers, dt_purchase, importe, idcurrency) values ('3015','1015','PLATINO','TY96636','5015','147850','2021-10-01','18000','6004' );
insert into practica_modelado.coche(idcoche, idmodelo, color, matricula, idpolicy, actual_kilometers, dt_purchase, importe, idcurrency) values ('3016','1016','PLATINO','HJ96637','5016','100500','2021-10-01','19500','6003' );
insert into practica_modelado.coche(idcoche, idmodelo, color, matricula, idpolicy, actual_kilometers, dt_purchase, importe, idcurrency) values ('3017','1017','PLATINO','JK22364','5017','100500','2022-02-28','25000','6001' );
insert into practica_modelado.coche(idcoche, idmodelo, color, matricula, idpolicy, actual_kilometers, dt_purchase, importe, idcurrency) values ('3018','1018','PLATINO','SE22365','5018','147850','2022-02-28','18000','6001' );
insert into practica_modelado.coche(idcoche, idmodelo, color, matricula, idpolicy, actual_kilometers, dt_purchase, importe, idcurrency) values ('3019','1019','PLATINO','SD22366','5019','100500','2022-02-28','21500','6001' );
insert into practica_modelado.coche(idcoche, idmodelo, color, matricula, idpolicy, actual_kilometers, dt_purchase, importe, idcurrency) values ('3020','1020','PLATINO','GH22367','5020','147850','2022-02-28','20000','6001' );

--carga de datos de revisiones*
insert into practica_modelado.revisiones(idrevision, idcoche, kilometers,dt_revi,idpolicy,descripcion) values ('2001','3001','80000','2022-06-30','5001',' ' );
insert into practica_modelado.revisiones(idrevision, idcoche, kilometers,dt_revi,idpolicy,descripcion) values ('2002','3002','85000','2022-07-01','5002',' ' );
insert into practica_modelado.revisiones(idrevision, idcoche, kilometers,dt_revi,idpolicy,descripcion) values ('2003','3003','100000','2022-07-02','5003',' ' );
insert into practica_modelado.revisiones(idrevision, idcoche, kilometers,dt_revi,idpolicy,descripcion) values ('2004','3004','100570','2022-07-02','5004',' ' );
insert into practica_modelado.revisiones(idrevision, idcoche, kilometers,dt_revi,idpolicy,descripcion) values ('2005','3005','80000','2022-07-02','5005',' ' );
insert into practica_modelado.revisiones(idrevision, idcoche, kilometers,dt_revi,idpolicy,descripcion) values ('2006','3006','80850','2022-07-03','5006',' ' );
insert into practica_modelado.revisiones(idrevision, idcoche, kilometers,dt_revi,idpolicy,descripcion) values ('2007','3007','85000','2022-07-03','5007',' ' );
insert into practica_modelado.revisiones(idrevision, idcoche, kilometers,dt_revi,idpolicy,descripcion) values ('2008','3008','85000','2022-07-03','5008',' ' );
insert into practica_modelado.revisiones(idrevision, idcoche, kilometers,dt_revi,idpolicy,descripcion) values ('2009','3009','125200','2022-07-03','5009',' ' );
insert into practica_modelado.revisiones(idrevision, idcoche, kilometers,dt_revi,idpolicy,descripcion) values ('2010','3010','100000','2022-07-04','5010',' ' );
insert into practica_modelado.revisiones(idrevision, idcoche, kilometers,dt_revi,idpolicy,descripcion) values ('2011','3011','80000','2022-07-04','5011',' ' );
insert into practica_modelado.revisiones(idrevision, idcoche, kilometers,dt_revi,idpolicy,descripcion) values ('2012','3012','80000','2022-07-05','5012',' ' );
insert into practica_modelado.revisiones(idrevision, idcoche, kilometers,dt_revi,idpolicy,descripcion) values ('2013','3013','20200','2022-07-05','5013',' ' );
insert into practica_modelado.revisiones(idrevision, idcoche, kilometers,dt_revi,idpolicy,descripcion) values ('2014','3014','80000','2022-07-06','5014',' ' );
insert into practica_modelado.revisiones(idrevision, idcoche, kilometers,dt_revi,idpolicy,descripcion) values ('2015','3015','147850','2022-07-06','5015',' ' );
insert into practica_modelado.revisiones(idrevision, idcoche, kilometers,dt_revi,idpolicy,descripcion) values ('2016','3016','100500','2022-07-06','5016',' ' );
insert into practica_modelado.revisiones(idrevision, idcoche, kilometers,dt_revi,idpolicy,descripcion) values ('2017','3017','80000','2022-07-06','5017',' ' );
insert into practica_modelado.revisiones(idrevision, idcoche, kilometers,dt_revi,idpolicy,descripcion) values ('2018','3018','75000','2022-07-07','5018',' ' );
insert into practica_modelado.revisiones(idrevision, idcoche, kilometers,dt_revi,idpolicy,descripcion) values ('2019','3019','90500','2022-07-07','5019',' ' );
insert into practica_modelado.revisiones(idrevision, idcoche, kilometers,dt_revi,idpolicy,descripcion) values ('2020','3020','750000','2022-07-07','5020',' ' );
insert into practica_modelado.revisiones(idrevision, idcoche, kilometers,dt_revi,idpolicy,descripcion) values ('2021','3001','100000','2022-12-02','5001',' ' );
insert into practica_modelado.revisiones(idrevision, idcoche, kilometers,dt_revi,idpolicy,descripcion) values ('2022','3005','100500','2022-12-02','5005',' ' );
insert into practica_modelado.revisiones(idrevision, idcoche, kilometers,dt_revi,idpolicy,descripcion) values ('2023','3011','100000','2022-12-05','5011',' ' );
insert into practica_modelado.revisiones(idrevision, idcoche, kilometers,dt_revi,idpolicy,descripcion) values ('2024','3014','125200','2022-12-05','5014',' ' );
insert into practica_modelado.revisiones(idrevision, idcoche, kilometers,dt_revi,idpolicy,descripcion) values ('2025','3017','100500','2022-12-05','5017',' ' );
insert into practica_modelado.revisiones(idrevision, idcoche, kilometers,dt_revi,idpolicy,descripcion) values ('2026','3002','100568','2022-12-05','5002',' ' );
insert into practica_modelado.revisiones(idrevision, idcoche, kilometers,dt_revi,idpolicy,descripcion) values ('2027','3007','100573','2022-12-05','5007',' ' );
insert into practica_modelado.revisiones(idrevision, idcoche, kilometers,dt_revi,idpolicy,descripcion) values ('2028','3008','125200','2022-12-05','5008',' ' );

