##Proceso numero 1 ... Cambiar entre usuario bloqueado y alterar tabla de amistad 


DELIMITER $$
CREATE TRIGGER 'actualizarAmigo'
AFTER INSERT ON 'USUARIO_BLOQUEADO' 
FOR EACH ROW
BEGIN
 	
	delete from Amistad am where new.idUsuarioBloquea = am.idUsuario1 and new.idUsuarioBloqueado = am.idUsuario2;

END$$
DELIMITER ;
