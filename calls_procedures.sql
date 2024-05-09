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

-- PROCEDIMIENTO PARA AGREGAR

USE school;

DROP PROCEDURE IF EXISTS add_city;

DELIMITER $$

CREATE PROCEDURE add_city(
	ciudad VARCHAR(50)
)
BEGIN
	DECLARE mensaje VARCHAR(100);
	
	INSERT INTO  
		city(city_name)
	VALUES 
		(ciudad);

	IF ROW_COUNT() > 0 THEN
		SET mensaje = 'Se actualizó el registro correctamente.';
	ELSE
		SET mensaje = 'No se encontró ningún registro para actualizar.';
	END IF;

	SELECT mensaje AS Resultado;

END $$

DELIMITER ;

-- PROCEDIMIENTO PARA AGREGAR

USE school;

DROP PROCEDURE IF EXISTS change_course_student;

DELIMITER $$

CREATE PROCEDURE change_course_student(
	id_alumno INT,
	id_asignatura INT
)
BEGIN
	DECLARE mensaje VARCHAR(100);
	
	UPDATE  
		course_student
	SET 
		actived = 0,
		updated_at = NOW()
	WHERE 
		course_id = id_asignatura
		AND 
		student_id = id_alumno;
		
	IF ROW_COUNT() > 0 THEN
		SET mensaje = 'Se actualizó el registro correctamente.';
	ELSE
		SET mensaje = 'No se encontró ningún registro para actualizar.';
	END IF;

	SELECT mensaje AS Resultado;

END $$

DELIMITER ;

-- PROCEDIMIENTO PARA AGREGAR

USE school;

DROP PROCEDURE IF EXISTS add_gender;

DELIMITER $$

CREATE PROCEDURE add_gender(
	IN genero VARCHAR(10)
)
BEGIN
	DECLARE mensaje VARCHAR(100);
	
	INSERT INTO  
		gender(gender_id, actived)
	VALUES( 
		genero, 1
	);
		
	IF ROW_COUNT() > 0 THEN
		SET mensaje = 'Se actualizó el registro correctamente.';
	ELSE
		SET mensaje = 'No se encontró ningún registro para actualizar.';
	END IF;

	SELECT mensaje AS Resultado;

END $$

DELIMITER ;

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
	
-- VISTA PARA FACILITAR LAS BUSQUEDAS DE LOS DEPARTAMENTOS
USE school;

DROP VIEW IF EXISTS department_teacher;

CREATE VIEW department_teacher AS
SELECT
	d.department_id,
	t.teacher_id,
	t.teacher_first_name
FROM 
	department AS d
LEFT JOIN
	teacher AS t ON d.department_id = t.department_id

;

-- VISTA PARA FACILITAR RESUMEN DE LOS CREDITOS
USE school;

DROP VIEW IF EXISTS grade_total_credits;

CREATE VIEW grade_total_credits AS
SELECT
	g.grade_name,
	c.course_name,
	SUM(c.credits) AS 'total_credits'
FROM 
	grade AS g
INNER JOIN
	course AS c ON c.grade_id = g.grade_id
GROUP BY 
	g.grade_name,
	c.course_name;
	
-- VISTA PARA FACILITAR RESUMEN DE LOS ESTUDIANTES POR AÑO
USE school;

DROP VIEW IF EXISTS course_student_count;

CREATE VIEW course_student_count AS
SELECT
	sy.start_year,
	COUNT(cs.student_id) AS 'n_estudiantes'
FROM 
	school_year AS sy 
INNER JOIN
	course_student AS cs ON cs.school_year_id = sy.school_year_id
GROUP BY 
	sy.start_year;
	
-- VISTA PARA FACILITAR RESUMEN DE LOS PROFESORES Y SUS ASIGNATURAS
USE school;

DROP VIEW IF EXISTS course_teacher_count;

CREATE VIEW course_teacher_count AS
SELECT
	t.teacher_id,
	t.teacher_first_surname,
	t.teacher_first_name,
	COUNT(c.course_id) AS 'n_asignaturas'
FROM 
	teacher AS t
LEFT JOIN
	course AS c ON  c.teacher_id = t.teacher_id 
GROUP BY 
	t.teacher_id,
	t.teacher_first_surname,
	t.teacher_first_name
