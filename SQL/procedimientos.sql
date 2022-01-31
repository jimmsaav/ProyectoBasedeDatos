use tliving;

drop procedure if exists ingresar_usuario;
drop procedure if exists ingresar_actividad;
drop procedure if exists añadir_amigo;
drop procedure if exists añadir_sitio;
drop procedure if exists mandar_mensaje;
drop procedure if exists consultar_mensaje;
drop procedure if exists eliminar_mensaje;
drop procedure if exists listar_amigos_recientes;
drop procedure if exists consultar_todos_mensaje;
drop procedure if exists consultar_estado_mensaje;
drop procedure if exists consultar_sitios_porUsuarios;
drop procedure if exists consultar_sitio_porActividad;
drop procedure if exists consultar_sitio_porDireccion;
drop procedure if exists consultar_sitio_porHorarioAtencion;
drop procedure if exists listar_amigos;
drop procedure if exists listar_amigos_recientes;
drop procedure if exists amigos_apellido;
drop procedure if exists consultar_datos_usuario;
drop procedure if exists actividades_usuario;
drop procedure if exists encontrar_compatibilidad;

##1
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

call ingresar_usuario(434343434, 'Juan', 'Felipe', 'Juan@correo.ec', 19, 'samanes 123', 'Guayaquil', null, false);
## 2 


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

call ingresar_actividad('correr con patos', 'Deporte', 5, 'Salir a correr junto a patos');
##3

DELIMITER //
create procedure añadir_amigo(IN idUsuario1_in INT, IN idUsuario2_in INT, IN fecha_envio_amistad_in date, IN estado_in varchar(100))
begin
DECLARE suma1 INT;
select idAmistad into suma1 from AMISTAD order by idAmistad desc limit 1;
set suma1 = suma1 + 1;
INSERT into AMISTAD (idAmistad, idUsuario1, idUsuario2, fecha_envio_amistad, estado)
values (suma1, idUsuario1_in, idUsuario2_in, fecha_envio_amistad_in, estado_in);
		
END //

call añadir_amigo(35, 23, '2021-04-03', 'aceptado');

##5

DELIMITER //
create procedure añadir_sitio(IN nombre_in varchar(100), IN direccion_in varchar(100), IN numero_contacto_in varchar(100), IN sala_virtual_in tinyint(1), IN idActividad_in INT, IN link_in varchar(500), IN plataforma_in varchar(100))
begin
declare suma2 int;
declare dir varchar(100);
select si.direccion into dir from SITIO si where si.direccion like direccion_in;
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

call añadir_sitio ('samanes', 'Samanes 2', '098978675', 0, 3, null, null);



##6

DELIMITER //
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
DELIMITER ;

call mandar_mensaje(34,21, 'Hola como estas?', 'Hablar', 'Leído', '2021-04-03 13:25:45');


## Proceso numero 7

DELIMITER //

create procedure consultar_mensaje (in Face int, in Usuario_Agregado INT)
begin
select m.asunto, m.contenido from mensaje m where Face = m.idEmisor and Usuario_Agregado = m.idReceptor;
END //

call consultar_mensaje(16, 17);
## Proceso 8: Eliminar mensaje

DELIMITER //
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

call eliminar_mensaje(34);

## Proceso 9: Consultar todos los mensajes

DELIMITER //
create procedure consultar_todos_mensaje (in Face int)
begin
select cm.asunto, cm.contenido from mensaje cm where Face = cm.idEmisor;
END //

call consultar_todos_mensaje(12);


## Proceso 10: Consultar mensajes por estado (ej.. leídos, no leídos, enviado)

DELIMITER //
create procedure consultar_estado_mensaje (in Face int, in Usuario_Agregado int, in IDmen int)
begin
select ce.estado from mensaje ce where Face = ce.idEmisor and Usuario_Agregado = ce.idReceptor and IDmen = ce.idMensaje;
END //

call consultar_estado_mensaje(19, 20, 12);

##  Proceso 11: Consultar sitios por usuario

