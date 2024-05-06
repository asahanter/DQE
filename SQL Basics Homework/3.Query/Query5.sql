USE Employee;
SELECT DISTINCT e.ID, e.Firstname, e.Lastname, e.DateOfBirth, d.Name AS Departament, c.Email, c.Phone, a.Country, a.City, a.Address, e.Position, e.WorkFromDate, s.Sum AS Salary
FROM Employee AS e
JOIN Departaments d
ON e.DepartamentID = d.ID
JOIN Contacts c
ON e.ContactID = c.ID
JOIN Emp_Addr ea
ON e.ID = ea.EmpID
JOIN Addresses a
ON ea.AddrID = a.ID
JOIN Salary s
ON e.ID = s.EmpID
WHERE s.Sum = (
    SELECT MAX(Sum)
    FROM Salary
    WHERE Sum < (
        SELECT MAX(Sum)
        FROM Salary
    )
);
