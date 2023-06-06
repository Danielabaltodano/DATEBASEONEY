use master 
CREATE DATABASE DB_ELTORO
GO
USE DB_ELTORO

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

CREATE TABLE [Venta] (
  [id_venta] integer PRIMARY KEY,
  [fecha] integer,
  Cod_consola int unique
)
GO

CREATE TABLE [Alquiler] (
  [Cod_consola] integer PRIMARY KEY,
  [Hora_inicio] TIME,
  [Hora_fin] TIME,
  [Costo_Hora] integer,
  id_venta int unique
)
GO

ALTER TABLE dbo.Venta
ADD CONSTRAINT FK_Venta2_Alquileres
FOREIGN KEY (Cod_consola)
REFERENCES dbo.Alquiler(Cod_consola)

GO

ALTER TABLE dbo.Alquiler
ADD CONSTRAINT FK_Alquiler_Venta2
FOREIGN KEY (id_venta)
REFERENCES dbo.Venta(id_venta)

GO

CREATE TABLE [producto] (
  [id_producto] integer PRIMARY KEY,
  [codigo] integer,
  [nombre] varchar(15),
  [precio_compra] decimal(4,2),
  [descripcion] varchar(30),
  id_Consumible int,
  CONSTRAINT FK_Produco_Consu8 FOREIGN KEY (id_Consumible) REFERENCES consumibles (id_Consumible),
  id_videojuegos int,
  CONSTRAINT FK_Produco_ViJu FOREIGN KEY (id_videojuegos) REFERENCES videojuegos (id_videojuegos),
  id_electronicos int,
  CONSTRAINT FK_Produco_Consu9 FOREIGN KEY (id_electronicos) REFERENCES Electronicos (id_electronicos),
) 
GO


CREATE TABLE [Detalle_Venta] (
  [id_detalleventa] integer PRIMARY KEY,
  [Cantidad] integer,
  [Precio_venta] integer,
  id_Consumible int,
  CONSTRAINT FK_Produco1_Consu FOREIGN KEY (id_Consumible) REFERENCES consumibles (id_Consumible),
  id_videojuegos int,
  CONSTRAINT FK_Produco2_ViJu FOREIGN KEY (id_videojuegos) REFERENCES videojuegos (id_videojuegos),
  id_electronicos int,
  CONSTRAINT FK_Produco3_Consu1 FOREIGN KEY (id_electronicos) REFERENCES Electronicos (id_electronicos),
  id_venta int,
  CONSTRAINT FK_venta_venta2 FOREIGN KEY (id_venta) REFERENCES Venta (id_venta),
)
GO

