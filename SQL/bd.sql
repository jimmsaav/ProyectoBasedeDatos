DROP SCHEMA IF EXISTS tliving;
CREATE SCHEMA tliving;
USE tliving;
create table Usuario (
  idUsuario int not null auto_increment,
  cedula int not null,
  nombre varchar(50) not null,
  apellido varchar(50) not null,
  correo varchar(50) not null,
  edad int not null,
  direccion varchar(60) not null,
  ciudad varchar(40) not null,
  moderador integer default NULL,
  es_moderador boolean not null,  
  primary key (idUsuario), 
  foreign key (moderador) references Usuario(idUsuario)
);

CREATE TABLE MENSAJE (
  idMensaje INT not NULL auto_increment,
  fecha datetime not NULL,
  contenido varchar(1000) not NULL,
  adjunto json,
  asunto varchar(50) NOT NULL,
  idReceptor INT NOT NULL,
  idEmisor INT NOT NULL,
  PRIMARY KEY (idMensaje),
  FOREIGN KEY (idReceptor) REFERENCES USUARIO(idUsuario),
  FOREIGN KEY (idEmisor) REFERENCES USUARIO(idUsuario)
);


create table Amistad(
  idAmistad int not null auto_increment,
  idUsuario1 int not null,
  idUsuario2 int not null,
  fecha_envio_amistad date not null, 
  estado varchar(100) not null,
  primary key(idAmistad),
  foreign key(idUsuario1)
  references Usuario(idUsuario),
  foreign key(idUsuario2)
  references Usuario(idUsuario)
);

create table USUARIO_BLOQUEADO(
  id_bloqueo int not null auto_increment,
  idUsuarioBloquea int not null,
  idUsuarioBloqueado int not null,
  primary key(id_bloqueo),
  foreign key (idUsuarioBloquea)
  references Usuario(idUsuario),
  foreign key (idUsuarioBloqueado)
  references Usuario(idUsuario)
);

create table actividad (
	idActividad int not null auto_increment,
	nombre varchar (80) not null,
	tipo varchar (50) not null,
	cantidad_participantes int not null,
	descripcion varchar(100) not null,
	primary key(idActividad)
);

create table Sitio(
  idSitio int not null auto_increment,
  nombre varchar(100) not null,
  direccion varchar(100) not null,
  numero_contacto varchar(100) not null,
  sala_virtual boolean not null, 
  idActividad int not null, 
  link varchar(500), 
  plataforma varchar(100),
  primary key (idSitio), 
  foreign key(idActividad) references actividad(idActividad)
	 
);
CREATE TABLE ListaHorarioAtencion (
	idListaHorarioAtencion int not null auto_increment,
	idSitio int not null, 
	primary key(idListaHorarioAtencion),
	foreign key(idSitio) references Sitio(idSitio)
);


create table HorarioAtencion (
	idHorario int not null auto_increment,
	horaApertura datetime not null,
	horaCierre datetime not null,
	idListaHorarioAtencion int not null,
	primary key(idHorario),
	foreign key(idListaHorarioAtencion) references ListaHorarioAtencion(idListaHorarioAtencion)
);
create table Asistencia (
  idAsistencia int not null auto_increment,
  fecha_asistencia date not null,
  idUsuario int not null,
  idSitio int not null,
  primary key (idAsistencia),
  foreign key (idUsuario)
  references Usuario(idUsuario),
  foreign key (idSitio) references Sitio(idSitio)
);
