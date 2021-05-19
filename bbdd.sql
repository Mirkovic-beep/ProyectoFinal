create database proyecto_final;
use proyecto_final;

create table videojuegos (
     id int (2),
     id_genero int (2),
     ncopias int (10),
     duracion varchar (10),
     nombre varchar (30),
     pegi varchar (5),
     id_distribuidor int (2),  
     precio double (5,2),
     consola varchar(20),
     nuevo int (1),
     primary key (id));

create table genero (
     id int (2),
     nombre varchar (30),
     dificultad varchar (30),
     primary key (id));

create table desarrolladora (
     id int (2),
     nombre varchar (30),
     sede varchar (30),
     primary key (id));


create table formato (
     id int (2),
     nombre varchar (30),
     stock int (10),
     primary key (id));


create table Local_fisico (
     id int (2),
     nombre varchar (30),
     localizacion varchar (30),
     primary key (id));

create table clientes (
     id int (2),
     nombre varchar (30),
     apellidos varchar (30),
     dni varchar (10),
     primary key (id));

create table distribuidor (
     id int (2),
     nombre varchar (30),
     afiliacion varchar (30),
     sede varchar (30),
     primary key (id));

alter table videojuegos add foreign key (id_genero) references genero(id) ON DELETE CASCADE;
alter table videojuegos add foreign key (id_distribuidor) references distribuidor(id) ON DELETE CASCADE ON UPDATE CASCADE;

create table es_desarrollado(
	id_videojuego int (2),
	id_desarrolladora int (2),
	primary key (id_videojuego,id_desarrolladora));

alter table es_desarrollado add foreign key (id_videojuego) references videojuegos(id) ON DELETE CASCADE;
alter table es_desarrollado add foreign key (id_desarrolladora) references desarrolladora(id) ON DELETE CASCADE ON UPDATE CASCADE;

create table formato_juego(
	id_videojuego int (2),
	id_formato int (2),
	primary key (id_videojuego,id_formato));

alter table formato_juego add foreign key (id_videojuego) references videojuegos(id) ON DELETE CASCADE ON UPDATE CASCADE;
alter table formato_juego add foreign key (id_formato) references formato(id) ON DELETE CASCADE ON UPDATE CASCADE;

create table compra(
	id_videojuego int (2),
	id_cliente int (2),
	id_transaccion int (2),
	fecha_compra varchar (20),
	id_local int (2),
	primary key (id_videojuego,id_cliente,id_local));

alter table compra add foreign key (id_videojuego) references videojuegos(id) ON DELETE CASCADE ON UPDATE CASCADE;
alter table compra add foreign key (id_cliente) references clientes(id) ON DELETE CASCADE ON UPDATE CASCADE;
alter table compra add foreign key (id_local) references local_fisico(id) ON DELETE CASCADE ON UPDATE CASCADE;


create table almacenar(
	id_local int (2),
	id_videojuego int (2),
	primary key (id_local,id_videojuego));

alter table almacenar add foreign key (id_local) references local_fisico(id) ON DELETE CASCADE ON UPDATE CASCADE;
alter table almacenar add foreign key (id_videojuego) references videojuegos(id) ON DELETE CASCADE ON UPDATE CASCADE;

insert into genero
values
(1,'Lucha','Alta'),
(2,'Carreras','Alta'),
(3,'FPS','Media'),
(4,'RPG','Baja'),
(5,'ROL','Media'),
(6,'MOBA','Alta'),
(7,'Deportes','Baja'),
(8,'Hack n slash','Baja'),
(9,'Puzzles','Media'),
(10,'Plataformas','Media'),
(11,'Estrategia','Alta'),
(12,'RTS','Media'),
(13,'RPG por turnos','Media'),
(14,'Survival','Media'),
(15,'Simulacion','Baja');


insert into desarrolladora
values
(1,'RockStar','EEUU'),
(2,'SEGA','Japon'),
(3,'RIOT','Dublin'),
(4,'Nintendo','Japon'),
(5,'CD Project','China'),
(6,'Tencent','China'),
(7,'Bethesda','Mozambique'),
(8,'Square enix','Francia'),
(9,'Iron Gate','EEUU'),
(10,'Mojang','Suecia'),
(11,'Treyarch','EEUU'),
(12,'Naughty Dog','EEUU');


insert into distribuidor
values
(1,'Eneba','Tencent','Espana'),
(2,'G2A','Rockstar','Japon'),
(3,'Game','Blizzard','Dublin'),
(4,'Media','Tencent','Japon'),
(5,'Kinguin','Tencent','China'),
(6,'G4K','EA','China'),
(7,'Steam','Ubisoft','Mozambique'),
(8,'Origin','Rockstar','Francia'),
(9,'Epic','EA','EEUU'),
(10,'Battle','Blizzard','Suecia'),
(11,'Twitch','Rockstar','EEUU'),
(12,'Uplay','Ubisoft','EEUU');

