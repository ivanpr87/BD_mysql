-- Triggers 
-- Ivan Bastos


-- Trigger después de actualizar un cliente:

DELIMITER //
CREATE TRIGGER TR_AfterUpdateCustomer
AFTER UPDATE ON Customers
FOR EACH ROW
BEGIN
    IF NOT (OLD.name <=> NEW.name AND OLD.address <=> NEW.address AND OLD.phone <=> NEW.phone AND OLD.email <=> NEW.email) THEN
        INSERT INTO Customer_Log (id_customer, change_date, action, modified_by)
        VALUES (NEW.id_customer, NOW(), CONCAT('Se modificó el cliente con ID: ', NEW.id_customer), @user);
    END IF;
END;
//
DELIMITER ;



-- Trigger después de insertar un nuevo cliente:
DELIMITER //
CREATE TRIGGER TR_AfterInsertCustomer
AFTER INSERT ON Customers
FOR EACH ROW
BEGIN
    INSERT INTO Customer_Log (id_customer, change_date, action, modified_by)
    VALUES (NEW.id_customer, NOW(), CONCAT('Se agregó un nuevo cliente con ID: ', NEW.id_customer), @user);
END;
//
DELIMITER ;



-- Trigger después de eliminar un cliente:

DELIMITER //
CREATE TRIGGER TR_AfterDeleteCustomer
AFTER DELETE ON Customers
FOR EACH ROW
BEGIN
    INSERT INTO Customer_Log (id_customer, change_date, action, modified_by)
    VALUES (OLD.id_customer, NOW(), CONCAT('Se eliminó el cliente con ID: ', OLD.id_customer), @user);
END;
//
DELIMITER ;


-- Trigger antes de insertar un nuevo componente:

DELIMITER //
CREATE TRIGGER TR_BeforeInsertComponent
BEFORE INSERT ON Components
FOR EACH ROW
BEGIN
    IF NEW.name IS NULL OR NEW.description IS NULL OR NEW.price IS NULL THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'No se pueden insertar registros con campos nulos en la tabla Components';
    END IF;
END;
//
DELIMITER ;


-- Trigger antes de actualizar un componente:


DELIMITER //
CREATE TRIGGER TR_BeforeUpdateComponent
BEFORE UPDATE ON Components
FOR EACH ROW
BEGIN
    IF NEW.name IS NULL OR  NEW.description IS NULL OR NEW.price IS NULL THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'No se pueden actualizar registros con campos nulos en la tabla Components';
    END IF;
END;
//
DELIMITER ;

-- Trigger antes de eliminar un componente:

DELIMITER //
CREATE TRIGGER TR_BeforeDeleteComponent
BEFORE DELETE ON Components
FOR EACH ROW
BEGIN
    DECLARE num_repairs INT;
    
    SELECT COUNT(*) INTO num_repairs
    FROM Repair_Components
    WHERE id_component = OLD.id_component;
    
    IF num_repairs > 0 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'No se puede eliminar un componente con reparaciones asociadas';
    END IF;
END;
//
DELIMITER ;


-- Trigger guarda los cambios en la tabla componente ya se agregado o modficacion del mismo.
DELIMITER //
CREATE TRIGGER TR_BeforeModifyComponent
BEFORE INSERT ON Components
FOR EACH ROW
BEGIN
    DECLARE action_description VARCHAR(200);
    
    -- Si es una inserción, registra la acción como "Nuevo componente agregado"
    IF NEW.id_component IS NULL THEN
        SET action_description = CONCAT('Nuevo componente agregado: ', NEW.name);
    ELSE
        -- Si es una actualización, registra la acción como "Componente actualizado"
        SET action_description = CONCAT('Componente actualizado: ', NEW.name);
    END IF;
    
    -- Inserta el registro en la tabla de log
    INSERT INTO components_log (action_date, action_description, performed_by)
    VALUES (NOW(), action_description, @user);
END;
//
DELIMITER ;

