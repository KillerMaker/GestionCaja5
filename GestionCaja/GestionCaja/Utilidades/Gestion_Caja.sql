USE [GESTION_CAJAS]
GO
/****** Object:  Table [dbo].[EMPLEADO]    Script Date: 10/2/2021 10:12:18 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EMPLEADO](
	[IDENTIFICADOR] [int] IDENTITY(1,1) NOT NULL,
	[ID_PERSONA] [int] NOT NULL,
	[TANDA_LABOR] [varchar](50) NOT NULL,
	[PORCIENTO_COMISION] [decimal](3, 2) NOT NULL,
	[FECHA_INGRESO] [date] NOT NULL,
	[ESTADO] [varchar](50) NULL,
	[SUELDO] [decimal](8, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IDENTIFICADOR] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PERSONA]    Script Date: 10/2/2021 10:12:18 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PERSONA](
	[ID_PERSONA] [int] IDENTITY(1,1) NOT NULL,
	[NOMBRE] [varchar](60) NOT NULL,
	[FECHA_NACIMIENTO] [date] NOT NULL,
	[GENERO] [char](1) NOT NULL,
	[CEDULA] [char](11) NOT NULL,
	[TIPO_CLIENTE] [varchar](25) NOT NULL,
 CONSTRAINT [PK__PERSONA__782441494ECDD8A9] PRIMARY KEY CLUSTERED 
(
	[ID_PERSONA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VISTA_EMPLEADO]    Script Date: 10/2/2021 10:12:18 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[VISTA_EMPLEADO]
AS
SELECT P.NOMBRE, E.IDENTIFICADOR, E.TANDA_LABOR, E.PORCIENTO_COMISION, E.FECHA_INGRESO, E.SUELDO, P.FECHA_NACIMIENTO, P.GENERO, P.CEDULA, P.TIPO_CLIENTE, E.ESTADO FROM EMPLEADO AS E
INNER JOIN PERSONA AS P ON E.ID_PERSONA = P.ID_PERSONA
GO
/****** Object:  Table [dbo].[ESTUDIANTE]    Script Date: 10/2/2021 10:12:18 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ESTUDIANTE](
	[IDENTIFICADOR] [int] IDENTITY(1,1) NOT NULL,
	[MATRICULA] [char](8) NOT NULL,
	[ID_PERSONA] [int] NOT NULL,
	[CARRERA] [char](3) NOT NULL,
	[FECHA_REGISTRO] [date] NOT NULL,
	[ESTADO] [varchar](50) NOT NULL,
 CONSTRAINT [PK__ESTUDIAN__46A2F689BD76084B] PRIMARY KEY CLUSTERED 
(
	[IDENTIFICADOR] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VISTA_ESTUDIANTE]    Script Date: 10/2/2021 10:12:18 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[VISTA_ESTUDIANTE] 
AS
SELECT E.IDENTIFICADOR,  P.NOMBRE, E.MATRICULA, E.CARRERA, E.FECHA_REGISTRO, E.ESTADO, P.FECHA_NACIMIENTO, P.GENERO, P.CEDULA, P.TIPO_CLIENTE FROM ESTUDIANTE AS E
INNER JOIN PERSONA AS P ON E.ID_PERSONA = P.ID_PERSONA
GO
/****** Object:  Table [dbo].[TIPO_DOCUMENTO]    Script Date: 10/2/2021 10:12:18 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TIPO_DOCUMENTO](
	[ID_TIPO_DOCUMENTO] [int] IDENTITY(1,1) NOT NULL,
	[DESCRIPCION] [varchar](300) NULL,
	[ESTADO] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_TIPO_DOCUMENTO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TIPO_PAGO]    Script Date: 10/2/2021 10:12:18 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TIPO_PAGO](
	[ID_TIPO_PAGO] [int] IDENTITY(1,1) NOT NULL,
	[DESCRIPCION] [varchar](300) NULL,
	[ESTADO] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_TIPO_PAGO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TIPO_SERVICIO]    Script Date: 10/2/2021 10:12:18 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TIPO_SERVICIO](
	[ID_TIPO_SERVICIO] [int] IDENTITY(1,1) NOT NULL,
	[DESCRIPCION] [varchar](300) NULL,
	[ESTADO] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_TIPO_SERVICIO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[EMPLEADO]  WITH CHECK ADD  CONSTRAINT [FK__EMPLEADO__ID_PER__403A8C7D] FOREIGN KEY([ID_PERSONA])
REFERENCES [dbo].[PERSONA] ([ID_PERSONA])
GO
ALTER TABLE [dbo].[EMPLEADO] CHECK CONSTRAINT [FK__EMPLEADO__ID_PER__403A8C7D]
GO
ALTER TABLE [dbo].[ESTUDIANTE]  WITH CHECK ADD  CONSTRAINT [FK__ESTUDIANT__ID_PE__412EB0B6] FOREIGN KEY([ID_PERSONA])
REFERENCES [dbo].[PERSONA] ([ID_PERSONA])
GO
ALTER TABLE [dbo].[ESTUDIANTE] CHECK CONSTRAINT [FK__ESTUDIANT__ID_PE__412EB0B6]
GO
/****** Object:  StoredProcedure [dbo].[INSERTA_TIPO_DOCUMENTO]    Script Date: 10/2/2021 10:12:18 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--CREATE TABLE TIPO_PAGO
--(
--	ID_TIPO_PAGO INT IDENTITY(1,1) PRIMARY KEY,
--	DESCRIPCION VARCHAR(300),
--	ESTADO VARCHAR(50)
--)
--CREATE TABLE TIPO_DOCUMENTO
--(
--	ID_TIPO_DOCUMENTO INT IDENTITY(1,1) PRIMARY KEY,
--	DESCRIPCION VARCHAR(300),
--	ESTADO VARCHAR(50)
--)
--CREATE TABLE TIPO_SERVICIO
--(
--	ID_TIPO_SERVICIO INT IDENTITY(1,1) PRIMARY KEY,
--	DESCRIPCION VARCHAR(300),
--	ESTADO VARCHAR(50)
--)

CREATE PROC [dbo].[INSERTA_TIPO_DOCUMENTO]
(
	@DESCRIPCION VARCHAR(300),
	@ESTADO VARCHAR(50)
)
AS
BEGIN
	INSERT INTO TIPO_DOCUMENTO VALUES(@DESCRIPCION,@ESTADO)
END
GO
/****** Object:  StoredProcedure [dbo].[INSERTA_TIPO_PAGO]    Script Date: 10/2/2021 10:12:18 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--CREATE TABLE TIPO_PAGO
--(
--	ID_TIPO_PAGO INT IDENTITY(1,1) PRIMARY KEY,
--	DESCRIPCION VARCHAR(300),
--	ESTADO VARCHAR(50)
--)
--CREATE TABLE TIPO_DOCUMENTO
--(
--	ID_TIPO_DOCUMENTO INT IDENTITY(1,1) PRIMARY KEY,
--	DESCRIPCION VARCHAR(300),
--	ESTADO VARCHAR(50)
--)
--CREATE TABLE TIPO_SERVICIO
--(
--	ID_TIPO_SERVICIO INT IDENTITY(1,1) PRIMARY KEY,
--	DESCRIPCION VARCHAR(300),
--	ESTADO VARCHAR(50)
--)

CREATE PROC [dbo].[INSERTA_TIPO_PAGO]
(
	@DESCRIPCION VARCHAR(300),
	@ESTADO VARCHAR(50)
)
AS
BEGIN
	INSERT INTO TIPO_PAGO VALUES(@DESCRIPCION,@ESTADO)
END
GO
/****** Object:  StoredProcedure [dbo].[INSERTA_TIPO_SERVICIO]    Script Date: 10/2/2021 10:12:18 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--CREATE TABLE TIPO_PAGO
--(
--	ID_TIPO_PAGO INT IDENTITY(1,1) PRIMARY KEY,
--	DESCRIPCION VARCHAR(300),
--	ESTADO VARCHAR(50)
--)
--CREATE TABLE TIPO_DOCUMENTO
--(
--	ID_TIPO_DOCUMENTO INT IDENTITY(1,1) PRIMARY KEY,
--	DESCRIPCION VARCHAR(300),
--	ESTADO VARCHAR(50)
--)
--CREATE TABLE TIPO_SERVICIO
--(
--	ID_TIPO_SERVICIO INT IDENTITY(1,1) PRIMARY KEY,
--	DESCRIPCION VARCHAR(300),
--	ESTADO VARCHAR(50)
--)

CREATE PROC [dbo].[INSERTA_TIPO_SERVICIO]
(
	@DESCRIPCION VARCHAR(300),
	@ESTADO VARCHAR(50)
)
AS
BEGIN
	INSERT INTO TIPO_SERVICIO VALUES(@DESCRIPCION,@ESTADO)
END
GO
/****** Object:  StoredProcedure [dbo].[INSERTAR_EMPLEADO]    Script Date: 10/2/2021 10:12:18 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[INSERTAR_EMPLEADO]
(
	@NOMBRE VARCHAR(60),
	@FECHA_NACIMIENTO DATE,
	@GENERO CHAR(1),
	@CEDULA CHAR(11),
	@TANDA_LABOR VARCHAR(50),
	@PORCIENTO_COMISION DECIMAL(3,2),
	@FECHA_INGRESO DATE,
	@SUELDO DECIMAL(8,2),
	@ESTADO VARCHAR(50)
) 
AS 
BEGIN
	EXECUTE INSERTAR_PERSONA @NOMBRE, @FECHA_NACIMIENTO, @GENERO, @CEDULA, 'EMPLEADO'
	INSERT INTO EMPLEADO (ID_PERSONA, TANDA_LABOR, PORCIENTO_COMISION, FECHA_INGRESO, SUELDO, ESTADO)
		VALUES (
		(SELECT MAX(ID_PERSONA) FROM PERSONA),
		@TANDA_LABOR,
		@PORCIENTO_COMISION,
		@FECHA_INGRESO,
		@SUELDO,
		@ESTADO)
		PRINT 'LA PERSONA HA SIDO INSERTADA'
END
GO
/****** Object:  StoredProcedure [dbo].[INSERTAR_ESTUDIANTE]    Script Date: 10/2/2021 10:12:18 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[INSERTAR_ESTUDIANTE]
(
	@NOMBRE VARCHAR(60),
	@FECHA_NACIMIENTO DATE,
	@GENERO CHAR(1),
	@CEDULA CHAR(11),
	@CARRERA CHAR(3),
	@FECHA_REGISTRO DATE,
	@ESTADO VARCHAR(50)
) 
AS 
BEGIN
	IF EXISTS (SELECT MATRICULA FROM ESTUDIANTE)
		BEGIN
			DECLARE @MATRICULA INT= (SELECT MAX(MATRICULA) FROM ESTUDIANTE)
			SET @MATRICULA=@MATRICULA+1
		END
	ELSE
		BEGIN
			SET @MATRICULA=20200000
		END

	EXECUTE INSERTAR_PERSONA @NOMBRE, @FECHA_NACIMIENTO, @GENERO, @CEDULA, 'ESTUDIANTE'
	INSERT INTO ESTUDIANTE (ID_PERSONA,MATRICULA, CARRERA, FECHA_REGISTRO, ESTADO)
		VALUES (
		(SELECT MAX(ID_PERSONA) FROM PERSONA),
		CONVERT(CHAR(8),@MATRICULA),
		@CARRERA,
		@FECHA_REGISTRO,
		@ESTADO)
		PRINT 'LA PERSONA HA SIDO INSERTADA'
END
GO
/****** Object:  StoredProcedure [dbo].[INSERTAR_PERSONA]    Script Date: 10/2/2021 10:12:18 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[INSERTAR_PERSONA]
(
	@NOMBRE VARCHAR(60),
	@FECHA_NACIMIENTO DATE,
	@GENERO CHAR(1),
	@CEDULA CHAR(11),
	@TIPO_CLIENTE VARCHAR(25)
) 
AS 
BEGIN
	INSERT INTO PERSONA (NOMBRE, FECHA_NACIMIENTO, GENERO, CEDULA, TIPO_CLIENTE)
		VALUES (
		@NOMBRE,
		@FECHA_NACIMIENTO,
		@GENERO,
		@CEDULA,
		@TIPO_CLIENTE)
		PRINT 'LA PERSONA HA SIDO INSERTADA'
		RETURN
END
GO
