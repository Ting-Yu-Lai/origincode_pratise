-- 員工表
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    department_id INT,
    salary DECIMAL(10,2),
    hire_date DATE
);

-- 部門表
CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

-- 題目 1：選出所有員工的姓名和薪水

SELECT name,salary FROM employees;

-- 題目 2：選出薪水大於 55000 的員工姓名和薪水

SELECT name,salary FROM employees WHERE salary > 55000;

-- 題目 3：選出 IT 部門的所有員工（使用 JOIN）

SELECT e.name
FROM employees e
JOIN departments d ON e.department_id = d.dept_id
WHERE d.dept_name = "IT";

-- 題目 4：計算每個部門的平均薪水（顯示部門名稱和平均薪水）

SELECT dept_name, AVG(SUM(employees.salary)) as dept_avg_salary
FROM employees e JOIN departments d ON e.department_id = d.dept_id

-- 訂正
SELECT d.dept_name, AVG(e.salary) as avg_salary
FROM employees e 
JOIN departments d ON e.department_id = e.dept_id
GROUP BY d.dept_name;

-- 題目 5：找出薪水最高的前 3 名員工（用 LIMIT）

SELECT name, salary
FROM employees
ORDER BY salary DESC
LIMIT 3;

-- 題目 6：列出沒有部門的員工（department_id 為 NULL）

SELECT * FROM employees WHERE department_id IS NULL;

-- 題目 7：計算每個部門的人數（包含沒有員工的部門）

SELECT d.dept_name, COUNT(e.emp_id) as emp_count
FROM departments d
LEFT JOIN employees e ON d.dept_id = e.department_id
GROUP BY d.dept_name;

-- 題目 8：找出 2021 年之後入職且薪水 > 50000 的員工

SELECT name,salary,hire_date
FROM employees 
WHERE salary > 50000 AND hire_date > '2021-12-31';

-- 題目 9：使用子查詢：找出薪水高於「HR 部門平均薪水」的員工

SELECT name, salary
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees e
    JOIN departments d ON e.department_id = d.dept_id
    WHERE d.dept_name = 'HR'
);

-- 題目 10：列出每個部門的最高薪水員工姓名（進階，可用 WINDOW 或子查詢）