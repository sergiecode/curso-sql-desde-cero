### UPDATE, DELETE, TRUNCATE y DROP en MySQL – Ejemplos prácticos con explicación

---

```sql

UPDATE users SET password = 'thingesmimejoramigo', cellphone = '+1500111222' WHERE id = 3;

UPDATE products SET description = 'La ruedita más cómoda de tu ciudad' WHERE id = 2;

UPDATE products SET description = 'Las teclas más suaves del mercado', stock = 1 WHERE id = 3;

DELETE from products WHERE id = 8;

INSERT INTO products (name, description, price,stock)
VALUES
('Mate', 'Perfecto para Cebar', 100.00, 10)

TRUNCATE TABLE providers;

DROP TABLE providers;

SHOW TABLES;

```

---

Estos comandos te permiten **modificar o eliminar datos y estructuras** dentro de tu base de datos. A continuación, te muestro ejemplos paso a paso usando las tablas `users`, `products` y `providers`.

---

#### 1. Actualizar datos en una tabla

```sql
UPDATE users SET password = 'thingesmimejoramigo', cellphone = '+1500111222' WHERE id = 3;
```

> Modifica la contraseña y el número de celular del usuario con `id = 3`.
> El uso del **WHERE** es fundamental para evitar modificar todos los registros por error.

---

#### 2. Actualizar una descripción de producto

```sql
UPDATE products SET description = 'La ruedita más cómoda de tu ciudad' WHERE id = 2;
```

> Cambia la descripción del producto con `id = 2` (en este caso, probablemente el *Mouse*).
> Ideal para corregir o mejorar textos sin alterar otros campos.

---

#### 3. Actualizar múltiples columnas en un mismo registro

```sql
UPDATE products SET description = 'Las teclas más suaves del mercado', stock = 1 WHERE id = 3;
```

> Modifica tanto la descripción como el stock del producto `id = 3` (el *Keyboard*).
> Podés actualizar varios campos al mismo tiempo separándolos con comas.

---

#### 4. Eliminar un registro específico

```sql
DELETE FROM products WHERE id = 8;
```

> Borra el producto con `id = 8`.
> Siempre es recomendable usar `WHERE` para evitar eliminar todos los registros de la tabla.

---

#### 5. Insertar un nuevo producto

```sql
INSERT INTO products (name, description, price, stock)
VALUES
('Mate', 'Perfecto para Cebar', 100.00, 10);
```

> Agrega un nuevo producto a la tabla `products`.
> Esto permite recuperar la información de catálogo luego de una eliminación accidental o al agregar nuevos ítems.

---

#### 6. Vaciar completamente una tabla (sin eliminar su estructura)

```sql
TRUNCATE TABLE providers;
```

> Elimina **todos los registros** de la tabla `providers`, pero **mantiene la estructura** para volver a usarla.
> Es más rápido que `DELETE` cuando querés limpiar toda la tabla.

---

#### 7. Eliminar una tabla por completo

```sql
DROP TABLE providers;
```

> Borra **definitivamente** la tabla `providers` y toda su estructura.
> Después de ejecutarlo, la tabla deja de existir y no se puede consultar.

---

#### 8. Listar las tablas existentes

```sql
SHOW TABLES;
```

> Muestra las tablas que aún existen en la base de datos actual. Sirve para confirmar si `providers` fue realmente eliminada.

---

✅ **Resumen:**

* `UPDATE`: modifica registros específicos.
* `DELETE`: elimina filas puntuales.
* `TRUNCATE`: borra todo el contenido de una tabla sin eliminar su estructura.
* `DROP`: elimina completamente la tabla.

Estas operaciones son fundamentales para **mantener y administrar datos en producción**, especialmente cuando necesitás limpiar, corregir o reestructurar tu base de datos sin comprometer su integridad.
