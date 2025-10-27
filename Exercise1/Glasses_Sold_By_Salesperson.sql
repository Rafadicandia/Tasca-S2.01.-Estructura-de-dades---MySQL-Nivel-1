SELECT DISTINCT
    G.Brand AS Marca_Gafa_Vendida_Por_Marc
FROM
    Sales AS S
JOIN
    Employees AS E ON S.idEmployee = E.idEmployee
JOIN
    Glasses AS G ON S.Glasses_idGlasses = G.idGlasses
WHERE
    E.idEmployee = 1 -- Reemplaza [ID_EMPLEADO] (Ej: 2 para Marc Puig)
    AND S.SaleDate BETWEEN '2024-01-01' AND '2025-10-31' -- Reemplaza AAAA con el año deseado (Ej: '2024-01-01' AND '2024-12-31')
ORDER BY
    Marca_Gafa_Vendida_Por_Marc;