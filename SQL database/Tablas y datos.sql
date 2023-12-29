#------------------------------------------- Creat tablas -------------------------------------#

create table CIUDAD ( Nombre VARCHAR(12), Pais VARCHAR(12), PRIMARY KEY (Nombre, Pais));

create table LUGARAVISITAR ( Nombre VARCHAR(12), Ciudad VARCHAR(12), Pais VARCHAR(12), Direccion VARCHAR(20), Descripcion VARCHAR(40), Precio INTEGER, PRIMARY KEY (Nombre, Ciudad, Pais));

create table CIRCUITO ( Identificador VARCHAR(5), IdentificadorFecha VARCHAR(5), Descripcion VARCHAR(20), CiudadSalida VARCHAR(12), PaisSalida VARCHAR(12), CiudadLlegada VARCHAR(12), PaisLlegada VARCHAR(12), Duracion INTEGER, Precio INTEGER, PRIMARY KEY (Identificador) );

create table FECHACIRCUITO ( Identificador VARCHAR(5), FechaSalida DATE, nbPersonas INTEGER, PRIMARY KEY (Identificador) );

create table ETAPA (Identificador VARCHAR(5), Orden INTEGER, NombreLugar VARCHAR(12), Ciudad VARCHAR(12), Pais VARCHAR(12), Duracion INTEGER, PRIMARY KEY (Identificador) );

create table HOTEL ( Nombre VARCHAR(12), Ciudad VARCHAR(12), Pais VARCHAR(12), Direccion VARCHAR(20), NumCuartos INTEGER, PrecioCuarto INTEGER, PrecioDesayuno INTEGER, PRIMARY KEY (Nombre, Ciudad, Pais));

create table RESERVACION (Cliente VARCHAR(20), Identificador VARCHAR(5), PRIMARY KEY (Cliente, Identificador));

create table SIMULACION (Identificador VARCHAR(5), NombreCliente VARCHAR(20), FechaSalida DATE, FechaLlegada DATE, NoPersonas INTEGER, Costo INTEGER, PRIMARY KEY (Identificador));

create table SIM_CIUDAD( IdentificadorSim VARCHAR(5), Ciudad VARCHAR(12), pais VARCHAR(12), PRIMARY KEY (IdentificadorSim, Ciudad, Pais));

create table SIM_LUGAR ( IdentificadorSim VARCHAR(5), NombreLugar VARCHAR(12), Ciudad VARCHAR(12), Pais VARCHAR(12), PRIMARY KEY (IdentificadorSim, NombreLugar, Ciudad, Pais));

create table SIM_HOTEL (IdentificadorSim VARCHAR(5), NombreHotel VARCHAR(12), Ciudad VARCHAR(12), pais VARCHAR(12), PRIMARY KEY (IdentificadorSim, NombreHotel, Ciudad, Pais));

create table ETAPACIRCUITO (IdentificadorCircuito VARCHAR(5), IdentificadorEtapa VARCHAR(5), NoEtapa INTEGER NOT NULL DEFAULT 0, PRIMARY KEY (IdentificadorCircuito, IdentificadorEtapa, NoEtapa), CHECK (NoEtapa BETWEEN 0 AND 3));

create table CLIENTE (Nombre VARCHAR(20), Tipo ENUM (“Compañia”, “Grupo”, “Individual”), Año INTEGER, Empleado ENUM (“S”, “N”), TipoPago ENUM (“Credito”, “Debito”, “Efectivo”, “Cheque”), PRIMARY KEY (Nombre));






#--------------------------------- Datos para rellenar las tablas --------------------#

#---- Tuplas para CIUDAD ---------------#

insert into CIUDAD values ("Puebla”, "Mexico”);
insert into CIUDAD values (“CDMX”, “Mexico”);
insert into CIUDAD values (“Madrid”, “"España"”);
insert into CIUDAD values(“Barcelona”, "España") ;
insert into CIUDAD values ("Mykonos", “Grecia”);


#--- Tuplas pata LUGARAVISITAR -----#