;
-- VISTA PARA FACILITAR LAS BUSQUEDAS
USE school;

DROP VIEW IF EXISTS c_student_data;

CREATE VIEW c_student_data AS
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
	
	
-- VISTA PARA FACILITAR LAS BUSQUEDAS
USE school;

DROP VIEW IF EXISTS teacher_k_nit;

CREATE VIEW teacher_k_nit AS
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
	

-- VISTA PARA FACILITAR LAS BUSQUEDAS
USE school;

DROP VIEW IF EXISTS student_year_course;

CREATE VIEW student_year_course AS
SELECT 
	s.student_first_name,
	sy.start_year,
	sy.end_year
FROM 
	student AS s
INNER JOIN
	course_student AS cs ON cs.student_id = s.student_id 
INNER JOIN 
	school_year AS sy ON sy.school_year_id  = cs.school_year_id  
;

-- VISTA PARA FACILITAR LAS BUSQUEDAS
USE school;

DROP VIEW IF EXISTS student_year_course;

CREATE VIEW student_year_course AS
SELECT DISTINCT  
	t.teacher_first_name,
	c.course_name 
FROM 
	course AS c
LEFT JOIN
	teacher AS t ON t.teacher_id = c.teacher_id 
WHERE 
	c.teacher_id IS NULL;


USE school;

/* Departamento */
CALL add_departamento (1, 'Informática');
CALL add_departamento (2, 'Matemáticas');
CALL add_departamento (3, 'Economía y Empresa');
CALL add_departamento (4, 'Educación');
CALL add_departamento (5, 'Agronomía');
CALL add_departamento (6, 'Química y Física');
CALL add_departamento (7, 'Filología');
CALL add_departamento (8, 'Derecho');
CALL add_departamento (9, 'Biología y Geología');
 
 /* Persona */
CALL add_alumno (1, '89542419S', 'Juan', 'Saez', 'Vega', 'Almería', 'C/ Mercurio', '618253876', '1992/08/08', 'H');
CALL add_alumno (2, '26902806M', 'Salvador', 'Sánchez', 'Pérez', 'Almería', 'C/ Real del barrio alto', '950254837', '1991/03/28', 'H');
CALL add_alumno (4, '17105885A', 'Pedro', 'Heller', 'Pagac', 'Almería', 'C/ Estrella fugaz', NULL, '2000/10/05', 'H');
CALL add_alumno (6, '04233869Y', 'José', 'Koss', 'Bayer', 'Almería', 'C/ Júpiter', '628349590', '1998/01/28', 'H');
CALL add_alumno (7, '97258166K', 'Ismael', 'Strosin', 'Turcotte', 'Almería', 'C/ Neptuno', NULL, '1999/05/24', 'H');
CALL add_alumno (9, '82842571K', 'Ramón', 'Herzog', 'Tremblay', 'Almería', 'C/ Urano', '626351429', '1996/11/21', 'H');
CALL add_alumno (11, '46900725E', 'Daniel', 'Herman', 'Pacocha', 'Almería', 'C/ Andarax', '679837625', '1997/04/26', 'H');
CALL add_alumno (19, '11578526G', 'Inma', 'Lakin', 'Yundt', 'Almería', 'C/ Picos de Europa', '678652431', '1998/09/01', 'M');
CALL add_alumno (21, '79089577Y', 'Juan', 'Gutiérrez', 'López', 'Almería', 'C/ Los pinos', '678652431', '1998/01/01', 'H');
CALL add_alumno (22, '41491230N', 'Antonio', 'Domínguez', 'Guerrero', 'Almería', 'C/ Cabo de Gata', '626652498', '1999/02/11', 'H');
CALL add_alumno (23, '64753215G', 'Irene', 'Hernández', 'Martínez', 'Almería', 'C/ Zapillo', '628452384', '1996/03/12', 'M');
CALL add_alumno (24, '85135690V', 'Sonia', 'Gea', 'Ruiz', 'Almería', 'C/ Mercurio', '678812017', '1995/04/13', 'M');


