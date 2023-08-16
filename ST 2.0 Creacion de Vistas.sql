USE servicio_tecnico;


-- Esta vista muestra los detalles de cada reparación junto con la información del equipo y los componentes asociados.
CREATE VIEW View_RepairDetails AS
SELECT r.id_repair, r.start_date, r.end_date, r.description AS repair_description, r.total_cost,
       e.id_equipment, e.brand, e.model, e.serial_number,
       c.id_component, c.name AS component_name, rc.quantity AS component_quantity
FROM Repairs r
JOIN Equipment e ON r.id_equipment = e.id_equipment
LEFT JOIN Repair_Components rc ON r.id_repair = rc.id_repair
LEFT JOIN Components c ON rc.id_component = c.id_component;


-- Esta vista muestra los detalles de cada asignación de técnicos a reparaciones.

CREATE VIEW View_Assignments AS
SELECT a.id_assignment, a.id_repair, r.description AS repair_description,
       a.id_technician, t.name AS technician_name, a.assignment_date
FROM Assignments a
JOIN Repairs r ON a.id_repair = r.id_repair
JOIN Technicians t ON a.id_technician = t.id_technician;


-- Esta vista muestra los detalles de las facturas emitidas para cada reparación.

CREATE VIEW View_Invoices AS
SELECT i.id_invoice, i.id_repair, r.description AS repair_description, i.emission_date, i.total_amount
FROM Invoices i
JOIN Repairs r ON i.id_repair = r.id_repair;


-- Esta vista muestra los detalles de cada cliente y los equipos que tienen asociados.

CREATE VIEW View_CustomerEquipment AS
SELECT c.id_customer, c.name AS customer_name, c.address, c.phone, c.email,
       e.id_equipment, e.brand, e.model, e.serial_number
FROM Customers c
LEFT JOIN Equipment e ON c.id_customer = e.id_customer;

