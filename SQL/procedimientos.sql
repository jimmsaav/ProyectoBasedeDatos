use tliving;

#1
drop procedure if exists ingresar_usuario;
DELIMITER //
create procedure ingresar_usuario(IN cedula_in INT, IN nombre_in varchar(50), IN apellido_in varchar(50), IN correo_in varchar(50), IN edad_in INT ,
IN direccion_in varchar(60), IN ciudad_in varchar(40), IN moderador_in INT, IN es_moderador_in tinyint(1) )
begin
DECLARE suma int;
DECLARE cedula int;
select us.cedula into cedula from USUARIO us where cedula_in = us.cedula;
	START TRANSACTION;
	IF(
	(cedula is null)
	AND
	((edad_in>=18))
	) then
    select idUsuario into suma from USUARIO order by idUsuario desc limit 1;
	set suma = suma + 1;
		INSERT into USUARIO (idUsuario, cedula, nombre, apellido, correo, edad, direccion, ciudad, moderador, es_moderador)
		values (suma, cedula_in, nombre_in, apellido_in, correo_in, edad_in, direccion_in, ciudad_in, moderador_in, es_moderador_in);
		commit;
		else
		rollback;
		END IF;

END //


## 2 
drop procedure if exists ingresar_actividad;

DELIMITER //
create procedure ingresar_actividad(IN nombre_IN varchar(80), IN tipo_IN varchar(50), IN cantidad_participantes_IN INT, IN descripcion_IN varchar(100))
begin
DECLARE suma1 INT;
select idActividad into suma1 from ACTIVIDAD order by idActividad desc limit 1;
set suma1 = suma1 + 1;
INSERT into ACTIVIDAD (idActividad, nombre, tipo, cantidad_participantes, descripcion)
values (suma1, nombre_IN, tipo_IN, cantidad_participantes_IN, descripcion_IN);
commit;
		
END //
DELIMITER;

#3
drop procedure if exists añadir_amigo;
DELIMITER //
create procedure añadir_amigo(IN idUsuario1_in INT, IN idUsuario2_in INT, IN fecha_envio_amistad_in date, IN estado_in varchar(100))
begin
DECLARE suma1 INT;
select idAmistad into suma1 from AMISTAD order by idAmistad desc limit 1;
set suma1 = suma1 + 1;
INSERT into AMISTAD (idAmistad, idUsuario1, idUsuario2, fecha_envio_amistad, estado)
values (suma1, idUsuario1_in, idUsuario2_in, fecha_envio_amistad_in, estado_in);
		
END //



##5
drop procedure if exists añadir_sitio;
DELIMITER //
create procedure añadir_sitio(IN nombre_in varchar(100), IN direccion_in varchar(100), IN numero_contacto_in varchar(100), IN sala_virtual_in tinyint(1), IN idActividad_in INT, IN link_in varchar(500), IN plataforma_in varchar(100))
begin
declare suma2 int;
declare dir varchar(100);
select si.direccion into dir from SITIO si where direccion_in = si.direccion;
	START TRANSACTION;
    IF(dir is null)
    then
    select idSitio into suma2 from SITIO order by idSitio desc limit 1;
    set suma2 = suma2 + 1;
    insert into SITIO(idSitio, nombre, direccion, numero_contacto, sala_virtual, idActividad, link, plataforma)
    values (suma2, nombre_in, direccion_in, numero_contacto_in, sala_virtual_in, idActividad_in, link_in, plataforma_in);
		commit;
	else
		rollback;
	END if;

END //





##6
drop procedure if exists mandar_mensaje;
DELIMETER //
create procedure mandar_mensaje (in Face int, in Usuario_Agregado INT, in texto_mensaje varchar(1000), in tema varchar(50), in esta varchar(15), in datos_horario datetime)
begin
DECLARE suma int; 
DECLARE bloqueado int;
select ub.id_bloqueo into bloqueado from USUARIO_BLOQUEADO ub where Face = ub.idUsuarioBloquea and Usuario_Agregado = ub.idUsuarioBloqueado;
	START TRANSACTION;
	IF(
	(bloqueado is null)
	AND
	((select a.estado from amistad a where Face = a.idUsuario1 and Usuario_Agregado = a.idUsuario2) like 'Aceptado')
	) then
		select idMensaje into suma from mensaje order by idMensaje desc limit 1; 
		set suma = suma + 1 ;  
		insert into mensaje(idMensaje, fecha, contenido, asunto, estado, idReceptor, idEmisor) 
		values (suma, datos_horario, texto_mensaje, tema, esta, Usuario_Agregado, Face);
			commit;
		else
			rollback;
		END IF;  
END //

## Proceso numero 7
drop procedure if exists consultar_mensaje;
DELIMETER //
create procedure consultar_mensaje (in Face int, in Usuario_Agregado INT)
begin
select m.asunto, m.contenido from mensaje m where Face = m.idEmisor and Usuario_Agregado = m.idReceptor;
END //

