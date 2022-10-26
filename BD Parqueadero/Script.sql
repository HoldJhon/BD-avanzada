create database parqueadero;

create table administrador(
    id serial not null,
    nombre varchar(25),
    direccion varchar(25),
    primary key (id)
);

create table telefono_admin(
    id_admin integer not null,
    telefono varchar (10),
    foreign key (id_admin) references administrador (id)
);

create table parqueaderos(
    id serial not null,
    id_admin integer not null,
    nombre varchar(25),
    localizacion varchar(25),
    primary key (id),
    foreign key (id_admin) references administrador (id)
);

create table tarifa(
    id serial not null,
    valor float not null,
    fecha_inicio date not null,
    fecha_final date not null,
    primary key (id)
);

create table tarifa-parqueadero(
    id_parqueadero integer not null,
    id_tarifa integer not null,
    foreign key (id_parqueadero) references parqueadero (id),
    foreign key (id_tarifa) references tarifa (id)
);

create table puesto(
    id serial not null,
    id_parqueadero integer not null,
    ubicacion varchar (20),
    primary key (id),
    foreign key (id_parqueadero) references parqueadero (id)
);

create table vehiculo(
    placa varchar(6) not null,
    fecha_entrada date not null,
    hora_entrada time not null,
    primary key (placa)
);

create table vehiculo-puesto(
    placa_vehiculo varchar(6) not null,
    id_puesto integer not null,
    foreign key (placa_vehiculo) references vehiculo (placa),
    foreign key (id_puesto) references puesto (id)
);

create table vehiculo-tarifa(
    placa_vehiculo varchar(6) not null,
    id_tarifa integer not null,
    foreign key (placa_vehiculo) references vehiculo (placa),
    foreign key (id_tarifa) references tarifa (id)
);