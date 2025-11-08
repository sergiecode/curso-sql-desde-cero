# Instalaciones necesarias para curso de SQL:

 - [DBNGIN](https://dbngin.com/)
 - [TABLE PLUS](https://tableplus.com/)
 - [DOCKER](https://www.docker.com/get-started/)


## Utilizaremos en la práctica avanzada:
 - [GOOGLE CHROME (NAVEGADOR)](https://www.google.com/intl/es_es/chrome/)
 - [VISUAL STUDIO CODE (Editor Código)](https://code.visualstudio.com/download)
 - [GIT (manejador de versiones)](https://git-scm.com/)
 - [POSTMAN](https://www.postman.com/downloads/)

## Playground sin instalaciones para practicar
 - [SQL PLAYGROUND](https://runsql.com/r)

## Familia de comandos SQL

| Tipo    | Nombre completo            | Qué hace                                          | Ejemplo típico                  |
| ------- | -------------------------- | ------------------------------------------------- | ------------------------------- |
| **DDL** | Data Definition Language   | Define estructura (tablas, columnas, constraints) | `CREATE TABLE`, `ALTER`, `DROP` |
| **DML** | Data Manipulation Language | Manipula datos (insertar, modificar, borrar)      | `INSERT`, `UPDATE`, `DELETE`    |
| **DQL** | Data Query Language        | Consulta datos                                    | `SELECT`                        |
| **DCL** | Data Control Language      | Gestiona permisos y accesos                       | `GRANT`, `REVOKE`               |

## Tipo de datos más importantes

| Tipo                | Uso típico            | Ejemplo                  |
| ------------------- | --------------------- | ------------------------ |
| `INT`               | números enteros       | cantidad, id             |
| `DECIMAL(10,2)`     | números con decimales | precio, saldo            |
| `VARCHAR(n)`        | texto corto           | nombre, email            |
| `TEXT`              | texto largo           | descripción, comentarios |
| `DATE` / `DATETIME` | fechas y tiempos      | fecha de registro        |
| `BOOLEAN`           | valores lógicos       | activo/inactivo          |

## Constraints (limitaciones)

| Constraint    | Función                       | Ejemplo                                      |
| ------------- | ----------------------------- | -------------------------------------------- |
| `NOT NULL`    | Obliga a tener un valor       | `email VARCHAR(150) NOT NULL`                |
| `DEFAULT`     | Valor por defecto             | `is_active BOOLEAN DEFAULT TRUE`             |
| `UNIQUE`      | No permite valores duplicados | `email UNIQUE`                               |
| `CHECK`       | Valida condiciones            | `CHECK (price > 0)`                          |
| `FOREIGN KEY` | Vincula tablas                | `FOREIGN KEY (user_id) REFERENCES users(id)` |

## Atributos de Columna 

| Atributo                         | Función                                                                                                                                                    | Ejemplo                                                             |
| -------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------- |
| **AUTO_INCREMENT**               | Genera automáticamente un número consecutivo por cada fila nueva. Solo puede haber uno por tabla y debe estar asociado a una **PRIMARY KEY** o **UNIQUE**. | `id INT AUTO_INCREMENT PRIMARY KEY`                                 |
| **DEFAULT**                      | Asigna un valor automático si no se especifica otro. Puede usar valores fijos o funciones.                                                                 | `created_at DATE DEFAULT (CURRENT_DATE)`                            |
| **COMMENT**                      | Agrega una descripción interna sobre la columna (no afecta los datos).                                                                                     | `price DECIMAL(10,2) COMMENT 'Precio en USD'`                       |
| **GENERATED / STORED / VIRTUAL** | Crea una columna calculada a partir de otras. En MySQL 5.7+ se usa `GENERATED ALWAYS AS (...)`.                                                            | `total DECIMAL(10,2) GENERATED ALWAYS AS (price * quantity) STORED` |
| **CHARACTER SET / COLLATE**      | Define la codificación y reglas de comparación para texto.                                                                                                 | `name VARCHAR(100) CHARACTER SET utf8mb4`                           |
| **ZEROFILL**                     | Rellena con ceros a la izquierda los números enteros. (poco usado hoy)                                                                                     | `code INT(5) ZEROFILL`                                              |


## ALTER TABLE

| Operación           | Descripción                                                              | Ejemplo                                                                                 |
| ------------------- | ------------------------------------------------------------------------ | --------------------------------------------------------------------------------------- |
| **ADD COLUMN**      | Agrega una nueva columna.                                                | `ALTER TABLE users ADD COLUMN age INT;`                                                 |
| **DROP COLUMN**     | Elimina una columna existente.                                           | `ALTER TABLE users DROP COLUMN age;`                                                    |
| **RENAME COLUMN**   | Cambia el nombre de una columna.                                         | `ALTER TABLE users RENAME COLUMN name TO full_name;`                                    |
| **MODIFY COLUMN**   | Cambia el tipo o las propiedades de una columna (sin cambiar el nombre). | `ALTER TABLE users MODIFY COLUMN full_name VARCHAR(150) NOT NULL;`                      |
| **ADD CONSTRAINT**  | Crea una nueva constraint (clave foránea, única, etc.).                  | `ALTER TABLE orders ADD CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES users(id);` |
| **DROP CONSTRAINT** | Elimina una constraint existente (MySQL 8+).                             | `ALTER TABLE orders DROP CONSTRAINT fk_user;`                                           |
| **RENAME TO**       | Cambia el nombre de la tabla.                                            | `ALTER TABLE users RENAME TO customers;`                                                |
| **ADD INDEX**       | Agrega un índice para optimizar consultas.                               | `ALTER TABLE users ADD INDEX idx_email (email);`                                        |
| **DROP INDEX**      | Elimina un índice existente.                                             | `ALTER TABLE users DROP INDEX idx_email;`                                               |
| **ADD CHECK**       | Agrega una validación lógica sobre los datos.                            | `ALTER TABLE products ADD CONSTRAINT chk_price CHECK (price > 0);`                      |
| **DROP CHECK**      | Quita una validación `CHECK`.                                            | `ALTER TABLE products DROP CHECK chk_price;`                                            |



## POSTGRESQL

| Parámetro             | Valor            |
| --------------------- | ---------------- |
| **Puerto**            | 5432             |
| **Usuario**           | postgres         |
| **Contraseña**        | *(sin password)* |

## MYSQL

| Parámetro      | Valor            |
| -------------- | ---------------- |
| **Puerto**     | 3306             |
| **Usuario**    | root             |
| **Contraseña** | *(sin password)* |