/* Profesor */
CALL add_profesor (3, '11105554G', 'Zoe', 'Ramirez', 'Gea', 'Almería', 'C/ Marte', '618223876', '1979/08/19', 'M', 1);
CALL add_profesor (5, '38223286T', 'David', 'Schmidt', 'Fisher', 'Almería', 'C/ Venus', '678516294', '1978/01/19', 'H', 2);
CALL add_profesor (8, '79503962T', 'Cristina', 'Lemke', 'Rutherford', 'Almería', 'C/ Saturno', '669162534', '1977/08/21', 'M', 3);
CALL add_profesor (10, '61142000L', 'Esther', 'Spencer', 'Lakin', 'Almería', 'C/ Plutón', NULL, '1977/05/19', 'M', 4);
CALL add_profesor (12, '85366986W', 'Carmen', 'Streich', 'Hirthe', 'Almería', 'C/ Almanzora', NULL, '1971-04-29', 'M', 4);
CALL add_profesor (13, '73571384L', 'Alfredo', 'Stiedemann', 'Morissette', 'Almería', 'C/ Guadalquivir', '950896725', '1980/02/01', 'H', 6);
CALL add_profesor (14, '82937751G', 'Manolo', 'Hamill', 'Kozey', 'Almería', 'C/ Duero', '950263514', '1977/01/02', 'H', 1);
CALL add_profesor (15, '80502866Z', 'Alejandro', 'Kohler', 'Schoen', 'Almería', 'C/ Tajo', '668726354', '1980/03/14', 'H', 2);
CALL add_profesor (16, '10485008K', 'Antonio', 'Fahey', 'Considine', 'Almería', 'C/ Sierra de los Filabres', NULL, '1982/03/18', 'H', 3);
CALL add_profesor (17, '85869555K', 'Guillermo', 'Ruecker', 'Upton', 'Almería', 'C/ Sierra de Gádor', NULL, '1973/05/05', 'H', 4);
CALL add_profesor (18, '04326833G', 'Micaela', 'Monahan', 'Murray', 'Almería', 'C/ Veleta', '662765413', '1976/02/25', 'H', 5);
CALL add_profesor (20, '79221403L', 'Francesca', 'Schowalter', 'Muller', 'Almería', 'C/ Quinto pino', NULL, '1980/10/31', 'H', 6);
CALL add_profesor (21, '13175769N', 'Pepe', 'Sánchez', 'Ruiz', 'Almería', 'C/ Quinto pino', NULL, '1980/10/16', 'H', 1);
CALL add_profesor (22, '98816696W', 'Juan', 'Guerrero', 'Martínez', 'Almería', 'C/ Quinto pino', NULL, '1980/11/21', 'H', 1);
CALL add_profesor (23, '77194445M', 'María', 'Domínguez', 'Hernández', 'Almería', 'C/ Quinto pino', NULL, '1980/12/13', 'M', 2);

/* Grado */
CALL add_grado (1, 'Grado en Ingeniería Agrícola (Plan 2015)');
CALL add_grado (2, 'Grado en Ingeniería Eléctrica (Plan 2014)');
CALL add_grado (3, 'Grado en Ingeniería Electrónica Industrial (Plan 2010)');
CALL add_grado (4, 'Grado en Ingeniería Informática (Plan 2015)');
CALL add_grado (5, 'Grado en Ingeniería Mecánica (Plan 2010)');
CALL add_grado (6, 'Grado en Ingeniería Química Industrial (Plan 2010)');
CALL add_grado (7, 'Grado en Biotecnología (Plan 2015)');
CALL add_grado (8, 'Grado en Ciencias Ambientales (Plan 2009)');
CALL add_grado (9, 'Grado en Matemáticas (Plan 2010)');
CALL add_grado (10, 'Grado en Química (Plan 2009)');
 
