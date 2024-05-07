# SCHOOL DATA BASE 

#### Diagrama Entidad Relación





#### Comandos DDL y DML

```sql
-- CREAR BASE DE DATOS
CREATE DATABASE school;
```

```sql
-- CREAR TABLAS
USE `school` ;

-- -----------------------------------------------------
-- Table `school`.`gender`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `school`.`gender` (
  `gender_id` VARCHAR(5) NOT NULL,
  `actived` TINYINT NULL,
  PRIMARY KEY (`gender_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `school`.`department`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `school`.`department` (
  `department_id` INT NOT NULL,
  `department_name` VARCHAR(50) NULL,
  PRIMARY KEY (`department_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `school`.`teacher`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `school`.`teacher` (
  `teacher_id` INT(10) NOT NULL,
  `teacher_nit` VARCHAR(10) NULL,
  `teacher_first_name` VARCHAR(50) NULL,
  `teacher_last_name` VARCHAR(50) NULL,
  `teacher_first_surname` VARCHAR(50) NULL,
  `teacher_last_surname` VARCHAR(50) NULL,
  `gender_id` VARCHAR(5) NOT NULL,
  `department_id` INT NOT NULL,
  `birthdate` DATE NULL,
  `actived` TINYINT NULL,
  PRIMARY KEY (`teacher_id`),
  INDEX `fk_teacher_gender_idx` (`gender_id` ASC) VISIBLE,
  INDEX `fk_teacher_department1_idx` (`department_id` ASC) VISIBLE,
  CONSTRAINT `fk_teacher_gender`
    FOREIGN KEY (`gender_id`)
    REFERENCES `school`.`gender` (`gender_id`),
  CONSTRAINT `fk_teacher_department1`
    FOREIGN KEY (`department_id`)
    REFERENCES `school`.`department` (`department_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `school`.`student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `school`.`student` (
  `student_id` INT(10) NOT NULL,
  `student_nit` VARCHAR(10) NULL,
  `student_first_name` VARCHAR(50) NULL,
  `student_last_name` VARCHAR(50) NULL,
  `student_first_surname` VARCHAR(50) NULL,
  `student_last_surname` VARCHAR(50) NULL,
  `gender_id` VARCHAR(5) NOT NULL,
  `birthdate` DATE NULL,
  `actived` TINYINT NULL,
  PRIMARY KEY (`student_id`),
  INDEX `fk_student_gender1_idx` (`gender_id` ASC) VISIBLE,
  CONSTRAINT `fk_student_gender1`
    FOREIGN KEY (`gender_id`)
    REFERENCES `school`.`gender` (`gender_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `school`.`grade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `school`.`grade` (
  `grade_id` INT NOT NULL,
  `grade_name` VARCHAR(100) NULL,
  PRIMARY KEY (`grade_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `school`.`course`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `school`.`course` (
  `course_id` INT NOT NULL,
  `course_name` VARCHAR(100) NULL,
  `credits` FLOAT NULL,
  `coursecol` VARCHAR(45) NULL,
  `four_month_period` TINYINT NULL,
  `teacher_id` INT(10) NOT NULL,
  `grade_id` INT NOT NULL,
  `type` ENUM('básica', 'obligatoria', 'optativa') NULL,
  `course` TINYINT NULL,
  PRIMARY KEY (`course_id`),
  INDEX `fk_course_teacher1_idx` (`teacher_id` ASC) VISIBLE,
  INDEX `fk_course_grade1_idx` (`grade_id` ASC) VISIBLE,
  CONSTRAINT `fk_course_teacher1`
    FOREIGN KEY (`teacher_id`)
    REFERENCES `school`.`teacher` (`teacher_id`),
  CONSTRAINT `fk_course_grade1`
    FOREIGN KEY (`grade_id`)
    REFERENCES `school`.`grade` (`grade_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `school`.`school_year`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `school`.`school_year` (
  `school_year_id` INT NOT NULL,
  `start_year` YEAR NULL,
  `end_year` YEAR NULL,
  PRIMARY KEY (`school_year_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `school`.`course_student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `school`.`course_student` (
  `student_id` INT(10) NOT NULL,
  `course_id` INT NOT NULL,
  `school_year_id` INT NOT NULL,
  `actived` TINYINT NULL DEFAULT 1,
  `created_at` DATETIME NULL DEFAULT NOW(),
  `updated_at` DATETIME NULL DEFAULT NOW(),
  INDEX `fk_course_student_student1_idx` (`student_id` ASC) VISIBLE,
  INDEX `fk_course_student_course1_idx` (`course_id` ASC) VISIBLE,
  INDEX `fk_course_student_school_year1_idx` (`school_year_id` ASC) VISIBLE,
  CONSTRAINT `fk_course_student_student1`
    FOREIGN KEY (`student_id`)
    REFERENCES `school`.`student` (`student_id`),
  CONSTRAINT `fk_course_student_course1`
    FOREIGN KEY (`course_id`)
    REFERENCES `school`.`course` (`course_id`),
  CONSTRAINT `fk_course_student_school_year1`
    FOREIGN KEY (`school_year_id`)
    REFERENCES `school`.`school_year` (`school_year_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `school`.`phone_number`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `school`.`phone_number` (
  `phone_number_id` INT NOT NULL,
  `phone_number` VARCHAR(45) NULL,
  `phone_number_type` VARCHAR(45) NULL,
  `phone_number_name` VARCHAR(45) NULL,
  `teacher_id` INT(10) NULL DEFAULT NULL,
  `student_id` INT(10) NULL DEFAULT NULL,
  PRIMARY KEY (`phone_number_id`),
  INDEX `fk_phone_number_teacher1_idx` (`teacher_id` ASC) VISIBLE,
  INDEX `fk_phone_number_student1_idx` (`student_id` ASC) VISIBLE,
  CONSTRAINT `fk_phone_number_teacher1`
    FOREIGN KEY (`teacher_id`)
    REFERENCES `school`.`teacher` (`teacher_id`),
  CONSTRAINT `fk_phone_number_student1`
    FOREIGN KEY (`student_id`)
    REFERENCES `school`.`student` (`student_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `school`.`address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `school`.`address` (
  `address_id` INT NOT NULL,
  `address_line_1` VARCHAR(45) NULL,
  `address_line_2` VARCHAR(45) NULL,
  `city` VARCHAR(45) NULL,
  `address_type` VARCHAR(45) NULL,
  `teacher_id` INT(10) NULL DEFAULT NULL,
  `student_id` INT(10) NULL DEFAULT NULL,
  PRIMARY KEY (`address_id`),
  INDEX `fk_address_teacher1_idx` (`teacher_id` ASC) VISIBLE,
  INDEX `fk_address_student1_idx` (`student_id` ASC) VISIBLE,
  CONSTRAINT `fk_address_teacher1`
    FOREIGN KEY (`teacher_id`)
    REFERENCES `school`.`teacher` (`teacher_id`),
  CONSTRAINT `fk_address_student1`
    FOREIGN KEY (`student_id`)
    REFERENCES `school`.`student` (`student_id`))
ENGINE = InnoDB;

```

## INSERTAR DATOS DE PRUEBA



Datos Extraídos de [DATOS SCHOOL](https://gist.github.com/josejuansanchez/291d56867bfe6ca0cfae2e2b9b671e78);

Datos Formateados [DATOS FORMATEADOS](https://github.com/David-Albarracin/TALLER_DB3/blob/main/data_format.txt)

#### PROCEDIMIENTO PARA AGREGAR PRODUCTOS

```sql
```



#### VISTAS PARA FACILITAR BÚSQUEDAS 

```sql

```



## Consultas sobre una tabla

1. Devuelve un listado con el primer apellido, segundo apellido y el nombre de
   todos los alumnos. El listado deberá estar ordenado alfabéticamente de
   menor a mayor por el primer apellido, segundo apellido y nombre.

   ```sql
   ```

2. Averigua el nombre y los dos apellidos de los alumnos que no han dado de
   alta su número de teléfono en la base de datos.

   ```sql
   ```

3. Devuelve el listado de los alumnos que nacieron en 1999.

   ```sql
   ```

4. Devuelve el listado de profesores que no han dado de alta su número de
   teléfono en la base de datos y además su nif termina en K.

   ```sql
   ```

5. Devuelve el listado de las asignaturas que se imparten en el primer
   cuatrimestre, en el tercer curso del grado que tiene el identificador 7.

   ```sql
   
   ```

## Consultas multitabla (Composición interna)

Resuelva todas las consultas utilizando la sintaxis de SQL1 y SQL2. Las consultas con
sintaxis de SQL2 se deben resolver con INNER JOIN y NATURAL JOIN.

1. Devuelve un listado con los datos de todas las alumnas que se han
   matriculado alguna vez en el Grado en Ingeniería Informática (Plan 2015).

   ```sql
   ```

2. Devuelve un listado con todas las asignaturas ofertadas en el Grado en
   Ingeniería Informática (Plan 2015).

   ```sql
   ```

3. Devuelve un listado de los profesores junto con el nombre del
   departamento al que están vinculados. El listado debe devolver cuatro
   columnas, primer apellido, segundo apellido, nombre y nombre del
   departamento. El resultado estará ordenado alfabéticamente de menor a
   mayor por los apellidos y el nombre.

   ```sql
   ```

4. Devuelve un listado con el nombre de las asignaturas, año de inicio y año de
   fin del curso escolar del alumno con nif 26902806M.

   ```sql
   ```

5. Devuelve un listado con el nombre de todos los departamentos que tienen
   profesores que imparten alguna asignatura en el Grado en Ingeniería
   Informática (Plan 2015).

   ```sql
   ```

6. Devuelve un listado con todos los alumnos que se han matriculado en
   alguna asignatura durante el curso escolar 2018/2019.

   ```sql
   
   ```

## Consultas multitabla (Composición externa)

Resuelva todas las consultas utilizando las cláusulas LEFT JOIN, RIGHT JOIN, NATURAL
LEFT JOIN y NATURAL RIGHT JOIN.

1. Devuelve un listado con los nombres de todos los profesores y los
   departamentos que tienen vinculados. El listado también debe mostrar
   aquellos profesores que no tienen ningún departamento asociado. El listado
   debe devolver cuatro columnas, nombre del departamento, primer apellido,
   segundo apellido y nombre del profesor. El resultado estará ordenado
   alfabéticamente de menor a mayor por el nombre del departamento,
   apellidos y el nombre.

   ```sql
   ```

2. Devuelve un listado con los profesores que no están asociados a un
   departamento.

   ```sql
   ```

3. Devuelve un listado con los departamentos que no tienen profesores
   asociados.

   ```sql
   ```

4. Devuelve un listado con los profesores que no imparten ninguna asignatura.

   ```sql
   ```

5. Devuelve un listado con las asignaturas que no tienen un profesor asignado.

   ```sql
   ```

6. Devuelve un listado con todos los departamentos que tienen alguna
   asignatura que no se haya impartido en ningún curso escolar. El resultado
   debe mostrar el nombre del departamento y el nombre de la asignatura que
   no se haya impartido nunca.

   ```sql
   
   ```

## Consultas resumen

1. Devuelve el número total de alumnas que hay.

   ```sql
   ```

2. Calcula cuántos alumnos nacieron en 1999.

   ```sql
   ```

3. Calcula cuántos profesores hay en cada departamento. El resultado sólo
   debe mostrar dos columnas, una con el nombre del departamento y otra
   con el número de profesores que hay en ese departamento. El resultado
   sólo debe incluir los departamentos que tienen profesores asociados y
   deberá estar ordenado de mayor a menor por el número de profesores.

   ```sql
   ```

4. Devuelve un listado con todos los departamentos y el número de profesores
   que hay en cada uno de ellos. Tenga en cuenta que pueden existir
   departamentos que no tienen profesores asociados. Estos departamentos
   también tienen que aparecer en el listado.

   ```sql
   ```

5. Devuelve un listado con el nombre de todos los grados existentes en la base
   de datos y el número de asignaturas que tiene cada uno. Tenga en cuenta

   que pueden existir grados que no tienen asignaturas asociadas. Estos grados
   también tienen que aparecer en el listado. El resultado deberá estar
   ordenado de mayor a menor por el número de asignaturas.

   ```sql
   ```

6. Devuelve un listado con el nombre de todos los grados existentes en la base
   de datos y el número de asignaturas que tiene cada uno, de los grados que
   tengan más de 40 asignaturas asociadas.

   ```sql
   ```

7. Devuelve un listado que muestre el nombre de los grados y la suma del
   número total de créditos que hay para cada tipo de asignatura. El resultado
   debe tener tres columnas: nombre del grado, tipo de asignatura y la suma
   de los créditos de todas las asignaturas que hay de ese tipo. Ordene el
   resultado de mayor a menor por el número total de crédidos.

   ```sql
   ```

8. Devuelve un listado que muestre cuántos alumnos se han matriculado de
   alguna asignatura en cada uno de los cursos escolares. El resultado deberá
   mostrar dos columnas, una columna con el año de inicio del curso escolar y
   otra con el número de alumnos matriculados.

   ```sql
   ```

9. Devuelve un listado con el número de asignaturas que imparte cada
   profesor. El listado debe tener en cuenta aquellos profesores que no
   imparten ninguna asignatura. El resultado mostrará cinco columnas: id,
   nombre, primer apellido, segundo apellido y número de asignaturas. El
   resultado estará ordenado de mayor a menor por el número de asignaturas.

   ```sql
   
   ```

## Subconsultas

1. Devuelve todos los datos del alumno más joven.

   ```sql
   ```

2. Devuelve un listado con los profesores que no están asociados a un
   departamento.

   ```sql
   ```

3. Devuelve un listado con los departamentos que no tienen profesores
   asociados.

   ```sql
   ```

4. Devuelve un listado con los profesores que tienen un departamento
   asociado y que no imparten ninguna asignatura.

   ```sql
   ```

5. Devuelve un listado con las asignaturas que no tienen un profesor asignado.

   ```sql
   ```

6. Devuelve un listado con todos los departamentos que no han impartido
   asignaturas en ningún curso escolar.

   ```sql
   
   ```





