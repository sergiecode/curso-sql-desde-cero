### ALTER TABLE en MySQL – Ejemplos prácticos y explicación

---

```sql

ALTER TABLE users ADD COLUMN phone VARCHAR(20);

ALTER TABLE users DROP COLUMN phone;

ALTER TABLE users RENAME COLUMN phone TO cellphone;

ALTER TABLE users DROP COLUMN cellphone;

ALTER TABLE users MODIFY COLUMN cellphone VARCHAR(30) NOT NULL;

ALTER TABLE users ADD CONSTRAINT cellphone UNIQUE (cellphone);

ALTER TABLE users RENAME TO	customers;

DESCRIBE customers;
DESCRIBE users;
DESCRIBE orders;
DESCRIBE products;

SHOW tables;

```

---

Estos comandos se usan para **modificar la estructura de una tabla existente** sin eliminarla. Con `ALTER TABLE` podés agregar, eliminar, renombrar o modificar columnas, además de definir o quitar restricciones.

---

#### 1. Agregar una columna

```sql
ALTER TABLE users ADD COLUMN phone VARCHAR(20);
```

> Agrega una nueva columna `phone` de tipo `VARCHAR(20)` a la tabla `users`.
> Este tipo de operación es útil cuando necesitás sumar un nuevo dato a tu modelo, sin perder la información existente.

---

#### 2. Eliminar una columna

```sql
ALTER TABLE users DROP COLUMN phone;
```

> Elimina la columna `phone` y todos sus datos asociados.
> Se usa cuando ya no necesitás ese campo o fue reemplazado por otro.

---

#### 3. Renombrar una columna

```sql
ALTER TABLE users RENAME COLUMN phone TO cellphone;
```

> Cambia el nombre de la columna `phone` a `cellphone`.
> Ideal para mantener una convención de nombres más clara o consistente.

---

#### 4. Eliminar una columna renombrada

```sql
ALTER TABLE users DROP COLUMN cellphone;
```

> Borra definitivamente la columna `cellphone`.

---

#### 5. Modificar el tipo de dato o restricciones de una columna

```sql
ALTER TABLE users MODIFY COLUMN cellphone VARCHAR(30) NOT NULL;
```

> Cambia las propiedades de la columna `cellphone`, estableciendo un nuevo tamaño máximo (30 caracteres) y que no puede ser nula (`NOT NULL`).

---

#### 6. Agregar una restricción UNIQUE

```sql
ALTER TABLE users ADD CONSTRAINT cellphone UNIQUE (cellphone);
```

> Crea una restricción de unicidad sobre la columna `cellphone`.
> Esto garantiza que no haya dos usuarios con el mismo número de celular.

---

#### 7. Renombrar una tabla

```sql
ALTER TABLE users RENAME TO customers;
```

> Cambia el nombre de la tabla `users` a `customers`.
> Muy común cuando evolucionás tu modelo de datos o redefinís el dominio del sistema.

---

#### 8. Consultar la estructura de las tablas

```sql
DESCRIBE customers;
DESCRIBE users;
DESCRIBE orders;
DESCRIBE products;
```

> `DESCRIBE` muestra la estructura de la tabla: columnas, tipos de datos, claves primarias y restricciones.
> Sirve para verificar los cambios que hiciste con `ALTER TABLE`.

---

#### 9. Listar todas las tablas de la base de datos

```sql
SHOW TABLES;
```

> Devuelve una lista con todas las tablas existentes en la base de datos seleccionada.

---

✅ **Resumen:**
`ALTER TABLE` es una herramienta esencial para la **evolución de un esquema SQL**. Permite modificar la estructura de tus tablas sin perder los datos existentes y adaptarlas a nuevas necesidades del proyecto.
