--CREACION DE ESQUEMA

create schema elvisramirez authorization sinucdvh;


-------------------------------------
----*********************************
-------------------------------------

---CREAR TABLA TIPO MONEDA

create table elvisramirez.TipoMoneda (
	IdTipoMoneda integer not null, --- PK
	NombreMoneda varchar(50) not null,
	Estado integer not null,
	
	
--- DEFINIMOS PK DE TABLA TIPO MONEDA
	constraint TipoMoneda_PK primary key (IdTipoMoneda)
);


-------------------------------------
----*********************************
-------------------------------------


---CREAR TABLA MODELO COCHE

create table elvisramirez.ModeloCoche (
	IdModeloCoche integer not null, --- PK
	NombreModeloCoche varchar(50) not null,
	Estado integer not null,
	
	
--- DEFINIMOS PK DE TABLA MODELO COCHE
	constraint ModeloCoche_PK primary key (IdModeloCoche)
);




-------------------------------------
----*********************************
-------------------------------------

---CREAR TABLA ASEGURADORA

create table elvisramirez.Aseguradora (
	IdAseguradora integer not null, --- PK
	NombreAseguradora varchar(50) not null,
	Estado integer not null,
	
	
--- DEFINIMOS PK DE TABLA ASEGURADORA
	constraint Aseguradora_PK primary key (IdAseguradora)
);


-------------------------------------
----*********************************
-------------------------------------

---CREAR TABLA GRUPO EMPRESARIAL

create table elvisramirez.GrupoEmpresarial (
	IdGpoEmpresarial integer not null, --- PK
	NombreGrupoEmpresarial varchar(50) not null,
	Estado integer not null,
	
	
--- DEFINIMOS PK DE TABLA GRUPO EMPRESARIAL
	constraint GrupoEmpresarial_PK primary key (IdGpoEmpresarial)
);



-------------------------------------
----*********************************
-------------------------------------

---CREAR TABLA ESTADOS COCHES

create table elvisramirez.EstadosCoches (
	IdEstado integer not null, --- PK
	NombreEstado varchar(20) not null,
		
	
--- DEFINIMOS PK DE TABLA TIPO MONEDA
	constraint EstadosCoches_PK primary key (IdEstado)
);


-------------------------------------
----*********************************
-------------------------------------

---CREAR TABLA MARCAS COCHE

create table elvisramirez.MarcasCoche (
	IdMarcaCoche integer not null, --- PK
	NombreMarcaCoche varchar(50) not null,
	IdGpoEmpresarial integer not null,
	Estado integer not null,
	
	
--- DEFINIMOS PK DE TABLA TIPO MONEDA
	constraint MarcasCoche_PK primary key (IdMarcaCoche)
);



alter table elvisramirez.MarcasCoche add constraint MarcaCoches_GrupoEmpresarial_FK foreign key (IdGpoEmpresarial) references elvisramirez.GrupoEmpresarial(IdGpoEmpresarial);
-------------------------------------
----*********************************
-------------------------------------

---CREAR TABLA COLORES COCHES

create table elvisramirez.ColoresCoches (
	IdColor integer not null, --- PK
	NombreColor varchar(50) not null,
	Estado integer not null,
	
	
--- DEFINIMOS PK DE TABLA COLORES COCHES
	constraint ColoresCoches_PK primary key (IdColor)
);






-------------------------------------
----*********************************
-------------------------------------

---CREAR TABLA COCHES



create table elvisramirez.Coches (
	IdCoche integer not null, --- PK
	Matricula varchar(50) not null,
	FechadeCompra date not null,
	Poliza varchar(50) not null,
	IdColor integer not null,
	IdEstado integer not null,
	IdModeloCoche integer not null,
	IdMarcaCoche integer not null,
	IdAseguradora integer not null,
	
	
	
--- DEFINIMOS PK DE TABLA COCHES
	constraint coches_PK primary key (IdCoche)
);

alter table elvisramirez.Coches add constraint Coches_Color_FK foreign key (IdColor) references elvisramirez.ColoresCoches(IdColor);
alter table elvisramirez.Coches add constraint Coches_Estado_FK foreign key (IdEstado) references elvisramirez.EstadosCoches(IdEstado);
alter table elvisramirez.Coches add constraint Coches_Modelo_FK foreign key (IdModeloCoche) references elvisramirez.ModeloCoche(IdModeloCoche);
alter table elvisramirez.Coches add constraint Coches_Marca_FK foreign key (IdMarcaCoche) references elvisramirez.MarcasCoche(IdMarcaCoche);
alter table elvisramirez.Coches add constraint Coches_Aseguradora_FK foreign key (IdAseguradora) references elvisramirez.Aseguradora(IdAseguradora);



