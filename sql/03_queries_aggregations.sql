USE FastFoodDB;
GO
-- 1. Total de ventas globales
SELECT SUM(TotalCompra) AS TotalVentasGlobales
FROM Ordenes;
--2. Promedio de precios de productos por categoría
SELECT c.Nombre AS Categoria, AVG(p.Precio) AS PrecioPromedio
FROM Productos p
JOIN Categorias c ON p.CategoriaID = c.CategoriaID
GROUP BY c.Nombre;
-- 3. Orden mínima y máxima por sucursal
SELECT s.Nombre AS Sucursal, MIN(o.TotalCompra) AS OrdenMinima, MAX(o.TotalCompra) AS OrdenMaxima
FROM Ordenes o
JOIN Sucursales s ON o.SucursalID = s.SucursalID
GROUP BY s.Nombre;
-- 4. Mayor número de kilómetros recorridos para entrega
SELECT MAX(KilometrosRecorrer) AS MaximoKilometrosRecorridos
FROM Ordenes;
-- 5. Promedio de cantidad de productos por orden
SELECT AVG(Cantidad) AS PromedioProductosPorOrden
FROM DetalleOrdenes;
-- 6. Total de ventas por tipo de pago
SELECT o.TipoPagoID, SUM(o.TotalCompra) AS TotalVentas
FROM Ordenes o
GROUP BY o.TipoPagoID;
-- 7. Sucursal con la venta promedio más alta
SELECT TOP 1 s.Nombre AS Sucursal, AVG(o.TotalCompra) AS PromedioVentas
FROM Ordenes o
JOIN Sucursales s ON o.SucursalID = s.SucursalID
GROUP BY s.Nombre
ORDER BY PromedioVentas DESC;
-- 8. Sucursal con la mayor cantidad de ventas por encima de $1000
SELECT s.Nombre AS Sucursal, COUNT(*) AS CantidadVentas
FROM Ordenes o
JOIN Sucursales s ON o.SucursalID = s.SucursalID
WHERE o.TotalCompra > 1000
GROUP BY s.Nombre
ORDER BY CantidadVentas DESC;
-- 9. Comparación de ventas promedio antes y después del 1 de julio de 2023
SELECT
  CASE
    WHEN FechaOrdenTomada < '2023-07-01' THEN 'Antes del 1 de Julio'
    ELSE 'Después del 1 de Julio'
  END AS Periodo,
  AVG(TotalCompra) AS PromedioVentas
FROM Ordenes
GROUP BY
  CASE
    WHEN FechaOrdenTomada < '2023-07-01' THEN 'Antes del 1 de Julio'
    ELSE 'Después del 1 de Julio'
  END;
  -- 10. Análisis de actividad de ventas por horario
SELECT
  HorarioVenta,
  COUNT(*) AS CantidadVentas,
  AVG(TotalCompra) AS IngresoPromedio,
  MAX(TotalCompra) AS OrdenMaxima
FROM Ordenes
GROUP BY HorarioVenta
ORDER BY CantidadVentas DESC;