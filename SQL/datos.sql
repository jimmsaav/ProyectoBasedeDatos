insert into  Usuario values (1, 'Pedro', 'Zambrano', 'Alborada', 'Guayaquil', NULL, true);
insert into  Usuario values (2, 'Juan', 'Hidalgo', 'Ciudad del rio', 'Guayaquil', 1, false);
insert into  Usuario values (3, 'Carlos', 'Lopez', 'Mucho lote', 'Guayaquil', 1, false);
insert into  Usuario values (4, 'Francisco', 'Sven', 'La Joya', 'Guayaquil', 1, false);
insert into  Usuario values (5, 'Luis', 'Jimenez', 'Metropolis', 'Guayaquil', 1, false);
insert into  Usuario values (6, 'Elbert', 'Yturralde', 'Vista al Rio', 'Cuenca', NULL, false);
insert into  Usuario values (7, 'Pedro', 'Lopez', 'Los Sigsales', 'Cuenca', 6, false);
insert into  Usuario values (8, 'Jaime', 'Morales', 'San Blas', 'Cuenca', 6, false);
insert into  Usuario values (9, 'Angelica', 'Lopez', 'Jardines de la Sierra', 'Cuenca', 6, false);
insert into  Usuario values (10, 'Andrea', 'Castro', 'Los Sigsales', 'Cuenca', 6, false);
insert into  Usuario values (11, 'Sofia', 'Montero', 'San Blas', 'Cuenca', 6, false);
insert into  Usuario values (12, 'Francisco', 'Cruz', 'Ciudadela La Paz', 'Guayaquil', 1, false);
insert into  Usuario values (13, 'Ernesto', 'Andrade', 'Samanes 5', 'Guayaquil', 1, false);
insert into  Usuario values (14, 'Luis', 'Lopez', 'Parque Historico', 'Guayaquil', 1, false);
insert into  Usuario values (15, 'Emilio', 'Vera', 'Metropolis 2', 'Guayaquil', 1, false);
insert into  Usuario values (16, 'Pedro', 'Martinez', 'Los Sigsales', 'Cuenca', 6, false);
insert into  Usuario values (17, 'Jaime', 'Barroso', 'San Blas', 'Cuenca', 6, false);
insert into  Usuario values (18, 'Luisa', 'Lopez', 'Jardines de la Sierra', 'Cuenca', 6, false);
insert into  Usuario values (19, 'Isabela', 'Castro', 'Los Sigsales', 'Cuenca', 6, false);
insert into  Usuario values (20, 'Kiara', 'Montero', 'San Blas', 'Cuenca', 6, false);

INSERT INTO MENSAJE VALUES 
(1, '2021-04-03 13:25:45', 'Encontre un lugar bastante interesante en Guayaquil', null, 'Propuesta de viaje', 17, 16),
(2, '2021-04-03 13:30:12', 'Lo voy a revisar dame unos minutos', null, 'RE: Propuesta de viaje', 16, 17),
(3, '2021-04-03 13:45:11', 'Lo acabo de revisar, esta increible el lugar. Cuando lo vamos a visitar?', null, 'RE: Propuesta de viaje', 16, 17),
(4, '2021-04-03 15:03:12', 'Podemos ir a visitarlo mañana.', null,'RE: Propuesta de viaje', 17, 16),
(5, '2021-04-03 15:04:13', 'Hola, me gustaria saber si la iglesia de San Blas es bonito, ya que eres de Cuenca', null, 'Consulta sobre iglesia', 1, 7),
(6, '2021-04-03 15:04:13', 'Me parece bien, entonces mañana a las 10am nos encontramos alla', null, 'RE: Propuesta de viaje', 16, 17),
(7, '2021-04-03 15:04:13', 'Hola, el viaje de la otra vez estuvo interesante, te gustaria volver a pescar?', null, 'Pesca', 19, 20),
(8, '2021-04-03 15:04:13', 'Claro que si, de hecho estaba a punto de escribirte lo mismo.', null, 'RE: Pesca', 20, 19),
(9, '2021-04-03 15:04:13', 'Oye se te quedo tu mochila en mi carro cuando fuimos a excursionar.', null, 'Tu mochila', 13, 14),
(10, '2021-04-03 15:04:14', 'Claro, la iglesia es muy bonita, te la recomiendo mucho.', null, 'RE: Consulta sobre iglesia', 7, 1),
(11, '2021-04-03 15:04:14', 'Graciaaas... se me habia olvidado donde estaba.', null, 'RE: Tu mochila', 13, 14),
(12, '2021-04-03 15:04:14', 'Excelente, a las 5am entonces vayamos a pescar, te veo luego!', null, 'RE: Pesca', 19, 20),
(13, '2021-04-03 15:04:15', 'Muchas gracias, de verdad deseo conocer la iglesia, conoces otro lugar que puedas recomendar?', null, 'RE: Consulta sobre iglesia', 1, 7),
(14, '2021-04-03 15:04:19', 'Dale, hasta luego.', null, 'RE: Pesca', 20, 19),
(15, '2021-04-03 15:04:21', 'Si, te recomiendo visitar los parques de noche, son hermosos.', null, 'RE: Consulta sobre iglesia', 7, 1),
(16, '2021-04-05 16:04:13', 'Me parece bien, ire a visitar los parques tambien.', null, 'RE: Consulta sobre iglesia', 1, 7),
(17, '2021-04-05 16:04:13', 'Vi este sitio para poder visitar, creo que podria ser interesante.', null, 'Visita a Quito', 4, 10),
(18, '2021-04-05 16:05:21', 'Yap, ire a revisar eso, te respondo despues', null, 'RE: Visita a Quito', 4, 10),
(19, '2021-04-05 15:05:25', 'Termine de revisar los sitios, estan interesantes, lo podemos planificar?', null, 'RE: Visita a Quito', 4, 10),
(20, '2021-04-05 15:05:30', 'Claro, espero que podamos ir todos.', null, 'RE: Visita a Quito', 10, 4);

