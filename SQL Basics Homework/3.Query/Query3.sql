-- Знайти мінімальну ЗП серед максимальних ЗП по країнах
USE Employee;
SELECT MIN(MaxSalary) AS MinMaxSalary
FROM (
    SELECT MAX(Salary.Sum) AS MaxSalary
    FROM Employee
    INNER JOIN Emp_Addr
	ON Employee.ID = Emp_Addr.EmpID
    INNER JOIN Addresses
	ON Emp_Addr.AddrID = Addresses.ID
    INNER JOIN Salary
	ON Employee.ID = Salary.EmpID
    GROUP BY Addresses.Country
) AS MaxSalaries;