DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS titles;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS department;




CREATE TABLE department (
	dept_no VARCHAR PRIMARY KEY,
	dept_name VARCHAR (70) UNIQUE NOT NULL
);


CREATE TABLE dept_emp (
	emp_no INT NOT NULL,
	dept_no VARCHAR NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES department(dept_no)   
);


CREATE TABLE dept_manager(
	dept_no VARCHAR ,
	emp_no INT NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES department(dept_no)
);


CREATE TABLE employees(
	emp_no INT PRIMARY KEY NOT NULL ,
	emp_title_id VARCHAR NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR(40) NOT NULL,
	last_name VARCHAR(40) NOT NULL,
	sex VARCHAR NOT NULL,
	hire_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES salaries(emp_no),
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);



SELECT * FROM employees;

CREATE TABLE salaries(
	emp_no INT PRIMARY KEY NOT NULL,
	salary INT NOT NULL
);


CREATE TABLE titles (
	title_id VARCHAR PRIMARY KEY NOT NULL ,
	title VARCHAR UNIQUE NOT NULL
);