insert into Amistad values(1, 1, 2, '2021-04-03', 'Enviado' );
insert into Amistad values(2, 1, 3, '2021-04-03', 'Enviado' );
insert into Amistad values(3, 3, 4, '2021-04-03', 'Aceptado' );
insert into Amistad values(4, 3, 2, '2021-04-03', 'Aceptado' );
insert into Amistad values(5, 2, 4, '2021-04-03', 'Aceptado' );
insert into Amistad values(6, 2, 5, '2021-04-03', 'Enviado' );
insert into Amistad values(7, 2, 6, '2021-04-03', 'Aceptado' );
insert into Amistad values(8, 2, 7, '2021-04-03', 'Aceptado' );
insert into Amistad values(9, 7, 8, '2021-04-04', 'Enviado' );
insert into Amistad values(10, 7, 1,'2021-04-04', 'Aceptado' );
insert into Amistad values(11, 7, 3,'2021-04-04', 'Aceptado' );
insert into Amistad values(12, 7, 5,'2021-04-04', 'Aceptado' );
insert into Amistad values(13, 7, 9,'2021-04-04', 'Enviado' );
insert into Amistad values(14, 20, 2,'2021-04-04', 'Aceptado' );
insert into Amistad values(15, 20, 6, '2021-04-06', 'Enviado' );
insert into Amistad values(16, 20, 9, '2021-04-06', 'Aceptado' );
insert into Amistad values(17, 20, 11, '2021-04-10', 'Aceptado' );
insert into Amistad values(18, 20, 12, '2021-04-15', 'Enviado' );
insert into Amistad values(19, 14, 20, '2021-05-03', 'Aceptado' );
insert into Amistad values(20, 14, 19, '2021-05-10', 'Aceptado' );

insert into USUARIO_BLOQUEADO values (1, 1, 20);
insert into USUARIO_BLOQUEADO values (2, 2, 20);
insert into USUARIO_BLOQUEADO values (3, 3, 20);
insert into USUARIO_BLOQUEADO values (4, 4, 20);
insert into USUARIO_BLOQUEADO values (5, 5, 20);
insert into USUARIO_BLOQUEADO values (6, 6, 20);
insert into USUARIO_BLOQUEADO values (7, 7, 20);
insert into USUARIO_BLOQUEADO values (8, 8, 20);
insert into USUARIO_BLOQUEADO values (9, 9, 20);
insert into USUARIO_BLOQUEADO values (10, 10, 20);
insert into USUARIO_BLOQUEADO values (11, 11, 20);
insert into USUARIO_BLOQUEADO values (12, 12, 20);
insert into USUARIO_BLOQUEADO values (13, 13, 20);
insert into USUARIO_BLOQUEADO values (14, 14, 20);
insert into USUARIO_BLOQUEADO values (15, 15, 20);
insert into USUARIO_BLOQUEADO values (16, 16, 20);
insert into USUARIO_BLOQUEADO values (17, 20, 1);
insert into USUARIO_BLOQUEADO values (18, 20, 2);
insert into USUARIO_BLOQUEADO values (19, 20, 3);
insert into USUARIO_BLOQUEADO values (20, 20, 4);