/* Asignatura */
CALL add_asignatura (1, 'Álgegra lineal y matemática discreta', 6, 'básica', 1, 1, NULL, 4);
CALL add_asignatura (2, 'Cálculo', 6, 'básica', 1, 1, NULL, 4);
CALL add_asignatura (3, 'Física para informática', 6, 'básica', 1, 1, NULL, 4);
CALL add_asignatura (4, 'Introducción a la programación', 6, 'básica', 1, 1, NULL, 4);
CALL add_asignatura (5, 'Organización y gestión de empresas', 6, 'básica', 1, 1, NULL, 4);
CALL add_asignatura (6, 'Estadística', 6, 'básica', 1, 2, NULL, 4);
CALL add_asignatura (7, 'Estructura y tecnología de computadores', 6, 'básica', 1, 2, NULL, 4);
CALL add_asignatura (8, 'Fundamentos de electrónica', 6, 'básica', 1, 2, NULL, 4);
CALL add_asignatura (9, 'Lógica y algorítmica', 6, 'básica', 1, 2, NULL, 4);
CALL add_asignatura (10, 'Metodología de la programación', 6, 'básica', 1, 2, NULL, 4);
CALL add_asignatura (11, 'Arquitectura de Computadores', 6, 'básica', 2, 1, 3, 4);
CALL add_asignatura (12, 'Estructura de Datos y Algoritmos I', 6, 'obligatoria', 2, 1, 3, 4);
CALL add_asignatura (13, 'Ingeniería del Software', 6, 'obligatoria', 2, 1, 14, 4);
CALL add_asignatura (14, 'Sistemas Inteligentes', 6, 'obligatoria', 2, 1, 3, 4);
CALL add_asignatura (15, 'Sistemas Operativos', 6, 'obligatoria', 2, 1, 14, 4);
CALL add_asignatura (16, 'Bases de Datos', 6, 'básica', 2, 2, 14, 4);
CALL add_asignatura (17, 'Estructura de Datos y Algoritmos II', 6, 'obligatoria', 2, 2, 14, 4);
CALL add_asignatura (18, 'Fundamentos de Redes de Computadores', 6 ,'obligatoria', 2, 2, 3, 4);
CALL add_asignatura (19, 'Planificación y Gestión de Proyectos Informáticos', 6, 'obligatoria', 2, 2, 3, 4);
CALL add_asignatura (20, 'Programación de Servicios Software', 6, 'obligatoria', 2, 2, 14, 4);
CALL add_asignatura (21, 'Desarrollo de interfaces de usuario', 6, 'obligatoria', 3, 1, 14, 4);
CALL add_asignatura (22, 'Ingeniería de Requisitos', 6, 'optativa', 3, 1, NULL, 4);
CALL add_asignatura (23, 'Integración de las Tecnologías de la Información en las Organizaciones', 6, 'optativa', 3, 1, NULL, 4);
CALL add_asignatura (24, 'Modelado y Diseño del Software 1', 6, 'optativa', 3, 1, NULL, 4);
CALL add_asignatura (25, 'Multiprocesadores', 6, 'optativa', 3, 1, NULL, 4);
CALL add_asignatura (26, 'Seguridad y cumplimiento normativo', 6, 'optativa', 3, 1, NULL, 4);
CALL add_asignatura (27, 'Sistema de Información para las Organizaciones', 6, 'optativa', 3, 1, NULL, 4); 
CALL add_asignatura (28, 'Tecnologías web', 6, 'optativa', 3, 1, NULL, 4);
CALL add_asignatura (29, 'Teoría de códigos y criptografía', 6, 'optativa', 3, 1, NULL, 4);
CALL add_asignatura (30, 'Administración de bases de datos', 6, 'optativa', 3, 2, NULL, 4);
CALL add_asignatura (31, 'Herramientas y Métodos de Ingeniería del Software', 6, 'optativa', 3, 2, NULL, 4);
CALL add_asignatura (32, 'Informática industrial y robótica', 6, 'optativa', 3, 2, NULL, 4);
CALL add_asignatura (33, 'Ingeniería de Sistemas de Información', 6, 'optativa', 3, 2, NULL, 4);
CALL add_asignatura (34, 'Modelado y Diseño del Software 2', 6, 'optativa', 3, 2, NULL, 4);
CALL add_asignatura (35, 'Negocio Electrónico', 6, 'optativa', 3, 2, NULL, 4);
CALL add_asignatura (36, 'Periféricos e interfaces', 6, 'optativa', 3, 2, NULL, 4);
CALL add_asignatura (37, 'Sistemas de tiempo real', 6, 'optativa', 3, 2, NULL, 4);
CALL add_asignatura (38, 'Tecnologías de acceso a red', 6, 'optativa', 3, 2, NULL, 4);
CALL add_asignatura (39, 'Tratamiento digital de imágenes', 6, 'optativa', 3, 2, NULL, 4);
CALL add_asignatura (40, 'Administración de redes y sistemas operativos', 6, 'optativa', 4, 1, NULL, 4);
CALL add_asignatura (41, 'Almacenes de Datos', 6, 'optativa', 4, 1, NULL, 4);
CALL add_asignatura (42, 'Fiabilidad y Gestión de Riesgos', 6, 'optativa', 4, 1, NULL, 4);
CALL add_asignatura (43, 'Líneas de Productos Software', 6, 'optativa', 4, 1, NULL, 4);
CALL add_asignatura (44, 'Procesos de Ingeniería del Software 1', 6, 'optativa', 4, 1, NULL, 4);
CALL add_asignatura (45, 'Tecnologías multimedia', 6, 'optativa', 4, 1, NULL, 4);
CALL add_asignatura (46, 'Análisis y planificación de las TI', 6, 'optativa', 4, 2, NULL, 4);
CALL add_asignatura (47, 'Desarrollo Rápido de Aplicaciones', 6, 'optativa', 4, 2, NULL, 4);
CALL add_asignatura (48, 'Gestión de la Calidad y de la Innovación Tecnológica', 6, 'optativa', 4, 2, NULL, 4);
CALL add_asignatura (49, 'Inteligencia del Negocio', 6, 'optativa', 4, 2, NULL, 4);
CALL add_asignatura (50, 'Procesos de Ingeniería del Software 2', 6, 'optativa', 4, 2, NULL, 4);
CALL add_asignatura (51, 'Seguridad Informática', 6, 'optativa', 4, 2, NULL, 4);
CALL add_asignatura (52, 'Biologia celular', 6, 'básica', 1, 1, NULL, 7);
CALL add_asignatura (53, 'Física', 6, 'básica', 1, 1, NULL, 7);
CALL add_asignatura (54, 'Matemáticas I', 6, 'básica', 1, 1, NULL, 7);
CALL add_asignatura (55, 'Química general', 6, 'básica', 1, 1, NULL, 7);
CALL add_asignatura (56, 'Química orgánica', 6, 'básica', 1, 1, NULL, 7);
CALL add_asignatura (57, 'Biología vegetal y animal', 6, 'básica', 1, 2, NULL, 7);
CALL add_asignatura (58, 'Bioquímica', 6, 'básica', 1, 2, NULL, 7);
CALL add_asignatura (59, 'Genética', 6, 'básica', 1, 2, NULL, 7);
CALL add_asignatura (60, 'Matemáticas II', 6, 'básica', 1, 2, NULL, 7);
CALL add_asignatura (61, 'Microbiología', 6, 'básica', 1, 2, NULL, 7);
CALL add_asignatura (62, 'Botánica agrícola', 6, 'obligatoria', 2, 1, NULL, 7);
CALL add_asignatura (63, 'Fisiología vegetal', 6, 'obligatoria', 2, 1, NULL, 7);
CALL add_asignatura (64, 'Genética molecular', 6, 'obligatoria', 2, 1, NULL, 7);
CALL add_asignatura (65, 'Ingeniería bioquímica', 6, 'obligatoria', 2, 1, NULL, 7);
CALL add_asignatura (66, 'Termodinámica y cinética química aplicada', 6, 'obligatoria', 2, 1, NULL, 7);
CALL add_asignatura (67, 'Biorreactores', 6, 'obligatoria', 2, 2, NULL, 7);
CALL add_asignatura (68, 'Biotecnología microbiana', 6, 'obligatoria', 2, 2, NULL, 7);
CALL add_asignatura (69, 'Ingeniería genética', 6, 'obligatoria', 2, 2, NULL, 7);
CALL add_asignatura (70, 'Inmunología', 6, 'obligatoria', 2, 2, NULL, 7);
CALL add_asignatura (71, 'Virología', 6, 'obligatoria', 2, 2, NULL, 7);
CALL add_asignatura (72, 'Bases moleculares del desarrollo vegetal', 4.5, 'obligatoria', 3, 1, NULL, 7);
CALL add_asignatura (73, 'Fisiología animal', 4.5, 'obligatoria', 3, 1, NULL, 7);
CALL add_asignatura (74, 'Metabolismo y biosíntesis de biomoléculas', 6, 'obligatoria', 3, 1, NULL, 7);
CALL add_asignatura (75, 'Operaciones de separación', 6, 'obligatoria', 3, 1, NULL, 7);
CALL add_asignatura (76, 'Patología molecular de plantas', 4.5, 'obligatoria', 3, 1, NULL, 7);
CALL add_asignatura (77, 'Técnicas instrumentales básicas', 4.5, 'obligatoria', 3, 1, NULL, 7);
CALL add_asignatura (78, 'Bioinformática', 4.5, 'obligatoria', 3, 2, NULL, 7);
CALL add_asignatura (79, 'Biotecnología de los productos hortofrutículas', 4.5, 'obligatoria', 3, 2, NULL, 7);
CALL add_asignatura (80, 'Biotecnología vegetal', 6, 'obligatoria', 3, 2, NULL, 7);
CALL add_asignatura (81, 'Genómica y proteómica', 4.5, 'obligatoria', 3, 2, NULL, 7);
CALL add_asignatura (82, 'Procesos biotecnológicos', 6, 'obligatoria', 3, 2, NULL, 7);
CALL add_asignatura (83, 'Técnicas instrumentales avanzadas', 4.5, 'obligatoria', 3, 2, NULL, 7);

