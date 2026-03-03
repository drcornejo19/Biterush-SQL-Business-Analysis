USE FastFoodDB;
GO
-- Cantidad total de registros únicos en la tabla Ordenes
SELECT COUNT(DISTINCT ordenId) AS TotalOrdenesUnicas
FROM Ordenes;
-- Cantidad de empleados por departamento
SELECT Departamento, COUNT(*) AS TotalEmpleados
FROM Empleados
GROUP BY Departamento;
--Cantidad de productos por código de categoría
SELECT CategoriaID, COUNT(*) AS TotalProductos
FROM Productos
GROUP BY CategoriaID;
-- Cantidad de clientes importados (total en la tabla Clientes)
SELECT COUNT(*) AS TotalClientesImportados
FROM Clientes;
-- Sucursales con promedio de facturación > 1000 y menos km que el promedio general
SELECT s.Nombre AS Sucursal,
       AVG(o.TotalCompra) AS PromedioFacturacion,
       AVG(o.KilometrosRecorrer) AS PromedioKmRecorridos
FROM Ordenes o
JOIN Sucursales s ON o.SucursalID = s.SucursalID
GROUP BY s.Nombre
HAVING AVG(o.TotalCompra) > 1000
   AND AVG(o.KilometrosRecorrer) < (
       SELECT AVG(KilometrosRecorrer) FROM Ordenes
   )
ORDER BY PromedioKmRecorridos ASC;

-- Aumentar el precio de todos los productos de la categoría 'Comida Rápida' (ID = 1) en $1
UPDATE Productos
SET Precio = Precio + 1
WHERE CategoriaID = 1;

-- Cambiar la posición de los empleados del departamento 'Cocina' a 'Chef'
UPDATE Empleados
SET Posicion = 'Chef'
WHERE Departamento = 'Cocina';

-- Cambiar la dirección de la Sucursal con ID 1
UPDATE Sucursales
SET Direccion = '1234 New Address St'
WHERE SucursalID = 1;
DELETE FROM TiposPago
WHERE TipoPagoID = 10
  AND TipoPagoID NOT IN (SELECT TipoPagoID FROM Ordenes);
DELETE FROM Mensajeros
WHERE MensajeroID = 10
  AND MensajeroID NOT IN (SELECT MensajeroID FROM Ordenes);
DELETE FROM Sucursales
WHERE SucursalID = 10
  AND SucursalID NOT IN (SELECT SucursalID FROM Ordenes)
  AND SucursalID NOT IN (SELECT SucursalID FROM Empleados);
