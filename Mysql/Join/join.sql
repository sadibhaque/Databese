-- dummydb -- https://github.com/sadibhaque/Databese/blob/main/Mysql/Databases/dummydb.sql

-- method 1 

-- optimized way

SELECT employees.first_name, departments.department_name FROM employees, departments 
WHERE employees.department_id = departments.department_id;

-- method 2 

-- there must be same coulmn name in both table in order to join 

SELECT employees.first_name, departments.department_name FROM employees
JOIN departments using (department_id);
