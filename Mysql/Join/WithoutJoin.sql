-- dummydb -- https://github.com/sadibhaque/Databese/blob/main/Mysql/Databases/dummydb.sql

SELECT employees.first_name, departments.department_name FROM employees, departments 
WHERE employees.department_id = departments.department_id;
