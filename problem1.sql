-- QAP 2 - SQL and PostgreSQL Mastery

/* Problem 1: University Course Enrollment System 
Scenario 
You’re tasked with developing a system to manage university students, professors, courses, and their enrollments.
* A single student can register for multiple courses
* A single professor can teach multiple courses
* A course can only have one professor
* A course can have multiple students */

-- Create tables
-- Students Table
CREATE TABLE students (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL
    school_enrollment_date NOT NULL,
)

-- Professors Table
CREATE TABLE professors (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    department VARCHAR(100) NOT NULL
)

-- Courses Table
CREATE TABLE courses (
    id SERIAL PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    course_description TEXT NOT NULL,
    professor_id INT NOT NULL,
    FOREIGN KEY (professor_id) REFERENCES professors(id)
)

-- Enrollments Table
CREATE TABLE enrollments (
    id SERIAL PRIMARY KEY,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    FOREIGN KEY (student_id) REFERENCES students(id),
    FOREIGN KEY (course_id) REFERENCES courses(id)
)

-- Insert data into tables
-- Students data (5)
INSERT INTO students (first_name, last_name, email, school_enrollment_date)
VALUES ('Donald', 'Blake', 'odinson@thunder.com', '2012-04-04'),
       ('Anthony', 'Stark', 'tony@starkindustries.com', '2012-04-04'),
       ('Gwendolyne', 'Stacy', 'gwenpool@spider-society.com', '2012-04-04');
       ('Steven', 'Rogers', 'cap@aol.com', '2012-04-04');
       ('Natalia', 'Romanova', 'blackspider@theredroom.com', '2012-04-04');

-- Professors data (4)
INSERT INTO professors (first_name, last_name, department)
        ('Robert', 'Banner', 'physics'),
        ('Charles', 'Xavier', 'sociology'),
        ('Jane', 'Foster', 'astrophysics'),
        ('Peter', 'Parker', 'photography');