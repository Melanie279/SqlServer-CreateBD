
-- Crear base de datos inicial
create database BDNotas


--Crear tablas de la BD
CREATE TABLE ProfessionalSchool (
    idProfessionalSchool INT,
    name VARCHAR(50) NOT NULL,    
    PRIMARY KEY (idProfessionalSchool),    
);

CREATE TABLE Career (
    idCareer INT,
    name VARCHAR(100) NOT NULL,
    idProfessionalSchool INT,
    PRIMARY KEY (idCareer),
    FOREIGN KEY (idProfessionalSchool) REFERENCES ProfessionalSchool(idProfessionalSchool)
);

CREATE TABLE Semester (
    idSemester INT,
    semester_code VARCHAR(100) NOT NULL,
    idCareer INT,
    PRIMARY KEY (idSemester),
    FOREIGN KEY (idCareer) REFERENCES Career(idCareer)
);

CREATE TABLE Students (
    idStudent INT,
    name VARCHAR(100) NOT NULL,
    lastName VARCHAR(100) NOT NULL,  
    email VARCHAR(100) NOT NULL,
    PRIMARY KEY (idStudent),    
);

CREATE TABLE Course (
    idCourse INT,
    name VARCHAR(100) NOT NULL,
    PRIMARY KEY (idCourse),    
);

CREATE TABLE Teachers (
    idTeacher INT,
    name VARCHAR(100) NOT NULL,
    lastName VARCHAR(100) NOT NULL,  
    email VARCHAR(100) NOT NULL,
    PRIMARY KEY (idTeacher),    
);

CREATE TABLE CourseSemester (
    idCourseSemester VARCHAR(100) NOT NULL,
    idCourse INT,
    idSemester INT,
    idStudent INT,
    idTeacher INT,
    PRIMARY KEY (idCourseSemester),
    FOREIGN KEY (idCourse) REFERENCES Course(idCourse),
    FOREIGN KEY (idSemester) REFERENCES Semester(idSemester),
    FOREIGN KEY (idStudent) REFERENCES Students(idStudent),
    FOREIGN KEY (idTeacher) REFERENCES Teachers(idTeacher)
);

CREATE TABLE PartialGrade (
    idPartialGrade INT,
    name VARCHAR(100) NOT NULL,    
    score INT,
    idCourseSemester VARCHAR(100) NOT NULL,
    PRIMARY KEY (idPartialGrade),
    FOREIGN KEY (idCourseSemester) REFERENCES CourseSemester(idCourseSemester)
);

CREATE TABLE CriteriaQuality (
    idCriteriaQuality INT,
    name VARCHAR(100) NOT NULL,  
    score INT,
    idPartialGrade INT,
    PRIMARY KEY (idCriteriaQuality),
    FOREIGN KEY (idPartialGrade) REFERENCES PartialGrade(idPartialGrade)
);

CREATE TABLE Subject (
    idSubject INT,
    name VARCHAR(100) NOT NULL,
    idCourseSemester VARCHAR(100) NOT NULL,
    PRIMARY KEY (idSubject),
    FOREIGN KEY (idCourseSemester) REFERENCES CourseSemester(idCourseSemester)
);

CREATE TABLE Exam (
    idExam INT,
    name VARCHAR(100) NOT NULL,
    typeTest VARCHAR(100) NOT NULL,
    numQuestions INT,    
    idCourseSemester VARCHAR(100) NOT NULL,
    PRIMARY KEY (idExam),
    FOREIGN KEY (idCourseSemester) REFERENCES CourseSemester(idCourseSemester)
);

CREATE TABLE Questions (
    idQuestion INT,
    question VARCHAR(100) NOT NULL,
    keyAnswer VARCHAR(100) NOT NULL,
    idExam INT,
    PRIMARY KEY (idQuestion),
    FOREIGN KEY (idExam) REFERENCES Exam(idExam)
);

CREATE TABLE Alternatives (
    idAlternative INT,
    keyAlternative VARCHAR(100) NOT NULL,
    valueAlternative VARCHAR(100) NOT NULL,
    isCorrect INT,
    idQuestion INT,
    PRIMARY KEY (idAlternative),
    FOREIGN KEY (idQuestion) REFERENCES Questions(idQuestion)
);

CREATE TABLE IntervalReview (
    idInterval INT,
    interval INT,
);

--Insertar Datos a las tablas creadas
--Datos para ProfesionaSchool
INSERT INTO ProfessionalSchool 
VALUES 
(1,'Ingenieria'),
(2,'Ciencias Medicas'),
(3,'Ciencias Administrativas')

