USE FastFoodDB;
GO
SELECT 
    m.Nombre AS Mensajero,
    AVG(DATEDIFF(MINUTE, o.FechaDespacho, o.FechaEntrega)) AS TiempoPromedioEntregaMin
FROM Ordenes o
JOIN Mensajeros m ON o.MensajeroID = m.MensajeroID
GROUP BY m.Nombre;
SELECT 
    ori.nombreOrigen AS Origen,
    SUM(o.TotalCompra) AS TotalVentas
FROM Ordenes o
JOIN OrigenesOrden ori ON o.OrigenID = ori.origenId
GROUP BY ori.nombreOrigen
ORDER BY TotalVentas DESC;
SELECT 
    e.Nombre AS Empleado,
    SUM(o.TotalCompra) AS VentasGeneradas
FROM Ordenes o
JOIN Empleados e ON o.EmpleadoID = e.EmpleadoID
GROUP BY e.Nombre
ORDER BY VentasGeneradas DESC;
SELECT 
    HorarioVenta,
    COUNT(*) AS TotalOrdenes,
    SUM(o.TotalCompra) AS TotalIngresos
FROM Ordenes o
GROUP BY HorarioVenta
ORDER BY TotalIngresos DESC;
SELECT 
    FORMAT(FechaOrdenTomada, 'yyyy-MM') AS Mes,
    SUM(TotalCompra) AS IngresosMensuales
FROM Ordenes
GROUP BY FORMAT(FechaOrdenTomada, 'yyyy-MM')
ORDER BY Mes;
SELECT * FROM TiposPago;
