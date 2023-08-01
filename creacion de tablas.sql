                                                                              -- Creacion de tablas.



-- Selecciono la BD lado.
USE labo;



-- Creo la tabla clientes.
CREATE TABLE IF NOT EXISTS clientes (
	n_cliente INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    nombre_cliente VARCHAR (50) NOT NULL,
    direccion_cliente VARCHAR (50) NOT NULL,
    cant_equipos INT NOT NULL,
	telefono INT NOT NULL);
 
 
 -- Creo la tabla equipos.   
CREATE TABLE IF NOT EXISTS equipos (
	num_serie INT NOT NULL UNIQUE PRIMARY KEY,
    n_cliente INT NOT NULL,
    nombre VARCHAR (30) NOT NULL,
    nescripcion VARCHAR (145),
    FOREIGN KEY (n_cliente)
		REFERENCES clientes (n_cliente)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);



-- Creo la tabla tecnicos.
CREATE TABLE IF NOT EXISTS tecnicos (
	legajo INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    nom_tecnico VARCHAR (60) NOT NULL,
    apel_tecnico VARCHAR (20) NOT NULL,
    telefono INT NOT NULL,
    direccion VARCHAR (80) NOT NULL
);


-- Creo la tabla stock.
CREATE TABLE IF NOT EXISTS stock (
	id_componente INT NOT NULL UNIQUE auto_increment,
    nom_comp VARCHAR (50) NOT NULL,
    cant INT NOT NULL
);



-- Creo la tabla reparaciones.
CREATE TABLE IF NOT EXISTS reparaciones (
	id_reparacion INT NOT NULL UNIQUE auto_increment,
    num_serie INT NOT NULL ,
    coste INT NOT NULL,
    id_componente INT NOT NULL,
    foreign key (num_serie) references equipos (num_serie)
		ON DELETE CASCADE
        ON UPDATE CASCADE,
	foreign key (id_componente) references stock (id_componente)
		ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- creo una tabla donde poner los ingresos
CREATE TABLE IF NOT EXISTS cant_ingresos(
	id_ingreso INT NOT NULL UNIQUE auto_increment,
    num_serie INT NOT NULL,
	fecha_ingreso DATE,
    FOREIGN KEY (num_serie) REFERENCES reparaciones (num_serie)
		ON DELETE CASCADE
        ON UPDATE CASCADE
    );
    
    
    -- creo una tabla con el legajo y el equipo que asumio
CREATE TABLE IF NOT EXISTS historial (
	id_historial INT NOT NULL UNIQUE AUTO_INCREMENT,
    num_serie INT NOT NULL,
    fecha_egreso DATE,
    legajo INT NOT NULL    
    );