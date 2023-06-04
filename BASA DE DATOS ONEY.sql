use master 
CREATE DATABASE DB_ELTORO
GO
USE DB_ELTORO

CREATE TABLE [producto] (
  [id_producto] integer PRIMARY KEY,
  [codigo] integer,
  [nombre] varchar(15),
  [precio_compra] decimal(4,2),
  [descripcion] varchar(30)
)
GO

CREATE TABLE [consumibles] (
  [id_Consumible] integer PRIMARY KEY,
  [id_producto] INT UNIQUE,
  [fecha_vencimiento] Datetime
)
GO

CREATE TABLE [videojuegos] (
  [id_videojuegos] integer PRIMARY KEY,
  [id_producto] integer UNIQUE,
  [fecha_lanzamiento] Datetime,
  [plataforma] varchar(10)
)
GO

CREATE TABLE [Electronicos] (
  [id_electronicos] integer PRIMARY KEY,
  [id_producto] INT UNIQUE,
  [marca] varchar(15),
  [categoria] varchar(15)
)
GO

CREATE TABLE [Detalle_Venta] (
  [id_detalleventa] integer PRIMARY KEY,
  [Cantidad] integer,
  [Precio_venta] integer
)
GO

CREATE TABLE [Venta] (
  [id_venta] integer PRIMARY KEY,
  [fecha] integer
)
GO

CREATE TABLE [Alquiler] (
  [Cod_consola] integer PRIMARY KEY,
  [Hora_inicio] TIME,
  [Hora_fin] TIME,
  [Costo_Hora] integer
)
GO

ALTER TABLE [consumibles] ADD FOREIGN KEY ([fecha_vencimiento]) REFERENCES [producto] ([codigo])
GO

ALTER TABLE [videojuegos] ADD FOREIGN KEY ([fecha_lanzamiento]) REFERENCES [producto] ([codigo])
GO

ALTER TABLE [Electronicos] ADD FOREIGN KEY ([marca]) REFERENCES [producto] ([codigo])
GO

ALTER TABLE [Detalle_Venta] ADD FOREIGN KEY ([Cantidad]) REFERENCES [videojuegos] ([fecha_lanzamiento])
GO

ALTER TABLE [Venta] ADD FOREIGN KEY ([fecha]) REFERENCES [Detalle_Venta] ([Cantidad])
GO

ALTER TABLE [Alquiler] ADD FOREIGN KEY ([Cod_consola]) REFERENCES [Venta] ([fecha])
GO

ALTER TABLE [Detalle_Venta] ADD FOREIGN KEY ([Cantidad]) REFERENCES [consumibles] ([fecha_vencimiento])
GO

ALTER TABLE [Detalle_Venta] ADD FOREIGN KEY ([Cantidad]) REFERENCES [Electronicos] ([marca])
GO