/* Curso escolar */
CALL add_curso_escolar (1, 2014, 2015);
CALL add_curso_escolar (2, 2015, 2016);
CALL add_curso_escolar (3, 2016, 2017);
CALL add_curso_escolar (4, 2017, 2018);

/* Alumno se matricula en asignatura */
CALL add_alumno_se_matricula_asignatura (1, 1, 1);
CALL add_alumno_se_matricula_asignatura (1, 2, 1);
CALL add_alumno_se_matricula_asignatura (1, 3, 1);
CALL add_alumno_se_matricula_asignatura (1, 4, 1);
CALL add_alumno_se_matricula_asignatura (1, 5, 1);
CALL add_alumno_se_matricula_asignatura (1, 6, 1);
CALL add_alumno_se_matricula_asignatura (1, 7, 1);
CALL add_alumno_se_matricula_asignatura (1, 8, 1);
CALL add_alumno_se_matricula_asignatura (1, 9, 1);
CALL add_alumno_se_matricula_asignatura (1, 10, 1);

CALL add_alumno_se_matricula_asignatura (1, 1, 2);
CALL add_alumno_se_matricula_asignatura (1, 2, 2);
CALL add_alumno_se_matricula_asignatura (1, 3, 2);

CALL add_alumno_se_matricula_asignatura (1, 1, 3);
CALL add_alumno_se_matricula_asignatura (1, 2, 3);
CALL add_alumno_se_matricula_asignatura (1, 3, 3);

