use tliving;

drop view if exists preferenciasPorUsuario;
create view preferenciasPorUsuario as 
	select u.idUsuario, s.idActividad from usuario as u left join asistencia as a on u.idUsuario = a.idUsuario
													  left join sitio as s on a.idSitio = s.idSitio;

drop view if exists usuariosPorCiudad;
create view usuariosPorCiudad as 
	select ciudad, count(*) from usuario group by ciudad;

drop view if exists usuariosPorModerador;
create view usuariosPorModerador as 
	select idUsuario, count(*) from usuario where es_moderador = 1 group by idUsuario;