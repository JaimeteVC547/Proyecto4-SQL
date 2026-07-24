-- PROYECTO 4: SQL

-- 1. Escribe una consulta que recupere los Vuelos (flights) y su identificador que figuren con status On Time.
SELECT flight_id, status 
FROM bookings.flights 
WHERE status = 'On Time';

-- 2. Escribe una consulta que extraiga todas las columnas de la tabla bookings y refleje todas las reservas que han supuesto
-- una cantidad total mayor a 1.000.000 (Unidades monetarias).
SELECT * 
FROM bookings.bookings 
WHERE total_amount > 1000000;

-- 3. Escribe una consulta que extraiga todas las columnas de los datos de los modelos de aviones disponibles (aircraft_data). Puede 
-- que os aparezca en alguna actualización como "aircrafts_data", revisad las tablas y elegid la que corresponda.
-- (En la versión que me descargé la base de datos, la tabla no se llamaba "aircraft_data" sino "airplanes_data")
SELECT * 
FROM bookings.airplanes_data;

-- 4. Con el resultado anterior visualizado previamente, escribe una consulta que extraiga los identificadores de vuelo que han volado
-- con un Boeing 737. (Código Modelo Avión = 733)
-- (En esta versión el modelo de avión de los Boeing 737 no era el 733, sino el 7M7)
SELECT f.flight_id, r.route_no, r.airplane_code 
FROM bookings.flights f 
JOIN bookings.routes r ON f.route_no = r.route_no 
WHERE r.airplane_code = '7M7';

-- 5. Escribe una consulta que te muestre la información detallada de los tickets que han comprado las personas que se llaman Irina.
SELECT * 
FROM bookings.tickets 
WHERE passenger_name LIKE 'IRINA%';

-- Ejercicios Opcionales

-- 6. Mostrar las ciudades con más de un aeropuerto.
SELECT city, COUNT(*) AS num_airports
FROM bookings.airports_data
GROUP BY city
HAVING COUNT(*) > 1;

-- 7. Mostrar el número de vuelos por modelo de avión.
SELECT aircraft_code, COUNT(*) AS total_vuelos
FROM bookings.flights
GROUP BY aircraft_code;

-- 8. Reservas con más de un billete (varios pasajeros).
SELECT book_ref, COUNT(*) AS num_tickets
FROM bookings.tickets
GROUP BY book_ref
HAVING COUNT(*) > 1;

-- 9. Vuelos con retraso de salida superior a una hora.
SELECT flight_id, scheduled_departure, actual_departure, (actual_departure - scheduled_departure) AS retraso
FROM bookings.flights
WHERE actual_departure - scheduled_departure > INTERVAL '1 hour';