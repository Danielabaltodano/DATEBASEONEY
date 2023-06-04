
--------Prodecimiento Mostrar cliente---------
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


--------------Prodecimiento Consultar cliente------------------
CREATE PROCEDURE [dbo].[ConsultarConsumble]
@dato varchar(50)
AS
BEGIN
    SELECT consumibles.id_Consumible, producto.codigo, producto.nombre, producto.precio_compra, producto.descripcion, Cliente.Procedencia
	FROM Cliente 
	INNER JOIN Persona ON Cliente.ID_Persona = Persona.ID_Persona
	WHERE Cliente.ID_cliente LIKE '%'+RTRIM(@dato)+'%' 
		OR Persona.Cedula LIKE '%'+RTRIM(@dato)+'%'
		OR Persona.Nombre1 LIKE '%'+RTRIM(@dato)+'%'
		OR Persona.Nombre2 LIKE '%'+RTRIM(@dato)+'%'
		OR Persona.Apellido1 LIKE '%'+RTRIM(@dato)+'%'
		OR Persona.Apellido2 LIKE '%'+RTRIM(@dato)+'%';
END







---------------------------Prodecimiento Crear Cliente-----------------------------------------

USE [DB_HotelMilenio]
GO
CREATE PROCEDURE [dbo].[CrearCliente]
    @Cedula VARCHAR(15),
    @Nombre1 VARCHAR(15),
    @Nombre2 VARCHAR(15),
    @Apellido1 VARCHAR(15),
    @Apellido2 VARCHAR(15),
    @Procedencia VARCHAR(40),
    @Telefono VARCHAR(8)
AS
BEGIN
    INSERT INTO Persona(Cedula, Nombre1, Nombre2, Apellido1, Apellido2,  Telefono)
    VALUES (@Cedula, @Nombre1, @Nombre2, @Apellido1, @Apellido2,  @Telefono)
	INSERT INTO Cliente(ID_Persona ,Procedencia)
	VALUES (SCOPE_IDENTITY(), @Procedencia)
END



-----------------------------Prodecimiento Modificar Cliente---------------------------------------------
USE [DB_HotelMilenio]
GO
CREATE PROCEDURE [dbo].[ModificarCliente]
@ID_Persona INT,
@Cedula VARCHAR(15),
@Nombre1 VARCHAR(15),
@Nombre2 VARCHAR(15),
@Apellido1 VARCHAR(15),
@Apellido2 VARCHAR(15),
@Procedencia VARCHAR(40),
@Telefono varchar(8)
AS
BEGIN
UPDATE Persona SET
    Cedula = @Cedula,
    Nombre1 = @Nombre1,
    Nombre2 = @Nombre2,
    Apellido1 = @Apellido1,
    Apellido2 = @Apellido2,
    Telefono = @Telefono
WHERE ID_Persona = @ID_Persona
update Cliente set Procedencia= @Procedencia where ID_Persona=@ID_Persona
END

---------------------------------Prodecimiento Eliminar cliente----------------------------------------
USE [DB_HotelMilenio]
GO
CREATE PROCEDURE EliminarCliente
    @dato varchar(50)
	As 
	Begin 
	delete from Cliente where ID_Persona= @dato
	delete from Persona where ID_Persona= @dato

End

-------------------Prodecimiento Insertar Empleado-------------------------------
USE [DB_HotelMilenio]
GO
CREATE PROCEDURE [dbo].[CrearEmpleado]
    @Nombre1 VARCHAR(15),
    @Nombre2 VARCHAR(15),
    @Apellido1 VARCHAR(15),
    @Apellido2 VARCHAR(15),
    @Telefono VARCHAR(8),
	@Usuario VARCHAR(15),
	@Contraseña VARCHAR(30)
AS
BEGIN
    INSERT INTO Persona( Nombre1, Nombre2, Apellido1, Apellido2,  Telefono)
    VALUES ( @Nombre1, @Nombre2, @Apellido1, @Apellido2,  @Telefono)
	INSERT INTO Empleado(ID_Persona ,Usuario,Contraseña)
	VALUES (SCOPE_IDENTITY(), @Usuario,@Contraseña)
END
--------Procedimiento Mostrar Empleado---------
USE DB_HotelMilenio
GO

CREATE PROCEDURE MostrarEmpleados
AS
BEGIN
    SELECT P.ID_Persona,E.ID_Empleado, P.Nombre1, P.Nombre2, P.Apellido1, P.Apellido2, P.Telefono, E.Usuario,E.Contraseña
    FROM Persona P
    INNER JOIN Empleado E ON P.ID_Persona = E.ID_Persona;
END

Exec MostrarEmpleados



--------------Procedimiento Consultar Empleado------------------
USE DB_HotelMilenio
GO

CREATE PROCEDURE ConsultarEmpleado
@dato varchar(50)
AS
BEGIN
    SELECT Empleado.ID_Empleado, Persona.Nombre1, Persona.Nombre2, Persona.Apellido1, Persona.Apellido2, Persona.Telefono,Empleado.Usuario,Empleado.Contraseña
	FROM Empleado
	INNER JOIN Persona ON Empleado.ID_Persona = Persona.ID_Persona
	WHERE Empleado.ID_Empleado LIKE '%'+RTRIM(@dato)+'%' 
		OR Persona.Nombre1 LIKE '%'+RTRIM(@dato)+'%'
		OR Persona.Nombre2 LIKE '%'+RTRIM(@dato)+'%'
		OR Persona.Apellido1 LIKE '%'+RTRIM(@dato)+'%'
		OR Persona.Apellido2 LIKE '%'+RTRIM(@dato)+'%';
END



--------------------------------Procedimiento Actualizar empleado----------------------------------------------------
USE [DB_HotelMilenio]
GO
CREATE PROCEDURE ModificarEmpleado
@ID_Persona INT,
@Nombre1 VARCHAR(15),
@Nombre2 VARCHAR(15),
@Apellido1 VARCHAR(15),
@Apellido2 VARCHAR(15),
@Telefono varchar(8),
@Usuario VARCHAR (15),
@Contraseña VARCHAR(30)
AS
BEGIN
UPDATE Persona SET
    Nombre1 = @Nombre1,
    Nombre2 = @Nombre2,
    Apellido1 = @Apellido1,
    Apellido2 = @Apellido2,
    Telefono = @Telefono
WHERE ID_Persona = @ID_Persona
UPDATE Empleado SET
Usuario= @Usuario,
Contraseña=@Contraseña

WHERE ID_Persona=@ID_Persona
END



--------------------------------------------------------------
USE [DB_HotelMilenio]
GO
CREATE PROCEDURE EliminarEmpleado
    @dato varchar(50)
	As 
	Begin 
	delete from Empleado where ID_Persona= @dato
	delete from Persona where ID_Persona= @dato

End
---------------------------------------------------------------------------------------

USE [DB_HotelMilenio]
GO
CREATE PROCEDURE RellenarEmpleado
AS
BEGIN
     SELECT E.ID_Empleado, P.Nombre1
	 FROM Persona P
	 INNER JOIN Empleado E ON P.ID_Persona= E.ID_Persona;
	 END

	 exec RellenarEmpleado


