insert into  Usuario values (1, 'Pedro', 'Zambrano', 'Alborada', 'Guayaquil', NULL, true);
insert into  Usuario values (2, 'Juan', 'Hidalgo', 'Ciudad del rio', 'Guayaquil', 15468, false);
insert into  Usuario values (3, 'Carlos', 'Franco', 'Mucho lote', 'Guayaquil', 15468, false);
insert into  Usuario values (4, 'Francisco', 'Sven', 'La Joya', 'Guayaquil', 15468, false);
insert into  Usuario values (5, 'Luis', 'Jimenez', 'Metropolis', 'Guayaquil', 15468, false);
insert into  Usuario values (6, 'Elbert', 'Yturralde', 'Vista al Rio', 'Cuenca', 15468, false);
insert into  Usuario values (7, 'Pedro', 'Asturias', 'Los Sigsales', 'Cuenca', 15468, false);
insert into  Usuario values (8, 'Jaime', 'Morales', 'San Blas', 'Cuenca', 15468, false);
insert into  Usuario values (9, 'Angelica', 'Lopez', 'Jardines de la Sierra', 'Cuenca', 15468, false);
insert into  Usuario values (10, 'Andrea', 'Castro', 'Los Sigsales', 'Cuenca', 15468, false);
insert into  Usuario values (11, 'Sofia', 'Montero', 'San Blas', 'Cuenca', 15468, false);
insert into  Usuario values (12, 'Francisco', 'Cruz', 'Ciudadela La Paz', 'Guayaquil', 15468, false);
insert into  Usuario values (13, 'Ernesto', 'Andrade', 'Samanes 5', 'Guayaquil', 15468, false);
insert into  Usuario values (14, 'Luis', 'Lisboa', 'Parque Historico', 'Guayaquil', 15468, false);
insert into  Usuario values (15, 'Emilio', 'Vera', 'Metropolis 2', 'Guayaquil', 15468, false);
insert into  Usuario values (16, 'Pedro', 'Martinez', 'Los Sigsales', 'Cuenca', 15468, false);
insert into  Usuario values (17, 'Jaime', 'Barroso', 'San Blas', 'Cuenca', 15468, false);
insert into  Usuario values (18, 'Luisa', 'Lopez', 'Jardines de la Sierra', 'Cuenca', 15468, false);
insert into  Usuario values (19, 'Isabela', 'Castro', 'Los Sigsales', 'Cuenca', 15468, false);
insert into  Usuario values (20, 'Kiara', 'Montero', 'San Blas', 'Cuenca', 15468, false);

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
(16, '2021-04-05 16:04:13', 'Pandemiaa acabate porfavor', null, 'Pascuas we', 19968, 15468),
(17, '2021-04-05 16:04:13', 'Pandemiaa acabate porfavor', null, 'Pascuas we', 19968, 15468),
(18, '2021-04-05 16:05:21', 'Pandemiaa acabate porfavor', null, 'Pascuas we', 19968, 15468),
(19, '2021-04-05 15:05:25', 'Pandemiaa acabate porfavor', null, 'Pascuas we', 19968, 15468),
(20, '2021-04-05 15:05:30', 'Pandemiaa acabate porfavor', null, 'Pascuas we', 19968, 15468);

insert into Amistad values(1010, 15468, 15368, '3-04-2021', 'Enviado' );
insert into Amistad values(1013, 15368, 16868, '23-11-2021', 'Enviado' );
insert into Amistad values(1016, 16868, 19968, '26-02-2021', 'Aceptado' );
insert into Amistad values(1019, 19968, 19967, '28-07-2021', 'Aceptado' );
insert into Amistad values(1022, 19967, 15468, '12-03-2021', 'Aceptado' );

insert into USUARIO_BLOQUEADO values (1200, 15468, 15368);
insert into USUARIO_BLOQUEADO values (1300, 15368, 19967);
insert into USUARIO_BLOQUEADO values (1400, 19967, 15468);
insert into USUARIO_BLOQUEADO values (1500, 15468, 19967);
insert into USUARIO_BLOQUEADO values (1600, 19967, 15368);