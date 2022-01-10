DROP SCHEMA IF EXISTS tliving;
CREATE SCHEMA tliving;
USE tliving;

create table Usuario (
  idUsuario int not null,
  nombre varchar(50) not null,
  apellido varchar(50) not null,
  direccion varchar(60) not null,
  ciudad varchar(40) not null,
  moderador integer default NULL,
  es_moderador boolean not null,  
  primary key (idUsuario), 
  foreign key (moderador) references Usuario(idUsuario)
);

CREATE TABLE MENSAJE (
  idMensaje INT not NULL,
  fecha DATE not NULL,
  contenido varchar(1000) not NULL,
  adjunto varchar(1000),
  asunto varchar(50) NOT NULL,
  idReceptor INT NOT NULL,
  idEmisor INT NOT NULL,
  PRIMARY KEY (idMensaje),
  FOREIGN KEY (idReceptor) REFERENCES USUARIO(idUsuario),
  FOREIGN KEY (idEmisor) REFERENCES USUARIO(idUsuario)
);
create table Asistencia (
  idAsistencia int not null,
  fecha_asistencia date not null,
  idUsuario int not null,
  idSitio int not null,
  primary key (idAsistencia),
  foreign key (idUsuario)
  references Usuario(idUsuario)
);

create table Amistad(
  idAmistad int not null,
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
  id_bloqueo int not null,
  idUsuarioBloquea int not null,
  idUsuarioBloqueado int not null,
  primary key(id_bloqueo),
  foreign key (idUsuarioBloquea)
  references Usuario(idUsuario),
  foreign key (idUsuarioBloqueado)
  references Usuario(idUsuario)
);
