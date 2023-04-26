CREATE TABLE ProfessionalSchool (
    idProfessionalSchool INT,
    name VARCHAR,    
    PRIMARY KEY (idProfessionalSchool),    
);

CREATE TABLE Career (
    idCareer INT,
    name VARCHAR,
    idProfessionalSchool INT,
    PRIMARY KEY (idCareer),
    FOREIGN KEY (idProfessionalSchool) REFERENCES ProfessionalSchool(idProfessionalSchool)
);

CREATE TABLE Semester (
    idSemester INT,
    semester_code VARCHAR,
    idCareer INT,
    PRIMARY KEY (idSemester),
    FOREIGN KEY (idCareer) REFERENCES Career(idCareer)
);

CREATE TABLE Students (
    idStudent INT,
    name VARCHAR,
    lastName VARCHAR,  
    email VARCHAR,
    PRIMARY KEY (idStudent),    
);

CREATE TABLE Course (
    idCourse INT,
    name VARCHAR,
    PRIMARY KEY (idCourse),    
);

CREATE TABLE Teachers (
    idTeacher INT,
    name VARCHAR,
    lastName VARCHAR,  
    email VARCHAR,
    PRIMARY KEY (idTeacher),    
);

CREATE TABLE CourseSemester (
    idCourseSemester VARCHAR,
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
    name VARCHAR,    
    score INT,
    idCourseSemester VARCHAR,
    PRIMARY KEY (idPartialGrade),
    FOREIGN KEY (idCourseSemester) REFERENCES CourseSemester(idCourseSemester)
);

CREATE TABLE CriteriaQuality (
    idCriteriaQuality INT,
    name VARCHAR,  
    score INT,
    idPartialGrade INT,
    PRIMARY KEY (idCriteriaQuality),
    FOREIGN KEY (idPartialGrade) REFERENCES PartialGrade(idPartialGrade)
);

CREATE TABLE Subject (
    idSubject INT,
    name VARCHAR,
    idCourseSemester VARCHAR,
    PRIMARY KEY (idSubject),
    FOREIGN KEY (idCourseSemester) REFERENCES CourseSemester(idCourseSemester)
);

CREATE TABLE Exam (
    idExam INT,
    name VARCHAR,
    typeTest VARCHAR,
    numQuestions INT,    
    idCourseSemester VARCHAR,
    PRIMARY KEY (idExam),
    FOREIGN KEY (idCourseSemester) REFERENCES CourseSemester(idCourseSemester)
);

CREATE TABLE Questions (
    idQuestion INT,
    question VARCHAR,
    keyAnswer VARCHAR,
    idExam INT,
    PRIMARY KEY (idQuestion),
    FOREIGN KEY (idExam) REFERENCES Exam(idExam)
);

CREATE TABLE Alternatives (
    idAlternative INT,
    keyAlternative VARCHAR,
    valueAlternative VARCHAR,
    isCorrect INT,
    idQuestion INT,
    PRIMARY KEY (idAlternative),
    FOREIGN KEY (idQuestion) REFERENCES Questions(idQuestion)
);

CREATE TABLE IntervalReview (
    idInterval INT,
    interval int,
);