--Datos para Career
INSERT INTO Career
VALUES 
(1,'Ingenieria Quimica', 1),
(2,'Ingenieria Informatica y de Sistemas',1),
(3,'Ingenieria Electronica',1),
(4,'Ingenieria Electrica',1),
(5,'Ingenieria Mecanica',1),
(6,'Ingenieria Ingenieria Civil',1),
(7,'Arquiterctura',1),
(8,'Ingenieria Petroquimica',1),
(9,'Ingenieria de Minas',1),
(10,'Ingenieria Geologica',1),
(11,'Arquiterctura',1),
(12,'Medicina',2),
(13,'Enfermeria',2),
(14,'Obstetricia',2),
(15,'Odontologia',2),
(16,'Psicologia',2),
(17,'Oftalmologia',2),
(18,'Administracion',3),
(19,'Contabilidad',3),
(20,'Economia',3)

--Datos para Semester
INSERT INTO Semester
VALUES 
(1,'2023-I', 1),
(2,'2023-I',2),
(3,'2023-I',3),
(4,'2023-I',4),
(5,'2023-I',5),
(6,'2023-II',6),
(7,'2023-II',7),
(8,'2023-II',8),
(9,'2023-II',9),
(10,'2023-II',10),
(11,'2023-II',11),
(12,'2022-I',12),
(13,'2022-I',13),
(14,'2022-I',14),
(15,'2022-I',15),
(16,'2022-II',16),
(17,'2022-II',17),
(18,'2022-II',18),
(19,'2022-II',19),
(20,'2022-II',20)


--Datos para Students
INSERT INTO Students
VALUES 
(1,'Melanie', 'Sullca Peralta','mells_dear_123@hotmail.com'),
(2,'Carmen', 'Perez','Carmen@hotmail.com'),
(3,'Juan', 'Quispe','Juan@hotmail.com'),
(4,'Anthony', 'Umere','Anthony@hotmail.com'),
(5,'Camila', 'Acosta','Camila@hotmail.com'),
(6,'Lucia', 'Collque','Lucia@hotmail.com'),
(7,'Fernando', 'Rivas','Fernando@hotmail.com'),
(8,'Carolina', 'Soto','Carolina@hotmail.com'),
(9,'Jhon', 'Zavallos','Jhon@hotmail.com'),
(10,'Armando', 'Ramos','Armando@hotmail.com'),
(11,'Gloria', 'Banda','Gloria@hotmail.com'),
(12,'Luciano', 'Leon','Luciano@hotmail.com'),
(13,'Oscar', 'Mallqui','Oscar@hotmail.com'),
(14,'Otilia', 'Calderon','Otilia@hotmail.com'),
(15,'Ernesto', 'Tintaya','Ernesto@hotmail.com'),
(16,'Abigail', 'Puma','Abigail@hotmail.com'),
(17,'Fabricio', 'Rozas','Fabricio@hotmail.com'),
(18,'Karen', 'Cuenca','Karen@hotmail.com'),
(19,'Benito', 'Fernandez','Benito@hotmail.com'),
(20,'Vania', 'Torres','Vania@hotmail.com')

--Datos para Course
INSERT INTO Course
VALUES 
(1,'Matematica'),
(2,'Analisis'),
(3,'Calculo'),
(4,'Economia'),
(5,'Fisica'),
(6,'Quimica'),
(7,'Matematica II'),
(8,'Inteligencia Artificial'),
(9,'Topografica'),
(10,'Dibujo')

--Datos para Teachers
INSERT INTO Teachers
VALUES 
(1,'Rosa', 'Huaman','Rosa@hotmail.com'),
(2,'Augusto', 'Mamani','Augusto@hotmail.com'),
(3,'Joaquin', 'Pumahuallca','Joaquin@hotmail.com'),
(4,'Aquiles', 'Perez','Aquiles@hotmail.com'),
(5,'Clorinda', 'Baca','Clorinda@hotmail.com'),
(6,'Lupe', 'Arias','Lupe@hotmail.com'),
(7,'Felipe', 'Ochoa','Felipe@hotmail.com'),
(8,'Cirilo', 'Nuñez','Cirilo@hotmail.com'),
(9,'Juvenal', 'Uremes','Juvenal@hotmail.com'),
(10,'Andres', 'Roca','Andres@hotmail.com')

--Datos para Teachers
INSERT INTO CourseSemester
VALUES 
(1,1, 1,1,1),
(2,1, 2,3, 5),
(3,2, 3,1,1),
(4,3, 1,8,2),
(5,2, 3,2,4),
(6,1, 1,4,8),
(7,5, 5,7,6),
(8,4, 1,9,3),
(9,1, 6,5,2),
(10,3, 7,2,10)

