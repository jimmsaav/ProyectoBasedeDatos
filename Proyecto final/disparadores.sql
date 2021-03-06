<<<<<<< HEAD:Proyecto final/disparadores.sql
use tliving;
drop trigger if exists actualizarBloqueado;
drop trigger if exists actualizarAmigo;
drop trigger if exists MensajeError;

##TRIGGER numero 1 ... Cambiar amigo a bloqueado y actualizar tabla Amistad
DELIMITER $$
CREATE TRIGGER actualizarBloqueado
AFTER INSERT ON USUARIO_BLOQUEADO
FOR EACH ROW
BEGIN
 	
	delete from Amistad am where new.idUsuarioBloquea = am.idUsuario1 and new.idUsuarioBloqueado = am.idUsuario2;

END$$
DELIMITER ;

##TRIGGER numero 2 ... Cambiar amigo bloqueado a nuevamente en lista de amigos -- Cambio de bloqueado a Amistad
DELIMITER $$
CREATE TRIGGER actualizarAmigo
AFTER INSERT ON Amistad
FOR EACH ROW
BEGIN
 	
	delete from USUARIO_BLOQUEADO ub where new.idUsuario1 = ub.idUsuarioBloquea and ub.idUsuarioBloqueado = new.idUsuario2;

END$$
DELIMITER ;

##TRIGGER 3 ... Mandar mensaje si un un sitio se encuentra repetido en la base de datos 
DELIMITER $$
CREATE TRIGGER MensajeError
BEFORE INSERT ON Sitio
FOR EACH ROW
BEGIN 
	if ((select idSitio from sitio where new.direccion like direccion) is not null) then
		SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Sitio repetido';
	end if;
END$$





=======
use tliving;
##TRIGGER numero 1 ... Cambiar amigo a bloqueado y actualizar tabla Amistad


DELIMITER $$
CREATE TRIGGER actualizarBloqueado
AFTER INSERT ON USUARIO_BLOQUEADO
FOR EACH ROW
BEGIN
 	
	delete from Amistad am where new.idUsuarioBloquea = am.idUsuario1 and new.idUsuarioBloqueado = am.idUsuario2;

END$$
DELIMITER ;








##TRIGGER numero 2 ... Cambiar amigo bloqueado a nuevamente en lista de amigos -- Cambio de bloqueado a Amistad


DELIMITER $$
CREATE TRIGGER actualizarAmigo
AFTER INSERT ON Amistad
FOR EACH ROW
BEGIN
 	
	delete from USUARIO_BLOQUEADO ub where new.idUsuario1 = ub.idUsuarioBloquea and ub.idUsuarioBloqueado = new.idUsuario2;

END$$
DELIMITER ;










##TRIGGER 3 ... Mandar mensaje si un un sitio se encuentra repetido en la base de datos 

DELIMITER $$

CREATE TRIGGER MensajeError
BEFORE INSERT ON Sitio
FOR EACH ROW
BEGIN
	IF( (select st.direccion from Sitio st where new.direccion = st.direccion) is not null)
		then

			DECLARE
  			msg VARCHAR(255);

			SET msg = CONCAT('El sitio ingresado esta repetido ', new.direccion);
			SIGNAL SQLSTATE '45000' SET message_text = msg;

	END IF;


END$$
DELIMITER ;




>>>>>>> 9100a490fd2675b09e46122972858909b0eb339e:SQL/disparadores.sql
