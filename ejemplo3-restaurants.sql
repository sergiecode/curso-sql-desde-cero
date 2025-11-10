-- 🍔 FoodieTrack: Base de datos relacional para practicar SQL (MySQL)
-- Incluye creación de tablas, inserción de datos y consultas explicadas paso a paso.

-- ------------------------------------------------------
-- 1️⃣ CREACIÓN DE BASE DE DATOS Y TABLAS
-- ------------------------------------------------------
CREATE DATABASE foodietrack;
USE foodietrack;

-- Tabla de usuarios
CREATE TABLE users (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(100) UNIQUE NOT NULL,
  country VARCHAR(100),
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Tabla de restaurantes
CREATE TABLE restaurants (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  city VARCHAR(100),
  average_price DECIMAL(10,2),
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Tabla de platos
CREATE TABLE dishes (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  restaurant_id INT UNSIGNED NOT NULL,
  name VARCHAR(255) NOT NULL,
  price DECIMAL(10,2) NOT NULL,
  category VARCHAR(100),
  FOREIGN KEY (restaurant_id) REFERENCES restaurants(id) ON DELETE CASCADE
);

-- Tabla de reseñas de usuarios
CREATE TABLE reviews (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  restaurant_id INT UNSIGNED NOT NULL,
  user_id INT UNSIGNED NOT NULL,
  rating DECIMAL(2,1) CHECK (rating BETWEEN 0 AND 10),
  comment TEXT,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (restaurant_id) REFERENCES restaurants(id) ON DELETE CASCADE,
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- ------------------------------------------------------
-- 2️⃣ INSERCIÓN DE DATOS DE EJEMPLO
-- ------------------------------------------------------
INSERT INTO users (username, country) VALUES
('Comelon', 'Argentina'),
('SaborQueen', 'Chile'),
('GourmetMax', 'México'),
('FoodieLover', 'España');

INSERT INTO restaurants (name, city, average_price) VALUES
('La Parrilla Loca', 'Buenos Aires', 25.00),
('Sushi Zen', 'Santiago', 40.00),
('Taco Fiesta', 'Ciudad de México', 15.00),
('PastaBella', 'Madrid', 30.00);

INSERT INTO dishes (restaurant_id, name, price, category) VALUES
(1, 'Bife de chorizo', 22.50, 'Carne'),
(1, 'Empanadas criollas', 5.00, 'Entrada'),
(2, 'Sushi roll', 18.00, 'Pescado'),
(3, 'Tacos al pastor', 12.00, 'Mexicano'),
(4, 'Spaghetti carbonara', 28.00, 'Italiana'),
(4, 'Lasaña', 30.00, 'Italiana');

INSERT INTO reviews (restaurant_id, user_id, rating, comment) VALUES
(1, 1, 8.5, 'Excelente carne y atención.'),
(1, 2, 7.0, 'Rico pero un poco caro.'),
(2, 2, 9.2, 'Sushi fresco y sabroso.'),
(3, 3, 8.8, 'Los mejores tacos que probé.'),
(4, 4, 9.5, 'La pasta es espectacular.'),
(4, 1, 9.0, 'Muy buena experiencia en general.');

-- ------------------------------------------------------
-- 3️⃣ CONSULTAS DE PRÁCTICA CON EXPLICACIONES
-- ------------------------------------------------------

-- 🧩 CONSULTA 1: Listar todos los restaurantes con su ciudad y precio promedio
SELECT name, city, average_price
FROM restaurants
ORDER BY average_price DESC;
-- 👉 Muestra todos los restaurantes ordenados por su precio promedio (de más caro a más barato).

-- 🧩 CONSULTA 2: Mostrar platos junto al restaurante donde se sirven
SELECT d.name AS plato, d.price AS precio, r.name AS restaurante
FROM dishes d
JOIN restaurants r ON d.restaurant_id = r.id
ORDER BY restaurante;
-- 👉 Ejemplo de INNER JOIN básico entre platos y restaurantes.

-- 🧩 CONSULTA 3: Promedio de calificaciones por restaurante
SELECT r.name AS restaurante, ROUND(AVG(rv.rating), 2) AS promedio_rating
FROM restaurants r
JOIN reviews rv ON r.id = rv.restaurant_id
GROUP BY r.name
ORDER BY promedio_rating DESC;
-- 👉 Usa GROUP BY para calcular el promedio de reseñas por restaurante.

-- 🧩 CONSULTA 4: Top 3 restaurantes mejor calificados
SELECT r.name AS restaurante, ROUND(AVG(rv.rating), 2) AS promedio_rating
FROM restaurants r
JOIN reviews rv ON r.id = rv.restaurant_id
GROUP BY r.name
ORDER BY promedio_rating DESC
LIMIT 3;
-- 👉 Muestra los tres mejores restaurantes según su promedio de calificación.

-- 🧩 CONSULTA 5: Listar los usuarios que más reseñas dejaron
SELECT u.username, COUNT(rv.id) AS cantidad_reseñas
FROM users u
JOIN reviews rv ON u.id = rv.user_id
GROUP BY u.username
ORDER BY cantidad_reseñas DESC;
-- 👉 Usa COUNT() y GROUP BY para contar reseñas por usuario.

-- 🧩 CONSULTA 6: Promedio de precio de platos por restaurante
SELECT r.name AS restaurante, ROUND(AVG(d.price), 2) AS promedio_precio_platos
FROM restaurants r
JOIN dishes d ON r.id = d.restaurant_id
GROUP BY r.name
ORDER BY promedio_precio_platos DESC;
-- 👉 Calcula el promedio del precio de los platos por cada restaurante.

-- 🧩 CONSULTA 7: Mostrar reseñas junto al nombre del usuario y el restaurante
SELECT u.username, r.name AS restaurante, rv.rating, rv.comment
FROM reviews rv
JOIN users u ON rv.user_id = u.id
JOIN restaurants r ON rv.restaurant_id = r.id
ORDER BY rv.rating DESC;
-- 👉 Combina tres tablas para ver quién calificó qué restaurante y con qué puntuación.

-- 🧩 CONSULTA 8: Restaurantes con más de una reseña
SELECT r.name AS restaurante, COUNT(rv.id) AS cantidad_reseñas
FROM restaurants r
JOIN reviews rv ON r.id = rv.restaurant_id
GROUP BY r.name
HAVING COUNT(rv.id) > 1;
-- 👉 HAVING se usa para filtrar resultados agrupados (no con WHERE).