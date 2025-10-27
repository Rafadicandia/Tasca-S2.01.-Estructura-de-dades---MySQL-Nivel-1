SELECT
    S.Site AS Site,
    COUNT(O.idOrder) AS Total_Drinks
FROM
    `Order` AS O
JOIN
    Customer AS C ON O.Customer_id = C.idCustomer
JOIN
    Site AS S ON C.Site_id = S.idSite
WHERE
    O.Drinks_id IS NOT NULL 
    AND S.Site = 'Sevilla' 
GROUP BY
    S.Site;