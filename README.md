# SCHOOL DATA BASE 

#### Diagrama Entidad Relación

![DIAGRAMA](https://raw.githubusercontent.com/David-Albarracin/SCHOOL_DB/main/school.png)



#### Comandos DDL y DML

```sql
-- CREAR BASE DE DATOS
CREATE DATABASE school;
```

```sql
-- CREAR TABLAS
USE `school` ;

-- -----------------------------------------------------
-- Table `school`.`city`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `school`.`city` (
  `city_id` INT NOT NULL AUTO_INCREMENT,
  `city_name` VARCHAR(45) NULL,
  PRIMARY KEY (`city_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `school`.`course_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `school`.`course_type` (
  `course_type_id` INT NOT NULL AUTO_INCREMENT,
  `course_type_name` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`course_type_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `school`.`department`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `school`.`department` (
  `department_id` INT NOT NULL,
  `department_name` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`department_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `school`.`gender`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `school`.`gender` (
  `gender_id` VARCHAR(5) NOT NULL,
  `actived` TINYINT NULL DEFAULT NULL,
  PRIMARY KEY (`gender_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `school`.`teacher`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `school`.`teacher` (
  `teacher_id` INT NOT NULL,
  `teacher_nit` VARCHAR(10) NULL DEFAULT NULL,
  `teacher_first_name` VARCHAR(50) NULL DEFAULT NULL,
  `teacher_last_name` VARCHAR(50) NULL DEFAULT NULL,
  `teacher_first_surname` VARCHAR(50) NULL DEFAULT NULL,
  `teacher_last_surname` VARCHAR(50) NULL DEFAULT NULL,
  `gender_id` VARCHAR(5) NOT NULL,
  `department_id` INT NOT NULL,
  `birthdate` DATE NULL DEFAULT NULL,
  `actived` TINYINT NULL DEFAULT NULL,
  PRIMARY KEY (`teacher_id`),
  INDEX `fk_teacher_gender_idx` (`gender_id` ASC) VISIBLE,
  INDEX `fk_teacher_department1_idx` (`department_id` ASC) VISIBLE,
  CONSTRAINT `fk_teacher_department1`
    FOREIGN KEY (`department_id`)
    REFERENCES `school`.`department` (`department_id`),
  CONSTRAINT `fk_teacher_gender`
    FOREIGN KEY (`gender_id`)
    REFERENCES `school`.`gender` (`gender_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `school`.`teacher_address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `school`.`teacher_address` (
  `teacher_address_id` INT(10) NOT NULL AUTO_INCREMENT,
  `address_line_1` VARCHAR(45) NULL DEFAULT NULL,
  `address_line_2` VARCHAR(45) NULL DEFAULT NULL,
  `address_type` VARCHAR(45) NULL DEFAULT NULL,
  `teacher_id` INT NOT NULL,
  `city_id` INT NOT NULL,
  PRIMARY KEY (`teacher_address_id`),
  INDEX `fk_address_teacher1_idx` (`teacher_id` ASC) VISIBLE,
  INDEX `fk_teacher_address_city1_idx` (`city_id` ASC) VISIBLE,
  CONSTRAINT `fk_address_teacher1`
    FOREIGN KEY (`teacher_id`)
    REFERENCES `school`.`teacher` (`teacher_id`),
  CONSTRAINT `fk_teacher_address_city1`
    FOREIGN KEY (`city_id`)
    REFERENCES `school`.`city` (`city_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `school`.`grade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `school`.`grade` (
  `grade_id` INT NOT NULL,
  `grade_name` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`grade_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `school`.`course`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `school`.`course` (
  `course_id` INT NOT NULL,
  `course_name` VARCHAR(100) NULL DEFAULT NULL,
  `credits` FLOAT NULL DEFAULT NULL,
  `four_month_period` TINYINT NULL DEFAULT NULL,
  `teacher_id` INT NULL,
  `grade_id` INT NOT NULL,
  `course` TINYINT NULL DEFAULT NULL,
  `course_type_id` INT NOT NULL,
  PRIMARY KEY (`course_id`),
  INDEX `fk_course_teacher1_idx` (`teacher_id` ASC) VISIBLE,
  INDEX `fk_course_grade1_idx` (`grade_id` ASC) VISIBLE,
  INDEX `fk_course_course_type1_idx` (`course_type_id` ASC) VISIBLE,
  CONSTRAINT `fk_course_grade1`
    FOREIGN KEY (`grade_id`)
    REFERENCES `school`.`grade` (`grade_id`),
  CONSTRAINT `fk_course_teacher1`
    FOREIGN KEY (`teacher_id`)
    REFERENCES `school`.`teacher` (`teacher_id`),
  CONSTRAINT `fk_course_course_type1`
    FOREIGN KEY (`course_type_id`)
    REFERENCES `school`.`course_type` (`course_type_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `school`.`school_year`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `school`.`school_year` (
  `school_year_id` INT NOT NULL,
  `start_year` YEAR NULL DEFAULT NULL,
  `end_year` YEAR NULL DEFAULT NULL,
  PRIMARY KEY (`school_year_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `school`.`student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `school`.`student` (
  `student_id` INT NOT NULL,
  `student_nit` VARCHAR(10) NULL DEFAULT NULL,
  `student_first_name` VARCHAR(50) NULL DEFAULT NULL,
  `student_last_name` VARCHAR(50) NULL DEFAULT NULL,
  `student_first_surname` VARCHAR(50) NULL DEFAULT NULL,
  `student_last_surname` VARCHAR(50) NULL DEFAULT NULL,
  `gender_id` VARCHAR(5) NOT NULL,
  `birthdate` DATE NULL DEFAULT NULL,
  `actived` TINYINT NULL DEFAULT NULL,
  PRIMARY KEY (`student_id`),
  INDEX `fk_student_gender1_idx` (`gender_id` ASC) VISIBLE,
  CONSTRAINT `fk_student_gender1`
    FOREIGN KEY (`gender_id`)
    REFERENCES `school`.`gender` (`gender_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `school`.`course_student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `school`.`course_student` (
  `student_id` INT NOT NULL,
  `course_id` INT NOT NULL,
  `school_year_id` INT NOT NULL,
  `actived` TINYINT NULL DEFAULT '1',
  `created_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  INDEX `fk_course_student_student1_idx` (`student_id` ASC) VISIBLE,
  INDEX `fk_course_student_course1_idx` (`course_id` ASC) VISIBLE,
  INDEX `fk_course_student_school_year1_idx` (`school_year_id` ASC) VISIBLE,
  CONSTRAINT `PK_course_student` PRIMARY KEY (student_id, course_id, school_year_id),
  CONSTRAINT `fk_course_student_course1`
    FOREIGN KEY (`course_id`)
    REFERENCES `school`.`course` (`course_id`),
  CONSTRAINT `fk_course_student_school_year1`
    FOREIGN KEY (`school_year_id`)
    REFERENCES `school`.`school_year` (`school_year_id`),
  CONSTRAINT `fk_course_student_student1`
    FOREIGN KEY (`student_id`)
    REFERENCES `school`.`student` (`student_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `school`.`student_phone_number`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `school`.`student_phone_number` (
  `student_phone_number_id` INT(10) NOT NULL AUTO_INCREMENT,
  `phone_number` VARCHAR(45) NULL DEFAULT NULL,
  `phone_number_type` VARCHAR(45) NULL DEFAULT NULL,
  `phone_number_name` VARCHAR(45) NULL DEFAULT NULL,
  `student_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`student_phone_number_id`),
  INDEX `fk_phone_number_student1_idx` (`student_id` ASC) VISIBLE,
  CONSTRAINT `fk_phone_number_student1`
    FOREIGN KEY (`student_id`)
    REFERENCES `school`.`student` (`student_id`))
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `school`.`teacher_phone_number`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `school`.`teacher_phone_number` (
  `teacher_phone_number_id` INT(10) NOT NULL AUTO_INCREMENT,
  `phone_number` VARCHAR(45) NULL DEFAULT NULL,
  `phone_number_type` VARCHAR(45) NULL DEFAULT NULL,
  `phone_number_name` VARCHAR(45) NULL DEFAULT NULL,
  `teacher_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`teacher_phone_number_id`),
  INDEX `fk_phone_number_teacher1_idx` (`teacher_id` ASC) VISIBLE,
  CONSTRAINT `fk_phone_number_teacher10`
    FOREIGN KEY (`teacher_id`)
    REFERENCES `school`.`teacher` (`teacher_id`))
ENGINE = InnoDB;




-- -----------------------------------------------------
-- Table `school`.`student_address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `school`.`student_address` (
  `student_address_id` INT(10) NOT NULL AUTO_INCREMENT,
  `address_line_1` VARCHAR(45) NULL DEFAULT NULL,
  `address_line_2` VARCHAR(45) NULL DEFAULT NULL,
  `address_type` VARCHAR(45) NULL DEFAULT NULL,
  `student_id` INT NULL DEFAULT NULL,
  `city_id` INT NOT NULL,
  PRIMARY KEY (`student_address_id`),
  INDEX `fk_address_student1_idx` (`student_id` ASC) VISIBLE,
  INDEX `fk_student_address_city1_idx` (`city_id` ASC) VISIBLE,
  CONSTRAINT `fk_address_student10`
    FOREIGN KEY (`student_id`)
    REFERENCES `school`.`student` (`student_id`),
  CONSTRAINT `fk_student_address_city1`
    FOREIGN KEY (`city_id`)
    REFERENCES `school`.`city` (`city_id`))
ENGINE = InnoDB;

```

## INSERTAR DATOS DE PRUEBA

Datos Extraídos de [DATOS SCHOOL](https://gist.github.com/josejuansanchez/291d56867bfe6ca0cfae2e2b9b671e78);

Datos Formateados [CALLS PROCEDURES](https://github.com/David-Albarracin/SCHOOL_DB/blob/main/calls_procedures.sql)

#### PROCEDIMIENTO Y FUNCIONES

```sql
-- PROCEDIMIENTO PARA AGREGAR DEPARTAMENTOS

USE school;

DROP PROCEDURE IF EXISTS add_departamento;

DELIMITER $$

CREATE PROCEDURE add_departamento(
	IN id INT,
    IN nombre VARCHAR(50)
)
BEGIN
    INSERT INTO department(
   		department_id,
   		department_name
   	) VALUES (
   		id,
   		nombre
   	);

END $$

DELIMITER ;

-- PROCEDIMIENTO PARA AGREGAR ALUMNOS

USE school;

DROP PROCEDURE IF EXISTS add_alumno;

DELIMITER $$

CREATE PROCEDURE add_alumno(
	IN id INT,
	IN nit VARCHAR(9),
	IN nombre VARCHAR(25),
	IN apellido1 VARCHAR(50),
	IN apellido2 VARCHAR(50),
	IN ciudad VARCHAR(25),
	IN direccion VARCHAR(50),
	IN telefono VARCHAR(9),
	IN fecha_nacimiento DATE,
	IN sexo ENUM('H', 'M')
)
BEGIN
	DECLARE get_city_id INT;
	DECLARE get_gener_id VARCHAR(10);

	SELECT c.city_id INTO get_city_id FROM city AS c WHERE c.city_name = ciudad;
	
	IF get_city_id IS NULL THEN
		INSERT INTO 
			city(
				city_name
			)VALUES(ciudad);
		SET get_city_id = LAST_INSERT_ID();
	END IF;

	SELECT g.gender_id INTO get_gener_id FROM gender AS g WHERE g.gender_id = sexo;
	
	IF get_gener_id IS NULL THEN
		INSERT INTO 
			gender(
				gender_id,
				actived
			)VALUES(sexo, 1);
		SET get_gener_id = sexo;
	END IF;
	
    INSERT INTO student(
   		student_id,
		student_nit,
		student_first_name,
		student_last_name,
		student_first_surname,
		student_last_surname,
		gender_id,
		birthdate,
		actived
   	) VALUES (
   		id,
   		nit,
   		nombre,
   		NULL,
   		apellido1,
   		apellido2,
   		get_gener_id,
   		fecha_nacimiento,
   		1
   	);
   
    INSERT INTO student_address (
		address_line_1,
		address_line_2,
		address_type,
		student_id,
		city_id
   	) VALUES (
   		direccion,
   		NULL,
   		'Casa',
   		id,
   		get_city_id
   	);
   
    INSERT INTO student_phone_number  (
		phone_number,
		phone_number_type,
		phone_number_name,
		student_id
   	) VALUES (
   		telefono,
   		'Personal',
   		nombre,
   		id
   	);

END $$

DELIMITER ;

-- PROCEDIMIENTO PARA AGREGAR PROFESORES

USE school;

DROP PROCEDURE IF EXISTS add_profesor;

DELIMITER $$

CREATE PROCEDURE add_profesor(
	id INT,
	nit VARCHAR(9),
	nombre VARCHAR(25),
	apellido1 VARCHAR(50),
	apellido2 VARCHAR(50),
	ciudad VARCHAR(25),
	direccion VARCHAR(50),
	telefono VARCHAR(9),
	fecha_nacimiento DATE,
	sexo ENUM('H', 'M'),
	id_departamento INT
)
BEGIN
	DECLARE get_city_id INT;
	DECLARE get_gener_id VARCHAR(10);

	SELECT c.city_id INTO get_city_id FROM city AS c WHERE c.city_name = ciudad;
	
	IF get_city_id IS NULL THEN
		INSERT INTO 
			city(
				city_name
			)VALUES(ciudad);
		SET get_city_id = LAST_INSERT_ID();
	END IF;

	SELECT g.gender_id INTO get_gener_id FROM gender AS g WHERE g.gender_id = sexo;
	
	IF get_gener_id IS NULL THEN
		INSERT INTO 
			gender(
				gender_id,
				actived
			)VALUES(sexo, 1);
		SET get_gener_id = sexo;
	END IF;
	
    INSERT INTO teacher (
   		teacher_id,
		teacher_nit,
		teacher_first_name,
		teacher_last_name,
		teacher_first_surname,
		teacher_last_surname,
		gender_id,
		department_id,
		birthdate,
		actived
   	) VALUES (
   		id,
   		nit,
   		nombre,
   		NULL,
   		apellido1,
   		apellido2,
   		get_gener_id,
   		id_departamento,
   		fecha_nacimiento,
   		1
   	);
   
    INSERT INTO teacher_address  (
		address_line_1,
		address_line_2,
		address_type,
		teacher_id,
		city_id
   	) VALUES (
   		direccion,
   		NULL,
   		'Casa',
   		id,
   		get_city_id
   	);
   
    INSERT INTO teacher_phone_number  (
		phone_number,
		phone_number_type,
		phone_number_name,
		teacher_id 
   	) VALUES (
   		telefono,
   		'Personal',
   		nombre,
   		id
   	);

END $$

DELIMITER ;

-- PROCEDIMIENTO PARA AGREGAR GRADOS

USE school;

DROP PROCEDURE IF EXISTS add_grado;

DELIMITER $$

CREATE PROCEDURE add_grado(
	id INT,
	nombre VARCHAR(100)
)
BEGIN
	INSERT INTO grade(
   		grade_id,
   		grade_name
   	) VALUES (
   		id,
   		nombre
   	);

END $$

DELIMITER ;

-- PROCEDIMIENTO PARA AGREGAR ASIGNATURAS

USE school;

DROP PROCEDURE IF EXISTS add_asignatura;

DELIMITER $$

CREATE PROCEDURE add_asignatura(
	id INT,
	nombre VARCHAR(100),
	creditos FLOAT,
	tipo ENUM('básica', 'obligatoria', 'optativa'),
	curso TINYINT,
	cuatrimestre TINYINT,
	id_profesor INT,
	id_grado INT
)
BEGIN
	DECLARE get_type_id VARCHAR(20);

	SELECT ct.course_type_id INTO get_type_id FROM course_type AS ct WHERE ct.course_type_name = tipo;

	IF get_type_id IS NULL THEN
		INSERT INTO course_type(
			course_type_name
		)VALUES(tipo);
		SET get_type_id = last_insert_id() ;
	END IF;

	INSERT INTO course (
   		course_id,
		course_name,
		credits,
		four_month_period,
		teacher_id,
		grade_id,
		course,
		course_type_id
   	) VALUES (
   		id,
   		nombre,
   		creditos,
   		cuatrimestre,
   		id_profesor,
   		id_grado,
   		curso,
   		get_type_id
   	);

END $$

DELIMITER ;


-- PROCEDIMIENTO PARA AGREGAR YEAR ESCOLAR

USE school;

DROP PROCEDURE IF EXISTS add_curso_escolar;

DELIMITER $$

CREATE PROCEDURE add_curso_escolar(
	id INT,
	anyo_inicio YEAR,
	anyo_fin YEAR
)
BEGIN
	INSERT INTO school_year(
   		school_year_id,
		start_year,
		end_year
   	) VALUES (
   		id,
   		anyo_inicio,
   		anyo_fin
   	);

END $$

DELIMITER ;

-- PROCEDIMIENTO PARA AGREGAR add_alumno_se_matricula_asignatura

USE school;

DROP PROCEDURE IF EXISTS add_alumno_se_matricula_asignatura;

DELIMITER $$

CREATE PROCEDURE add_alumno_se_matricula_asignatura(
	id_alumno INT,
	id_asignatura INT,
	id_curso_escolar INT
)
BEGIN
	INSERT INTO course_student(
   		student_id,
		course_id,
		school_year_id,
		actived,
		created_at,
		updated_at

   	) VALUES (
   		id_alumno,
   		id_asignatura,
   		id_curso_escolar,
   		1,
   		NOW(),
   		NOW()
   	);

END $$

DELIMITER ;
```

#### VISTAS PARA FACILITAR BÚSQUEDAS 

```sql
-- VISTA PARA FACILITAR LAS BUSQUEDAS DE LOS ESTUDIANTES
USE school;

DROP VIEW IF EXISTS student_data;

CREATE VIEW student_data AS
SELECT
	s.student_id AS id,
	s.student_nit AS nit,
	s.student_first_name,
	s.student_first_surname, 
	s.student_last_surname,
	s.gender_id AS Genero,
	s.birthdate,
	cy.city_name,
	spn.phone_number,
	COUNT(cs.student_id) AS 'Cursos'
FROM
	student AS s 
INNER JOIN
	student_address AS sa ON sa.student_id = s.student_id
INNER JOIN 
	city AS cy ON cy.city_id = sa.city_id
INNER JOIN 
	student_phone_number AS spn ON spn.student_id = s.student_id
LEFT JOIN
	course_student AS cs ON cs.student_id = s.student_id
GROUP BY
	id;
	
-- VISTA PARA FACILITAR LAS BUSQUEDAS DE LOS PROFESORES
USE school;

DROP VIEW IF EXISTS teacher_data;

CREATE VIEW teacher_data AS
SELECT
	t.teacher_id AS id,
	t.teacher_nit AS nit,
	t.teacher_first_name,
	t.teacher_first_surname, 
	t.teacher_last_name,
	t.gender_id AS Genero,
	t.birthdate,
	cy.city_name,
	tpn.phone_number,
	COUNT(c.teacher_id) AS 'Cursos'
FROM
	teacher AS t
INNER JOIN
	teacher_address AS ta ON ta.teacher_id = t.teacher_id
INNER JOIN 
	city AS cy ON cy.city_id = ta.city_id
INNER JOIN 
	teacher_phone_number AS tpn ON tpn.teacher_id = t.teacher_id
LEFT JOIN
	course AS c ON c.teacher_id = t.teacher_id
GROUP BY
	id;
	
-- VISTA PARA FACILITAR LAS BUSQUEDAS DE LOS CURSOS
USE school;

DROP VIEW IF EXISTS course_data;

CREATE VIEW course_data AS
SELECT 
	c.course_id,
	c.course_name,
	c.credits,
	c.four_month_period,
	c.teacher_id,
	g.grade_name,
	c.course,
	ct.course_type_name
FROM 
	course AS c  
LEFT JOIN
	course_type AS ct ON ct.course_type_id = ct.course_type_id
LEFT JOIN 
	grade AS g ON g.grade_id = c.grade_id;
	

```



## Consultas sobre una tabla

1. Devuelve un listado con el primer apellido, segundo apellido y el nombre de
   todos los alumnos. El listado deberá estar ordenado alfabéticamente de
   menor a mayor por el primer apellido, segundo apellido y nombre.

   ```sql
   SELECT
   	CONCAT(
   		student_first_surname,
   		' ',
   		student_last_surname,
   		' ', 
   		student_first_name
   	) AS estudiante
   FROM 
   	student_data
   ORDER BY
   	estudiante ASC;
   	
   +----------------------------+
   | estudiante                 |
   +----------------------------+
   | Domínguez Guerrero Antonio |
   | Gea Ruiz Sonia             |
   | Gutiérrez López Juan       |
   | Heller Pagac Pedro         |
   | Herman Pacocha Daniel      |
   | Hernández Martínez Irene   |
   | Herzog Tremblay Ramón      |
   | Koss Bayer José            |
   | Lakin Yundt Inma           |
   | Saez Vega Juan             |
   | Sánchez Pérez Salvador     |
   | Strosin Turcotte Ismael    |
   +----------------------------+
   12 rows in set (0.00 sec)
   ```
   
2. Averigua el nombre y los dos apellidos de los alumnos que no han dado de
   alta su número de teléfono en la base de datos.

   ```sql
   SELECT
   	CONCAT(
   		student_first_surname,
   		' ',
   		student_last_surname,
   		' ', 
   		student_first_name
   	) AS estudiante
   FROM 
   	student_data
   WHERE 
   	phone_number IS NULL
   ORDER BY
   	estudiante ASC;
   	
   +-------------------------+
   | estudiante              |
   +-------------------------+
   | Heller Pagac Pedro      |
   | Strosin Turcotte Ismael |
   +-------------------------+
   2 rows in set (0.00 sec)
   ```
   
3. Devuelve el listado de los alumnos que nacieron en 1999.

   ```sql
   SELECT
   	CONCAT(
   		student_first_surname,
   		' ',
   		student_last_surname,
   		' ', 
   		student_first_name
   	) AS estudiante
   FROM 
   	student_data
   WHERE 
   	YEAR(birthdate) = '1999'
   ORDER BY
   	estudiante ASC;
   
   +----------------------------+
   | estudiante                 |
   +----------------------------+
   | Domínguez Guerrero Antonio |
   | Strosin Turcotte Ismael    |
   +----------------------------+
   2 rows in set (0.00 sec)
   ```

4. Devuelve el listado de profesores que no han dado de alta su número de
   teléfono en la base de datos y además su nit termina en K.

   ```sql
   SELECT 
   	nit,
   	teacher_first_name,
   	phone_number
   FROM 
   	teacher_data 
   WHERE 
   	phone_number IS NULL
   	AND 
   	nit LIKE '%K';
   	
   +-----------+--------------------+--------------+
   | nit       | teacher_first_name | phone_number |
   +-----------+--------------------+--------------+
   | 10485008K | Antonio            | NULL         |
   | 85869555K | Guillermo          | NULL         |
   +-----------+--------------------+--------------+
   2 rows in set (0.00 sec)
   ```
   
5. Devuelve el listado de las asignaturas que se imparten en el primer
   cuatrimestre, en el tercer curso del grado que tiene el identificador 7.

   ```sql
   SELECT
   	c.course_name
   FROM 
   	course AS c
   INNER JOIN
   	grade AS g ON g.grade_id = c.grade_id 
   WHERE 
   	g.grade_id = 7
   	AND 
   	c.four_month_period = 1
   	AND 
   	c.course = 3;
   	
   +-------------------------------------------+
   | course_name                               |
   +-------------------------------------------+
   | Bases moleculares del desarrollo vegetal  |
   | Fisiología animal                         |
   | Metabolismo y biosíntesis de biomoléculas |
   | Operaciones de separación                 |
   | Patología molecular de plantas            |
   | Técnicas instrumentales básicas           |
   +-------------------------------------------+
   6 rows in set (0.00 sec)
   ```

## Consultas multitabla (Composición interna)

Resuelva todas las consultas utilizando la sintaxis de SQL1 y SQL2. Las consultas con
sintaxis de SQL2 se deben resolver con INNER JOIN y NATURAL JOIN.

1. Devuelve un listado con los datos de todas las alumnas que se han
   matriculado alguna vez en el Grado en Ingeniería Informática (Plan 2015).

   ```sql
   SELECT 
   	s.student_first_name,
   	c.course_name,
   	g.grade_name 
   FROM 
   	student AS s 
   INNER JOIN
   	course_student AS cs ON cs.student_id = s.student_id 
   INNER JOIN 
   	course AS c ON c.course_id =  cs.course_id 
   INNER JOIN 
   	grade AS g ON g.grade_id = c.grade_id 
   WHERE 
   	s.gender_id = 'M'
   	AND 
   	g.grade_name LIKE '%Grado en Ingeniería Informática (Plan 2015)%';
   ```
   
2. Devuelve un listado con todas las asignaturas ofertadas en el Grado en
   Ingeniería Informática (Plan 2015).

   ```sql
   SELECT 
   	c.course_name
   FROM 
   	course AS c
   INNER JOIN 
   	grade AS g ON g.grade_id = c.grade_id 
   WHERE 
   	g.grade_name LIKE '%Grado en Ingeniería Informática (Plan 2015)%';
   	
   +------------------------------------------------------------------------+
   | course_name                                                            |
   +------------------------------------------------------------------------+
   | Negocio Electrónico                                                    |
   | Periféricos e interfaces                                               |
   | Sistemas de tiempo real                                                |
   | Tecnologías de acceso a red                                            |
   | Tratamiento digital de imágenes                                        |
   | Administración de redes y sistemas operativos                          |
   | Almacenes de Datos                                                     |
   | Fiabilidad y Gestión de Riesgos                                        |
   | Líneas de Productos Software                                           |
   | Procesos de Ingeniería del Software 1                                  |
   | Tecnologías multimedia                                                 |
   | Análisis y planificación de las TI                                     |
   | Desarrollo Rápido de Aplicaciones                                      |
   | Gestión de la Calidad y de la Innovación Tecnológica                   |
   | Inteligencia del Negocio                                               |
   | Procesos de Ingeniería del Software 2                                  |
   | Seguridad Informática                                                  |
   +------------------------------------------------------------------------+
   51 rows in set (0.00 sec)
   ```
   
3. Devuelve un listado de los profesores junto con el nombre del
   departamento al que están vinculados. El listado debe devolver cuatro
   columnas, primer apellido, segundo apellido, nombre y nombre del
   departamento. El resultado estará ordenado alfabéticamente de menor a
   mayor por los apellidos y el nombre.

   ```sql
   SELECT 
   	concat(
   		t.teacher_first_surname,
   		' ',
   		t.teacher_last_surname,
   		' ',
   		t.teacher_first_name
   	) AS teacher,
   	d.department_name
   FROM 
   	teacher AS t 
   INNER JOIN
   	department AS d ON d.department_id = t.teacher_id 
   ORDER BY 
   	teacher DESC;
   	
   +---------------------------+--------------------+
   | teacher                   | department_name    |
   +---------------------------+--------------------+
   | Schmidt Fisher David      | Agronomía          |
   | Ramirez Gea Zoe           | Economía y Empresa |
   | Lemke Rutherford Cristina | Derecho            |
   +---------------------------+--------------------+
   3 rows in set (0.00 sec)
   ```
   
4. Devuelve un listado con el nombre de las asignaturas, año de inicio y año de
   fin del curso escolar del alumno con nif 26902806M.

   ```sql
   SELECT 
   	c.course_name,
   	sy.start_year,
   	sy.end_year 
   FROM 
   	student AS s
   INNER JOIN
   	course_student AS cs ON cs.student_id = s.student_id 
   INNER JOIN 
   	school_year AS sy ON sy.school_year_id = cs.school_year_id 
   INNER JOIN 
   	course AS c ON c.course_id = cs.course_id 
   WHERE 
   	s.student_nit = '26902806M';
   	
   +--------------------------------------+------------+----------+
   | course_name                          | start_year | end_year |
   +--------------------------------------+------------+----------+
   | Álgegra lineal y matemática discreta |       2014 |     2015 |
   | Cálculo                              |       2014 |     2015 |
   | Física para informática              |       2014 |     2015 |
   +--------------------------------------+------------+----------+
   3 rows in set (0.00 sec)
   ```
   
5. Devuelve un listado con el nombre de todos los departamentos que tienen
   profesores que imparten alguna asignatura en el Grado en Ingeniería
   Informática (Plan 2015).

   ```sql
   SELECT DISTINCT 
   	d.department_name
   FROM 
   	department AS d
   LEFT JOIN
   	teacher AS t ON t.department_id = d.department_id 
   LEFT JOIN 
   	course AS c ON c.teacher_id = t.teacher_id
   LEFT JOIN 
   	grade AS g ON g.grade_id = c.grade_id  
   WHERE 
   	g.grade_name LIKE '%Grado en Ingeniería Informática (Plan 2015)%';
   	
   +-----------------+
   | department_name |
   +-----------------+
   | Informática     |
   +-----------------+
   1 row in set (0.00 sec)
   ```
   
6. Devuelve un listado con todos los alumnos que se han matriculado en
   alguna asignatura durante el curso escolar 2018/2019.

   ```sql
   SELECT 
   	s.student_first_name
   FROM 
   	student AS s
   INNER JOIN
   	course_student AS cs ON cs.student_id = s.student_id 
   INNER JOIN 
   	school_year AS sy ON sy.school_year_id  = cs.school_year_id  
   WHERE 
   	YEAR(sy.start_year) = '2018'
   	AND 
   	YEAR(SY.end_year) = '2019';
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





