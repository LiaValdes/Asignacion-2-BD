/*Para eliminar toda una tabla*/
DROP TABLE flights;

/*Se crea la tabla flights con los campos id, origin, destination, duration*/
CREATE TABLE flights ( 

id INT AUTO_INCREMENT PRIMARY KEY, 

origin VARCHAR(255) NOT NULL,  

destination VARCHAR(255) NOT NULL, 

duration INT NOT NULL 

)

/*Indica que se va a modificar la tabla flights en la columna o campo origin*/
ALTER TABLE flights MODIFY COLUMN origin VARCHAR(255)

/*Se insertan los datos*/
INSERT INTO flights(origin,destination,duration)values("New York","London",415);
INSERT INTO flights(origin,destination,duration)values("Shanghai","Paris",760);
INSERT INTO flights(origin,destination,duration)values("Panama","Costa Rica",200);
INSERT INTO flights(origin,destination,duration)values("Mexico","Argentina",600);
INSERT INTO flights(origin,destination,duration)values("Instanbul","Tokyo",700);
INSERT INTO flights(origin,destination,duration)values("New York","Paris",435);
INSERT INTO flights(origin,destination,duration)values("Moscou","Paris",245);
INSERT INTO flights(origin,destination,duration)values("Lima","New York",435);

/*Muestra toda la tabla flights*/
SELECT * FROM flights;

/*Muestra solo los vuelos que salieron de New York*/
SELECT * from flights WHERE origin = 'New York'

/*Muestra los id de los vuelos que salieron de New York*/
SELECT id AS ‘Transaccion’ from flights WHERE origin = 'New York'

/*Muestra el promedio de la duracion de los vuelos*/
SELECT AVG(duration) FROM flights

/*Muestra la cantidad de registros en la tabla*/
SELECT COUNT(*) FROM flights

/*Muestra el dato de duración minimo */
SELECT MIN(duration) FROM flights

/*Muestra el dato de duración máximo */
SELECT MAX(duration) FROM flights;

/*Muestra los vuelos que salieron que tengan alguna "a" en su nombre*/
SELECT * FROM flights WHERE origin like "%a%"

/*Muestra la suma de la duración de todos los destinos */
SELECT SUM(duration) AS 'total' FROM `flights` WHERE destination like 'Paris'

/*Si el id es 3 el destino se cambia por Brasil*/
UPDATE flights SET destination = "Brasil" WHERE id = 3

/*Si es un vuelo que sale de New York y su destino es Paris, se cambia a 500 su duración*/
UPDATE flights SET duration = 500 WHERE destination = 'Paris' AND origin = 'New York'

/*Elimina un registro, Toko en este caso*/
DELETE FROM `flights` WHERE destination = 'Tokyo'


/*Devuelve la cantidad por cada destino de origen*/
SELECT origin, COUNT(*) FROM flights GROUP BY origin

/*Devuelve la cantidad de destino de origen mientras sean mayor a uno */
SELECT origin, COUNT(*) FROM flights GROUP BY origin HAVING COUNT(*) > 1

/*Se crea una nueva tabla, en este caso para pasajeros, con su id y nombre* como los campos/
/*La clave foranea es el id de la tabla flights*/
CREATE TABLE passenger ( 

	id INT AUTO_INCREMENT PRIMARY KEY, 

	name VARCHAR(255) NOT NULL, 

	flights_id INT NOT NULL, 

	FOREIGN KEY (flights_id) REFERENCES flights(id) 

)

/*Se insertan los datos de los pasajeros*/
INSERT INTO passenger(name, flights_id)values("Alice",1);

INSERT INTO passenger(name, flights_id)values("Bob",1);

INSERT INTO passenger(name, flights_id)values("Charlie",2);

INSERT INTO passenger(name, flights_id)values("Dave",2);

INSERT INTO passenger(name, flights_id)values("Erin",4);

INSERT INTO passenger(name, flights_id)values("Frank",6);

INSERT INTO passenger(name, flights_id)values("Grace",6);

/*Muestra los datos del origen destino y nombre del pasajero (utiliza datos de ambas tablas)*/
SELECT origin, destination, name FROM flights JOIN passenger ON passenger.flights_id = flights.id

/*Solo muestra el vuelo de Alice*/
SELECT origin, destination, name FROM flights JOIN passenger ON passenger.flights_id = flights.id WHERE name = "Alice"

/*Datos que muestren datos de origen, destino y nombre del pasajero que pertenezcan a la tabla flights*/
/*Aparecera NULL si falta alguno*/
SELECT origin, destination, name FROM flights LEFT JOIN passenger ON passenger.flights_id = flights.id

/*Datos que muestren datos de origen, destino y nombre del pasajero que pertenezcan a la tabla pasajeros*/
SELECT origin, destination, name FROM flights RIGHT JOIN passenger ON passenger.flights_id = flights.id