insert into Asistencia values(1, '2021-02-26', 1, 1);
insert into Asistencia values(2, '2020-03-26', 2, 2);
insert into Asistencia values(3, '2021-02-26', 3, 3);
insert into Asistencia values(4, '2021-02-26', 4, 4);
insert into Asistencia values(5, '2021-02-26', 5, 5);
insert into Asistencia values(6, '2021-02-26', 6, 6);
insert into Asistencia values(7, '2021-02-26', 7, 7);
insert into Asistencia values(8, '2021-02-26', 8, 8);
insert into Asistencia values(9, '2021-02-26', 9, 9);
insert into Asistencia values(10, '2021-02-26', 10, 10);
insert into Asistencia values(11, '2021-02-26', 11, 11);
insert into Asistencia values(12, '2021-02-26', 12, 12);
insert into Asistencia values(13, '2021-02-26', 13, 13);
insert into Asistencia values(14, '2021-02-26', 14, 14);
insert into Asistencia values(15, '2021-02-26', 15, 15);
insert into Asistencia values(16, '2021-02-26', 16, 16);
insert into Asistencia values(17, '2021-02-26', 17, 17);
insert into Asistencia values(18, '2021-02-26', 18, 18);
insert into Asistencia values(19, '2021-02-26', 19, 19);
insert into Asistencia values(20, '2021-02-26', 20, 20);

insert into Sitio values(1, 'Samanes', 'Samanes 2', '0999999989', 1, 1, 'https://us05web.zoom.us/j/81990938475?pwd=VWZJMWkwOTdIT3d4Sm5LaDFUOUd3QT09', 'Zoom');
insert into Sitio values(2, 'Mucho lote', 'Mucho lote 4ta', '0699999999', 1, 2, 'https://us05web.zoom.us/j/81990938475?pwd=VWZJMWkwOTdIT3d4Sm5LaDFUOUd3QT09', 'Zoom');
insert into Sitio values(3, 'Sauces', 'Sauces 2', '0999999969', 1, 3, 'https://us05web.zoom.us/j/81990938475?pwd=VWZJMWkwOTdIT3d4Sm5LaDFUOUd3QT09', 'Zoom');
insert into Sitio values(4, 'Alborada', 'Alborada 2', '0999499999', 0, 4, 'https://us05web.zoom.us/j/81990938475?pwd=VWZJMWkwOTdIT3d4Sm5LaDFUOUd3QT09', 'Zoom');
insert into Sitio values(5, 'Sur', 'Sur 1', '0999992399', 1, 5, 'https://us05web.zoom.us/j/81990938475?pwd=VWZJMWkwfTdIT3d4Sm5LaDFUOUd3QT09', 'Zoom');
insert into Sitio values(6, 'Norte', 'Norte complejo', '0459999999', 1, 6, 'https://us05web.zoom.us/j/81990938475?pfd=hWZJMWkwOTdIT3d4Sm5LaDFUOUd3QT09', 'Zoom');
insert into Sitio values(7, 'Centro', 'Aurora y boyaca', '0679999999', 0, 7, 'https://us05web.zoom.us/j/81990938475?pwd=VWZJMWkwOTdIT3d4Sm5LaDFUOUd3QT09', 'Zoom');
insert into Sitio values(8, 'Aurora', 'Mz 2456 villa 3', '0997899999', 1, 8, 'https://us05web.zoom.us/j/81990938475?pwd=VWZJMWkwOTdIT3d4Sm5LaDFUOUd3QT09', 'Zoom');
insert into Sitio values(9, 'Sambo', 'Villa italia mz 34', '0989999999', 1, 9, 'https://us05web.zoom.us/j/81990938475?pwd=VWZJMWkwOTdIT3d4Sm5LaDFUOUd3QT09', 'Zoom');
insert into Sitio values(10, 'La Joya', 'Maz 34 villa diamante', '0989999999', 1, 10, 'https://us05web.zoom.us/j/81990938475?pwd=VWZJMWkwOTdIT3d4Sm5LaDFUOUd3QT09', 'Zoom');
insert into Sitio values(11, 'Villa del rey', 'Villa del rey 2', '0975999999', 0, 11, 'https://us05web.zoom.us/j/81990938475?pwd=VWZJMWkwOTdIT3d4Sm5LaDFUOUd3QT09', 'Zoom');
insert into Sitio values(12, 'Colinas', 'Colinas 2', '0999999659', 1, 12, 'https://us05web.zoom.us/j/81990938475?pwd=VWZJMWkwOTdIT3d4Sm5LaDFUOUd3QT09', 'Zoom');
insert into Sitio values(13, 'Ciudadela', 'Ciudadela 2', '0992399999', 1, 13, 'https://us05web.zoom.us/j/81990938475?pwd=VWZJMWkwOTdIT3d4Sm5LaDFUOUd3QT09', 'Zoom');
insert into Sitio values(14, 'Samna', 'Samna 2', '0999996599', 1, 14, 'https://us05web.zoom.us/j/81990938475?pwd=VWZJMWkwOTdIT3d4Sm5LaDFUOUd3QT09', 'Zoom');
insert into Sitio values(15, 'Riocentro', 'Norte Orellana', '0945699999', 0, 15, 'https://us05web.zoom.us/j/81990938475?pwd=VWZJMWkwOTdIT3d4Sm5LaDFUOUd3QT09', 'Zoom');
insert into Sitio values(16, 'Mall', 'Victor Emilio Estrada', '0439999999', 0, 16, 'https://us05web.zoom.us/j/81990938475?pwd=VWZJMWkwOTdIT3d4Sm5LaDFUOUd3QT09', 'Zoom');
insert into Sitio values(17, 'City mall', 'Junior 4ta etapa', '0994599999', 1, 17, 'https://us05web.zoom.us/j/81990938475?pwd=VWZJMWkwOTdIT3d4Sm5LaDFUOUd3QT09', 'Zoom');
insert into Sitio values(18, 'Alborada norte', 'ALborada 14va', '0919999999', 0, 18, 'https://us05web.zoom.us/j/81990938475?pwd=VWZJMWkwOTdIT3d4Sm5LaDFUOUd3QT09', 'Zoom');
insert into Sitio values(19, 'Centro sur', 'Centro entre aurora y emilio', '0996599999', 1, 19, 'https://us05web.zoom.us/j/81990938475?pwd=VWZJMWkwOTdIT3d4Sm5LaDFUOUd3QT09', 'Zoom');
insert into Sitio values(20, 'Noroeste', 'Noroeste 2', '0999993579', 0, 20, 'https://us05web.zoom.us/j/81990938475?pwd=VWZJMWkwOTdIT3d4Sm5LaDFUOUd3QT09', 'Zoom');


