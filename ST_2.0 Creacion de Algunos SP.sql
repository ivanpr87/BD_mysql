
-- Agregar una reparación con componentes:
DELIMITER //
CREATE PROCEDURE sp_add_repair_with_components(
    IN p_start_date DATE,
    IN p_end_date DATE,
    IN p_description VARCHAR(200),
    IN p_cost_total DECIMAL(10, 2),
    IN p_id_equipment INT,
    IN p_component_data JSON
)
BEGIN
    -- Insertar la reparación
    INSERT INTO Repairs (start_date, end_date, description, cost_total, id_equipment)
    VALUES (p_start_date, p_end_date, p_description, p_cost_total, p_id_equipment);
    
    -- Obtener el ID de la última reparación insertada
    SET @repair_id = LAST_INSERT_ID();
    
    -- Insertar los componentes asociados a la reparación en la tabla de Componentes_Reparacion
    INSERT INTO Repair_Components (id_repair, id_component, quantity)
    SELECT @repair_id, component_data.id_component, component_data.quantity
    FROM JSON_TABLE(p_component_data, '$[*]' COLUMNS(
        id_component INT PATH '$.id_component',
        quantity INT PATH '$.quantity'
    )) AS component_data;
END //
DELIMITER ;



DELIMITER //
CREATE PROCEDURE sp_add_repair_with_components(
    IN p_start_date DATE,
    IN p_end_date DATE,
    IN p_description VARCHAR(200),
    IN p_cost_total DECIMAL(10, 2),
    IN p_id_equipment INT,
    IN p_component_data JSON
)
BEGIN
    -- Insertar la reparación
    INSERT INTO Repairs (start_date, end_date, description, cost_total, id_equipment)
    VALUES (p_start_date, p_end_date, p_description, p_cost_total, p_id_equipment);
    
    -- Obtener el ID de la última reparación insertada
    SET @repair_id = LAST_INSERT_ID();
    
    -- Insertar los componentes asociados a la reparación en la tabla de Componentes_Reparacion
    INSERT INTO Repair_Components (id_repair, id_component, quantity)
    SELECT @repair_id, component_data.id_component, component_data.quantity
    FROM JSON_TABLE(p_component_data, '$[*]' COLUMNS(
        id_component INT PATH '$.id_component',
        quantity INT PATH '$.quantity'
    )) AS component_data;
    
    -- Descontar el stock de componentes utilizados en la reparación
    UPDATE Stock s
    JOIN Repair_Components rc ON s.id_component = rc.id_component
    SET s.quantity = s.quantity - rc.quantity
    WHERE rc.id_repair = @repair_id;
END //
DELIMITER ;


-- Actualizar estado de una reparación:

DELIMITER //
CREATE PROCEDURE sp_update_repair_status(
    IN p_repair_id INT,
    IN p_status_id INT
)
BEGIN
    -- Actualizar el estado de la reparación
    UPDATE Repairs SET status_id = p_status_id WHERE id_repair = p_repair_id;
    
    -- Registrar el cambio en el historial de estados
    INSERT INTO Status_History (id_repair, id_status, change_date)
    VALUES (p_repair_id, p_status_id, NOW());
END //
DELIMITER ;

-- Asignar técnico a una reparación:

DELIMITER //
CREATE PROCEDURE sp_assign_technician_to_repair(
    IN p_repair_id INT,
    IN p_technician_id INT,
    IN p_assignment_date DATE
)
BEGIN
    -- Asignar el técnico a la reparación
    INSERT INTO Assignments (id_repair, id_technician, assignment_date)
    VALUES (p_repair_id, p_technician_id, p_assignment_date);
END //
DELIMITER ;


