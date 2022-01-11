/*Proceso 9: Consultar todos los mensajes de un usuario*/
SELECT idMensaje
FROM MENSAJE
WHERE idReceptor = 1 || idEmisor = 1;

/*Proceso 15: Listar amigos*/
SELECT idAmistad, idUsuario1, idUsuario2
FROM AMISTAD
WHERE idUsuario1 = 1 || idUsuario2 = 1;

/*Proceso 16: Listar amigos recientes*/
SELECT idAmistad, idUsuario1, idUsuario2, fecha_envio_amistad
FROM AMISTAD
WHERE idUsuario1 = 1 || idUsuario2 = 1
AND fecha_envio_amistad < '2021-04-04' && fecha_envio_amistad > '2021-04-02';

/*Proceso 17: Buscar amigos por apellido*/
SELECT *
FROM AMISTAD 
WHERE (idUsuario1 in (
	SELECT idUsuario
	FROM USUARIO
	WHERE Apellido like "Lopez"
) AND idUsuario2 = 1) OR (idUsuario2 in (
	SELECT idUsuario
	FROM USUARIO
	WHERE Apellido like "Lopez")
	AND idUsuario1 = 1
);

