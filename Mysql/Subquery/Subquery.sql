USE dummydb; -- https://drive.google.com/file/d/1Lkklsw33VSjlRKQ3bxmwIUqGXtfQgJ-r/view

-- phitron -- database -- week 2 -- moudle 6 -- video 2

SELECT * FROM employees
    WHERE salary < (
        SELECT salary FROM employees 
            WHERE employee_id = 144
    )
;

SELECT * FROM employees
    WHERE salary = (
        SELECT max(salary) FROM employees
    )
;


SELECT first_name FROM employees
WHERE department_id = (
    SELECT department_id FROM departments
    WHERE department_name = 'Marketing'
)


SELECT count(*) FROM employees as Members
WHERE department_id = (
    SELECT department_id FROM departments
    WHERE department_name = 'IT'                        
)

SELECT * FROM employees 
WHERE job_id = (
    SELECT job_id FROM jobs
    WHERE job_title = 'Programmer'
)

SELECT sum(salary) FROM employees 
WHERE job_id = (
    SELECT job_id FROM jobs
    WHERE job_title = 'Programmer'
)
