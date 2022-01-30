use tliving;

#1
drop procedure if exists ingresar_usuario;
DELIMITER //
create procedure ingresar_usuario(IN cedula INT, IN nombre varchar(50), IN apellido varchar(50), IN correo varchar(50), IN edad INT ,
IN direccion varchar(60), IN ciudad varchar(40), IN moderador INT, IN es_moderador tinyint(1) )
begin
DECLARE suma int;
DECLARE usuario int;
select us.idUsuario into usuario from USUARIO us where id_usuario_in = us.idUsuario;
	START TRANSACTION;
	IF(
	(@usuario is null)
	AND
	((select us.edad from USUARIO us where edad = us.edad and edad>=18))
	) then
    select idUsuario into suma from USUARIO group by idUsuario desc limit 1;
	set @suma = @suma + 1;
		INSERT into USUARIO (idUsuario, cedula, nombre, apellido, correo, edad, direccion, ciudad, moderador, es_moderador)
		values (suma, cedula, nombre, apellido, correo, edad, direccion, ciudad, moderador, es_moderador);
		commit;
		else
		rollback;
		END IF;

END //
DELIMITER;

#2 
drop procedure if exists ingresar_actividad;
DELIMITER //
create procedure ingresar_actividad(IN nombre varchar(80), IN tipo varchar(50), IN cantidad_participantes INT, IN descripcion varchar(100))
begin
DECLARE suma INT;
select idActividad into suma from ACTIVIDAD group by idActividad desc limit 1;
set @suma = @suma + 1;
INSERT into ACTIVIDAD (idActividad, nombre, tipo, cantidad_participantes, descripcion)
values (suma, nombre, tipo, cantidad_participantes, descripcion);
commit;
		
END //

#3
drop procedure if exists añadir_amigo;
DELIMITER //
create procedure añadir_amigo(IN idUsuario1_in INT, IN idUsuario2_in INT, IN fecha_envio_amistad_in date, IN estado_in varchar(100))
begin
DECLARE suma INT;
select idAmistad into suma from AMISTAD group by idAmistad desc limit 1;
set @suma = @suma + 1;
INSERT into AMISTAD (idAmistad, idUsuario1, idUsuario2, fecha_envio_amistad, estado)
values (suma, idUsuario1_in, idUsuario2_in, fecha_envio_amistad_in, estado_in);
		
END //

##6

drop procedure if exists mandar_mensaje;

DELIMETER //

create procedure mandar_mensaje (in Face int, in Usuario_Agregado INT, in texto_mensaje varchar(1000), in tema varchar(50), in esta varchar(15), in datos_horario datetime)

begin
DECLARE suma int;
DECLARE bloqueado int;

select ub.id_bloqueo into bloqueado from USUARIO_BLOQUEADO ub where Face = ub.idUsuarioBloquea and Usuario_Agregado = ub.idUsuarioBloqueadol;


	START TRANSACTION;
	IF(
	(@bloqueado is null)
	AND
	((select a.estado from amistad a where Face = a.idUsuario1 and Usuario_Agregado = a.idUsuario2) like 'Aceptado')

	) then

		select idMensaje into suma from mensaje group by idMensaje desc limit 1;
		set @suma = @suma + 1;  
		insert into mensaje(idMensaje, fecha, contenido, asunto, estado, idReceptor, idEmisor) 
		values (suma, datos_horario, texto_mensaje, tema, esta, Usuario_Agregado, Face);
			commit;
		else
			rollback;
		END IF;






END //

DELIMITER;






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

DELIMITER,


## Proceso 20: Consultar compatibilidad de actividades (dada una actividad, mostrar todos los usuarios amigos que son compatibles)
drop procedure if exists encontrar_compatibilidad;

DELIMITER //
create procedure encontrar_compatibilidad(in idUsuarioIN int, in nombreActividad varchar(100))
begin 
    select @idAct := idActividad from Actividad where nombre like nombreActividad;
    select IF(a.idUsuario1 = idUsuarioIN, a.idUsuario2, a.idUsuario1) as compatibles from preferenciasporusuario as pU, amistad as a where pU.idActividad = @idAct and (idUsuario1 = idUsuarioIn or idUsuario2 = idUsuarioIn) and a.estado like 'Aceptado';     
end //

