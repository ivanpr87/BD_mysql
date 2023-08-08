

-- Función para obtener la lista de reparaciones de un cliente específico:
DELIMITER //

CREATE FUNCTION GetRepairsByCustomer(customer_id INT)
RETURNS VARCHAR(1000)
DETERMINISTIC
BEGIN
    DECLARE repairs_list VARCHAR(1000);
    SELECT GROUP_CONCAT(CONCAT('ID: ', r.id_repair, ', Start Date: ', r.start_date, ', End Date: ', r.end_date, ', Description: ', r.description, ', Total Cost: ', r.total_cost) SEPARATOR '\n') INTO repairs_list
    FROM Repairs r
    INNER JOIN Equipment e ON r.id_equipment = e.id_equipment
    WHERE e.id_customer = customer_id;
    RETURN repairs_list;
END //

DELIMITER ;
-- Función para calcular el costo total de reparaciones para un cliente
DELIMITER //

CREATE FUNCTION GetTotalCostByCustomer(customer_id INT)
RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
    DECLARE total_cost DECIMAL(10, 2);
    SELECT SUM(r.total_cost) INTO total_cost
    FROM Repairs r
    INNER JOIN Equipment e ON r.id_equipment = e.id_equipment
    WHERE e.id_customer = customer_id;
    RETURN total_cost;
END //

DELIMITER ;

-- Función para obtener el número de reparaciones asignadas a un técnico:

DELIMITER //

CREATE FUNCTION GetAssignedRepairsCount(technician_id INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE repairs_count INT;
    SELECT COUNT(*) INTO repairs_count
    FROM Assignments a
    WHERE a.id_technician = technician_id;
    RETURN repairs_count;
END //

DELIMITER ;

-- Función para obtener el estado actual de una reparación:

DELIMITER //

CREATE FUNCTION GetCurrentRepairStatus(repair_id INT)
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
    DECLARE current_status VARCHAR(100);
    SELECT s.name INTO current_status
    FROM Status_History sh
    INNER JOIN Repair_Status s ON sh.id_status = s.id_status
    WHERE sh.id_repair = repair_id
    ORDER BY sh.change_date DESC
    LIMIT 1;
    RETURN current_status;
END //

DELIMITER ;



