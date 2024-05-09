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