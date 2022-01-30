use tliving;

drop view if exists preferenciasPorUsuario;
create view preferenciasPorUsuario as 
	select u.idUsuario, s.idActividad from usuario as u left join asistencia as a on u.idUsuario = a.idUsuario
													  left join sitio as s on a.idSitio = s.idSitio;

drop view if exists usuariosPorCiudad;
create view usuariosPorCiudad as 
	select ciudad, count(*) from usuario group by ciudad;
    