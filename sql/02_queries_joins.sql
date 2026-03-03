-- ¿Cómo puedo obtener una lista de todos los productos junto con sus categorías?
SELECT p.nombre AS Producto, c.nombre AS Categoria
FROM Productos p
LEFT JOIN Categorias c ON p.CategoriaID = c.categoriaId;
-- ¿Cómo puedo saber a qué sucursal está asignado cada empleado?
SELECT e.nombre AS Empleado, s.nombre AS Sucursal
FROM Empleados e
INNER JOIN Sucursales s ON e.sucursalId = s.sucursalId;
-- ¿Existen productos que no tienen una categoría asignada?
SELECT p.productoId, p.nombre AS Producto
FROM Productos p
LEFT JOIN Categorias c ON p.CategoriaID = c.categoriaId
WHERE c.categoriaId IS NULL;
-- ¿Cómo puedo obtener un detalle completo de las órdenes, incluyendo el Nombre del cliente, Nombre del empleado que tomó la orden, y Nombre del mensajero que la entregó?
SELECT o.ordenId, c.nombre AS Cliente, e.nombre AS Empleado, m.nombre AS Mensajero
FROM Ordenes o
INNER JOIN Clientes c ON o.clienteId = c.clienteId
INNER JOIN Empleados e ON o.empleadoId = e.empleadoId
INNER JOIN Mensajeros m ON o.mensajeroId = m.mensajeroId;
-- ¿Cuántos artículos correspondientes a cada Categoría de Productos se han vendido en cada sucursal?
SELECT s.nombre AS Sucursal, c.nombre AS Categoria, SUM(do.cantidad) AS TotalVendidos
FROM DetalleOrdenes do
INNER JOIN Ordenes o ON do.ordenId = o.ordenId
INNER JOIN Productos p ON do.productoId = p.productoId
INNER JOIN Categorias c ON p.CategoriaID = c.categoriaId
INNER JOIN Sucursales s ON o.sucursalId = s.sucursalId
GROUP BY s.nombre, c.nombre;
