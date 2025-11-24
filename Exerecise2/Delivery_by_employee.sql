select e.name, count(o.idOrder) as Cantidad_pedidos
from Employee as e
join Orders as o
on e.idEmployee = o.Employee_idEmployee
where e.idEmployee = 2
Group by e.name;