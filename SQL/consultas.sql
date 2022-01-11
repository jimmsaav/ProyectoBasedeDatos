use tliving;
/*Parte 1*/
select * from actividad
where idActividad = 1;

select * from amistad
where idAmistad = 2;

select * from asistencia
where idAsistencia = 3;

select * from horarioatencion
where idHorario = 4;

select * from listahorarioatencion
where idListaHorarioAtencion = 5;

select * from mensaje
where idMensaje = 6;

select * from sitio
where idSitio = 7;

select * from usuario 
where idUsuario = 8;

select * from usuario_bloqueado
where id_bloqueo = 9;

/*Parte 2*/
select * from actividad
where tipo = 'Deporte';

select * from amistad
where estado = 'Enviado';

select * from asistencia
where idSitio = 19;

select * from horarioatencion
where horaApertura like '2021-06%';

select * from listahorarioatencion
where idSitio = 18;

select * from mensaje
where asunto = 'RE: Propuesta de viaje';

select * from sitio
where nombre = 'Sur';

select * from usuario
where ciudad = 'Cuenca';

select * from usuario_bloqueado
where idUsuarioBloquea = 5;

/*Parte 3*/
/*Proceso 15: Listar amigos*/
SELECT idAmistad, idUsuario1, idUsuario2
FROM AMISTAD
WHERE idUsuario1 = 1 || idUsuario2 = 1;

/*Proceso 16: Listar amigos recientes*/
SELECT idAmistad, idUsuario1, idUsuario2, fecha_envio_amistad
FROM AMISTAD
WHERE idUsuario1 = 1 || idUsuario2 = 1
AND fecha_envio_amistad < '2021-04-04' && fecha_envio_amistad > '2021-04-02';

/*Proceso 17: Buscar amigos por apellido*/
SELECT *
FROM AMISTAD 
WHERE (idUsuario1 in (
	SELECT idUsuario
	FROM USUARIO
	WHERE Apellido like "Lopez"
) AND idUsuario2 = 1) OR (idUsuario2 in (
	SELECT idUsuario
	FROM USUARIO
	WHERE Apellido like "Lopez")
	AND idUsuario1 = 1
);

/*Proceso 18: Consultar Datos del usuario*/
select * from usuario
where nombre = 'Juan' and apellido = 'Hidalgo';

/*proceso 19: Consultar Lista actividades del usuario*/
 select actividad.nombre, actividad.tipo, actividad.descripcion, sitio.nombre as Lugar_de_actividad
 from usuario, asistencia, sitio, actividad
 where usuario.idUsuario = asistencia.idUsuario and asistencia.idSitio = sitio.idSitio and sitio.idActividad = actividad.idActividad and
 usuario.nombre= 'Juan' and usuario.apellido = 'Hidalgo';
 
 /*proceso 20: Consultar compatibilidad de actividades*/
  select usuario.nombre, usuario.apellido, usuario.direccion
 from usuario, asistencia, sitio, actividad
 where usuario.idUsuario = asistencia.idUsuario and asistencia.idSitio = sitio.idSitio and sitio.idActividad = actividad.idActividad and
 actividad.nombre = 'Parchis';
