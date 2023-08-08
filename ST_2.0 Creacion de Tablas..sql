
-- creo base de datos
CREATE DATABASE servicio_tecnico;
USE servicio_tecnico;

-- Tabla clientes
CREATE TABLE Customers (
    id_customer INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    address VARCHAR(200),
    phone VARCHAR(20),
    email VARCHAR(100)
);

-- Tabla equipos
CREATE TABLE Equipment (
    id_equipment INT AUTO_INCREMENT PRIMARY KEY,
    brand VARCHAR(100) NOT NULL,
    model VARCHAR(100),
    serial_number VARCHAR(50),
    id_customer INT,
    FOREIGN KEY (id_customer) REFERENCES Customers(id_customer)
);


-- Tabla componentes
CREATE TABLE Components (
    id_component INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description VARCHAR(200)
);

-- Tabla reparacion
CREATE TABLE Repairs (
    id_repair INT AUTO_INCREMENT PRIMARY KEY,
    start_date DATE NOT NULL,
    end_date DATE,
    description VARCHAR(200),
    total_cost DECIMAL(10, 2),
    id_equipment INT,
    FOREIGN KEY (id_equipment) REFERENCES Equipment(id_equipment)
);

-- Tabla componente_reparacion
CREATE TABLE Repair_Components (
    id_repair_component INT AUTO_INCREMENT PRIMARY KEY,
    id_repair INT,
    id_component INT,
    quantity INT,
    FOREIGN KEY (id_repair) REFERENCES Repairs(id_repair),
    FOREIGN KEY (id_component) REFERENCES Components(id_component)
);


-- tabla tecnicos
CREATE TABLE Technicians (
    id_technician INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    specialization VARCHAR(100)
);


-- tabla asignamiento
CREATE TABLE Assignments (
    id_assignment INT AUTO_INCREMENT PRIMARY KEY,
    id_repair INT,
    id_technician INT,
    assignment_date DATE,
    FOREIGN KEY (id_repair) REFERENCES Repairs(id_repair),
    FOREIGN KEY (id_technician) REFERENCES Technicians(id_technician)
);

-- tabla estado de reparacion 
CREATE TABLE Repair_Status (
    id_status INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);


-- Tabla  del historial de la reparaciones
CREATE TABLE Status_History (
    id_status_history INT AUTO_INCREMENT PRIMARY KEY,
    id_repair INT,
    id_status INT,
    change_date DATE,
    FOREIGN KEY (id_repair) REFERENCES Repairs(id_repair),
    FOREIGN KEY (id_status) REFERENCES Repair_Status(id_status)
);

-- tabla facturas
CREATE TABLE Invoices (
    id_invoice INT AUTO_INCREMENT PRIMARY KEY,
    id_repair INT,
    emission_date DATE,
    total_amount DECIMAL(10, 2),
    FOREIGN KEY (id_repair) REFERENCES Repairs(id_repair)
);


CREATE TABLE Stock (
    id_stock INT AUTO_INCREMENT PRIMARY KEY,
    id_component INT,
    quantity INT,
    update_date DATE,
    FOREIGN KEY (id_component) REFERENCES Components(id_component)
);

