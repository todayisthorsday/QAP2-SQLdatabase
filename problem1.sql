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
    email VARCHAR(100) NOT NULL,
    school_enrollment_date DATE NOT NULL
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
VALUES ('Donald', 'Blake', 'odinson@thunderer.com', '2012-04-04'),
       ('Anthony', 'Stark', 'tony@starkindustries.com', '2012-04-04'),
       ('Gwendolyne', 'Stacy', 'gwenpool@spider-society.com', '2012-04-04'),
       ('Steven', 'Rogers', 'cap@aol.com', '2012-04-04'),
       ('Natalia', 'Romanova', 'blackspider@theredroom.com', '2012-04-04')

-- Professors data (4)
INSERT INTO professors (first_name, last_name, department)
        ('Robert', 'Banner', 'physics'),
        ('Charles', 'Xavier', 'sociology'),
        ('Jane', 'Foster', 'astrophysics'),
        ('Peter', 'Parker', 'photography');

-- Courses data (3)
INSERT INTO courses (course_name, course_description, professor_id)
VALUES ('Physics 0616', 'Explore motion, energy, and forces through hands-on experiments and real-world applications. No gamma exposure required!', 1),
       ('Sociology 5023', 'Examine social structures, identity, and prejudice through the lens of human and mutant interactions. Explore how understanding, cooperation, and conflict shape societies—and the future.', 2),
       ('Astrophysics 2890', 'Unravel the mysteries of the cosmos, from black holes to celestial mechanics. Explore the forces shaping the universe with insights from both cutting-edge science and firsthand experience among the stars.', 3)
       ('Photography 2099', 'Learn the art of capturing moments through a lens, from street photography to action shots. Learn composition, lighting, and timing from a photographer who knows how to snap the perfect shot—whether its a superhero moment or everyday life.', 4)

-- Enrollments data (5)
INSERT INTO enrollments (student_id, course_id, enrollment_date)
VALUES (1, 1, '2012-04-04'),
       (1, 2, '2012-04-04'),
       (2, 2, '2012-04-04'),
       (2, 3, '2012-04-04'),
       (3, 3, '2012-04-04'),
       (4, 1, '2012-04-04'),
       (4, 2, '2012-04-04'),
       (4, 3, '2012-04-04'),
       (5, 4, '2012-04-04'),
       (5, 3, '2012-04-04');

-- Queries
-- Query 1: Retrieve the full names (by full name we mean the first name and last name joined into one column, separated by a space) of all students enrolled in “Physics 101”.
SELECT CONCAT(students.first_name, ' ', students.last_name) AS full_name
FROM enrollments
JOIN students ON enrollments.student_id = students.id
JOIN courses ON enrollments.course_id = courses.id
WHERE courses.course_name = 'Physics 0616'

-- Query 2: Retrieve a list of all courses along with the professor’s full name who teaches each course.
SELECT course_name, CONCAT(professors.first_name, ' ', professors.last_name) AS professor_name
FROM courses
JOIN professors ON courses.professor_id = professors.id

-- Query 3: Retrieve all courses that have students enrolled in them.
SELECT DISTINCT course_name
FROM enrollments 
JOIN courses ON enrollments.course_id = courses.id
JOIN students ON enrollments.student_id = students.id

-- Update data
-- Update the email address of student
UPDATE students
SET email = 'steve@aol.com'
WHERE id = 4;

-- Delete data
-- Remove a student from one of their courses
DELETE FROM enrollments
WHERE student_id = 5 AND course_id = 3;