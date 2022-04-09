USE devcamp_sql_project_schema;

INSERT INTO students(students_name, students_email)
VALUES
	("Luke Skywalker", "Luke@test.com"),
    ("Leia Organa", "Leia@test.com"),
    ("Obi Wan Kenobi", "ObiWan@test.com"),
    ("Han Solo", "Han@test.com"),
    ("Chewbacca", "Chewy@test.com"),
    ("C3PO", "3PO@test.com"),
    ("R2D2", "R2@test.com"),
    ("Biggs Darklighter", "Biggs@test.com"),
    ("Wedge Antilles", "Wedge@test.com"),
    ("Jek Tono Porkins", "Jek@test.com");

INSERT INTO professors(professors_name, professors_email)
VALUES
	("Emperor Palpatine", "Palps@test.com"),
    ("Darth Vader", "DaddyVader@test.com"),
    ("Grand Moff Tarkin", "Tarkin@test.com"),
    ("Grand Admiral Thrawn", "Thrawn@test.com"),
    ("General Cassio Tagge", "Tagge@test.com"),
    ("Admiral motti", "Motti@test.com"),
    ("Director Orson Krennic", "Krennic@test.com"),
    ("Moff Gideon", "GusFring@test.com"),
    ("Trilla Suduri", "SecondSister@test.com"),
    ("Masana Tide", "NinthSister@test.com");

INSERT INTO courses(courses_name, courses_credits, courses_professors_id)
VALUES
	("History 101", 4, 2),
    ("Geology 101", 4, 4),
    ("2-D Drawing", 3, 6),
    ("Computer Science", 3, 8),
    ("English Literature 101", 4, 10),
    ("The Works of JRR Tolkein", 3, 2),
    ("Origins of the Universe", 4, 4),
    ("Issues and Culture in the Middle East", 3, 5),
    ("Philosophy 101", 4, 3),
    ("Speech & Debate", 4, 1),
    ("Calculus 101", 4, 9),
    ("World Religions", 3, 7),
    ("20th Century Art & Propaganda", 3, 5),
    ("Physics 101", 4, 3),
    ("Theatre as Literature", 3, 1);
    
INSERT INTO students_courses(students_id, courses_id)
VALUES
	(1, 1),
    (1, 3),
    (1, 5),
    (1, 8),
    (1, 12),
    (1, 15),
    (2, 2),
    (2, 3),
    (2, 5),
    (2, 6),
    (2, 7),
    (2, 9),
    (3, 1),
    (3, 6),
    (3, 9),
    (3, 13),
    (3, 15),
    (4, 1),
    (4, 3),
    (4, 4),
    (4, 7),
    (4, 12),
    (4, 13),
    (5, 6),
    (5, 10),
    (5, 12),
    (5, 14),
    (5, 15),
    (6, 1),
    (6, 4),
    (6, 8),
    (6, 11),
    (6, 14),
    (7, 2),
    (7, 5),
    (7, 7),
    (7, 11),
    (7, 13),
    (7, 15),
    (8, 3),
    (8, 5),
    (8, 6),
    (8, 9),
    (8, 11),
    (8, 15),
    (9, 1),
    (9, 4),
    (9, 7),
    (9, 10),
    (9, 14),
    (9, 15),
    (10, 5),
    (10, 7),
    (10, 9),
    (10, 12),
    (10, 13);

INSERT INTO grades(grades_percentage, grades_letter, grades_students_id, grades_courses_id)
VALUES 
	(92, "A-", 1, 1),
    (87, "B+", 1, 3),
    (95, "A", 1, 5),
    (84, "B", 1, 8),
    (79, "C+", 1, 12),
    (90, "A-", 1, 15),
    (96, "A", 2, 2),
    (98, "A", 2, 3),
    (92, "A-", 2, 5),
    (94, "A", 2, 6),
    (97, "A", 2, 7),
    (95, "A", 2, 9),
    (86, "B", 3, 1),
    (76, "C+", 3, 6),
    (97, "A", 3, 9),
    (82, "B-", 3, 13),
    (91, "A-", 3, 15),
    (68, "D+", 4, 1),
    (73, "C-", 4, 3),
    (89, "B+", 4, 4),
    (74, "C", 4, 7),
    (56, "F", 4, 12),
    (75, "C", 4, 13),
    (87, "C+", 5, 6),
    (94, "A", 5, 10),
    (82, "B-", 5, 12),
    (78, "C+", 5, 14),
    (98, "A", 5, 15),
    (99, "A", 6, 1),
    (100, "A", 6, 4),
    (99, "A", 6, 8),
    (100, "A", 6, 11),
    (95, "A", 6, 14),
    (68, "D+", 7, 2),
    (72, "C-", 7, 5),
    (93, "A-", 7, 7),
    (95, "A", 7, 11),
    (62, "D-", 7, 13),
    (85, "B", 7, 15),
    (95, "A", 8, 3),
    (84, "B", 8, 5),
    (92, "A-", 8, 6),
    (82, "B-", 8, 9),
    (89, "B+", 8, 11),
    (85, "B", 8, 15),
    (88, "B+", 9, 1),
    (93, "A-", 9, 4),
    (84, "B", 9, 7),
    (87, "B+", 9, 10),
    (82, "B-", 9, 14),
    (93, "A-", 9, 15),
    (89, "B+", 10, 5),
    (95, "A", 10, 7),
    (76, "C", 10, 9),
    (87, "B+", 10, 12),
    (94, "A", 10, 13);

-- Script to return the average grade given by each professor
SELECT 
	professors_name, 
    AVG(grades_percentage) AS average_grade
FROM professors p
JOIN courses c
ON c.courses_professors_id = p.professors_id
JOIN grades g
ON g.grades_courses_id = c.courses_id
GROUP BY professors_name;

-- Script to return the top grades for each student
SELECT
	students_name,
    MAX(grades_percentage) AS top_grades
FROM students s	
JOIN grades g 
ON g.grades_students_id = students_id
GROUP BY students_name;

-- Script to group students by the courses they are enrolled in 
SELECT
	courses_name,
    students_name
FROM courses c
JOIN students_courses sc
ON sc.courses_id = c.courses_id
JOIN students s 
ON s.students_id = sc.students_id
ORDER BY courses_name;

-- Script for creating a summary report of courses and their average grades, sorted by most challenging to least challenging
SELECT 
	courses_name,
    AVG(grades_percentage) AS average_grade
FROM courses c 
JOIN grades g
ON g.grades_courses_id = c.courses_id
GROUP BY c.courses_id
ORDER BY average_grade ASC;

-- Script for finding which student and professor have the most courses in common
WITH spc AS(
SELECT
	s.students_name,
    p.professors_name,
    COUNT(distinct c.courses_id) common_courses
FROM students s
JOIN students_courses sc
ON sc.students_id = s.students_id
JOIN courses c 
ON c.courses_id = sc.courses_id
JOIN professors p 
ON p.professors_id = c.courses_professors_id
GROUP BY s.students_id, p.professors_id
)
SELECT *
FROM spc
WHERE spc.common_courses = (
	SELECT MAX(common_courses)
    FROM spc
)