insert into actividad values(01, 'Caminar', 'Deporte', 8, 'Caminata suave en parque');
insert into actividad values(02, 'Bailar', 'Socializar', 8, 'Baile en mi casa');
insert into actividad values(03, 'Futbol', 'Deporte', 8, 'Futbol cerca del parque, hay una cancha');
insert into actividad values(04, 'Basquetball', 'Deporte', 8, 'Jugar en cancha');
insert into actividad values(05, 'Natacion', 'Deporte', 8, 'Nadar en mi casa');
insert into actividad values(06, 'Cafe y hablar', 'Socializar', 8, 'Caminata suave en parque');
insert into actividad values(08, 'Trotar', 'Deporte', 8, 'Trotar suave en parque');
insert into actividad values(09, 'Bingo', 'Negocios', 8, 'Bingo millonario');
insert into actividad values(10, 'Caminar', 'Deporte', 8, 'Caminata suave en parque');
insert into actividad values(11, 'Cafe y hablar', 'Socializar', 8, 'Caminata suave en parque');
insert into actividad values(12, 'Tennis', 'Deporte', 8, 'Tennis en el patio de la casa');
insert into actividad values(13, 'Caminar', 'Deporte', 8, 'Caminata suave en parque');
insert into actividad values(14, 'Ajedrez', 'Deporte', 8, 'Ajedrez en mesa del parque');
insert into actividad values(15, 'Pin Pon', 'Deporte', 8, 'Pin Pon en casa de admin');
insert into actividad values(16, 'Soccer', 'Deporte', 8, 'Soccer en cancha');
insert into actividad values(17, 'Parchis', 'Varios', 8, 'Parchis y cafe');
insert into actividad values(18, 'UNO', 'Varios', 8, 'Cartas uno');
insert into actividad values(19, 'Monopolio', 'Varios', 8, 'Jugar monopolio');
insert into actividad values(20, 'XD', 'Socializar', 8, 'Hablar y reir');



