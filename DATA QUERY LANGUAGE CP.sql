
--1.Write a query to retrieve the names of employees who are assigned to more than one project, including the total number of projects for each employee.

SELECT 
    E.EmployeeName,
    COUNT(EP.ProjectID) AS ProjectCount
FROM 
    Employees E
JOIN 
    EmployeeProjects EP ON E.EmployeeID = EP.EmployeeID
GROUP BY 
    E.EmployeeName
HAVING 
    COUNT(EP.ProjectID) > 1;

	--2.Write a query to retrieve the list of projects managed by each department, including the department label and manager’s name.

	SELECT 
    D.DepartmentLabel,
    M.EmployeeName AS ManagerName,
    P.ProjectTitle
FROM 
    Departments D
JOIN 
    Employees M ON D.ManagerID = M.EmployeeID
JOIN 
    Projects P ON P.DepartmentID = D.DepartmentID;

	--3.Write a query to retrieve the names of employees working on the project "Website Redesign," including their roles in the project.

	SELECT 
    E.EmployeeName,
    EP.Role
FROM 
    Projects P
JOIN 
    EmployeeProjects EP ON P.ProjectID = EP.ProjectID
JOIN 
    Employees E ON EP.EmployeeID = E.EmployeeID
WHERE 
    P.ProjectTitle = 'Website Redesign';

	--4.Write a query to retrieve the department with the highest number of employees, including the department label, manager name, and the total number of employees.

	SELECT TOP 1
    D.DepartmentLabel,
    M.EmployeeName AS ManagerName,
    COUNT(E.EmployeeID) AS TotalEmployees
FROM 
    Departments D
JOIN 
    Employees M ON D.ManagerID = M.EmployeeID
JOIN 
    Employees E ON D.DepartmentID = E.DepartmentID
GROUP BY 
    D.DepartmentLabel, M.EmployeeName
ORDER BY 
    TotalEmployees DESC;

	--5.Write a query to retrieve the names and positions of employees earning a salary greater than 60,000, including their department names.

	SELECT 
    E.EmployeeName,
    E.Position,
    D.DepartmentLabel
FROM 
    Employees E
JOIN 
    Departments D ON E.DepartmentID = D.DepartmentID
WHERE 
    E.Salary > 60000;

	--6.Write a query to retrieve the number of employees assigned to each project, including the project title.

	SELECT 
    P.ProjectTitle,
    COUNT(EP.EmployeeID) AS EmployeeCount
FROM 
    Projects P
LEFT JOIN 
    EmployeeProjects EP ON P.ProjectID = EP.ProjectID
GROUP BY 
    P.ProjectTitle;

	--7.Write a query to retrieve a summary of roles employees have across different projects, including the employee name, project title, and role.

	SELECT 
    E.EmployeeName,
    P.ProjectTitle,
    EP.Role
FROM 
    EmployeeProjects EP
JOIN 
    Employees E ON EP.EmployeeID = E.EmployeeID
JOIN 
    Projects P ON EP.ProjectID = P.ProjectID;

	--8.Write a query to retrieve the total salary expenditure for each department, including the department label and manager name.

	SELECT 
    D.DepartmentLabel,
    M.EmployeeName AS ManagerName,
    SUM(E.Salary) AS TotalSalaryExpenditure
FROM 
    Departments D
JOIN 
    Employees M ON D.ManagerID = M.EmployeeID
JOIN 
    Employees E ON D.DepartmentID = E.DepartmentID
GROUP BY 
    D.DepartmentLabel, M.EmployeeName;
