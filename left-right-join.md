### LEFT JOIN, RIGHT JOIN y combinaciones múltiples en MySQL – Ejemplos con explicación

---

```sql

SELECT u.name AS usuario, o.id AS pedido, o.total
FROM users AS u
LEFT JOIN orders AS o
ON u.id = o.user_id

SELECT u.name AS usuario, o.id AS pedido, o.total
FROM users AS u
LEFT JOIN orders AS o
ON u.id = o.user_id
WHERE o.id IS NULL;

SELECT u.name AS usuario, o.id AS pedido, o.total
FROM users AS u
RIGHT JOIN orders AS o
ON u.id = o.user_id

SELECT
 u.name AS usuario,
 p.name AS producto,
 o.quantity AS cantidad,
 o.total,
 o.order_date AS fecha
FROM orders AS o
JOIN users AS u ON o.user_id = u.id
JOIN products AS p ON o.product_id = p.id
ORDER BY u.name;

```

---

En SQL, los **JOINs** permiten combinar datos de distintas tablas relacionadas. A diferencia del `INNER JOIN`, los `LEFT JOIN` y `RIGHT JOIN` también muestran los registros que no tienen coincidencias en una de las tablas, lo que los hace muy útiles para detectar ausencias o generar reportes completos.

---

#### 1. LEFT JOIN – mostrar todos los usuarios y sus pedidos (si existen)

```sql
SELECT u.name AS usuario, o.id AS pedido, o.total
FROM users AS u
LEFT JOIN orders AS o
ON u.id = o.user_id;
```

> El `LEFT JOIN` devuelve **todos los registros de la tabla de la izquierda** (`users`), junto con los datos de `orders` **solo si existen coincidencias**.
>
> Si un usuario no tiene pedidos, las columnas de `orders` aparecerán como `NULL`.
>
> Esto es ideal para obtener un listado completo de usuarios y detectar quiénes todavía no realizaron compras.

---

#### 2. LEFT JOIN con condición para mostrar solo los usuarios sin pedidos

```sql
SELECT u.name AS usuario, o.id AS pedido, o.total
FROM users AS u
LEFT JOIN orders AS o
ON u.id = o.user_id
WHERE o.id IS NULL;
```

> En este caso, se agrega una condición `WHERE o.id IS NULL` para **filtrar únicamente a los usuarios sin pedidos asociados**.
>
> Es una consulta muy útil en sistemas de e-commerce para identificar clientes inactivos o nuevos.

---

#### 3. RIGHT JOIN – mostrar todos los pedidos y sus usuarios (si existen)

```sql
SELECT u.name AS usuario, o.id AS pedido, o.total
FROM users AS u
RIGHT JOIN orders AS o
ON u.id = o.user_id;
```

> `RIGHT JOIN` funciona igual que `LEFT JOIN`, pero devuelve **todos los registros de la tabla derecha** (`orders`) y solo los usuarios que coinciden.
>
> Es útil para verificar si existen pedidos que quedaron sin un usuario válido (por ejemplo, por errores en integridad referencial o pruebas de datos).

---

#### 4. JOIN múltiple – combinar usuarios, productos y pedidos

```sql
SELECT
  u.name AS usuario,
  p.name AS producto,
  o.quantity AS cantidad,
  o.total,
  o.order_date AS fecha
FROM orders AS o
JOIN users AS u ON o.user_id = u.id
JOIN products AS p ON o.product_id = p.id
ORDER BY u.name;
```

> Esta consulta combina tres tablas (`orders`, `users`, `products`) para obtener un detalle completo de cada compra.
>
> * `JOIN users` une cada pedido con el comprador.
> * `JOIN products` agrega el nombre del producto.
> * `ORDER BY u.name` ordena los resultados alfabéticamente por el nombre del usuario.
>
> Es una forma clara y eficiente de generar reportes de ventas o exportar datos completos.

---

✅ **Resumen:**

* `LEFT JOIN`: muestra todos los registros de la tabla izquierda, incluso si no hay coincidencias.
* `RIGHT JOIN`: muestra todos los registros de la tabla derecha.
* `WHERE o.id IS NULL`: sirve para detectar registros sin relación.
* `JOIN` múltiple: permite combinar varias tablas para obtener información completa.

Estos tipos de joins son esenciales para el análisis de datos y el mantenimiento de relaciones en bases de datos relacionales.