insert into LUGARAVISITAR values (“Catedral Pue”, "Puebla", “Mexico", “Calle Centro”, “Iglesia", 50);
insert into LUGARAVISITAR values (“Cuauhtemoc”, "Puebla”, "Mexico”, “Col. Maravillas”, “Estadio de futbol”, 100);
insert into LUGARAVISITAR values (“Africam”, "Puebla", "Mexico", “Valsequillo”, “Zoológico”, 250);
insert into LUGARAVISITAR values (“Mu Barroco”, "Puebla", "Mexico", “Via Atlixcayotl”, "Museo", 100);
insert into LUGARAVISITAR values (“Catedral Mex”, "CDMX", "Mexico", “Calle Centro”, "Iglesia", 50);
insert into LUGARAVISITAR values (“Mu Soumaya”, "CDMX", "Mexico", “Polanco”, "Museo", 100);SELE
insert into LUGARAVISITAR values ("Museo INAH”, "CDMX", "Mexico", “Chapultepec”, "Museo", 50);
insert into LUGARAVISITAR values (“Sagrada Fam”, "Barcelona", "España", ”Calle Mallorca”, "Iglesia", 50);
insert into LUGARAVISITAR values (“Camp Nou”, "Barcelona", "España", “Calle Aristides”, "Estadio de futbol", 250);
insert into LUGARAVISITAR values (“Mu Picasso”, "Barcelona", "España", “Calle Montcada”, "Museo", 200);
insert into LUGARAVISITAR values (“Cibeles”, "Madrid", "España", “Plaza Villa”, “Fuente”, 50);
insert into LUGARAVISITAR values (“San Bernabeu”, “Madrid”, "España", “Av. Concha”, "Estadio de futbol", 250);
insert into LUGARAVISITAR values (“Metropolitan”, “Madrid”, "España”, “Av. Luis”, "Estadio de futbol", 200); 
insert into LUGARAVISITAR values (“Panagia Tour”, "Mykonos", "Grecia", “Ano Mera”, "Iglesia", 200);
insert into LUGARAVISITAR values (“Ornos Beach”, "Mykonos", "Grecia", “Ornos”, “Playa”, 150);
insert into LUGARAVISITAR values (“Paraportiani”, "Mykonos", "Grecia", “Xwpa”, "Iglesia", 200);

#--- Tuplas para HOTEL -----#

insert into HOTEL values (“Marriott”, “Puebla”, “Mexico”, “Blvd Serdán”, 550, 1200, 150);
insert into HOTEL values (“Hilton Garde”, “Puebla”, “Mexico”, “Via Atlixcayotl”, 230, 1500, 200);
insert into HOTEL values (“Plaza Refor”, “CDMX”, “Mexico”, “Hamburgo 195”, 485, 1300, 160);
insert into HOTEL values (“Hotel Mx”, “CDMX”, “Mexico”, “Carranza 15270”, 150, 1000, 150);
insert into HOTEL values (“Iberostar”, “Barcelona”, “España”, “PI. de Catalunya”, 330, 2500, 320);
insert into HOTEL values (“SB Glow”, “Barcelona”, “España”, “Carrer de Badajoz”, 400, 2000, 235);
insert into HOTEL values (“Eurostars”, “Madrid”, “España”, “Paseo Castellana”, 350, 3000, 300);
insert into HOTEL values (“Principal”, “Madrid”, “España”, “Calle del Marqués”, 235, 5000, 435);
insert into HOTEL values (“Myconian”, “Mykonos”, “Grecia”, “Elia 84600”, 560, 4500, 500);
insert into HOTEL values (“Cavo Tagoo”, “Mykonos”, “Grecia”, “Mukoc 515”, 150, 9950, 540);

#--- Tuplas para CIRCUITO -----#


insert into CIRCUITO values (“Mex1”, “Fech1”, “Circuito Mexico 1”, “Puebla”, “Mexico”, “CDMX”, “Mexico”, 0, 0);
insert into CIRCUITO values  (“Mex2”, “Fech2”, “Circuito Mexico 2”, “CDMX”, “Mexico”, “Puebla”, “Mexico”, 0, 0);
insert into CIRCUITO values (“Esp1”, “Fech3”, “Circuito España 1”, “Barcelona”, “España”, “Madrid”, “España”, 0, 0);
insert into CIRCUITO values (“Esp2”, “Fech4”, “Circuito España 2”, “Madrid”, “España”, “Barcelona”, “España”, 0, 0);
insert into CIRCUITO values  (“Grec1”, “Fech5”, “Circuito Grecia 1”, “Mykonos”, “Grecia”, “Mykonos”, “Grecia”, 0, 0);

#--- Tuplas para ETAPA -----#

insert into ETAPA values (“Me1.1”, 1, “Catedral Pue”, “Puebla”, “Mexico”,  1);
insert into ETAPA values (“Me1.2”, 2, “Mu Barroco”, “Puebla”, “Mexico”,  2);
insert into ETAPA values (“Me1.3”, 3, “Cuauhtemoc”, “Puebla”, “Mexico”,  3);
insert into ETAPA values (“Me1.4”, 4, “Africam”, “Puebla”, “Mexico”,  7);
 insert into ETAPA values (“Me2.1”, 1, “Catedral Mex”, “CDMX”, “Mexico”,  1);
insert into ETAPA values (“Me2.2”, 2, “Museo INAH”, “CDMX”, “Mexico”,  1);
insert into ETAPA values (“Me2.3”, 3, “Mu Soumaya”, “CDMX”, “Mexico”,  2);

insert into ETAPA values (“Es1.1”, 1, “Camp Nou”, “Barcelona”, “España”,  2);
insert into ETAPA values (“Es1.2”, 2, “Mu Picasso”, “Barcelona”, “España”,  3);
insert into ETAPA values (“Es1.3”, 3, “Sagrada Fam”, “Barcelona”, “España”,  1);

insert into ETAPA values (“Es2.1”, 1, “San Bernabeu”, “Madrid”, “España”,  2);
insert into ETAPA values (“Es2.2”, 2, “Cibeles”, “Madrid”, “Madrid”,  1);
insert into ETAPA values (“Es2.3”, 3, “Metropolitan”, “Madrid”, “España”,  2);

insert into ETAPA values (“Gr1.1”, 1, “Ornos Beach”, “Mykonos”, “Grecia”,  6);
insert into ETAPA values (“Gr1.2”, 2, “Panagia Tour”, “Mykonos”, “Grecia”,  3);
insert into ETAPA values (“Gr1.3”, 3, “Paraportiani”, “Mykonos”, “Grecia”,  2);


#--- Tuplas para FECHACIRCUITO -----#


insert into FECHACIRCUITO values (“Mex1”, CURDATE() + INTERVAL 3 DAY, 15);
insert into FECHACIRCUITO values(“Mex2”, CURDATE() + INTERVAL 2 DAY, 30);

insert into FECHACIRCUITO values (“Esp1”, CURDATE() + INTERVAL 6 DAY, 4);
insert into FECHACIRCUITO values(“Esp2”, CURDATE() + INTERVAL 4 DAY, 6);

insert into FECHACIRCUITO values(“Grec1”, CURDATE() + INTERVAL 2 DAY, 12);



#--- Tuplas para CLIENTE -----#

insert into CLIENTE values (“Pablo”, “Grupo”, 2020, “N”, “Efectivo”);
insert into CLIENTE values (“Paulina”, “Compañia”, 2021, “S”, “Debito”); 


#--- Tuplas para SIMULACION -----#

insert into SIMULACION values ( “Sim01”, “Pablo”, CURDATE() + 3, CURDATE() + INTERVAL 6 DAY, 4, 0);

#--- Tuplas para SIM_CIUDAD -----#
insert into SIM_CIUDAD values (“Sim01”, “Puebla”, “Mexico”);

#--- Tuplas para SIM_LUGAR -----#
insert into SIM_LUGAR values (“Sim01”, “Catedral Pue”, “Puebla”, “Mexico”);

#--- Tuplas para SIM_HOTEL -----#
insert into SIM_HOTEL values (“Sim01”, “Marriott”,“Puebla”, “Mexico”);


