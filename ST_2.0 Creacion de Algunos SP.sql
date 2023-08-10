-- Store procedure
-- Ivan Bastos

-- Este procedimiento calculará el costo total de todas las reparaciones realizadas por un técnico específico
DELIMITER //
CREATE PROCEDURE CalculateTotalCostByTechnician(
    IN technician_id INT,
    OUT total_cost DECIMAL(10, 2)
)
BEGIN
    SELECT SUM(R.total_cost) INTO total_cost
    FROM Repairs R
    INNER JOIN Assignments A ON R.id_repair = A.id_repair
    WHERE A.id_technician = technician_id;
END;
//
DELIMITER ;

-- Este procedimiento obtendrá el historial de estados de una reparación específica.
DELIMITER //
CREATE PROCEDURE GetRepairStatusHistory(
    IN repair_id INT
)
BEGIN
    SELECT RH.change_date, RS.name
    FROM Status_History RH
    INNER JOIN Repair_Status RS ON RH.id_status = RS.id_status
    WHERE RH.id_repair = repair_id
    ORDER BY RH.change_date;
END;
//
DELIMITER ;

-- este SP calculará el costo total de todas las reparaciones realizadas para un cliente específico dentro de las semanas que especifiquemos y devolverá el resultado con su IVA.
DELIMITER //
CREATE PROCEDURE CalculateTotalCostInRangeWithIVA(
    IN customer_id INT,
    IN start_date DATE,
    IN end_date DATE,
    OUT total_cost_with_iva DECIMAL(10, 2)
)
BEGIN
    -- Calculamos el costo total de las reparaciones en el rango de fechas especificado
    SELECT COALESCE(SUM(R.total_cost), 0) INTO total_cost_with_iva
    FROM Repairs R
    INNER JOIN Equipment E ON R.id_equipment = E.id_equipment
    WHERE E.id_customer = customer_id
    AND R.start_date BETWEEN start_date AND end_date;
    
    -- Calculamos el IVA y lo sumamos al costo total
    SET total_cost_with_iva = total_cost_with_iva + (total_cost_with_iva * 0.21);
END;
//
DELIMITER ;
-- con este actualizamos el precio de los componentes.
DELIMITER //
CREATE PROCEDURE UpdateComponentPrice(
    IN component_id INT,
    IN new_price DECIMAL(10, 2)
)
BEGIN
    UPDATE Components
    SET price = new_price
    WHERE id_component = component_id;
END;
//
DELIMITER ;

-- este SP chequeara si el costo de reparacion supera cierto monto
DELIMITER //
CREATE PROCEDURE CheckCostThreshold(
    IN customer_id INT,
    OUT message VARCHAR(100)
)
BEGIN
    DECLARE total_cost DECIMAL(10, 2);
    DECLARE cost_threshold DECIMAL(10, 2);
    
    -- Calculamos el costo total de las reparaciones para el cliente
    SELECT COALESCE(SUM(R.total_cost), 0) INTO total_cost
    FROM Repairs R
    INNER JOIN Equipment E ON R.id_equipment = E.id_equipment
    WHERE E.id_customer = customer_id;
    
    -- Definimos el umbral de costo
    SET cost_threshold = 500.00;
    
    -- Comparación y mensaje de salida
    IF total_cost <= cost_threshold THEN
        SET message = CONCAT('El costo total de las reparaciones para el cliente está por debajo del umbral (', cost_threshold, ').');
    ELSE
        SET message = CONCAT('El costo total de las reparaciones para el cliente está por encima del umbral (', cost_threshold, ').');
    END IF;
END;
//
DELIMITER ;




