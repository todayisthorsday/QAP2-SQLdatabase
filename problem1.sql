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
        ('Peter', 'Parker', 'photography')

-- Courses data (3)
INSERT INTO courses (course_name, course_description, professor_id)
VALUES ('Physics 0616', 'Explore motion, energy, and forces through hands-on experiments and real-world applications. No gamma exposure required!', 1),
       ('Sociology 5023', 'Examine social structures, identity, and prejudice through the lens of human and mutant interactions. Explore how understanding, cooperation, and conflict shape societies—and the future.', 2),
       ('Astrophysics 2890', 'Unravel the mysteries of the cosmos, from black holes to celestial mechanics. Explore the forces shaping the universe with insights from both cutting-edge science and firsthand experience among the stars.', 3)
       ('Photography 2099', 'Learn the art of capturing moments through a lens, from street photography to action shots. Learn composition, lighting, and timing from a photographer who knows how to snap the perfect shot—whether its a superhero moment or everyday life.', 4)

