CREATE TABLE assessments (
	id INT PRIMARY KEY,
	month VARCHAR(50),
	course_id VARCHAR(50),
	session VARCHAR(50),
	marks1 INT,
	marks2 INT,
	department VARCHAR(50),
	pass_flag INT
);

INSERT INTO assessments
(id, month, course_id, session, marks1, marks2, department, pass_flag)
VALUES
(1, 'Jan', 'C1', 'Morning', 72, 90, 'Business', 1),
(2, 'Jan', 'C2', 'Evening', 45, 70, 'Business', 0),
(3, 'Jan', 'C3', 'Morning', 65, 85, 'Technology', 1),
(4, 'Jan', 'C4', 'Weekend', 38, 60, 'Technology', 0),
(5, 'Feb', 'C1', 'Evening', 80, 95, 'Business', 1),
(6, 'Feb', 'C2', 'Weekend', 55, 80, 'Business', 1),
(7, 'Feb', 'C3', 'Morning', 48, 75, 'Technology', 0),
(8, 'Feb', 'C4', 'Evening', 68, 88, 'Technology', 1),
(9, 'Mar', 'C1', 'Weekend', 90, 98, 'Business', 1),
(10, 'Mar', 'C2', 'Morning', 60, 82, 'Business', 1),
(11, 'Mar', 'C3', 'Evening', 75, 92, 'Technology', 1),
(12, 'Mar', 'C4', 'Weekend', 42, 65, 'Technology', 0);

SELECT * FROM assessments;

CREATE TABLE courses (
    course_id VARCHAR(10) PRIMARY KEY,
    course VARCHAR(50),
    department VARCHAR(50)
);

INSERT INTO courses
(course_id, course, department)
VALUES
('C1', 'Excel', 'Business'),
('C2', 'PowerBI', 'Business'),
('C3', 'SQL', 'Technology'),
('C4', 'Python', 'Technology');

SELECT * FROM courses;

