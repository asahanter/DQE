-- Вивести 3 спеціалістів, у яких зарплата за січень 2024 вища, ніж середня по таблиці за цю дату та відсортувати за фаміліями.
USE Employee;
SELECT TOP 3 Employee.Lastname, Employee.Firstname, Salary.Sum, Salary.Date
FROM Employee
LEFT JOIN Salary
ON Employee.ID = Salary.EmpID
WHERE Date='2024-01-01' AND Salary.Sum >
(
	SELECT AVG(Sum)
	FROM Salary
	WHERE Date='2024-01-01'
)
ORDER BY Employee.Lastname;