-------------------------------------
----*********************************
-------------------------------------

---CREAR TABLA REVISIONES



create table elvisramirez.Revisiones (
	IdRevision integer not null, --- PK
	IdCoche integer not null,
	IdTipoMoneda integer not null,
	FechadeRevision date not null,
	Importe numeric(18,2) not null,
	KmsAlRevisar integer not null,
	Estado integer not null,
	
	
--- DEFINIMOS PK DE TABLA REVISIONES
	constraint Revisiones_PK primary key (IdRevision)
);


alter table elvisramirez.Revisiones add constraint Revisiones_Coche_FK foreign key (IdCoche) references elvisramirez.Coches(IdCoche);
alter table elvisramirez.Revisiones add constraint Revisiones_TipoMoneda_FK foreign key (IdTipoMoneda) references elvisramirez.TipoMoneda(IdTipoMoneda);


--*****INSERT A LAS TABLAS
insert into elvisramirez.tipomoneda (IdTipoMoneda, NombreMoneda, Estado) values (1,'€', 1);
insert into elvisramirez.tipomoneda (IdTipoMoneda, NombreMoneda, Estado) values (2,'$', 1);

insert into elvisramirez.ModeloCoche (IdModeloCoche, NombreModeloCoche, Estado) values (1, 'Sedan', 1);
insert into elvisramirez.ModeloCoche (IdModeloCoche, NombreModeloCoche, Estado) values (2, 'SUV', 1);
insert into elvisramirez.ModeloCoche (IdModeloCoche, NombreModeloCoche, Estado) values (3, 'PickUp', 1);
insert into elvisramirez.ModeloCoche (IdModeloCoche, NombreModeloCoche, Estado) values (4, 'Wagon', 1);
insert into elvisramirez.ModeloCoche (IdModeloCoche, NombreModeloCoche, Estado) values (5, 'Crossover', 1);

insert into elvisramirez.grupoempresarial (IdGpoEmpresarial, NombreGrupoEmpresarial, Estado) values (1,'BMW Group',1);
insert into elvisramirez.grupoempresarial (IdGpoEmpresarial, NombreGrupoEmpresarial, Estado) values (2,'Daimler',1);
insert into elvisramirez.grupoempresarial (IdGpoEmpresarial, NombreGrupoEmpresarial, Estado) values (3,'FCA',1);
insert into elvisramirez.grupoempresarial (IdGpoEmpresarial, NombreGrupoEmpresarial, Estado) values (4,'PSA',1);
insert into elvisramirez.grupoempresarial (IdGpoEmpresarial, NombreGrupoEmpresarial, Estado) values (5,'Toyota',1);
insert into elvisramirez.grupoempresarial (IdGpoEmpresarial, NombreGrupoEmpresarial, Estado) values (6,'Volkswagen',1);
insert into elvisramirez.grupoempresarial (IdGpoEmpresarial, NombreGrupoEmpresarial, Estado) values (7,'Renault Nissan',1);


insert into elvisramirez.marcascoche (IdMarcaCoche, NombreMarcaCoche, IdGpoEmpresarial, Estado) values (1, 'Volkswagen',6, 1);
insert into elvisramirez.marcascoche (IdMarcaCoche, NombreMarcaCoche, IdGpoEmpresarial,Estado) values (2, 'Renault',7, 1);
insert into elvisramirez.marcascoche (IdMarcaCoche, NombreMarcaCoche, IdGpoEmpresarial,Estado) values (3, 'Seat',6, 1);
insert into elvisramirez.marcascoche (IdMarcaCoche, NombreMarcaCoche, IdGpoEmpresarial,Estado) values (4, 'Peugeot',4, 1);
insert into elvisramirez.marcascoche (IdMarcaCoche, NombreMarcaCoche, IdGpoEmpresarial,Estado) values (5, 'skoda',6, 1);
insert into elvisramirez.marcascoche (IdMarcaCoche, NombreMarcaCoche, IdGpoEmpresarial,Estado) values (6, 'Mercedes',2, 1);
insert into elvisramirez.marcascoche (IdMarcaCoche, NombreMarcaCoche, IdGpoEmpresarial,Estado) values (7, 'Bmw',1, 1);
insert into elvisramirez.marcascoche (IdMarcaCoche, NombreMarcaCoche, IdGpoEmpresarial,Estado) values (8, 'Fiat',3, 1);
insert into elvisramirez.marcascoche (IdMarcaCoche, NombreMarcaCoche, IdGpoEmpresarial,Estado) values (9, 'Toyota',5, 1);
insert into elvisramirez.marcascoche (IdMarcaCoche, NombreMarcaCoche, IdGpoEmpresarial,Estado) values (10, 'Audi',6, 1);

