USE dummydb;

-- 3rd highest salary and who recieves it

SELECT max(salary), first_name FROM employees
    WHERE salary < (
        SELECT max(salary) FROM employees
        WHERE salary < (
            SELECT max(salary) FROM employees
        )
    )
; 

-- 3rd lowest salary and who recieves it

SELECT min(salary), first_name FROM employees
    WHERE salary > (
        SELECT min(salary) FROM employees
        WHERE salary > (
            SELECT min(salary) FROM employees
        )
    )
; 

SELECT * from employees;


-- Which employee has been hired after Steven


SELECT first_name from employees
    WHERE hire_date > (
        SELECT max(hire_date) from employees
            WHERE first_name = 'Steven'
    )
;


-- With common table expression solve the question 1 and 2


With mx as (
    SELECT max(salary) as mx1 FROM employees
),
mn as (
    SELECT min(salary) as mn1 FROM employees
)
SELECT max(salary), first_name FROM employees
    WHERE salary < (
        SELECT max(salary) FROM employees
        WHERE salary < (
            SELECT mx1 from mx
        )
    )

    -- seperate use

SELECT min(salary), first_name FROM employees
    WHERE salary > (
        SELECT min(salary) FROM employees
        WHERE salary > (
            SELECT mn1 from mn
        )
    )
; 
