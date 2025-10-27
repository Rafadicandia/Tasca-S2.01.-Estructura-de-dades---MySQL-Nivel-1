
SELECT
    SU.Name AS NombreProveedor,
    COUNT(S.idSales) AS TotalVentas 
FROM
    Supplier AS SU
JOIN
    Glasses AS G ON G.idSupplier = SU.idSupplier
JOIN
    Sales AS S ON S.Glasses_idGlasses = G.idGlasses
GROUP BY
    SU.Name
ORDER BY
    TotalVentas DESC; 