insert into elvisramirez.Aseguradora(IdAseguradora,NombreAseguradora,  Estado) values (1, 'Mapfre', 1) ;
insert into elvisramirez.Aseguradora(IdAseguradora,NombreAseguradora,  Estado) values (2, 'MMT', 1) ;
insert into elvisramirez.Aseguradora(IdAseguradora,NombreAseguradora,  Estado) values (3, 'AXA', 1) ;
insert into elvisramirez.Aseguradora(IdAseguradora,NombreAseguradora,  Estado) values (4, 'Allianz', 1) ;
insert into elvisramirez.Aseguradora(IdAseguradora,NombreAseguradora,  Estado) values (5, 'Direct', 1) ;
insert into elvisramirez.Aseguradora(IdAseguradora,NombreAseguradora,  Estado) values (6, 'Vivaz', 1) ;
insert into elvisramirez.Aseguradora(IdAseguradora,NombreAseguradora,  Estado) values (7, 'Luko', 1) ;
insert into elvisramirez.Aseguradora(IdAseguradora,NombreAseguradora,  Estado) values (8, 'Aviva', 1) ;
insert into elvisramirez.Aseguradora(IdAseguradora,NombreAseguradora,  Estado) values (9, 'MGS', 1) ;
insert into elvisramirez.Aseguradora(IdAseguradora,NombreAseguradora,  Estado) values (10, 'Helvetia', 1); 

insert into elvisramirez.estadoscoches (IdEstado, NombreEstado) values (1, 'Activo');
insert into elvisramirez.estadoscoches (IdEstado, NombreEstado) values (2, 'Inactivo');
insert into elvisramirez.estadoscoches (IdEstado, NombreEstado) values (3, 'Perdida Total');
insert into elvisramirez.estadoscoches (IdEstado, NombreEstado) values (4, 'Recuperado');
insert into elvisramirez.estadoscoches (IdEstado, NombreEstado) values (5, 'Inundado');
insert into elvisramirez.estadoscoches (IdEstado, NombreEstado) values (6, 'Robado');
insert into elvisramirez.estadoscoches (IdEstado, NombreEstado) values (7, 'En Mantenimiento');

insert into elvisramirez.colorescoches (IdColor, NombreColor, estado) values (1,'Rojo',1);
insert into elvisramirez.colorescoches (IdColor, NombreColor, estado) values (2,'Blanco',1);
insert into elvisramirez.colorescoches (IdColor, NombreColor, estado) values (3,'Gris',1);
insert into elvisramirez.colorescoches (IdColor, NombreColor, estado) values (4,'Negro',1);
insert into elvisramirez.colorescoches (IdColor, NombreColor, estado) values (5,'Plata',1);
insert into elvisramirez.colorescoches (IdColor, NombreColor, estado) values (6,'Azul',1);
insert into elvisramirez.colorescoches (IdColor, NombreColor, estado) values (7,'Marrón',1);
insert into elvisramirez.colorescoches (IdColor, NombreColor, estado) values (8,'Verde',1);
insert into elvisramirez.colorescoches (IdColor, NombreColor, estado) values (9,'Amarillo',1);
insert into elvisramirez.colorescoches (IdColor, NombreColor, estado) values (10,'Beige',1);

