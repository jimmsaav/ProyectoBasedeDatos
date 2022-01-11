use tliving;
select * from actividad;
select * from amistad;
select * from asistencia;
select * from horarioatencion;
select * from listahorarioatencion;
select * from mensaje;
select * from sitio;
select * from usuario;
select * from usuario_bloqueado;
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
