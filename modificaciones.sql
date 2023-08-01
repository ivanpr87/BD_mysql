USE labo;



-- Agrego algunas columnas que me parecieron necesarias a las tablas.

-- agrego la comumna email
ALTER TABLE  clientes 
	ADD COLUMN email VARCHAR (40) NOT NULL UNIQUE;
    
-- elemino la columna nescripsion porque estaba mal escrita
ALTER TABLE equipos
	DROP nescripcion;

-- agrego la columna descricion
ALTER TABLE equipos
	ADD descripcion VARCHAR (50);

-- agrego la comumna email 
ALTER TABLE tecnicos 
	ADD COLUMN email VARCHAR (40) NOT NULL UNIQUE;

-- modifico al varchar la columna telefono ya qeu estaba como int
ALTER TABLE tecnicos 
	MODIFY COLUMN telefono VARCHAR (40) NOT NULL UNIQUE;




    
    
-- modifico el valor de un dato porque le pifie y no me di cuenta.

UPDATE CLIENTES
SET telefono = 1123456243
WHERE email = 'nudo_lavalle482@gmail.com';

UPDATE CLIENTES
SET telefono = 1541233622
WHERE n_cliente = 8;