-- =========================================================
-- LABORATORIO 2 - SQL MURDER MYSTERY
-- Proceso de recopilación de pruebas
-- =========================================================


-- ---------------------------------------------------------
-- PASO 1: Recuperar el reporte del crimen
-- Conclusión: El asesinato ocurrió el 15/01/2018 en SQL City.
-- El reporte menciona dos testigos.
-- Evidencia: imagen1TestigoEscena.png
-- ---------------------------------------------------------

SELECT *
FROM crime_scene_report
WHERE date = 20180115
AND city = 'SQL City'
AND type = 'murder';



-- ---------------------------------------------------------
-- PASO 2: Buscar testigo que vive en Northwestern Dr
-- Conclusión: El testigo vive en la última casa de la calle.
-- Evidencia: Imagen2DirecciónTestigo.png
-- ---------------------------------------------------------

SELECT *
FROM person
WHERE address_street_name = 'Northwestern Dr'
ORDER BY address_number DESC;


-- ---------------------------------------------------------
-- PASO 3: Entrevista del testigo
-- Conclusión: El sospechoso es miembro del gimnasio Get Fit Now
-- con membresía que inicia en 48Z y tiene una placa con H42W.
-- Evidencia: Imagen4EntrevistaTestigo.png
-- ---------------------------------------------------------

SELECT *
FROM interview
WHERE person_id = 14887;



-- ---------------------------------------------------------
-- PASO 4: Buscar miembros del gimnasio con ID 48Z
-- Conclusión: Se encontraron tres personas, pero una es silver.
-- Los sospechosos son Joe Germuska y Jeremy Bowers.
-- Evidencia: Imagen6TablaSospechososMembresia.png
-- ---------------------------------------------------------

SELECT *
FROM get_fit_now_member
WHERE id LIKE '48Z%';



-- ---------------------------------------------------------
-- PASO 5: Buscar licencias de los sospechosos
-- Conclusión: Se obtuvieron los license_id para cruzar
-- con la tabla de vehículos.
-- Evidencia: Imagen7LicenciaIDSospechoso.png
-- ---------------------------------------------------------

SELECT *
FROM person
WHERE id IN (28819, 67318);



-- ---------------------------------------------------------
-- PASO 6: Buscar placas que contengan H42W
-- Conclusión: La licencia 423327 coincide con la placa
-- encontrada, correspondiente a Jeremy Bowers.
-- Evidencia: Imagen8PlacaVehiculo.png
-- ---------------------------------------------------------

SELECT *
FROM drivers_license
WHERE plate_number LIKE '%H42W%';



-- ---------------------------------------------------------
-- PASO 7: Identificación del primer asesino
-- Conclusión: Jeremy Bowers es el asesino material.
-- Evidencia: Imagen9PrimerAsesino.png
-- ---------------------------------------------------------

INSERT INTO solution VALUES (1, 'Jeremy Bowers');
SELECT value FROM solution;



-- ---------------------------------------------------------
-- PASO 8: Entrevista del asesino
-- Conclusión: Jeremy fue contratado por una mujer rica,
-- con cabello rojo, altura entre 65 y 67 pulgadas,
-- que conduce un Tesla Model S y asistió 3 veces
-- al SQL Symphony Concert en diciembre de 2017.
-- Evidencia: Imagen10EntrevistaJeremy.png
-- ---------------------------------------------------------

SELECT *
FROM interview
WHERE person_id = 67318;



-- ---------------------------------------------------------
-- PASO 9: Buscar mujeres con Tesla Model S
-- Conclusión: Se encontraron tres posibles sospechosas.
-- Evidencia: Imagen11MujeresConTeslaModelS.png
-- ---------------------------------------------------------

SELECT *
FROM drivers_license
WHERE gender = 'female'
AND hair_color = 'red'
AND height BETWEEN 65 AND 67
AND car_make = 'Tesla'
AND car_model = 'Model S';



-- ---------------------------------------------------------
-- PASO 10: Buscar personas que asistieron 3 veces
-- al SQL Symphony Concert en diciembre de 2017
-- Evidencia: Imagen12ConciertoVECES.png
-- ---------------------------------------------------------

SELECT person_id, COUNT(*) AS veces
FROM facebook_event_checkin
WHERE event_name = 'SQL Symphony Concert'
AND date BETWEEN 20171201 AND 20171231
GROUP BY person_id
HAVING COUNT(*) = 3;



-- ---------------------------------------------------------
-- PASO 11: Identificar a las personas encontradas
-- Conclusión: Las personas son Bryan Pardo y Miranda Priestly.
-- Evidencia: Imagen13IdentificaciónAsesinoEnConcierto.png
-- ---------------------------------------------------------

SELECT *
FROM person
WHERE id IN (24556, 99716);



-- ---------------------------------------------------------
-- PASO 12: Conclusión final
-- Conclusión:
-- Bryan Pardo es descartado porque no coincide con el perfil.
-- Miranda Priestly coincide con todas las pistas,
-- por lo que es la autora intelectual del crimen.
-- Evidencia: Imagen14SoluciónAsesina.png
-- ---------------------------------------------------------

INSERT INTO solution VALUES (1, 'Miranda Priestly');
SELECT value FROM solution;