## Proceso 8: Eliminar mensaje
drop procedure if exists eliminar_mensaje;
DELIMETER //
create procedure eliminar_mensaje (in id int)
begin
START TRANSACTION;
	IF(
	((select m.idMensaje from mensaje m where id = m.idMensaje ) is not null)
	) then
		delete from mensaje me where id = me.idMensaje;
			commit;
		else
			rollback;
		END IF;  
END //

## Proceso 9: Consultar todos los mensajes
drop procedure if exists consultar_todos_mensaje;
DELIMETER //
create procedure consultar_todos_mensaje (in Face int)
begin
	select cm.asunto, cm.contenido from mensaje cm where Face = cm.idEmisor;
END //

## Proceso 10: Consultar mensajes por estado (ej.. leídos, no leídos, enviado)
drop procedure if exists consultar_estado_mensaje;
DELIMETER //
create procedure consultar_estado_mensaje (in Face int, in Usuario_Agregado int, in IDmen int)
begin
	select cm.estado from mensaje ce where Face = ce.idEmisor and Usuario_Agregado = ce.idReceptor and IDmen = ce.idMensaje;
END //

##  Proceso 11: Consultar sitios por usuario
drop procedure if exists consultar_sitios_porUsuario;
DELIMETER //
create procedure consultar_sitios_porUsuarios(in idUsuario int)
begin
	select idSitio from sitios where idActividad in (select idActividad from preferenciasporusuario where idUsuario = idUsuario);
END //

##Proceso 12: Consultar sitios por actividad
drop procedure if exists consultar_sitios_porActividad;
DELIMETER //
create procedure consultar_sitio_porActividad(in idActividad int)
begin
	select idSitio from Sitio where idSitio = idActividad;
END //


##Proceso 13: Consultar sitios por direccion
drop procedure if exists consultar_sitio_porDireccion;
DELIMETER //
create procedure consultar_sitio_porDireccion(in direccionIN varchar(100))
begin
	select idSitio from sitio where direccion like direccionIN;
END//

##Proceso 14: Consultar sitios por horario de atencion
drop procedure if exists consultar_sitio_porHorarioAtencion;
DELIMETER //
create procedure consultar_sitio_porHorarioAtencion(in horaAperturaIN date, in horaCierreIN date)
begin 
	select idSitio from listahorarioatencion where idListaHorarioAtencion in(select idListaHorarioAtencion from horarioatencion where horaApertura >= horaAperturaIN and horaCierre <= horaCierreIN);
END//


##Proceso 15: Listar amigos
drop procedure if exists listar_amigos;
DELIMETER //
create procedure listar_amigos(in idUsuarioIN int)
begin
	select IF(idUsuario1 = idUsuarioIN, idUsuario2, idUsuario1) as idUsuariosAmigos from AMISTAD where idUsuario1 = idUsuarioIN or idUsuario2 = idUsuarioIN;
END //


## Proceso 16: Listar amigos recientes
drop procedure if exists listar_amigos_recientes;
DELIMITER //
create procedure listar_amigos_recientes(in idUsuarioIN int)
begin 
	select distinct IF(idReceptor = idUsuarioIN, idEmisor, idReceptor) as idAmigosRecientes from mensaje order by fecha DESC; 
end //
DELIMITER;


## Proceso 17: Buscar amigos por apellido
drop procedure if exists amigos_apellido;
DELIMITER //
create procedure amigos_apellido(in idUsuarioIN int, in apellidoIN varchar(50))
begin 
	select IF(a.idUsuario1 = idUsuarioIN, a.idUsuario2, a.idUsuario1) as idUsuariosAmigos from usuario as u, amistad as a where u.apellido like apellidoIN and ((idUsuario1 = idUsuarioIn or idUsuario1 = u.idUsuario ) and (idUsuario2 = idUsuarioIn or idUsuario2 = u.idUsuario));
end //
DELIMITER;

## Proceso 18: Consultar datos del usuario
drop procedure if exists consultar_datos_usuario;
DELIMITER //
create procedure consultar_datos_usuario(in idUsuarioIN int)
begin 
	select * from usuario where idUsuario = idUsuarioIN;
end //
DELIMITER;

## Proceso 19: Consultar lista de actividades del usuario
drop procedure if exists actividades_usuario;
DELIMITER //
create procedure actividades_usuario(in idUsuarioIN int)
begin 
	select a.nombre from preferenciasporusuario as pU, actividad as a  where pU.idUsuario = idUsuarioIN and a.idActividad = pU.idActividad;
end //
DELIMITER;

## Proceso 20: Consultar mensajes por estado (ej.. leídos, no leídos, enviado)
drop procedure if exists encontrar_compatibilidad;
DELIMITER //
create procedure encontrar_compatibilidad(in idUsuarioIN int, in nombreActividad varchar(100))
begin 
    select @idAct := idActividad from Actividad where nombre like nombreActividad;
    select IF(a.idUsuario1 = idUsuarioIN, a.idUsuario2, a.idUsuario1) as compatibles from preferenciasporusuario as pU, amistad as a where pU.idActividad = @idAct and (idUsuario1 = idUsuarioIn or idUsuario2 = idUsuarioIn) and a.estado like 'Aceptado';     
end //