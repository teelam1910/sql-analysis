--Data Engineering
--Create 6 tables

-- ALTER DATABASE company_db SET datestyle TO "ISO, MDY"; --needed to offset error received on employees table due to datestyle
-- SET datestyle TO "SQL"; --needed to offset error received on employees table due to datestyle

CREATE TABLE departments (
  dept_no VARCHAR(4) NOT NULL PRIMARY KEY,
  dept_name VARCHAR(100) NOT NULL
);


CREATE TABLE titles (
  title_id VARCHAR(5) NOT NULL PRIMARY KEY,
  title VARCHAR(100) NOT NULL
);


CREATE TABLE employees (
   emp_no INT NOT NULL PRIMARY KEY,
   emp_title_id VARCHAR(5) NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR(100) NOT NULL,
	last_name VARCHAR(100) NOT NULL,
	sex VARCHAR(1) NOT NULL,
	hire_date DATE NOT NULL,
    FOREIGN KEY (emp_title_id) REFERENCES titles (title_id)
);

CREATE TABLE dept_emp (
  emp_no INT NOT NULL,
  dept_no VARCHAR(4) NOT NULL,
  PRIMARY KEY (emp_no, dept_no), --composite key
  FOREIGN KEY (emp_no) REFERENCES employees (emp_no), 
  FOREIGN KEY (dept_no) REFERENCES departments (dept_no)
);

CREATE TABLE dept_manager (
  dept_no VARCHAR(4) NOT NULL,
  emp_no INT NOT NULL,
  PRIMARY KEY (dept_no, emp_no),
  FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
  FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);


CREATE TABLE salaries (
    emp_no INT NOT NULL,
   salary INT NOT NULL,
   PRIMARY KEY (emp_no, salary),
   FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);

-- select to_char(hire_date, 'YYYY-MM-DD') from employees;