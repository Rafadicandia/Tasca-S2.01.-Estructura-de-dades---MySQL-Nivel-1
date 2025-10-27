SELECT
    E.Name AS Nombre_Empleado,
    E.LastName AS Apellido_Empleado,
    COUNT(T.Order_id) AS Total_Pedidos_Repartidos
FROM
    TakeAwayOrder AS T
JOIN
    Employee AS E ON T.Employee_id = E.idEmployee
WHERE
    E.idEmployee = 2 
GROUP BY
    E.idEmployee, E.Name, E.LastName;