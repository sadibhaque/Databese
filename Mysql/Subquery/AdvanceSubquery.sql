use dummydb; -- https://github.com/sadibhaque/Databese/blob/main/Mysql/Databases/dummydb.sql

SELECT * FROM employees;
SELECT * FROM jobs;

show tables;


-- Q1 -- find the second highest salary

-- method 1

SELECT distinct salary FROM employees
ORDER BY salary DESC
LIMIT 1 offset 1
;  

-- method 2

SELECT max(salary) from employees
WHERE salary < (SELECT max(salary) FROM employees); 


-- Q2 -- find the employee who gets more salary than their manager


SELECT first_name, salary FROM employees as emp
WHERE salary > (
    SELECT salary from employees as mng 
    WHERE emp.manager_id = mng.employee_id
)


-- Q3 -- find the employees who does the same job as the managers 

SELECT first_name FROM employees as emp
WHERE job_id = (
    SELECT job_id from employees as mng 
    WHERE emp.manager_id = mng.employee_id
)
