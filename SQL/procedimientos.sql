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

DELIMITER;






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
	(@bloqueado is null)
	AND
	((select a.estado from amistad a where Face = a.idUsuario1 and Usuario_Agregado = a.idUsuario2) like 'Aceptado')

	) then

		select idMensaje into suma from mensaje group by idMensaje desc limit 1; 
		set @suma = @suma + 1 ;  
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

DELIMITER;







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

DELIMITER;






## Proceso 9: Consultar todos los mensajes



drop procedure if exists consultar_todos_mensaje;

DELIMETER //

create procedure consultar_todos_mensaje (in Face int)

begin

select cm.asunto, cm.contenido from mensaje cm where Face = cm.idEmisor

END //

DELIMITER;








## Proceso 10: Consultar mensajes por estado (ej.. leídos, no leídos, enviado)




drop procedure if exists consultar_estado_mensaje;

DELIMETER //

create procedure consultar_estado_mensaje (in Face int, in Usuario_Agregado int, in IDmen int)

begin

select cm.estado from mensaje ce where Face = ce.idEmisor and Usuario_Agregado = ce.idReceptor and IDmen = ce.idMensaje;

END //

DELIMITER;





