 USE labo;   

-- Empiezo con la insercion de datos en mis tablas


-- Agrego los datos a la tabla clientes.
INSERT INTO clientes(nombre_cliente, direccion_cliente, cant_equipos, telefono, email)
	VALUES  ('Nudo', 'Lavalle 482', 40, 11234562, 'nudo_lavalle482@gmail.com' ),
			('Saleros', 'Rivadavia 6482', 0, 1542285562, 'Saleros_sa@gmail.com' ),
            ('NudoSA', 'Cordoba 4682', 70, 154123362, 'Nudosa_1950@gmail.com' ),
            ('Magnetic', 'Rivadavia 5531', 20, 1581945456, 'magnetic.sa@gmail.com' ),
            ('imperial', 'Alverdi 4322', 40, 1517892652, 'imperial.cop@gmail.com' );

-- Agrego los datos a la tabla equipos.

INSERT INTO equipos 
	VALUES	(877,1,'con5000'),
			(871,7,'con5000'),
			(830,1,'con5000'),
			(882,9,'Val4000'),
			(860,1,'Val4000'),
			(831,9,'Val4000'),
			(800,8,'Val4000'),
			(832,8,'Val4000'),
			(806,8,'Val4000'),
			(816,1,'con5000');

-- Agrego los datos a la tabla stock.
INSERT INTO stock
	VALUES	(879594,'componente1', 1000),
			(8724,'componente2', 455),
			(87394,'componente3', 134),
			(12879594,'componente4',989),
			(2319594,'componente5',700),
			(83694,'componente6',250);
		

-- Agrego los datos a la tabla equipos


INSERT INTO reparaciones (num_serie, coste, id_componente)
	VALUES 	(877, 67, 879594),
			(877, 23, 8724),
			(882, 26, 87394),
			(806, 1300, 12879594),
			(816, 30, 2319594),
			(816, 156, 83694);
	
    -- Agrego los datos a la tabla tecnicos
INSERT INTO tecnicos (nom_tecnico, apel_tecnico, telefono, direccion, email)
	VALUES	 	('Olivette', 'Greatland', '234-480-3344', 'Suite 32', 'ogreatland0@theglobeandmail.com'),
				('Gipsy', 'Langston', '792-584-7327', 'Suite 30', 'glangston1@1688.com'),
				('Marga', 'Osborne', '387-513-5030', 'Room 1340', 'mosborne2@cyberchimps.com'),
				('Wallis', 'Cardon', '684-770-2065', 'Suite 57', 'wcardon3@godaddy.com'),
				('Dorette', 'Trussman', '311-292-9483', 'PO Box 17357', 'dtrussman4@google.com.au'),
				('Selinda', 'Jenkyn', '799-884-0452', 'Suite 86', 'sjenkyn5@house.gov'),
				('Susan', 'Wolfendale', '981-829-6213', 'Suite 30', 'swolfendale6@tinypic.com'),
				('Mella', 'Guiton', '774-643-9556', 'Room 1571', 'mguiton7@ycombinator.com'),
				('Kilian', 'Meak', '744-506-1332', 'Room 1964', 'kmeak8@dion.ne.jp'),
				('Dusty', 'Merigot', '564-361-0014', 'PO Box 84359', 'dmerigot9@thetimes.co.uk');
	
    
    -- Agrego los datos de la cantidad de ingresos que va teniendo el equipo
INSERT INTO cant_ingresos (num_serie, fecha_ingreso)
	VALUES 	(806,'2022-10-03'),
			(806,'2023-01-12'),
			(882,'2020-06-06'),
			(806,'2015-07-14'),
			(806,'2023-03-16'),
            (882,'2019-10-18'),
            (882,'2022-12-18'),
            (816,'2018-12-09');

INSERT INTO historial (num_serie, fecha_egreso, legajo)
	VALUES	(877, '2023-03-14', 7),
			(877, '2022-10-09', 2),
            (882, '2015-03-31', 7),
            (882, '2018-02-05', 5),
            (806, '2023-04-02', 5),
            (806, '2023-01-11', 5),
            (816, '2022-12-23', 2),
            (816, '2022-11-24', 1),
            (877, '2021-09-04', 7);

