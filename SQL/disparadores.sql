
##Proceso numero 1 ... Cambiar amigo a bloqueado y actualizar tabla Amistad


DELIMITER $$
CREATE TRIGGER 'actualizarBloqueado'
AFTER INSERT ON 'USUARIO_BLOQUEADO' 
FOR EACH ROW
BEGIN
 	
	delete from Amistad am where new.idUsuarioBloquea = am.idUsuario1 and new.idUsuarioBloqueado = am.idUsuario2;

END$$
DELIMITER ;








##Proceso numero 2 ... Cambiar amigo bloqueado a nuevamente en lista de amigos -- Cambio de bloqueado a Amistad


DELIMITER $$
CREATE TRIGGER 'actualizarAmigo'
AFTER INSERT ON 'Amistad' 
FOR EACH ROW
BEGIN
 	
	delete from USUARIO_BLOQUEADO ub where new.idUsuario1 = ub.idUsuarioBloquea and ub.idUsuarioBloqueado = new.idUsuario2;

END$$
DELIMITER ;




