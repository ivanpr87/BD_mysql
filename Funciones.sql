
-- desde ahora voy a tratar de hacer toda la logica de sql en ingles.
-- funcion que me de el nombre completo de un empleado
DELIMITER //

CREATE FUNCTION GetEmployeeFullName (employee_id INT) -- creo la funcion para que me devuelva el nombre y apellido segun si Legajo
RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
    DECLARE full_name VARCHAR(255); -- declaro la variable full_nmae
    SELECT CONCAT(nom_tecnico, ' ', apel_tecnico) INTO full_name -- concateno el nombre y el apellido del empleado
    FROM tecnicos -- le digo de donde sacar los datos
    WHERE legajo = employee_id; -- aca le digo  que cuando el legajo sea igual al que le paso por consola lo guardo en el full_name y lo muestre
    RETURN full_name; 
END;

//

DELIMITER ;

-- con esta funcion voy a traer todos los componentes de mi tabla stock que este por debajo de 200
DELIMITER //

CREATE FUNCTION GetProductsBelowStocks() -- creamos la funcion
RETURNS VARCHAR(1000) -- que retorne algo con hasta mil caracteres
DETERMINISTIC 
BEGIN
    DECLARE product_list VARCHAR(1000) DEFAULT ''; -- declaro una variable llamada product_list
    
    SELECT GROUP_CONCAT(CONCAT(nom_comp, ' (Stock: ', cant, ')') SEPARATOR ', ') -- funcion para concatenar los nombre y el stock cuando sea menor que 200, si aparece se mostrara con su nombre y la cantidad
    INTO product_list -- se guarda en esta variable
    FROM stock -- aca le estamos diciendo de donde sacar esos datos
    WHERE cant < 200; -- aca le estamos diciendo cuando la cantidad sea menor que 20

    IF product_list IS NULL THEN
        SET product_list = 'No hay componentes por debajo de 200';
    END IF; -- aca pusimos el condicional para cuando no tengamos nada por debajo de 200

    RETURN product_list; -- es lo que le llega a la funcion y devuelve
END;

//

DELIMITER ;

