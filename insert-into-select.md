### INSERT y SELECT en MySQL – Ejemplos completos y explicación

´´´sql

DESCRIBE users;
DESCRIBE products;
DESCRIBE orders;

INSERT INTO users (name, email, password, cellphone)
VALUES 
('Sergie Code', 'info@sergiecode.com', 'ABCabc123,.-', '+44789456123'),
('Ricardo Darin', 'ricardo@darin.com', 'elsecretodetusojos', '+11978954132'),
('Jenna Ortega', 'wednesday@addams.com', 'merlinamiercoles', '+349188646486')

INSERT INTO products (name, description, price,stock)
VALUES
('Notebook', 'Sirve para programar', 1000.05, 1),
('Mouse', NULL, 5.50, 10),
('Keyboard', NULL, 5.50, NULL)

INSERT INTO products (name, description, price)
VALUES
('Micrófono', 'Calidad para Streaming', 305.10)

INSERT INTO orders (user_id, product_id, quantity, total)
VALUES
(1,1,1,1000.05),
(2,2,1,5.50),
(3,4,2,610.20)


SELECT * FROM users;
SELECT * FROM products;
SELECT * FROM orders;


SHOW tables;

´´´

Estos comandos te permiten **insertar registros en tus tablas** y luego **consultar los datos almacenados**. A continuación, te muestro cómo se aplican en las tablas `users`, `products` y `orders`.

---

#### 1. Ver la estructura de las tablas

```sql
DESCRIBE users;
DESCRIBE products;
DESCRIBE orders;
```

> `DESCRIBE` muestra la estructura de cada tabla: columnas, tipos de datos, claves primarias y restricciones. Es útil para confirmar los nombres de las columnas antes de hacer un `INSERT`.

---

#### 2. Insertar registros en la tabla `users`

```sql
INSERT INTO users (name, email, password, cellphone)
VALUES
('Sergie Code', 'info@sergiecode.com', 'ABCabc123,.-', '+44789456123'),
('Ricardo Darin', 'ricardo@darin.com', 'elsecretodetusojos', '+11978954132'),
('Jenna Ortega', 'wednesday@addams.com', 'merlinamiercoles', '+349188646486');
```

> Se insertan tres registros con nombre, email, contraseña y celular.
> El formato es `INSERT INTO <tabla> (columnas) VALUES (valores)`. Podés agregar varios registros en una sola sentencia separando las filas con comas.

---

#### 3. Insertar registros en la tabla `products`

```sql
INSERT INTO products (name, description, price, stock)
VALUES
('Notebook', 'Sirve para programar', 1000.05, 1),
('Mouse', NULL, 5.50, 10),
('Keyboard', NULL, 5.50, NULL);
```

> Crea tres productos distintos.
> Se puede usar `NULL` para valores desconocidos o no requeridos (por ejemplo, stock no definido).

---

#### 4. Insertar otro producto con menos columnas

```sql
INSERT INTO products (name, description, price)
VALUES
('Micrófono', 'Calidad para Streaming', 305.10);
```

> Podés omitir columnas opcionales como `stock` siempre que la tabla lo permita (por ejemplo, si esa columna acepta `NULL` o tiene un valor por defecto).

---

#### 5. Insertar registros en la tabla `orders`

```sql
INSERT INTO orders (user_id, product_id, quantity, total)
VALUES
(1,1,1,1000.05),
(2,2,1,5.50),
(3,4,2,610.20);
```

> Inserta tres pedidos en la tabla `orders`, relacionando usuarios y productos por sus IDs.
> Por ejemplo, el primer pedido indica que el usuario con ID 1 compró el producto con ID 1.

---

#### 6. Consultar los registros insertados

```sql
SELECT * FROM users;
SELECT * FROM products;
SELECT * FROM orders;
```

> `SELECT *` muestra todos los registros de una tabla.
> Ideal para verificar que los datos se insertaron correctamente.

---

#### 7. Listar todas las tablas existentes

```sql
SHOW TABLES;
```

> Muestra todas las tablas disponibles dentro de la base de datos seleccionada.

---

✅ **Resumen:**
Con `INSERT INTO` agregás datos a tus tablas y con `SELECT` podés visualizarlos. Estas operaciones son esenciales para poblar una base de datos y probar relaciones entre entidades (`users`, `products`, `orders`) en un sistema tipo e-commerce.