DELIMITER //
create procedure consultar_sitios_porUsuarios(in idUsuario int)
begin
	select idSitio from sitios where idActividad in (select idActividad from preferenciasporusuario where idUsuario = idUsuario);
END //

call consultar_sitios_porUsuarios(12);

##Proceso 12: Consultar sitios por actividad

DELIMITER //
create procedure consultar_sitio_porActividad(in idActividad int)
begin
	select idSitio from Sitio where idSitio = idActividad;
END //

call consultar_sitio_porActividad(23);


##Proceso 13: Consultar sitios por direccion

DELIMITER //
create procedure consultar_sitio_porDireccion(in direccionIN varchar(100))
begin
	select idSitio from sitio where direccion like direccionIN;
END//

call consultar_sitio_porDireccion('Samanes 2');

##Proceso 14: Consultar sitios por horario de atencion

DELIMITER //
create procedure consultar_sitio_porHorarioAtencion(in horaAperturaIN date, in horaCierreIN date)
begin 
	select idSitio from listahorarioatencion where idListaHorarioAtencion in(select idListaHorarioAtencion from horarioatencion where horaApertura >= horaAperturaIN and horaCierre <= horaCierreIN);
END//

call consultar_sitio_porHorarioAtencion('2021-04-09 13:25:45','2021-04-09 16:25:45');


##Proceso 15: Listar amigos

DELIMITER //
create procedure listar_amigos(in idUsuarioIN int)
begin
	select IF(idUsuario1 = idUsuarioIN, idUsuario2, idUsuario1) as idUsuariosAmigos from AMISTAD where idUsuario1 = idUsuarioIN or idUsuario2 = idUsuarioIN;
END //

call listar_amigos(12);




## Proceso 16: Listar amigos recientes

DELIMITER //
create procedure listar_amigos_recientes(in idUsuarioIN int)
begin 
	select distinct IF(idUsuario1 = idUsuarioIN, idUsuario2, idUsuario1) as idAmigosRecientes from amistad where (idUsuario1 = idUsuarioIN or idUsuario2 = idUsuarioIN) and estado like 'Aceptado' order by fecha_envio_amistad DESC; 
end //
DELIMITER;

call listar_amigos_recientes(12);
## Proceso 17: Buscar amigos por apellido

DELIMITER //
create procedure amigos_apellido(in idUsuarioIN int, in apellidoIN varchar(50))
begin 
	select IF(a.idUsuario1 = idUsuarioIN, a.idUsuario2, a.idUsuario1) as idUsuariosAmigos from usuario as u, amistad as a where u.apellido like apellidoIN and ((idUsuario1 = idUsuarioIn or idUsuario1 = u.idUsuario ) and (idUsuario2 = idUsuarioIn or idUsuario2 = u.idUsuario));
end //

call amigos_apellido(1, 'Hidalgo');

## Proceso 18: Consultar datos del usuario

DELIMITER //
create procedure consultar_datos_usuario(in idUsuarioIN int)
begin 
	select * from usuario where idUsuario = idUsuarioIN;
end //

call consultar_datos_usuario(23);
## Proceso 19: Consultar lista de actividades del usuario

DELIMITER //
create procedure actividades_usuario(in idUsuarioIN int)
begin 
	select a.nombre from preferenciasporusuario as pU, actividad as a  where pU.idUsuario = idUsuarioIN and a.idActividad = pU.idActividad;
end //

call actividades_usuario(23);

## Proceso 20: Consultar mensajes por estado (ej.. leídos, no leídos, enviado)

DELIMITER //
create procedure encontrar_compatibilidad(in idUsuarioIN int, in nombreActividad varchar(100))
begin 
    select @idAct := idActividad from Actividad where nombre like nombreActividad;
    select IF(a.idUsuario1 = idUsuarioIN, a.idUsuario2, a.idUsuario1) as compatibles from preferenciasporusuario as pU, amistad as a where pU.idActividad = @idAct and (idUsuario1 = idUsuarioIn or idUsuario2 = idUsuarioIn) and a.estado like 'Aceptado';     
end //

call encontrar_compatibilidad(12, 'Caminar');
