USE dummydb;

-- Example of Common Table Expressions

WITH avg_it as (SELECT avg(salary) as sal1 FROM employees
    WHERE department_id = 60 -- it
),
max_market as (SELECT max(salary) as sal2 FROM employees
    WHERE department_id = 20 -- marketing
)

SELECT salary FROM employees
WHERE salary > (SELECT sal1 from avg_it) AND salary < (SELECT sal2 FROM max_market);

