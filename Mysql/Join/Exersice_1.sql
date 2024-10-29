CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    age INT,
    course_id INT
);

INSERT INTO students (student_id, student_name, age, course_id) VALUES
(1, 'Alice', 21, 101),
(2, 'Bob', 22, 102),
(3, 'Charlie', 20, 101),
(4, 'David', 23, 103),
(5, 'Eve', 22, 104);


CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(50),
    instructor VARCHAR(50)
);

INSERT INTO courses (course_id, course_name, instructor) VALUES
(101, 'Mathematics', 'Prof. Adams'),
(102, 'Physics', 'Prof. Baker'),
(103, 'Chemistry', 'Prof. Clark'),
(104, 'Computer Science', 'Prof. Davis'),
(105, 'Biology', 'Prof. Evans');



-- Questions



-- 1. Retrieve the names of all students along with the names of the courses they are enrolled in.


-- 2. List all courses along with the names of students enrolled in them, including courses with no students.


-- 3. Find students who are not enrolled in any courses.


-- 4. Get a list of all instructors and the names of students they teach. 


-- 5. Retrieve the names of students who are in courses taught by a specific instructo.


-- 6. Find the total number of students enrolled in each course.


-- 7. List students along with course names, only for courses starting with the letter "C".


-- 8. Show the names of students and their courses, but only for students older than 21.


-- 9. Retrieve a list of courses with no enrolled students.


-- 10. Find students who share the same course with a specific student (e.g., "Alice").





-- Solutions



-- 1
SELECT students.student_name as name, courses.course_name as course FROM students 
JOIN courses ON students.course_id = courses.course_id;

--2
SELECT courses.course_name as name, students.student_name as student FROM courses
LEFT JOIN students ON courses.course_id = students.course_id
ORDER BY courses.course_id;



SELECT * FROM students;
SELECT * FROM courses;


--3
SELECT students.student_name FROM students 
where students.course_id is NULL; 


--4
SELECT courses.instructor , students.student_name FROM students
LEFT JOIN courses ON courses.course_id = students.course_id;



--5
SELECT students.student_name FROM courses
JOIN 
    students ON courses.course_id = students.course_id
WHERE 
    courses.instructor = 'Prof. Adams';


--6
SELECT courses.course_name, COUNT(students.student_id) AS total_students
FROM courses
LEFT JOIN students ON courses.course_id = students.course_id
GROUP BY courses.course_id, courses.course_name

--7
SELECT 
    students.student_name,
    courses.course_name
FROM 
    students
JOIN 
    courses ON students.course_id = courses.course_id
WHERE 
    courses.course_name LIKE 'C%';



--8
SELECT students.student_name, courses.course_name from students
JOIN courses ON courses.course_id = students.course_id
WHERE students.age > 21;


--9
SELECT courses.course_name from courses 
left join students on courses.course_id = students.course_id
where students.course_id is null;


--10
SELECT students.student_name from students
where students.course_id = (
    SELECT students.course_id FROM students
    where students.student_name = "Alice"
)
