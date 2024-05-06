-- Вивести різницю між середньою та максимальною зарплатою для кожного відділу
USE Employee;
SELECT Departaments.ID, Departaments.Name, MAX(Salary.Sum) AS MaxSalary, AVG(Salary.Sum) AS AvgSalary, MAX(Salary.Sum) - AVG(Salary.Sum) AS SalaryDifference
FROM Departaments
LEFT JOIN Employee
ON Departaments.ID = Employee.DepartamentID
LEFT JOIN Salary
ON Employee.ID = Salary.EmpID
GROUP BY Departaments.ID, Departaments.Name;