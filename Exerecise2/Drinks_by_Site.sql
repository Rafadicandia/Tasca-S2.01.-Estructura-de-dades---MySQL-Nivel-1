select p.Name, count(o.product_idProduct) as cantidad_Pedidos, Site
from Product as p
join OrderLine as o
on o.Product_idProduct = p.idProduct
join Orders as l
on o.order_idOrder = l.idOrder
join Branch as b
on l.Branch_idBranch  = b.idBranch
join Site as S
on s.idSite = b.Site_id
where p.Type = "Drink"
group by p.Name, o.product_idProduct, Site
;

