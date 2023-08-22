USE servicio_tecnico;


-- Iniciar la transacción
START TRANSACTION;

-- Borrar los registros de la tabla "Components"
DELETE FROM Components WHERE id_component = 13;
DELETE FROM Components WHERE id_component = 16;
-- revertir la transacción
ROLLBACK;
-- Si todo está bien, confirmar la transacción
COMMIT;



-- Iniciar la transacción
START TRANSACTION;

-- Insertar nuevos registros en la tabla "Customers"
INSERT INTO Customers (name, address, phone, email)
VALUES 	('Nuevo Cliente 3', 'Dirección 3', '123-456-7893', 'nuevo3@gmail.com'),
		('Nuevo Cliente 4', 'Dirección 4', '123-456-7894', 'nuevo4@gmail.com'),
        ('Nuevo Cliente 5', 'Dirección 5', '123-456-7895', 'nuevo5@gmail.com'),
        ('Nuevo Cliente 6', 'Dirección 6', '123-456-7896', 'nuevo6@gmail.com');

-- Crear un punto de guardado (SAVEPOINT)
SAVEPOINT after_insert_1;

-- Insertar otro nuevo registro
INSERT INTO Customers (name, address, phone, email)
VALUES 	('Nuevo Cliente 7', 'Dirección 7', '987-654-3217', 'nuevo7@gamil.com'),
		('Nuevo Cliente 8', 'Dirección 8', '987-654-3218', 'nuevo8@gamil.com'),
        ('Nuevo Cliente 9', 'Dirección 9', '987-654-3219', 'nuevo9@gamil.com'),
        ('Nuevo Cliente 10', 'Dirección 10', '987-654-3220', 'nuevo10@gamil.com');

-- Eliminar el punto de guardado después de insertar los primeros 4 registros
-- RELEASE SAVEPOINT after_insert_1;

-- Si algo sale mal, revertir a after_insert_1
-- ROLLBACK TO after_insert_1;

-- Confirmar la transacción
COMMIT;




