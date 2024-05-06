-- Вивести всіх спеціалістів, які живуть в країнах, де середня ЗП вища за середню ЗП серед усіх країн
USE Employee;
SELECT Employee.Firstname, Employee.Lastname, Addresses.Country, AVG(Salary.Sum) AS AvgSalary
FROM Employee
INNER JOIN Emp_Addr
ON Employee.ID = Emp_Addr.EmpID
INNER JOIN Addresses
ON Emp_Addr.AddrID = Addresses.ID
INNER JOIN Salary
ON Employee.ID = Salary.EmpID
GROUP BY Employee.Firstname, Employee.Lastname, Addresses.Country
HAVING AVG(Salary.Sum) > 
(
	SELECT AVG(Sum)
	FROM Salary
);