CALL add_alumno_se_matricula_asignatura (1, 1, 4);
CALL add_alumno_se_matricula_asignatura (1, 2, 4);
CALL add_alumno_se_matricula_asignatura (1, 3, 4);

CALL add_alumno_se_matricula_asignatura (2, 1, 1);
CALL add_alumno_se_matricula_asignatura (2, 2, 1);
CALL add_alumno_se_matricula_asignatura (2, 3, 1);

CALL add_alumno_se_matricula_asignatura (4, 1, 1);
CALL add_alumno_se_matricula_asignatura (4, 2, 1);
CALL add_alumno_se_matricula_asignatura (4, 3, 1);

CALL add_alumno_se_matricula_asignatura (4, 1, 2);
CALL add_alumno_se_matricula_asignatura (4, 2, 2);
CALL add_alumno_se_matricula_asignatura (4, 3, 2);
CALL add_alumno_se_matricula_asignatura (4, 4, 2);
CALL add_alumno_se_matricula_asignatura (4, 5, 2);
CALL add_alumno_se_matricula_asignatura (4, 6, 2);
CALL add_alumno_se_matricula_asignatura (4, 7, 2);
CALL add_alumno_se_matricula_asignatura (4, 8, 2);
CALL add_alumno_se_matricula_asignatura (4, 9, 2);
CALL add_alumno_se_matricula_asignatura (4, 10, 2);