insert into videojuegos
values
(1,1,500,'788','Armored core','+18',1,15.99,'Xbox',0),
(2,2,130,'287','Baldurs gate','+7',2,30.99,'Wii',0),
(3,3,324,'354','Bioshock','+16',3,60.99,'Xbox',0),
(4,3,545,'467','Borderlands','+18',4,10.99,'PC',0),
(5,5,543,'573','Colossus','+18',5,69.99,'Play',0),
(6,2,798,'645','Crazytaxi','+12',6,4.99,'Play',0),
(7,7,134,'745','Daggerfall','+12',7,8.99,'PC',0),
(8,3,656,'555','Deadspace','+12',8,56.99,'PC',0),
(9,9,783,'666','Diablo','+18',9,98.99,'PC',0),
(10,3,456,'222','Doom','+18',10,21.99,'PC',0),
(11,11,240,'333','Dragon quest','+12',11,50.99,'Play',0),
(12,3,300,'323','Gta','+18',12,34.99,'Play',0),
(13,3,300,'323','Halo','+18',1,22.99,'Xbox',0),
(14,14,300,'323','Heavy rain','+18',2,34.99,'Xbox',0),
(15,3,300,'323','Hotline','+18',3,34.99,'PC',0),
(16,9,300,'323','Ico','+18',4,34.99,'Play',0),
(17,3,300,'323','LeftforDead','+7',5,4.99,'Xbox',0),
(18,10,300,'323','Limbo','+18',6,14.99,'Wii',0),
(19,10,300,'323','Mario','+18',7,44.99,'Wii',0),
(20,10,300,'323','Monkey island','+7',8,14.99,'Nes',0),
(21,1,300,'323','Mortal kombat','+18',9,24.99,'PC',0),
(22,8,300,'323','Okami','+18',10,54.99,'Play',1),
(23,8,300,'323','Phoenix','+18',11,14.99,'Wii',0),
(24,3,300,'323','Quake','+18',12,34.99,'PC',1),
(25,1,300,'323','Resistance','+16',1,74.99,'Play',1),
(26,8,300,'323','Scurge','+16',2,54.99,'Wii',0),
(27,8,300,'323','Skyrim','+16',3,34.99,'Xbox',0),
(28,10,300,'323','Sonic','+16',4,34.99,'Wii',0),
(29,2,300,'323','Speedball','+16',5,34.99,'Wii',0),
(30,8,300,'323','Starwars','+7',6,34.99,'Xbox',1),
(31,10,300,'323','Steelempire','+12',7,34.99,'Wii',0),
(32,8,300,'323','Finalfantasy','+18',8,34.99,'Play',0),
(33,1,300,'323','Streetfighter','+12',9,34.99,'Xbox',0);


insert into formato
values
(1,'Fisico','EEUU'),
(2,'ES','Japon'),
(3,'Digital','Dublin');


insert into local_fisico
values
(1,'GameStop','EEUU'),
(2,'Nelson','Japon'),
(3,'BeyondG','Dublin'),
(4,'Rito','Japon');

insert into clientes
values
(1,'Pepe','Garrido','05964249G'),
(2,'Jorge','Perez','07035642Z'),
(3,'Galo','Martin','06040708H'),
(4,'David','Valdes','03020100F'),
(5,'Pablo','Pereira','87656492J'),
(6,'Adrian','Vadillo','02949293I'),
(7,'Pablo','Castillo','23425322H'),
(8,'Mario','Gonzales','78293920U'),
(9,'David','Herrero','53627237Y'),
(10,'Branka','ignjatovic','32567896G'),
(11,'Francisco','Doral','09876523O'),
(12,'Daniel','Leal','89674532T'),
(13,'Diego','Delgado','43868367R'),
(14,'Miranda','Rodriguez','56432567E'),
(15,'Irene','Ortega','23456709G'),
(16,'Felipe','Martinez','21123453L'),
(17,'Martin','Lopez','76573865V'),
(18,'Javier','Almagro','90872365H'),
(19,'Rocio','Jurado','34897654F'),
(21,'Mike','Tyson','57643289P'),
(22,'Kobe','Bryant','23786590F'),
(23,'Lana','Del rey','87645349U'),
(24,'Ana','Albert','84097632D'),
(25,'Miriam','Jimenez','00000000A'),
(26,'Paula','Gomez','01108923K'),
(27,'Elena','Manso','22334455P'),
(28,'Fernando','Simon','11335566H'),
(29,'Isabel','Ayuso','01001001G'),
(30,'Alvaro','Codina','11111111J'),
(31,'Sergio','Ramos','93293042R');

insert into es_desarrollado
values
(1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(6,6),
(7,7),
(8,8),
(9,9),
(10,10),
(11,11),
(12,12),
(13,1),
(14,2),
(15,3),
(16,4),
(17,5),
(18,6),
(19,7),
(20,7),
(21,7),
(22,8),
(23,9),
(24,10),
(25,11),
(26,12),
(27,10),
(28,5),
(29,7),
(30,8),
(31,9),
(32,10),
(33,11);

insert into formato_juego
values
(1,1),
(2,2),
(3,3),
(4,3),
(5,2),
(6,1),
(7,2),
(8,2),
(9,3),
(10,1),
(11,2),
(12,1),
(13,2),
(14,3),
(15,3),
(16,2),
(17,1),
(18,3),
(19,1),
(20,3),
(21,2),
(22,2),
(23,3),
(24,3),
(25,2),
(26,1),
(27,1),
(28,2),
(29,2),
(30,1),
(31,1),
(32,2),
(33,1);



insert into almacenar
values
(1,1),
(2,2),
(3,3),
(4,4),
(1,5),
(2,6),
(3,7),
(4,8),
(1,9),
(2,10),
(2,11),
(1,12),
(3,13),
(4,14),
(1,15),
(2,15),
(3,16),
(4,17),
(1,18),
(2,19),
(3,20),
(4,21),
(1,22),
(2,23),
(3,24),
(4,25),
(1,26),
(2,27),
(3,28),
(4,29),
(1,30),
(2,31),
(3,32),
(4,33);

insert into compra(id_videojuego,id_cliente,id_transaccion,id_local)
values
(1,11,1,1),
(2,22,2,2),
(3,13,3,3),
(4,14,4,4),
(5,15,5,1),
(6,16,6,2),
(7,17,7,3),
(8,18,8,4),
(9,19,9,1),
(10,11,10,2),
(11,31,11,3),
(12,12,12,4);













