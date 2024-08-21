create database employee;

use employee;

CREATE TABLE employees (
    emp_no      INT             NOT NULL,  -- UNSIGNED AUTO_INCREMENT??
    birth_date  DATE            NOT NULL,
    first_name  VARCHAR(14)     NOT NULL,
    last_name   VARCHAR(16)     NOT NULL,
    gender      ENUM ('M','F')  NOT NULL,  -- Enumeration of either 'M' or 'F'  
    hire_date   DATE            NOT NULL,
    PRIMARY KEY (emp_no)                   -- Index built automatically on primary-key column
                                           -- INDEX (first_name)
                                           -- INDEX (last_name)
);
CREATE TABLE departments (
    dept_no     CHAR(4)         NOT NULL,  -- in the form of 'dxxx'
    dept_name   VARCHAR(40)     NOT NULL,
    PRIMARY KEY (dept_no),                 -- Index built automatically
    UNIQUE  KEY (dept_name)                -- Build INDEX on this unique-value column
);

CREATE TABLE dept_emp (
    emp_no      INT         NOT NULL,
    dept_no     CHAR(4)     NOT NULL,
    from_date   DATE        NOT NULL,
    to_date     DATE        NOT NULL,
    KEY         (emp_no),   -- Build INDEX on this non-unique-value column
    KEY         (dept_no),  -- Build INDEX on this non-unique-value column
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no) ON DELETE CASCADE,
           -- Cascade DELETE from parent table 'employee' to this child table
           -- If an emp_no is deleted from parent 'employee', all records
           --  involving this emp_no in this child table are also deleted
           -- ON UPDATE CASCADE??
    FOREIGN KEY (dept_no) REFERENCES departments (dept_no) ON DELETE CASCADE,
           -- ON UPDATE CASCADE??
    PRIMARY KEY (emp_no, dept_no)
           -- Might not be unique?? Need to include from_date
);

CREATE TABLE titles (
    emp_no      INT          NOT NULL,
    title       VARCHAR(50)  NOT NULL,
    from_date   DATE         NOT NULL,
    to_date     DATE,
    KEY         (emp_no),
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no) ON DELETE CASCADE,
                         -- ON UPDATE CASCADE??
    PRIMARY KEY (emp_no, title, from_date)
       -- This ensures unique combination. 
       -- An employee may hold the same title but at different period
);

CREATE TABLE salaries (
    emp_no      INT    NOT NULL,
    salary      INT    NOT NULL,
    from_date   DATE   NOT NULL,
    to_date     DATE   NOT NULL,
    KEY         (emp_no),
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no) ON DELETE CASCADE,
    PRIMARY KEY (emp_no, from_date)
);

-- Inserting data into employees table
INSERT INTO employees (emp_no, birth_date, first_name, last_name, gender, hire_date) VALUES
(1, '1990-01-15', 'John', 'Doe', 'M', '2010-05-20'),
(2, '1992-03-25', 'Jane', 'Smith', 'F', '2011-07-10'),
(3, '1988-09-12', 'Michael', 'Johnson', 'M', '2009-12-05'),
(4, '1995-11-08', 'Emily', 'Brown', 'F', '2014-02-18');

-- Inserting data into departments table
INSERT INTO departments (dept_no, dept_name) VALUES
('d001', 'Marketing'),
('d002', 'Finance'),
('d003', 'Human Resources'),
('d004', 'Information Technology');

-- Inserting data into dept_emp table
INSERT INTO dept_emp (emp_no, dept_no, from_date, to_date) VALUES
(1, 'd001', '2010-05-20', '9999-01-01'),
(2, 'd002', '2011-07-10', '9999-01-01'),
(3, 'd003', '2009-12-05', '2015-06-30'),
(4, 'd004', '2014-02-18', '9999-01-01');

-- Inserting data into titles table
INSERT INTO titles (emp_no, title, from_date, to_date) VALUES
(1, 'Software Engineer', '2010-05-20', '2015-06-30'),
(1, 'Senior Software Engineer', '2015-07-01', '9999-01-01'),
(2, 'Financial Analyst', '2011-07-10', '9999-01-01'),
(3, 'HR Coordinator', '2009-12-05', '2015-06-30'),
(3, 'HR Manager', '2015-07-01', '9999-01-01'),
(4, 'IT Specialist', '2014-02-18', '9999-01-01');

-- Inserting data into salaries table
INSERT INTO salaries (emp_no, salary, from_date, to_date) VALUES
(1, 60000, '2010-05-20', '2015-06-30'),
(1, 75000, '2015-07-01', '9999-01-01'),
(2, 55000, '2011-07-10', '9999-01-01'),
(3, 50000, '2009-12-05', '2015-06-30'),
(3, 65000, '2015-07-01', '9999-01-01'),
(4, 60000, '2014-02-18', '9999-01-01');



-- Retrieve all employees along with their department names and titles:
SELECT e.emp_no, e.first_name, e.last_name, d.dept_name, t.title
FROM employees e
INNER JOIN dept_emp de ON e.emp_no = de.emp_no
INNER JOIN departments d ON de.dept_no = d.dept_no
INNER JOIN titles t ON e.emp_no = t.emp_no;

-- Retrieve the average salary of employees by department:
SELECT d.dept_name, AVG(s.salary) AS avg_salary
FROM employees e
INNER JOIN dept_emp de ON e.emp_no = de.emp_no
INNER JOIN departments d ON de.dept_no = d.dept_no
INNER JOIN salaries s ON e.emp_no = s.emp_no
GROUP BY d.dept_name;

-- Find the employee who has the highest salary:
SELECT e.emp_no, e.first_name, e.last_name, s.salary
FROM employees e
INNER JOIN salaries s ON e.emp_no = s.emp_no
WHERE s.to_date = '9999-01-01'
ORDER BY s.salary DESC
LIMIT 1;

-- Retrieve employees who have held multiple titles:
SELECT emp_no, COUNT(DISTINCT title) AS title_count
FROM titles
GROUP BY emp_no
HAVING title_count > 1;

-- Retrieve employees who are currently working in the 'Marketing' department
SELECT e.emp_no, e.first_name, e.last_name
FROM employees e
INNER JOIN dept_emp de ON e.emp_no = de.emp_no
INNER JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Marketing' AND de.to_date = '9999-01-01';