create database liga;
use liga;
create table equipo (id_equipo int(20) not null auto_increment primary key, nombre varchar(20) not null, ciudad varchar(20) not null);
create table jugador (id_jugador int(15) not null auto_increment primary key, nombre varchar (20) not null, fech_nacimiento date not null);
insert into equipo values(not null, "Tolima","Ibague");
insert into jugador values(not null,"Johan",20040224);
select * from equipo;
select * from jugador;

