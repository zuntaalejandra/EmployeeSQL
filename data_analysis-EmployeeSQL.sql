

-- List the employee number, last name, first name, sex, and salary of each employee

SELECT 	e.emp_no, 
		e.last_name, 
		e.first_name, 
		e.sex,  
		s.salary
FROM 	public.employees e,
		public.salaries s
WHERE	e.emp_no = s.emp_no
		

-- List the first name, last name, and hire date for the employees who were hired in 1986

SELECT 	e.first_name, 
		e.last_name, 
		e.hire_date
FROM 	public.employees e
WHERE	to_char(hire_date, 'YYYY')  = '1986'


-- List the manager of each department along with their department number, department name, employee number, last name, and first name
-- note, the last_name and first_name are for all employees

SELECT 	
		m.last_name manager_last_name,
		m.first_name manager_first_name, 
		d.dept_no,
		d.dept_name,
		e.emp_no, 
		e.last_name, 
		e.first_name
FROM 	public.employees e,
		public.employees m,
		public.dept_manager dm,
		public.departments d,
		public.dept_emp de
WHERE	e.emp_no = de.emp_no
AND		m.emp_no = dm.emp_no
AND		de.dept_no = d.dept_no
AND		dm.dept_no = de.dept_no

-- List the manager of each department along with their department number, department name, employee number, last name, and first name
-- note, the last_name and first_name are for managers

SELECT 	
		m.last_name manager_last_name,
		m.first_name manager_first_name, 
		d.dept_no,
		d.dept_name
FROM 	public.employees m,
		public.dept_manager dm,
		public.departments d
WHERE	m.emp_no = dm.emp_no
AND		dm.dept_no = d.dept_no


-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name

SELECT 	
		d.dept_no,
		e.emp_no,
		e.last_name,
		e.first_name, 
		d.dept_name
FROM 	public.employees e,
		public.dept_emp de,
		public.departments d
WHERE	e.emp_no = de.emp_no
AND		de.dept_no = d.dept_no


-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B 

SELECT 	
		e.last_name,
		e.first_name, 
		e.sex
FROM 	public.employees e
WHERE	e.first_name = 'Hercules'
AND		e.last_name like 'B%'


-- List each employee in the Sales department, including their employee number, last name, and first name 

SELECT 	
		d.dept_no,
		e.last_name,
		e.first_name
FROM 	public.employees e,
		public.dept_emp de,
		public.departments d
WHERE	e.emp_no = de.emp_no
AND		de.dept_no = d.dept_no
AND		d.dept_name = 'Sales'



-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name 

SELECT 	
		e.emp_no,
		d.dept_no,
		e.last_name,
		e.first_name,
		d.dept_name
FROM 	public.employees e,
		public.dept_emp de,
		public.departments d
WHERE	e.emp_no = de.emp_no
AND		de.dept_no = d.dept_no
AND	d.dept_name IN  ('Sales','Development') 



-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name) 


SELECT 	
		e.last_name,
		count(e.emp_no) num_employees
FROM 	public.employees e
GROUP BY e.last_name
ORDER BY 2 DESC