insert into elvisramirez.Coches (IdCoche, Matricula,FechadeCompra, Poliza, IdColor, IdEstado, IdModeloCoche, IdMarcaCoche, IdAseguradora) values (1,'EMR-0285','2020-09-02','EMR20200902',1,1,4,4,2);
insert into elvisramirez.Coches (IdCoche, Matricula,FechadeCompra, Poliza, IdColor, IdEstado, IdModeloCoche, IdMarcaCoche, IdAseguradora) values (2,'YAN-0908','2020-10-03','YAN20201003',2,5,5,8,5);
insert into elvisramirez.Coches (IdCoche, Matricula,FechadeCompra, Poliza, IdColor, IdEstado, IdModeloCoche, IdMarcaCoche, IdAseguradora) values (3,'EPR-0405','2020-12-05','EPR20201205',5,7,1,7,1);
insert into elvisramirez.Coches (IdCoche, Matricula,FechadeCompra, Poliza, IdColor, IdEstado, IdModeloCoche, IdMarcaCoche, IdAseguradora) values (4,'RAS-0911','2021-09-02','RAS20210902',10,5,5,9,5);
insert into elvisramirez.Coches (IdCoche, Matricula,FechadeCompra, Poliza, IdColor, IdEstado, IdModeloCoche, IdMarcaCoche, IdAseguradora) values (5,'YSR-0511','2022-12-15','YSR20221215',8,7,2,8,2);
insert into elvisramirez.Coches (IdCoche, Matricula,FechadeCompra, Poliza, IdColor, IdEstado, IdModeloCoche, IdMarcaCoche, IdAseguradora) values (6,'RBR-0502','2019-02-09','RBR20190209',7,6,3,7,6);
insert into elvisramirez.Coches (IdCoche, Matricula,FechadeCompra, Poliza, IdColor, IdEstado, IdModeloCoche, IdMarcaCoche, IdAseguradora) values (7,'RSC-0308','2018-10-10','RSC20181010',5,4,2,7,4);
insert into elvisramirez.Coches (IdCoche, Matricula,FechadeCompra, Poliza, IdColor, IdEstado, IdModeloCoche, IdMarcaCoche, IdAseguradora) values (8,'MAR-0303','2015-06-16','MAR20150615',6,3,1,5,1);
insert into elvisramirez.Coches (IdCoche, Matricula,FechadeCompra, Poliza, IdColor, IdEstado, IdModeloCoche, IdMarcaCoche, IdAseguradora) values (9,'DMR-1001','2017-06-30','DMR20170630',4,4,4,6,10);


insert into elvisramirez.revisiones (IdRevision, IdCoche, IdTipoMoneda, FechadeRevision, Importe, KmsAlRevisar, Estado) values (1,1,1,'2022-01-30','300.50', 175125,1);
insert into elvisramirez.revisiones (IdRevision, IdCoche, IdTipoMoneda, FechadeRevision, Importe, KmsAlRevisar, Estado) values (2,2,2,'2022-02-28','250.14', 50010,1);
insert into elvisramirez.revisiones (IdRevision, IdCoche, IdTipoMoneda, FechadeRevision, Importe, KmsAlRevisar, Estado) values (3,3,1,'2022-04-15','115.10', 10568,1);
insert into elvisramirez.revisiones (IdRevision, IdCoche, IdTipoMoneda, FechadeRevision, Importe, KmsAlRevisar, Estado) values (4,4,2,'2022-05-23','225.89', 13258,1);
insert into elvisramirez.revisiones (IdRevision, IdCoche, IdTipoMoneda, FechadeRevision, Importe, KmsAlRevisar, Estado) values (5,5,2,'2022-06-14','99.99', 123589,1);
insert into elvisramirez.revisiones (IdRevision, IdCoche, IdTipoMoneda, FechadeRevision, Importe, KmsAlRevisar, Estado) values (6,6,1,'2022-07-05','130.15', 89098,1);
insert into elvisramirez.revisiones (IdRevision, IdCoche, IdTipoMoneda, FechadeRevision, Importe, KmsAlRevisar, Estado) values (7,7,2,'2022-08-10','1459.15', 13235,1);
insert into elvisramirez.revisiones (IdRevision, IdCoche, IdTipoMoneda, FechadeRevision, Importe, KmsAlRevisar, Estado) values (8,8,1,'2022-09-01','325.98', 45698,1);
insert into elvisramirez.revisiones (IdRevision, IdCoche, IdTipoMoneda, FechadeRevision, Importe, KmsAlRevisar, Estado) values (9,9,1,'2022-02-09','457.68', 12123,1);



