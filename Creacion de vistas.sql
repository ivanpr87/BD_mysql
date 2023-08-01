USE labo;


-- cree una vista donde ver el nombre del cliente y su email
CREATE OR REPLACE VIEW vista_cliente_y_email AS
SELECT nombre_cliente, email
FROM clientes;



-- creo una lista donde ver cuantas veces ingreso un equipo al labo
CREATE OR REPLACE VIEW vista_total_ingresos_equipos AS
SELECT i.num_serie AS equipo, COUNT(i.num_serie) AS total_ingresos
FROM cant_ingresos i
JOIN equipos e ON i.num_serie = e.num_serie
GROUP BY i.num_serie;



-- creo un lista donde ver si esta disponible el componente
CREATE OR REPLACE VIEW vista_disponibilidad_productos AS
SELECT nom_comp AS componente, 
       CASE WHEN cant > 0 THEN 'Disponible' ELSE 'No disponible' END AS disponibilidad
FROM stock;


-- crear una lista donde ver quien reparo 
CREATE OR REPLACE VIEW vista_asignaciones_tecnicos AS
SELECT legajo, num_serie, COUNT(*) AS veces_asumido
FROM historial
GROUP BY legajo, num_serie
ORDER BY veces_asumido DESC;

-- Creo un lista que me dice cuantos equipos entraron por mes
CREATE OR REPLACE VIEW vista_cantidad_de_ingresos_por_mes AS
SELECT fecha_ingreso, COUNT(*) AS cantidad_registros
FROM cant_ingresos
GROUP BY fecha_ingreso;
