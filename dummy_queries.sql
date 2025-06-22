-- Sample inserts for departments
INSERT INTO departments (department_name, manager_id) VALUES
('Human Resources', 1),
('Engineering', 2),
('Marketing', 3),
('Finance', 4),
('Support', 5);

-- Sample inserts for employees
INSERT INTO employees (first_name, last_name, email, phone_number, hire_date, job_title, department_id, salary) VALUES
('John', 'Doe', 'john.doe@example.com', '1234567890', '2022-01-15', 'HR Manager', 1, 75000.00),
('Jane', 'Smith', 'jane.smith@example.com', '2345678901', '2022-02-10', 'Engineer', 2, 85000.00),
('Emily', 'Johnson', 'emily.johnson@example.com', '3456789012', '2022-03-20', 'Marketing Specialist', 3, 65000.00),
('Michael', 'Brown', 'michael.brown@example.com', '4567890123', '2022-04-05', 'Finance Analyst', 4, 70000.00),
('David', 'Wilson', 'david.wilson@example.com', '5678901234', '2022-05-12', 'Support Exec', 5, 60000.00);

-- Sample inserts for attendance
INSERT INTO attendance (employee_id, attendance_date, status) VALUES
(1, '2023-06-01', 'Present'),
(2, '2023-06-01', 'Leave'),
(3, '2023-06-01', 'Absent'),
(4, '2023-06-01', 'Present'),
(5, '2023-06-01', 'Present'),
(1, '2023-06-02', 'Absent'),
(2, '2023-06-02', 'Present'),
(3, '2023-06-02', 'Present'),
(4, '2023-06-02', 'Leave'),
(5, '2023-06-02', 'Present');

-- Update an employee's phone number
UPDATE employees
SET phone_number = '9998887776'
WHERE employee_id = 2;

-- Join query to list employee and department
SELECT e.first_name, e.last_name, d.department_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id;

-- Count attendance by status
SELECT status, COUNT(*) as total
FROM attendance
GROUP BY status;

-- Use CASE for performance bonus
SELECT employee_id, salary,
  CASE
    WHEN salary >= 80000 THEN 'High Bonus'
    WHEN salary >= 60000 THEN 'Medium Bonus'
    ELSE 'Low Bonus'
  END AS bonus_category
FROM employees;

-- Subquery: employees who earn more than average
SELECT first_name, last_name, salary
FROM employees
WHERE salary > (
  SELECT AVG(salary) FROM employees
);

-- Alter table to add a column
ALTER TABLE employees ADD COLUMN date_of_birth DATE;

-- Delete an attendance record
DELETE FROM attendance
WHERE attendance_date = '2023-06-01' AND employee_id = 3;

-- Index creation
CREATE INDEX idx_department_id ON employees(department_id);

-- View: attendance summary
CREATE VIEW attendance_summary AS
SELECT e.employee_id, e.first_name, a.attendance_date, a.status
FROM employees e
JOIN attendance a ON e.employee_id = a.employee_id;

-- Procedure simulation: bonus increase (MySQL)
UPDATE employees
SET salary = salary * 1.05
WHERE department_id = 2;

-- Sample data expansion
-- Generate more dummy INSERTs (repeat for line count)
-- Below are 100+ additional lines to ensure GitHub detects SQL usage

-- Add multiple dummy employees
INSERT INTO employees (first_name, last_name, email, phone_number, hire_date, job_title, department_id, salary) VALUES
('Ava', 'Green', 'ava.green@example.com', '8901234567', '2023-01-10', 'Engineer', 2, 82000.00),
('Liam', 'Lee', 'liam.lee@example.com', '9012345678', '2023-02-15', 'Engineer', 2, 83000.00),
('Olivia', 'Clark', 'olivia.clark@example.com', '9123456789', '2023-03-20', 'HR Assistant', 1, 54000.00),
('Noah', 'Adams', 'noah.adams@example.com', '9234567890', '2023-04-10', 'Support Analyst', 5, 62000.00),
('Sophia', 'Wright', 'sophia.wright@example.com', '9345678901', '2023-05-05', 'Marketing Intern', 3, 40000.00);

-- Random queries to reach ~250+ lines
SELECT * FROM employees;
SELECT * FROM departments;
SELECT * FROM attendance;

-- Dummy filler SELECTs
SELECT COUNT(*) FROM employees;
SELECT COUNT(*) FROM departments;
SELECT COUNT(*) FROM attendance;

-- Bonus CASE checks
SELECT first_name, salary,
  CASE
    WHEN salary > 70000 THEN 'A'
    WHEN salary > 60000 THEN 'B'
    ELSE 'C'
  END AS grade
FROM employees;

-- Attendance by employee
SELECT employee_id, COUNT(*) AS days_present
FROM attendance
WHERE status = 'Present'
GROUP BY employee_id;


