
SELECT
    C.Name AS NombreCliente,
    C.Surname AS ApellidoCliente,
    COUNT(S.idSales) AS TotalFacturas
FROM
    Sales AS S
JOIN
    Clients AS C ON S.idClient = C.idClient
WHERE
    S.idClient = 2 -- Reemplaza [ID_CLIENTE] (Ej: 1)
    AND S.SaleDate BETWEEN '2024-01-01' AND '2025-10-01' -- Reemplaza con el rango de fechas (Ej: '2024-01-01' AND '2024-06-30')
GROUP BY
    C.idClient, C.Name, C.Surname;