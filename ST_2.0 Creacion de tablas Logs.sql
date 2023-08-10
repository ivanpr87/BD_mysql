-- Creado de tablas Logs
-- ivan bastos

CREATE TABLE Customer_Log (
    id_log INT AUTO_INCREMENT PRIMARY KEY,
    id_customer INT,
    change_date TIMESTAMP,
    action VARCHAR(200),
    modified_by VARCHAR(100)
);


CREATE TABLE Components_Log (
	id_log INT AUTO_INCREMENT PRIMARY KEY,
    action_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    action_description VARCHAR(200),
    performed_by VARCHAR(100)
);

