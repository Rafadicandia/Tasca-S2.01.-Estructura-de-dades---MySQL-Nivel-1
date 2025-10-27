

------------------------------------------------------
-- 1. DATOS GEOGRÁFICOS Y PERSONAL (SIN DEPENDENCIAS)
------------------------------------------------------

-- TABLA: Site (Ciudad/Localidad)
INSERT INTO Site (idSite, Site) VALUES
(1, 'Barcelona'),
(2, 'Madrid'),
(3, 'Sevilla');

-- TABLA: Province (Provincia) - Depende de Site
INSERT INTO Province (idProvince, Province, Site_idSite) VALUES
(1, 'Barcelona', 1),    -- Barcelona (Site 1)
(2, 'Girona', 1),       -- Girona (Site 1)
(3, 'Madrid', 2),       -- Madrid (Site 2)
(4, 'Sevilla', 3);      -- Sevilla (Site 3)

-- TABLA: Employee (Empleados)
INSERT INTO Employee (idEmployee, Name, LastName, NIF, Chef, Delivery) VALUES
(1, 'Marta', 'Rubio', '11111111A', b'1', b'0'),  -- Cocinera
(2, 'Pablo', 'López', '22222222B', b'0', b'1'),  -- Repartidor
(3, 'Raúl', 'Jiménez', '33333333C', b'1', b'0');  -- Cocinero

------------------------------------------------------
-- 2. DATOS DE PRODUCTOS
------------------------------------------------------

-- TABLA: Drinks (Bebidas)
INSERT INTO Drinks (idDrinks, Name, Description, Price) VALUES
(1, 'Coca Cola Zero', '330ml lata', 2),
(2, 'Agua con gas', '500ml botella', 1),
(3, 'Cerveza Lager', '330ml artesana', 3);

-- TABLA: Hamburguer (Hamburguesas)
-- Nota: La columna Price es VARCHAR(45), se inserta como texto.
INSERT INTO Hamburguer (idHamburguer, Name, Description, Price) VALUES
(1, 'Doble Cheese', 'Doble carne y queso fundido, cebolla caramelizada.', '12'),
(2, 'Pollo Crispy', 'Pechuga de pollo crujiente y salsa de miel mostaza.', '10'),
(3, 'Veggie Burger', 'Hamburguesa de lentejas y aguacate.', '9');

-- TABLA: Pizza
INSERT INTO Pizza (idPizza, Name, Description, Price) VALUES
(1, 'Prosciutto', 'Jamón y champiñones.', 11),
(2, 'Vegana', 'Verduras de temporada, sin queso.', 14),
(3, 'Hawaiana', 'Jamón cocido y piña.', 12);

-- TABLA: CategoryPizza (Categorías de Pizza) - Depende de Pizza
INSERT INTO CategoryPizza (idCategoryPizza, Name, Pizza_idPizza) VALUES
(101, 'Clásica', 1),      -- Prosciutto
(102, 'Especial', 2),     -- Vegana
(103, 'Tropical', 3);     -- Hawaiana

------------------------------------------------------
-- 3. DATOS DE CLIENTES
------------------------------------------------------

-- TABLA: Customer (Clientes) - Depende de Province y Site
INSERT INTO Customer (idCustomer, Name, LastName, Address, PostalCode, Province_id, Site_id, PhoneNumber) VALUES
(1, 'Elena', 'Vázquez', 'C/ Diagonal 30', '08008', 1, 1, '600111222'),    -- Barcelona
(2, 'David', 'Peralta', 'Paseo de la Castellana 50', '28001', 3, 2, '655333444'), -- Madrid
(3, 'Sofía', 'García', 'C/ Tetuán 1', '41001', 4, 3, '677888999');      -- Sevilla

------------------------------------------------------
-- 4. PEDIDOS Y SUCURSALES
------------------------------------------------------

-- TABLA: Order (Pedidos) - Depende de Customer y de un producto (Drinks, Pizza o Hamburguer)
-- TakeAway: b'1' = A domicilio, b'0' = Recogida en tienda.

-- Pedido 1: Pizza Prosciutto para Elena (Recogida en tienda)
INSERT INTO `Order` (idOrder, TakeAway, Quantity, TotalPrice, Customer_id, Pizza_id) VALUES
(1001, b'0', 1, 11, 1, 1);

-- Pedido 2: Dos Hamburguesas Doble Cheese para David (A domicilio)
INSERT INTO `Order` (idOrder, TakeAway, Quantity, TotalPrice, Customer_id, Hamburguer_id) VALUES
(1002, b'1', 2, 24, 2, 1);

-- Pedido 3: Cuatro bebidas para Sofía (Recogida en tienda)
INSERT INTO `Order` (idOrder, TakeAway, Quantity, TotalPrice, Customer_id, Drinks_id) VALUES
(1003, b'0', 4, 8, 3, 1);

-- TABLA: Branch (Sucursal) - Depende de geografía, empleado y pedido
INSERT INTO Branch (idBranch, Address, PostalCode, Province_id, Site_id, Employee_id, Order_id) VALUES
(1, 'Rambla de Cataluña 50', '08007', 1, 1, 1, 1001); -- Barcelona, Empleado Marta, Pedido 1001

-- TABLA: TakeAwayOrder (Pedidos a Domicilio) - Solo para pedidos donde TakeAway = b'1'
-- Referencia al Pedido 2 (idOrder=1002), asignado al Repartidor Pablo (idEmployee=2)
INSERT INTO TakeAwayOrder (idTakeAwayOrder, DeliveryArrivalTime, Order_id, Employee_id) VALUES
(501, DATE_ADD(NOW(), INTERVAL 35 MINUTE), 1002, 2);

