create table venta 
id int(11) auto_increment not null,
fech_venta date not null,
producto varchar (25) not null,
precio decimal not null,
descripcion text not null,
constraint pk_venta primary key(id)
);
