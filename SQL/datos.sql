
insert into  Usuario values (15468, 'El pepe', 'Potaxio', 'The dodo', 'Yo y los papus', NULL, 1);
insert into  Usuario values (15368, 'Ete sech', 'Potaxio remix', ':3', 'UwU', 15468, 0);
insert into  Usuario values (16868, 'Momasos', 'Eso tilin', 'Requisitos para ser mi duo', 'umu', 15468, 0);
insert into  Usuario values (19968, 'Cualquier cosa', 'Pan de pascua', 'hola', 'xd', 15468, 0);
insert into  Usuario values (19967, 'POU 2', 'gorila aplastar ciudad ataque prisión escapa juego', 'Artefacta', 'Creditos economicos', 15468, 0);

INSERT INTO MENSAJE VALUES 
(5004, '3-04-2021', 'Hola que pex', null, 'Saludos', 15468, 15368),
(5005, '3-04-2021', 'Pos aqui bien y tu?', null, 'RE: Saludos', 15368, 15468),
(5006, '4-04-2021', 'Checa este momazo wacho', '110 157 154 141 040 161 165 145 040 160 145 170', 'Checa el meme', 16868, 15368),
(5007, '4-04-2021', 'Arte de meme', null,'RE: Checa el meme', 15368, 16868),
(5008, '15-11-2021', 'Pandemiaa acabate porfavor', null, 'Pascuas we', 19968, 15468);

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