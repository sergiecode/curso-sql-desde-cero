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

## POSTGRESQL

| Parámetro             | Valor            |
| --------------------- | ---------------- |
| **Puerto**            | 5432             |
| **Nombre de la base** | PostgreSQL       |
| **Usuario**           | postgres         |
| **Contraseña**        | *(sin password)* |

## MYSQL

| Parámetro      | Valor            |
| -------------- | ---------------- |
| **Puerto**     | 3306             |
| **Usuario**    | root             |
| **Contraseña** | *(sin password)* |
