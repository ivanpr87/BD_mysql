-- Implementacion de sentencias.
-- Ivan Bastos

CREATE USER 'Pepito'@'localhost' IDENTIFIED BY '1234'; -- Creo el usuario Pepito y su correspondiente contraseña.

GRANT SELECT ON servicio_tecnico.* TO 'Pepito'@'localhost'; -- le di solamente permisos de lectura con "select" a Pepito

CREATE USER 'YO'@'localhost' IDENTIFIED BY '12345'; -- Creo el usuario YO y su correspondiente contraseña.

GRANT SELECT, INSERT, UPDATE ON servicio_tecnico.* TO 'YO'@'localhost'; -- Le di permisos de lectura con "Select", le di permisos de insercion con "Insert", le di permisos de modificacion con "Update" al usuario YO.
