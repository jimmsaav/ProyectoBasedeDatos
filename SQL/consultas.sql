use tliving;
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
--------------------------------
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
