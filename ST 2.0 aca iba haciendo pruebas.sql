
-- inserto un dato para pruebas
INSERT INTO Customers (name, address, phone, email)
VALUES
    ('nuria mangala', '342 av.libertador , buenos aires', '1578273237', 'norme.3joe@example.com');
 -- cambio el usurio   
  SET @user = 'yo';  
  
  -- elimino algo para probar que detecte el user
DELETE FROM Customers
WHERE id_customer = 27;


-- pruebas que funcione el before InsertComponents
INSERT INTO components (name, description, price)
VALUES
    ('',' buenos aires', '14.77');
  
  
-- borre el TR porque me falto una S y el TR
    drop trigger BeforeModifyComponent;
    
