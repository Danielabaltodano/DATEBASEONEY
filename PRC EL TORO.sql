
--------Prodecimiento Mostrar consumible---------
USE DB_ELTORO
GO

CREATE PROCEDURE MostrarConsumible
AS
BEGIN
    SELECT P.id_producto,C.id_Consumible ,P.codigo, P.nombre, P.precio_compra, P.descripcion, C.fecha_vencimiento
    FROM producto P
    INNER JOIN consumibles C ON P.id_producto = C.id_producto;
END



Exec MostrarConsumible;


--------------Prodecimiento Consultar consumible------------------
CREATE PROCEDURE [dbo].[ConsultarConsumble]
@dato varchar(50)
AS
BEGIN
    SELECT consumibles.id_Consumible, producto.codigo, producto.nombre, producto.precio_compra, producto.descripcion, Consumibles.fecha_vencimiento
	FROM Consumible
	INNER JOIN Producto ON Consumibles.id_productos = Producto.id_producto
	WHERE Consumibles.id_Consumible LIKE '%'+RTRIM(@dato)+'%' 
		OR Producto.codigo LIKE '%'+RTRIM(@dato)+'%'
		OR Producto.Nombre LIKE '%'+RTRIM(@dato)+'%'
		OR Producto.precio_compra LIKE '%'+RTRIM(@dato)+'%'
		OR Producto.descripcion LIKE '%'+RTRIM(@dato)+'%'
END







---------------------------Prodecimiento Crear Consumibles-----------------------------------------

USE [DB_ELTORO]
GO
CREATE PROCEDURE [dbo].[CrearConsumible]
    @codigo VARCHAR(15),
    @nombre VARCHAR(15),
    @precio_compra VARCHAR(15),
    @descripcion VARCHAR(15),
	@fecha_vencimiento DATETIME
AS
BEGIN
    INSERT INTO Producto(codigo, nombre, precio_compra, descripcion)
    VALUES (@codigo, @nombre, @precio_compra, @descripcion)
	INSERT INTO Consumible(id_producto ,fecha_vencimiento)
	VALUES (SCOPE_IDENTITY(), @fecha_vencimiento)
END



-----------------------------Prodecimiento Modificar Consumible---------------------------------------------
USE [DB_ELTORO]
GO
CREATE PROCEDURE [dbo].[ModificarConsumible]
@id_producto INT,
@codigo INT,
@nombre VARCHAR(15),
@precio_compra INT,
@descripcion VARCHAR(15),
@fecha_vencimiento DATETIME
AS
BEGIN
UPDATE Producto SET
    codigo = @codigo,
    nombre = @nombre,
    precio_compra = @precio_compra,
    descripcion = @descripcion
WHERE id_producto = @id_producto
update Consumible set fecha_vencimiento= @fecha_vencimiento where id_producto = @id_producto
END

---------------------------------Prodecimiento Eliminar consumible----------------------------------------
USE [DB_ELTORO]
GO
CREATE PROCEDURE EliminarConsumible
    @dato varchar(50)
	As 
	Begin 
	delete from Consumible where id_producto= @dato
	delete from Producto where id_producto= @dato

End

-------------------Prodecimiento Insertar VideoJuego-------------------------------

USE [DB_ELTORO]
GO
CREATE PROCEDURE [dbo].[CrearVideoJuego]
    @codigo VARCHAR(15),
    @nombre VARCHAR(15),
    @precio_compra VARCHAR(15),
    @descripcion VARCHAR(15),
	@fecha_lanzamiento DATETIME,
	@plataforma VARCHAR(15)
AS
BEGIN
    INSERT INTO Producto(codigo, nombre, precio_compra, descripcion)
    VALUES (@codigo, @nombre, @precio_compra, @descripcion)
    INSERT INTO VideoJuegos(id_producto, fecha_lanzamiento, plataforma)
    VALUES (SCOPE_IDENTITY(), @fecha_lanzamiento, @plataforma)
END

--------Procedimiento Mostrar VideoJuego---------
USE [DB_ELTORO]
GO

CREATE PROCEDURE MostrarVideoJuego
AS
BEGIN
    SELECT P.id_producto, V.id_videojuegos, P.codigo, P.nombre, P.precio_compra, P.descripcion, V.fecha_lanzamiento, V.plataforma
    FROM producto P
    INNER JOIN videojuegos V ON P.id_producto = V.id_producto;
END

EXEC MostrarVideoJuego;




--------------Procedimiento Consultar VideoJuego------------------
USE [DB_ELTORO]
GO

CREATE PROCEDURE [dbo].[ConsultarVideoJuego]
    @dato VARCHAR(50)
AS
BEGIN
    SELECT videojuegos.id_videojuegos, producto.codigo, producto.nombre, producto.precio_compra, producto.descripcion, videojuegos.fecha_lanzamiento, videojuegos.plataforma
    FROM videojuegos
    INNER JOIN Producto ON VideoJuegos.id_producto = Producto.id_producto
    WHERE VideoJuegos.id_videojuegos LIKE '%'+RTRIM(@dato)+'%' 
        OR Producto.codigo LIKE '%'+RTRIM(@dato)+'%'
        OR Producto.Nombre LIKE '%'+RTRIM(@dato)+'%'
        OR Producto.precio_compra LIKE '%'+RTRIM(@dato)+'%'
        OR Producto.descripcion LIKE '%'+RTRIM(@dato)+'%'
END




--------------------------------Procedimiento Actualizar videojuegos----------------------------------------------------
USE [DB_ELTORO]
GO
CREATE PROCEDURE [dbo].[ModificarVideoJuego]
    @id_producto INT,
    @codigo INT,
    @nombre VARCHAR(15),
    @precio_compra INT,
    @descripcion VARCHAR(15),
    @fecha_lanzamiento DATETIME,
    @plataforma VARCHAR(15)
AS
BEGIN
    UPDATE Producto SET
        codigo = @codigo,
        nombre = @nombre,
        precio_compra = @precio_compra,
        descripcion = @descripcion
    WHERE id_producto = @id_producto

    UPDATE VideoJuegos SET
        fecha_lanzamiento = @fecha_lanzamiento,
        plataforma = @plataforma
    WHERE id_producto = @id_producto
END




--------------------------------------eliminar videojuego-----------------------------------------------------
USE [DB_ELTORO]
GO

CREATE PROCEDURE EliminarVideoJuego
    @dato VARCHAR(50)
AS 
BEGIN 
    DELETE FROM videojuegos WHERE id_producto = @dato
    DELETE FROM Producto WHERE id_producto = @dato
END
---------------------------------------------------------------------------------------