--Datos para PartialGrade
INSERT INTO PartialGrade
VALUES 
(1,'PrimerExamenParcial', 12,1),
(2,'SegundoExamenParcial', 15,1),
(3,'PrimerExamenParcial', 16,1),
(4,'TercerExamenParcial', 20,1),
(5,'PrimerExamenParcial', 10,1),
(6,'SegundoExamenParcial', 5,1),
(7,'SegundoExamenParcial', 18,1),
(8,'PrimerExamenParcial', 11,1),
(9,'PrimerExamenParcial', 14,1),
(10,'PrimerExamenParcial', 13,1)

--Datos para CriteriaQuality
INSERT INTO CriteriaQuality
VALUES 
(1,'Trabajos', 12,1),
(2,'Laboratorio', 15,2),
(3,'ExamenActitudinal', 16,3),
(4,'Trabajosl', 20,4),
(5,'Laboratorio', 10,5),
(6,'Trabajos', 5,6),
(7,'Trabajosl', 18,7),
(8,'Laboratorio', 11,8),
(9,'Trabajos', 14,2),
(10,'Trabajos', 13,9)

CREATE TABLE Subject (
    idSubject INT,
    name VARCHAR(100) NOT NULL,
    idCourseSemester VARCHAR(100) NOT NULL,
    PRIMARY KEY (idSubject),
    FOREIGN KEY (idCourseSemester) REFERENCES CourseSemester(idCourseSemester)
);

--Datos para Subject
INSERT INTO Subject
VALUES 
(1,'Ecuaciones', 1),
(2,'Funciones', 2),
(3,'Quimica', 3),
(4,'Interpolacion', 6),
(5,'Ecuaciones Avanzadas', 8),
(6,'Parabolas', 10),
(7,'Sustitucion', 5),
(8,'Ecuaciones III', 4),
(9,'Funciones avanzadas', 7),
(10,'Libros contables', 9)

CREATE TABLE Exam (
    idExam INT,
    name VARCHAR(100) NOT NULL,
    typeTest VARCHAR(100) NOT NULL,
    numQuestions INT,    
    idCourseSemester VARCHAR(100) NOT NULL,
    PRIMARY KEY (idExam),
    FOREIGN KEY (idCourseSemester) REFERENCES CourseSemester(idCourseSemester)
);

--Datos para Exam
INSERT INTO Exam
VALUES 
(1,'Evaluacion', 'Exam', 10, 5),
(2,'Evaluacion', 'Exam', 10, 2),
(3,'Evaluacion', 'Exam', 10, 3),
(4,'Evaluacion', 'Exam', 10, 4),
(5,'Evaluacion', 'Exam', 10, 6),
(6,'Evaluacion', 'Exam', 10, 9),
(7,'Evaluacion', 'Exam', 10, 10),
(8,'Evaluacion', 'Exam', 10, 8),
(9,'Evaluacion', 'Exam', 10, 7),
(10,'Evaluacion', 'Exam', 10, 1)

CREATE TABLE Questions (
    idQuestion INT,
    question VARCHAR(100) NOT NULL,
    keyAnswer VARCHAR(100) NOT NULL,
    idExam INT,
    PRIMARY KEY (idQuestion),
    FOREIGN KEY (idExam) REFERENCES Exam(idExam)
);

--Datos para Questions
INSERT INTO Questions
VALUES 
(1,'Evaluacion', 'Las funciones cuyas gráficas son líneas rectas que pasan por el origen de coordenadas reciben el
nombre de', 'a', 5),
(2,'Evaluacion', 'La función de proporcionalidad directa recibe el nombre de:', 'b', 2),
(3,'La función lineal que pasa por el punto (3,6) tiene como expresión:', 'Exam', 'b', 3),
(4,'Si la pendiente de una función lineal es positiva, la función es:', 'Exam', 'b', 4),
(5,'Si la pendiente de una función es cero, la función es:', 'Exam','a', 6),
(6,'Dada la función y = 2x – 4, señala todas las frases que sean verdaderas.', 'Exam', 'a', 9),
(7,'La función que pasa por los puntos (1, 3) y (-1, 3) es una:', 'Exam', 'a', 10),
(8,'He comprado kilo y medio de tomates y me han costado 1,20 euros. La función que da el coste
de los tomates en función de su peso viene dada por la expresión:', 'Exam', 'b', 8)


--Datos para Alternatives
INSERT INTO Alternatives
VALUES 
(1,'a', 'Funciones afines', 'a', 1),
(2,'b', 'Funciones constantes', 'a', 1),
(3,'a', 'Función afín', 'a', 2),
(4,'b', 'Función lineal', 'b', 2),
(5,'a', 'y = 1,20 x', 'b', 3),
(6,'b', 'Exam', 'b', 3),
(7,'a', 'Exam', 'b', 4),
(8,'b', 'Exam', 'b', 4),
(9,'a', 'Exam', 'a', 5),
(10,'b', 'Exam', 'a', 5)