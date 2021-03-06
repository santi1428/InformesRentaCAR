USE [master]
GO
/****** Object:  Database [db_alquiler]    Script Date: 26/05/2019 5:32:56 p. m. ******/
CREATE DATABASE [db_alquiler]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'db_alquiler', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\db_alquiler.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'db_alquiler_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\db_alquiler_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [db_alquiler] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [db_alquiler].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [db_alquiler] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [db_alquiler] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [db_alquiler] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [db_alquiler] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [db_alquiler] SET ARITHABORT OFF 
GO
ALTER DATABASE [db_alquiler] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [db_alquiler] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [db_alquiler] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [db_alquiler] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [db_alquiler] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [db_alquiler] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [db_alquiler] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [db_alquiler] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [db_alquiler] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [db_alquiler] SET  ENABLE_BROKER 
GO
ALTER DATABASE [db_alquiler] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [db_alquiler] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [db_alquiler] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [db_alquiler] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [db_alquiler] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [db_alquiler] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [db_alquiler] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [db_alquiler] SET RECOVERY FULL 
GO
ALTER DATABASE [db_alquiler] SET  MULTI_USER 
GO
ALTER DATABASE [db_alquiler] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [db_alquiler] SET DB_CHAINING OFF 
GO
ALTER DATABASE [db_alquiler] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [db_alquiler] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [db_alquiler] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'db_alquiler', N'ON'
GO
ALTER DATABASE [db_alquiler] SET QUERY_STORE = OFF
GO
USE [db_alquiler]
GO
/****** Object:  Table [dbo].[AlquileresTBL]    Script Date: 26/05/2019 5:32:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AlquileresTBL](
	[FechaInicial] [varchar](20) NULL,
	[FechaFinal] [varchar](20) NULL,
	[KM_Inicial] [int] NULL,
	[KM_Final] [int] NULL,
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[ReservaId] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AseguradoraTBL]    Script Date: 26/05/2019 5:32:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AseguradoraTBL](
	[Documento_Cliente] [varchar](20) NOT NULL,
	[Tipo_Permiso] [varchar](10) NULL,
	[Permiso] [bit] NULL,
	[Nombre] [varchar](30) NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_AseguradoraTBL] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientesTBL]    Script Date: 26/05/2019 5:32:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientesTBL](
	[n_documento] [varchar](50) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[apellido] [varchar](50) NOT NULL,
	[fecha_nacimiento] [varchar](10) NOT NULL,
	[direccion] [varchar](50) NOT NULL,
	[telefono] [varchar](50) NOT NULL,
	[id_documento] [int] NOT NULL,
	[id_estado] [int] NOT NULL,
 CONSTRAINT [PK_cliente] PRIMARY KEY CLUSTERED 
(
	[n_documento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Color_vehiculosTBL]    Script Date: 26/05/2019 5:32:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Color_vehiculosTBL](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Color] [varchar](30) NOT NULL,
 CONSTRAINT [PK_Color_vehiculosTBL] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DevolucionesTBL]    Script Date: 26/05/2019 5:32:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DevolucionesTBL](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[DocumentoCliente] [varchar](50) NULL,
	[Placa] [varchar](50) NULL,
	[FechaComienzo] [varchar](10) NULL,
	[KMAntes] [int] NULL,
	[KMDespues] [int] NULL,
	[Observaciones] [varchar](300) NULL,
	[FechaEntrega] [varchar](10) NULL,
	[VehiculoMatricula] [varchar](50) NOT NULL,
	[Multa] [bigint] NULL,
 CONSTRAINT [PK_DevolucionesTBL] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EstadosTBL]    Script Date: 26/05/2019 5:32:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EstadosTBL](
	[id_estado] [int] IDENTITY(1,1) NOT NULL,
	[estado] [varchar](50) NOT NULL,
 CONSTRAINT [PK_estado] PRIMARY KEY CLUSTERED 
(
	[id_estado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gama_vehiculosTBL]    Script Date: 26/05/2019 5:32:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gama_vehiculosTBL](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Gama] [varchar](40) NOT NULL,
 CONSTRAINT [PK_Gama_vehiculosTBL] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LicenciasTBL]    Script Date: 26/05/2019 5:32:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LicenciasTBL](
	[tipo_permiso] [varchar](2) NOT NULL,
	[vehiculos] [varchar](50) NOT NULL,
	[id_estado] [int] NOT NULL,
 CONSTRAINT [PK_permiso] PRIMARY KEY CLUSTERED 
(
	[tipo_permiso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MarcasTBL]    Script Date: 26/05/2019 5:32:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MarcasTBL](
	[id_marca] [int] IDENTITY(1,1) NOT NULL,
	[marca] [varchar](50) NOT NULL,
 CONSTRAINT [PK_marcas] PRIMARY KEY CLUSTERED 
(
	[id_marca] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PagosTBL]    Script Date: 26/05/2019 5:32:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PagosTBL](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_tipo_pago] [int] NOT NULL,
	[fecha] [varchar](20) NULL,
	[valor] [bigint] NOT NULL,
	[estado] [varchar](20) NOT NULL,
	[aseguradora_id] [int] NULL,
	[DocumentoCliente] [varchar](50) NULL,
 CONSTRAINT [PK_PagosTBL] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReservasTBL]    Script Date: 26/05/2019 5:32:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReservasTBL](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[DocumentoCliente] [varchar](50) NULL,
	[FechaInicial] [varchar](20) NULL,
	[FechaFinal] [varchar](20) NULL,
	[MatriculaVehiculo] [varchar](50) NULL,
	[CantidadDias] [int] NULL,
	[AseguradoraId] [int] NOT NULL,
 CONSTRAINT [PK_ReservasTBL] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tipo_documentosTBL]    Script Date: 26/05/2019 5:32:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tipo_documentosTBL](
	[id_documento] [int] IDENTITY(1,1) NOT NULL,
	[tipo_documento] [varchar](50) NULL,
 CONSTRAINT [PK_tipo_documento] PRIMARY KEY CLUSTERED 
(
	[id_documento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tipo_vehiculosTBL]    Script Date: 26/05/2019 5:32:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tipo_vehiculosTBL](
	[cod] [varchar](2) NOT NULL,
	[tipo] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tipo_vehiculo] PRIMARY KEY CLUSTERED 
(
	[cod] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoPagosTBL]    Script Date: 26/05/2019 5:32:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoPagosTBL](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Tipo] [varchar](30) NOT NULL,
 CONSTRAINT [PK_TipoPagosTBL] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsuariosTBL]    Script Date: 26/05/2019 5:32:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsuariosTBL](
	[nombre_usuario] [varchar](10) NOT NULL,
	[contrasena] [varchar](5) NOT NULL,
	[nombre] [varchar](20) NOT NULL,
	[apellido] [varchar](20) NOT NULL,
 CONSTRAINT [PK_usuarios] PRIMARY KEY CLUSTERED 
(
	[nombre_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VehiculosTBL]    Script Date: 26/05/2019 5:32:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VehiculosTBL](
	[matricula] [varchar](50) NOT NULL,
	[id_marca] [int] NOT NULL,
	[modelo] [varchar](50) NOT NULL,
	[placa] [varchar](50) NOT NULL,
	[precio_km] [varchar](50) NOT NULL,
	[id_estado] [int] NOT NULL,
	[id_sede] [int] NOT NULL,
	[id_tipo] [varchar](2) NOT NULL,
	[color_id] [int] NULL,
	[gama_id] [int] NULL,
 CONSTRAINT [PK_vehiculo] PRIMARY KEY CLUSTERED 
(
	[matricula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AlquileresTBL] ON 

INSERT [dbo].[AlquileresTBL] ([FechaInicial], [FechaFinal], [KM_Inicial], [KM_Final], [id], [ReservaId]) VALUES (N'2019/06/08', N'2019/06/12', 81, NULL, 8, 6)
SET IDENTITY_INSERT [dbo].[AlquileresTBL] OFF
SET IDENTITY_INSERT [dbo].[AseguradoraTBL] ON 

INSERT [dbo].[AseguradoraTBL] ([Documento_Cliente], [Tipo_Permiso], [Permiso], [Nombre], [id]) VALUES (N'5465644546', N'A2', 1, N'ALLIANZ SEGUROS S.A', 1)
INSERT [dbo].[AseguradoraTBL] ([Documento_Cliente], [Tipo_Permiso], [Permiso], [Nombre], [id]) VALUES (N'4456456889', N'A2', 1, N'ARL SURA.', 2)
INSERT [dbo].[AseguradoraTBL] ([Documento_Cliente], [Tipo_Permiso], [Permiso], [Nombre], [id]) VALUES (N'4564545655', N'A2', 1, N'AXA COLPATRIA SEGUROS S.A.', 5)
INSERT [dbo].[AseguradoraTBL] ([Documento_Cliente], [Tipo_Permiso], [Permiso], [Nombre], [id]) VALUES (N'6544566455', N'A2', 1, N'BBVA SEGUROS COLOMBIA S.A.', 6)
SET IDENTITY_INSERT [dbo].[AseguradoraTBL] OFF
INSERT [dbo].[ClientesTBL] ([n_documento], [nombre], [apellido], [fecha_nacimiento], [direccion], [telefono], [id_documento], [id_estado]) VALUES (N'12345', N'Pepito', N'Perez', N'05/13/1895', N'Clle 2 sur #50e-49', N'2158888', 5, 2)
INSERT [dbo].[ClientesTBL] ([n_documento], [nombre], [apellido], [fecha_nacimiento], [direccion], [telefono], [id_documento], [id_estado]) VALUES (N'1532125', N'Jhon', N'Aguilar', N'06/25/1985', N'Calle 84 58-50', N'2117669', 6, 2)
INSERT [dbo].[ClientesTBL] ([n_documento], [nombre], [apellido], [fecha_nacimiento], [direccion], [telefono], [id_documento], [id_estado]) VALUES (N'22217031', N'Carolina', N'Aguilar', N'1985-11-21', N'Calle 2 sur #50e-49', N'3206554', 5, 3)
INSERT [dbo].[ClientesTBL] ([n_documento], [nombre], [apellido], [fecha_nacimiento], [direccion], [telefono], [id_documento], [id_estado]) VALUES (N'22321230', N'Luisa', N'salazar', N'05/29/2009', N'Calle 84 58-50', N'2117669', 5, 2)
INSERT [dbo].[ClientesTBL] ([n_documento], [nombre], [apellido], [fecha_nacimiento], [direccion], [telefono], [id_documento], [id_estado]) VALUES (N'45612', N'Maluma', N'Balvin', N'05/17/2018', N'Calle 84 58-50', N'4445566', 5, 2)
INSERT [dbo].[ClientesTBL] ([n_documento], [nombre], [apellido], [fecha_nacimiento], [direccion], [telefono], [id_documento], [id_estado]) VALUES (N'456545', N'Luisa', N'Valencia', N'06/07/2018', N'Calle 84 58-50', N'2117669', 5, 2)
INSERT [dbo].[ClientesTBL] ([n_documento], [nombre], [apellido], [fecha_nacimiento], [direccion], [telefono], [id_documento], [id_estado]) VALUES (N'456685', N'Maira', N'Munevar', N'01/31/2018', N'Calle 84 58-52', N'2158888', 5, 2)
INSERT [dbo].[ClientesTBL] ([n_documento], [nombre], [apellido], [fecha_nacimiento], [direccion], [telefono], [id_documento], [id_estado]) VALUES (N'55667789', N'Tatiana', N'Ruiz', N'06/14/1960', N'Av 2 sur 50-60', N'2223344', 5, 2)
INSERT [dbo].[ClientesTBL] ([n_documento], [nombre], [apellido], [fecha_nacimiento], [direccion], [telefono], [id_documento], [id_estado]) VALUES (N'67767676', N'Jhon', N'Taborda', N'06/20/1944', N'Calle 84 58-50', N'98989898', 5, 2)
INSERT [dbo].[ClientesTBL] ([n_documento], [nombre], [apellido], [fecha_nacimiento], [direccion], [telefono], [id_documento], [id_estado]) VALUES (N'78945', N'Juan', N'Taborda', N'06/16/1891', N'Calle 85 58-50', N'789456', 5, 2)
INSERT [dbo].[ClientesTBL] ([n_documento], [nombre], [apellido], [fecha_nacimiento], [direccion], [telefono], [id_documento], [id_estado]) VALUES (N'789456', N'Sebastian', N'Espinoza', N'02/04/1890', N'Calle 84 58-50', N'3201654', 5, 2)
INSERT [dbo].[ClientesTBL] ([n_documento], [nombre], [apellido], [fecha_nacimiento], [direccion], [telefono], [id_documento], [id_estado]) VALUES (N'789456321', N'Sebastian', N'Ramirez', N'02/15/2000', N'Calle 84 58-50', N'2117669', 5, 2)
INSERT [dbo].[ClientesTBL] ([n_documento], [nombre], [apellido], [fecha_nacimiento], [direccion], [telefono], [id_documento], [id_estado]) VALUES (N'8081025', N'Juan', N'Brand', N'2013-07-01', N'Calle 84 58-50', N'2117669', 5, 2)
INSERT [dbo].[ClientesTBL] ([n_documento], [nombre], [apellido], [fecha_nacimiento], [direccion], [telefono], [id_documento], [id_estado]) VALUES (N'8081031', N'Juan', N'Brand', N'2013-07-01', N'Calle 84 58-50', N'2117669', 5, 2)
INSERT [dbo].[ClientesTBL] ([n_documento], [nombre], [apellido], [fecha_nacimiento], [direccion], [telefono], [id_documento], [id_estado]) VALUES (N'80813032', N'Victor', N'Brand Rendon', N'1985-06-06', N'Calle 84 #55-50', N'2914470', 5, 2)
INSERT [dbo].[ClientesTBL] ([n_documento], [nombre], [apellido], [fecha_nacimiento], [direccion], [telefono], [id_documento], [id_estado]) VALUES (N'80813039', N'Luis', N'Zapata', N'07/19/1995', N'Calle 84 58-578', N'2158888', 5, 2)
INSERT [dbo].[ClientesTBL] ([n_documento], [nombre], [apellido], [fecha_nacimiento], [direccion], [telefono], [id_documento], [id_estado]) VALUES (N'80858788', N'Juan', N'Brand', N'2021-03-15', N'Calle 84 58-50', N'2117669', 5, 2)
INSERT [dbo].[ClientesTBL] ([n_documento], [nombre], [apellido], [fecha_nacimiento], [direccion], [telefono], [id_documento], [id_estado]) VALUES (N'87645', N'Laura', N'Marin', N'06/27/1944', N'Calle 84 58-50', N'2158888', 5, 2)
INSERT [dbo].[ClientesTBL] ([n_documento], [nombre], [apellido], [fecha_nacimiento], [direccion], [telefono], [id_documento], [id_estado]) VALUES (N'90909090', N'Pepe', N'Rendon', N'05/23/2018', N'calle 65 48-50', N'1111111', 5, 2)
INSERT [dbo].[ClientesTBL] ([n_documento], [nombre], [apellido], [fecha_nacimiento], [direccion], [telefono], [id_documento], [id_estado]) VALUES (N'980980', N'Lenny', N'Aguilar', N'02/01/2000', N'Calle 84 58-50', N'33333', 5, 2)
INSERT [dbo].[ClientesTBL] ([n_documento], [nombre], [apellido], [fecha_nacimiento], [direccion], [telefono], [id_documento], [id_estado]) VALUES (N'987654', N'Daniela', N'Rendon', N'06/07/2018', N'Calle 84 58-50', N'2117669', 5, 2)
SET IDENTITY_INSERT [dbo].[Color_vehiculosTBL] ON 

INSERT [dbo].[Color_vehiculosTBL] ([id], [Color]) VALUES (1, N'Blanco')
INSERT [dbo].[Color_vehiculosTBL] ([id], [Color]) VALUES (2, N'Negro ')
INSERT [dbo].[Color_vehiculosTBL] ([id], [Color]) VALUES (3, N'Plata ')
INSERT [dbo].[Color_vehiculosTBL] ([id], [Color]) VALUES (4, N'Gris')
INSERT [dbo].[Color_vehiculosTBL] ([id], [Color]) VALUES (5, N'Azul')
INSERT [dbo].[Color_vehiculosTBL] ([id], [Color]) VALUES (6, N'Rojo')
INSERT [dbo].[Color_vehiculosTBL] ([id], [Color]) VALUES (7, N'Beige')
INSERT [dbo].[Color_vehiculosTBL] ([id], [Color]) VALUES (8, N'Amarillo')
INSERT [dbo].[Color_vehiculosTBL] ([id], [Color]) VALUES (9, N'Verde')
INSERT [dbo].[Color_vehiculosTBL] ([id], [Color]) VALUES (10, N'Otros')
SET IDENTITY_INSERT [dbo].[Color_vehiculosTBL] OFF
SET IDENTITY_INSERT [dbo].[DevolucionesTBL] ON 

INSERT [dbo].[DevolucionesTBL] ([id], [DocumentoCliente], [Placa], [FechaComienzo], [KMAntes], [KMDespues], [Observaciones], [FechaEntrega], [VehiculoMatricula], [Multa]) VALUES (1, N'12345', N'evs460', N'2019/05/02', NULL, 1550, N'El vehiculo se entrego sin ningun daño.', N'2019/05/26', N'11111', 789546)
INSERT [dbo].[DevolucionesTBL] ([id], [DocumentoCliente], [Placa], [FechaComienzo], [KMAntes], [KMDespues], [Observaciones], [FechaEntrega], [VehiculoMatricula], [Multa]) VALUES (2, N'12345', N'evs460', N'2019/05/02', NULL, 1250, N'Se entrego sin daños', N'2019/05/26', N'11111', 1200000)
INSERT [dbo].[DevolucionesTBL] ([id], [DocumentoCliente], [Placa], [FechaComienzo], [KMAntes], [KMDespues], [Observaciones], [FechaEntrega], [VehiculoMatricula], [Multa]) VALUES (3, N'12345', N'evs460', N'2019/05/02', NULL, 1250, N'Se entrego sin daños', N'2019/05/26', N'11111', 1200000)
INSERT [dbo].[DevolucionesTBL] ([id], [DocumentoCliente], [Placa], [FechaComienzo], [KMAntes], [KMDespues], [Observaciones], [FechaEntrega], [VehiculoMatricula], [Multa]) VALUES (4, N'12345', N'evs460', N'2019/05/02', NULL, 1250, N'El vehiculo se entrego sin daños', N'2019/05/26', N'11111', 47854)
SET IDENTITY_INSERT [dbo].[DevolucionesTBL] OFF
SET IDENTITY_INSERT [dbo].[EstadosTBL] ON 

INSERT [dbo].[EstadosTBL] ([id_estado], [estado]) VALUES (2, N'Activo                                            ')
INSERT [dbo].[EstadosTBL] ([id_estado], [estado]) VALUES (3, N'No disponible')
INSERT [dbo].[EstadosTBL] ([id_estado], [estado]) VALUES (4, N'Bloqueado')
INSERT [dbo].[EstadosTBL] ([id_estado], [estado]) VALUES (5, N'Alquilado')
INSERT [dbo].[EstadosTBL] ([id_estado], [estado]) VALUES (6, N'Disponible')
SET IDENTITY_INSERT [dbo].[EstadosTBL] OFF
SET IDENTITY_INSERT [dbo].[Gama_vehiculosTBL] ON 

INSERT [dbo].[Gama_vehiculosTBL] ([id], [Gama]) VALUES (1, N'Baja')
INSERT [dbo].[Gama_vehiculosTBL] ([id], [Gama]) VALUES (2, N'Media')
INSERT [dbo].[Gama_vehiculosTBL] ([id], [Gama]) VALUES (3, N'Alta')
SET IDENTITY_INSERT [dbo].[Gama_vehiculosTBL] OFF
INSERT [dbo].[LicenciasTBL] ([tipo_permiso], [vehiculos], [id_estado]) VALUES (N'C1', N'Particular', 2)
SET IDENTITY_INSERT [dbo].[MarcasTBL] ON 

INSERT [dbo].[MarcasTBL] ([id_marca], [marca]) VALUES (1, N'Mazda     ')
INSERT [dbo].[MarcasTBL] ([id_marca], [marca]) VALUES (8, N'Renault')
INSERT [dbo].[MarcasTBL] ([id_marca], [marca]) VALUES (9, N'Skoda')
INSERT [dbo].[MarcasTBL] ([id_marca], [marca]) VALUES (10, N'BMW')
INSERT [dbo].[MarcasTBL] ([id_marca], [marca]) VALUES (11, N'Mercedez Benz')
INSERT [dbo].[MarcasTBL] ([id_marca], [marca]) VALUES (12, N'Skodas')
INSERT [dbo].[MarcasTBL] ([id_marca], [marca]) VALUES (13, N'Suzuki')
SET IDENTITY_INSERT [dbo].[MarcasTBL] OFF
SET IDENTITY_INSERT [dbo].[PagosTBL] ON 

INSERT [dbo].[PagosTBL] ([id], [id_tipo_pago], [fecha], [valor], [estado], [aseguradora_id], [DocumentoCliente]) VALUES (2, 1, N'20190502', 500000, N'Pendiente', 1, N'12345')
INSERT [dbo].[PagosTBL] ([id], [id_tipo_pago], [fecha], [valor], [estado], [aseguradora_id], [DocumentoCliente]) VALUES (3, 2, N'20190502', 800000, N'Realizado', 2, N'1532125')
INSERT [dbo].[PagosTBL] ([id], [id_tipo_pago], [fecha], [valor], [estado], [aseguradora_id], [DocumentoCliente]) VALUES (4, 3, N'20190602', 300000, N'Pendiente', 5, N'22217031')
INSERT [dbo].[PagosTBL] ([id], [id_tipo_pago], [fecha], [valor], [estado], [aseguradora_id], [DocumentoCliente]) VALUES (5, 4, N'20190602', 250000, N'Realizado', 6, N'12345')
SET IDENTITY_INSERT [dbo].[PagosTBL] OFF
SET IDENTITY_INSERT [dbo].[ReservasTBL] ON 

INSERT [dbo].[ReservasTBL] ([id], [DocumentoCliente], [FechaInicial], [FechaFinal], [MatriculaVehiculo], [CantidadDias], [AseguradoraId]) VALUES (1, N'12345', N'2019/05/02', N'2019/05/10', N'11111', 9, 1)
INSERT [dbo].[ReservasTBL] ([id], [DocumentoCliente], [FechaInicial], [FechaFinal], [MatriculaVehiculo], [CantidadDias], [AseguradoraId]) VALUES (3, N'1532125', N'2019/06/01', N'2019/06/20', N'123', 20, 2)
INSERT [dbo].[ReservasTBL] ([id], [DocumentoCliente], [FechaInicial], [FechaFinal], [MatriculaVehiculo], [CantidadDias], [AseguradoraId]) VALUES (4, N'45612', N'2019/05/10', N'2019/05/17', N'77788', 8, 5)
INSERT [dbo].[ReservasTBL] ([id], [DocumentoCliente], [FechaInicial], [FechaFinal], [MatriculaVehiculo], [CantidadDias], [AseguradoraId]) VALUES (5, N'87645', N'2019/07/15', N'2019/07/29', N'2222', 15, 6)
INSERT [dbo].[ReservasTBL] ([id], [DocumentoCliente], [FechaInicial], [FechaFinal], [MatriculaVehiculo], [CantidadDias], [AseguradoraId]) VALUES (6, N'80858788', N'2019/06/08', N'2019/06/12', N'15321230', 5, 6)
INSERT [dbo].[ReservasTBL] ([id], [DocumentoCliente], [FechaInicial], [FechaFinal], [MatriculaVehiculo], [CantidadDias], [AseguradoraId]) VALUES (7, N'', N'', N'', N'11111', 0, 1)
INSERT [dbo].[ReservasTBL] ([id], [DocumentoCliente], [FechaInicial], [FechaFinal], [MatriculaVehiculo], [CantidadDias], [AseguradoraId]) VALUES (8, N'123', N'2019-05-04', N'2019-05-04', N'11111', 0, 1)
INSERT [dbo].[ReservasTBL] ([id], [DocumentoCliente], [FechaInicial], [FechaFinal], [MatriculaVehiculo], [CantidadDias], [AseguradoraId]) VALUES (9, N'123', N'2019-05-06', N'2019-05-09', N'11111', 3, 1)
SET IDENTITY_INSERT [dbo].[ReservasTBL] OFF
SET IDENTITY_INSERT [dbo].[Tipo_documentosTBL] ON 

INSERT [dbo].[Tipo_documentosTBL] ([id_documento], [tipo_documento]) VALUES (5, N'Cedula                                            ')
INSERT [dbo].[Tipo_documentosTBL] ([id_documento], [tipo_documento]) VALUES (6, N'Nit')
INSERT [dbo].[Tipo_documentosTBL] ([id_documento], [tipo_documento]) VALUES (7, N'Cedula Extrangeria')
INSERT [dbo].[Tipo_documentosTBL] ([id_documento], [tipo_documento]) VALUES (8, N'Pasaporte')
SET IDENTITY_INSERT [dbo].[Tipo_documentosTBL] OFF
INSERT [dbo].[Tipo_vehiculosTBL] ([cod], [tipo]) VALUES (N'AU', N'Automovil')
INSERT [dbo].[Tipo_vehiculosTBL] ([cod], [tipo]) VALUES (N'BS', N'Bus')
INSERT [dbo].[Tipo_vehiculosTBL] ([cod], [tipo]) VALUES (N'BT', N'Buseta')
INSERT [dbo].[Tipo_vehiculosTBL] ([cod], [tipo]) VALUES (N'CA', N'Campero')
INSERT [dbo].[Tipo_vehiculosTBL] ([cod], [tipo]) VALUES (N'CG', N'Camion Grand')
INSERT [dbo].[Tipo_vehiculosTBL] ([cod], [tipo]) VALUES (N'CM', N'Camion')
INSERT [dbo].[Tipo_vehiculosTBL] ([cod], [tipo]) VALUES (N'CP', N'Camion Pequeño')
INSERT [dbo].[Tipo_vehiculosTBL] ([cod], [tipo]) VALUES (N'MI', N'Microbus')
INSERT [dbo].[Tipo_vehiculosTBL] ([cod], [tipo]) VALUES (N'PU', N'Camioneta')
INSERT [dbo].[Tipo_vehiculosTBL] ([cod], [tipo]) VALUES (N'TC', N'Tracto Camion')
SET IDENTITY_INSERT [dbo].[TipoPagosTBL] ON 

INSERT [dbo].[TipoPagosTBL] ([id], [Tipo]) VALUES (1, N'Efectivo')
INSERT [dbo].[TipoPagosTBL] ([id], [Tipo]) VALUES (2, N'Consignacion')
INSERT [dbo].[TipoPagosTBL] ([id], [Tipo]) VALUES (3, N'Efecty')
INSERT [dbo].[TipoPagosTBL] ([id], [Tipo]) VALUES (4, N'Consignación Bancaria')
INSERT [dbo].[TipoPagosTBL] ([id], [Tipo]) VALUES (5, N'Baloto')
SET IDENTITY_INSERT [dbo].[TipoPagosTBL] OFF
INSERT [dbo].[UsuariosTBL] ([nombre_usuario], [contrasena], [nombre], [apellido]) VALUES (N'admin', N'admin', N'Administrador', N'admin')
INSERT [dbo].[UsuariosTBL] ([nombre_usuario], [contrasena], [nombre], [apellido]) VALUES (N'Enrique', N'1234', N'Enrique', N'Roberto')
INSERT [dbo].[VehiculosTBL] ([matricula], [id_marca], [modelo], [placa], [precio_km], [id_estado], [id_sede], [id_tipo], [color_id], [gama_id]) VALUES (N'11111', 1, N'2015', N'evs460', N'123000', 6, 2, N'AU', 1, 1)
INSERT [dbo].[VehiculosTBL] ([matricula], [id_marca], [modelo], [placa], [precio_km], [id_estado], [id_sede], [id_tipo], [color_id], [gama_id]) VALUES (N'123', 8, N'2015', N'ess541', N'123000', 6, 2, N'BS', 2, 2)
INSERT [dbo].[VehiculosTBL] ([matricula], [id_marca], [modelo], [placa], [precio_km], [id_estado], [id_sede], [id_tipo], [color_id], [gama_id]) VALUES (N'123456', 1, N'2015', N'efs410', N'123000', 3, 2, N'BS', 3, 3)
INSERT [dbo].[VehiculosTBL] ([matricula], [id_marca], [modelo], [placa], [precio_km], [id_estado], [id_sede], [id_tipo], [color_id], [gama_id]) VALUES (N'1234567', 9, N'2016', N'skj156', N'123000', 3, 2, N'BS', 1, 1)
INSERT [dbo].[VehiculosTBL] ([matricula], [id_marca], [modelo], [placa], [precio_km], [id_estado], [id_sede], [id_tipo], [color_id], [gama_id]) VALUES (N'15321230', 1, N'2017', N'qiy470', N'123000', 3, 2, N'CA', 2, 2)
INSERT [dbo].[VehiculosTBL] ([matricula], [id_marca], [modelo], [placa], [precio_km], [id_estado], [id_sede], [id_tipo], [color_id], [gama_id]) VALUES (N'2222', 1, N'2017', N'yer186', N'123000', 3, 2, N'CA', 3, 3)
INSERT [dbo].[VehiculosTBL] ([matricula], [id_marca], [modelo], [placa], [precio_km], [id_estado], [id_sede], [id_tipo], [color_id], [gama_id]) VALUES (N'77788', 10, N'2018', N'ogs375', N'123000', 3, 2, N'CA', 4, 2)
ALTER TABLE [dbo].[AlquileresTBL]  WITH CHECK ADD FOREIGN KEY([ReservaId])
REFERENCES [dbo].[ReservasTBL] ([id])
GO
ALTER TABLE [dbo].[ClientesTBL]  WITH CHECK ADD  CONSTRAINT [FK_clientes_estados1] FOREIGN KEY([id_estado])
REFERENCES [dbo].[EstadosTBL] ([id_estado])
GO
ALTER TABLE [dbo].[ClientesTBL] CHECK CONSTRAINT [FK_clientes_estados1]
GO
ALTER TABLE [dbo].[ClientesTBL]  WITH CHECK ADD  CONSTRAINT [FK_clientes_tipo_documentos] FOREIGN KEY([id_documento])
REFERENCES [dbo].[Tipo_documentosTBL] ([id_documento])
GO
ALTER TABLE [dbo].[ClientesTBL] CHECK CONSTRAINT [FK_clientes_tipo_documentos]
GO
ALTER TABLE [dbo].[DevolucionesTBL]  WITH CHECK ADD  CONSTRAINT [FK_DevolucionesTBL_VehiculosTBL] FOREIGN KEY([VehiculoMatricula])
REFERENCES [dbo].[VehiculosTBL] ([matricula])
GO
ALTER TABLE [dbo].[DevolucionesTBL] CHECK CONSTRAINT [FK_DevolucionesTBL_VehiculosTBL]
GO
ALTER TABLE [dbo].[LicenciasTBL]  WITH CHECK ADD  CONSTRAINT [FK_licencias_estados] FOREIGN KEY([id_estado])
REFERENCES [dbo].[EstadosTBL] ([id_estado])
GO
ALTER TABLE [dbo].[LicenciasTBL] CHECK CONSTRAINT [FK_licencias_estados]
GO
ALTER TABLE [dbo].[PagosTBL]  WITH CHECK ADD FOREIGN KEY([aseguradora_id])
REFERENCES [dbo].[AseguradoraTBL] ([id])
GO
ALTER TABLE [dbo].[PagosTBL]  WITH CHECK ADD FOREIGN KEY([DocumentoCliente])
REFERENCES [dbo].[ClientesTBL] ([n_documento])
GO
ALTER TABLE [dbo].[ReservasTBL]  WITH CHECK ADD  CONSTRAINT [FK_ReservasTBL_AseguradoraTBL] FOREIGN KEY([AseguradoraId])
REFERENCES [dbo].[AseguradoraTBL] ([id])
GO
ALTER TABLE [dbo].[ReservasTBL] CHECK CONSTRAINT [FK_ReservasTBL_AseguradoraTBL]
GO
ALTER TABLE [dbo].[ReservasTBL]  WITH CHECK ADD  CONSTRAINT [FK_ReservasTBL_VehiculosTBL] FOREIGN KEY([MatriculaVehiculo])
REFERENCES [dbo].[VehiculosTBL] ([matricula])
GO
ALTER TABLE [dbo].[ReservasTBL] CHECK CONSTRAINT [FK_ReservasTBL_VehiculosTBL]
GO
ALTER TABLE [dbo].[VehiculosTBL]  WITH CHECK ADD  CONSTRAINT [FK_vehiculo_tipo_vehiculo] FOREIGN KEY([id_tipo])
REFERENCES [dbo].[Tipo_vehiculosTBL] ([cod])
GO
ALTER TABLE [dbo].[VehiculosTBL] CHECK CONSTRAINT [FK_vehiculo_tipo_vehiculo]
GO
ALTER TABLE [dbo].[VehiculosTBL]  WITH CHECK ADD  CONSTRAINT [FK_vehiculos_estados] FOREIGN KEY([id_estado])
REFERENCES [dbo].[EstadosTBL] ([id_estado])
GO
ALTER TABLE [dbo].[VehiculosTBL] CHECK CONSTRAINT [FK_vehiculos_estados]
GO
ALTER TABLE [dbo].[VehiculosTBL]  WITH CHECK ADD  CONSTRAINT [FK_vehiculos_marcas] FOREIGN KEY([id_marca])
REFERENCES [dbo].[MarcasTBL] ([id_marca])
GO
ALTER TABLE [dbo].[VehiculosTBL] CHECK CONSTRAINT [FK_vehiculos_marcas]
GO
ALTER TABLE [dbo].[VehiculosTBL]  WITH CHECK ADD  CONSTRAINT [FK_VehiculosTBL_Color_vehiculosTBL] FOREIGN KEY([color_id])
REFERENCES [dbo].[Color_vehiculosTBL] ([id])
GO
ALTER TABLE [dbo].[VehiculosTBL] CHECK CONSTRAINT [FK_VehiculosTBL_Color_vehiculosTBL]
GO
ALTER TABLE [dbo].[VehiculosTBL]  WITH CHECK ADD  CONSTRAINT [FK_VehiculosTBL_Gama_vehiculosTBL] FOREIGN KEY([gama_id])
REFERENCES [dbo].[Gama_vehiculosTBL] ([id])
GO
ALTER TABLE [dbo].[VehiculosTBL] CHECK CONSTRAINT [FK_VehiculosTBL_Gama_vehiculosTBL]
GO
/****** Object:  StoredProcedure [dbo].[Clientes_LlenarCombo]    Script Date: 26/05/2019 5:32:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Clientes_LlenarCombo] AS
BEGIN
SELECT n_documento AS 'Valor', 'Documento: ' + n_documento + ', ' +nombre + ' ' + apellido AS 'Texto' FROM ClientesTBL
END
GO
/****** Object:  StoredProcedure [dbo].[InsertarLicencias]    Script Date: 26/05/2019 5:32:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[InsertarLicencias]
@tipo_permiso VARCHAR(2),
@vehiculos VARCHAR(50),
@id_estado int

AS
BEGIN
	
	SET NOCOUNT ON;
	IF NOT EXISTS (SELECT * FROM LicenciasTBL WHERE tipo_permiso  like @tipo_permiso )
	BEGIN
		INSERT INTO LicenciasTBL (tipo_permiso,vehiculos,id_estado)
		SELECT @tipo_permiso,@vehiculos,@id_estado

		SELECT '1' AS strResultado
	END    
	ELSE
	BEGIN
		SELECT '0' AS strResultado
	END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Actualizar_Marcas]    Script Date: 26/05/2019 5:32:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Actualizar_Marcas]
@marca VARCHAR(50)

AS
BEGIN
	
	SET NOCOUNT ON;
	IF  EXISTS (SELECT * FROM MarcasTBL WHERE marca  = @marca )
	BEGIN
		Update MarcasTBL SET Marca = @marca
		 WHERE marca  = @marca

		SELECT '1' AS strResultado, 'Se Actualizo la marca' AS Mensaje
	END    
	ELSE
	BEGIN
		SELECT '0' AS strResultado, 'La marca no se puede Actualizar' AS Mensaje
	END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_ActualizarClientes]    Script Date: 26/05/2019 5:32:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_ActualizarClientes]
@n_documento VARCHAR(50),
@nombre VARCHAR(50),
@apellido VARCHAR(50),
@fecha_nacimiento VARCHAR(10),
@direccion VARCHAR(50),
@telefono INT,
@id_documento INT,
@id_estado INT,
@tipo_permiso VARCHAR(2) = NULL,
@fecha_vencimiento DATE = NULL,
@estadoAseguradora bit
AS
BEGIN
	
	SET NOCOUNT ON;
	IF  EXISTS (SELECT * FROM ClientesTBL WHERE n_documento = @n_documento)
	BEGIN
		update ClientesTBL set  nombre = @nombre, apellido = @apellido, fecha_nacimiento = @fecha_nacimiento, direccion = @direccion, telefono = @telefono, id_documento = @id_documento,id_estado = @id_estado
		WHERE n_documento = @n_documento
		IF  EXISTS (SELECT * FROM AseguradoraTBL WHERE n_documento = @n_documento and tipo_permiso = @tipo_permiso )
		BEGIN
			update AseguradoraTBL set  tipo_permiso = @tipo_permiso,Permiso=@estadoAseguradora

			WHERE n_documento = @n_documento and tipo_permiso = @tipo_permiso
		END
		SELECT '1' AS strResultado, 'Se Actualizo el cliente correctamente' AS Mensaje
	END    
	ELSE
	BEGIN
		SELECT '0' AS strResultado,
		'No se realizo la Actualizacion' AS Mensaje
	END
END
	

GO
/****** Object:  StoredProcedure [dbo].[SP_ActualizarVehiculos]    Script Date: 26/05/2019 5:32:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ActualizarVehiculos]
@matricula VARCHAR(50),
@id_marca int,
@modelo int,
@placa VARCHAR(50),
@precioo_km VARCHAR(50),
@id_estado INT,
@id_sede INT,
@id_tipo VARCHAR(2)
AS
BEGIN
	
	SET NOCOUNT ON;
	IF EXISTS (SELECT * FROM VehiculosTBL WHERE matricula  = @matricula )
	BEGIN
		UPDATE VehiculosTBL SET id_marca = @id_marca,modelo = @modelo ,placa = @placa ,precio_km = @precioo_km,id_estado = @id_estado ,id_sede = @id_sede ,id_tipo = @id_tipo
		

		SELECT '1' AS strResultado, 'Se actualizo el Vehiculo' AS Mensaje
	END    
	ELSE
	BEGIN
		SELECT '0' AS strResultado, 'No se actualizo el registro' AS Mensaje
	END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Alquiler_Insert]    Script Date: 26/05/2019 5:32:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Alquiler_Insert] 
@KM_Inicial int,
@FechaInicial varchar(20),
@FechaFinal varchar(20),
@ReservaId bigint
AS
BEGIN
INSERT INTO AlquileresTBL (FechaInicial, FechaFinal, KM_Inicial, ReservaId) VALUES (@FechaInicial, @FechaFinal, @KM_Inicial, @ReservaId)
UPDATE VehiculosTBL SET id_estado = 3 WHERE matricula = (SELECT MatriculaVehiculo FROM ReservasTBL WHERE id = @ReservaId)
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Consultar_Alquiler]    Script Date: 26/05/2019 5:32:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Consultar_Alquiler]

AS
BEGIN	
SELECT A.id AS 'ID', A.FechaInicial AS 'FECHA INICIAL', A.FechaFinal AS 'FECHA FINAL', A.KM_Inicial AS 'KM INICIAL', R.CantidadDias AS 'CANTIDAD DIAS', C.n_documento AS 'DOCUMENTO',
C.nombre + ' ' + C.apellido AS 'CLIENTE'FROM AlquileresTBL A INNER JOIN ReservasTBL R ON A.ReservaId = R.id 
INNER JOIN ClientesTBL C ON R.DocumentoCliente = C.n_documento
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Consultar_Alquileres]    Script Date: 26/05/2019 5:32:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[SP_Consultar_Alquileres]
@id_encabezado VARCHAR(50) = NULL
AS
BEGIN	
select a.fecha_elaboracion, d.matricula,d.f_ini,d.k_ini,d.observaciones,k_fin,f_fin
from DetallesalquilerTBL d inner join VehiculosTBL v on d.matricula = v.matricula inner join AlquilerTBL a on a.id_encabezado = d.id_encabezado
where  d.id_encabezado = @id_encabezado	
			
	
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Consultar_Pago]    Script Date: 26/05/2019 5:32:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Consultar_Pago] 
AS
BEGIN
SELECT        SUBSTRING(dbo.PagosTBL.fecha, 1, 4) + '/' + SUBSTRING(dbo.PagosTBL.fecha, 5, 2)+ '/' + SUBSTRING(dbo.PagosTBL.fecha, 7, 2)  AS FECHA, dbo.PagosTBL.valor AS [$VALOR], dbo.PagosTBL.estado AS ESTADO, dbo.TipoPagosTBL.Tipo AS TIPO, dbo.AseguradoraTBL.Nombre AS 'ASEGURADORA', dbo.ClientesTBL.n_documento AS 'DOCUMENTO CLIENTE', dbo.ClientesTBL.nombre AS 'NOMBRE', dbo.ClientesTBL.apellido AS 'APELLIDO'
FROM          dbo.PagosTBL INNER JOIN
              dbo.TipoPagosTBL ON dbo.PagosTBL.id = dbo.TipoPagosTBL.id INNER JOIN dbo.AseguradoraTBL ON dbo.PagosTBL.aseguradora_id = dbo.AseguradoraTBL.id INNER JOIN dbo.ClientesTBL ON dbo.PagosTBL.DocumentoCliente = dbo.ClientesTBL.n_documento; 
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Consultar_PagoXCriterio]    Script Date: 26/05/2019 5:32:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_Consultar_PagoXCriterio]
@parametro_busqueda VARCHAR(50) = NULL,
@fecha_inicial DATE = NULL,
@fecha_final DATE = NULL
AS
BEGIN	
	SELECT SUBSTRING(P.fecha , 1, 4) + '/' + SUBSTRING(P.fecha , 5, 2)+ '/' + SUBSTRING(P.fecha , 7, 2) AS 'FECHA', P.valor AS '$VALOR', P.estado AS 'ESTADO', T.tipo AS 'TIPO', A.nombre AS 'ASEGURADORA', C.n_documento AS 'DOCUMENTO CLIENTE', C.nombre AS 'NOMBRE', C.apellido AS 'APELLIDO' 
	FROM PagosTBL P INNER JOIN TipoPagosTBL T ON P.id_tipo_pago = T.id  
	INNER JOIN AseguradoraTBL A ON P.aseguradora_id = A.id INNER JOIN ClientesTBL C ON P.DocumentoCliente = C.n_documento 
	WHERE P.estado = ISNULL(@parametro_busqueda, P.estado) 
	OR A.nombre = ISNULL(@parametro_busqueda, P.estado)
	OR C.n_documento = ISNULL(@parametro_busqueda, C.n_documento)
	OR T.Tipo = ISNULL(@parametro_busqueda, T.Tipo)
	OR P.fecha between @fecha_inicial and @fecha_final
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Consultar_ReservaXCodigo]    Script Date: 26/05/2019 5:32:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Consultar_ReservaXCodigo]
@Codigo bigint
AS
BEGIN
SELECT R.id AS 'ID RESERVA', C.nombre + ' ' + C.apellido AS 'CLIENTE', R.FechaInicial AS 'FECHA INICIAL',
R.FechaFinal AS 'FECHA FINAL', V.placa AS 'PLACA VEHICULO', M.marca AS 'MARCA VEHICULO', A.Nombre AS 'ASEGURADORA',
R.CantidadDias AS 'CANTIDAD DIAS'
FROM ReservasTBL R INNER JOIN ClientesTBL C ON R.DocumentoCliente = C.n_documento 
INNER JOIN VehiculosTBL V ON R.MatriculaVehiculo = V.matricula 
INNER JOIN MarcasTBL M ON V.id_marca = M.id_marca 
INNER JOIN AseguradoraTBL A ON R.AseguradoraId = A.id 
WHERE R.id = @Codigo
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Consultar_vehiculo]    Script Date: 26/05/2019 5:32:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_Consultar_vehiculo]
AS
BEGIN	
SELECT        dbo.VehiculosTBL.matricula AS MATRICULA, dbo.VehiculosTBL.modelo AS MODELO, dbo.VehiculosTBL.placa AS PLACA, dbo.VehiculosTBL.precio_km AS [PRECIO/KM], dbo.Tipo_vehiculosTBL.tipo AS TIPO, 
              dbo.MarcasTBL.marca AS MARCA, dbo.Color_vehiculosTBL.Color AS COLOR, dbo.EstadosTBL.estado AS ESTADO, dbo.Gama_vehiculosTBL.Gama AS GAMA
FROM          dbo.Color_vehiculosTBL INNER JOIN
              dbo.Gama_vehiculosTBL ON dbo.Color_vehiculosTBL.id = dbo.Gama_vehiculosTBL.id INNER JOIN
              dbo.VehiculosTBL ON dbo.Color_vehiculosTBL.id = dbo.VehiculosTBL.color_id AND dbo.Gama_vehiculosTBL.id = dbo.VehiculosTBL.gama_id INNER JOIN
              dbo.EstadosTBL ON dbo.VehiculosTBL.id_estado = dbo.EstadosTBL.id_estado INNER JOIN
              dbo.MarcasTBL ON dbo.VehiculosTBL.id_marca = dbo.MarcasTBL.id_marca INNER JOIN
              dbo.Tipo_vehiculosTBL ON dbo.VehiculosTBL.id_tipo = dbo.Tipo_vehiculosTBL.cod
ORDER BY ESTADO, MARCA, MODELO
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Consultar_Vehiculos_Disponibles]    Script Date: 26/05/2019 5:32:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Consultar_Vehiculos_Disponibles]
@parametro_busqueda VARCHAR(50) = NULL
AS
BEGIN
	SELECT  V.matricula AS 'MATRICULA',V.modelo AS 'MODELO',V.placa AS 'PLACA',V.precio_km AS 'PRECIO/KM', T.tipo AS 'TIPO', M.marca AS 'MARCA',  C.Color AS 'COLOR',  E.estado AS 'ESTADO', G.Gama AS 'GAMA'
	FROM VehiculosTBL V INNER JOIN MarcasTBL M ON V.id_marca = M.id_marca INNER JOIN EstadosTBL E ON V.id_estado = E.id_estado INNER JOIN Tipo_vehiculosTBL T ON V.id_tipo = T.cod 
	INNER JOIN Color_vehiculosTBL C ON V.color_id = C.id INNER JOIN Gama_vehiculosTBL G ON V.gama_id = G.id 
	WHERE V.id_estado = 6 
	AND G.Gama = ISNULL(@parametro_busqueda, G.Gama)

END
GO
/****** Object:  StoredProcedure [dbo].[SP_Consultar_VehiculoXCriterio]    Script Date: 26/05/2019 5:32:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_Consultar_VehiculoXCriterio]
@parametro_busqueda VARCHAR(50) = NULL
AS
BEGIN	
	SELECT  V.matricula AS 'MATRICULA',V.modelo AS 'MODELO',V.placa AS 'PLACA',V.precio_km AS 'PRECIO/KM', T.tipo AS 'TIPO', M.marca AS 'MARCA',  C.Color AS 'COLOR',  E.estado AS 'ESTADO', G.Gama AS 'GAMA'
	FROM VehiculosTBL V INNER JOIN MarcasTBL M ON V.id_marca = M.id_marca INNER JOIN EstadosTBL E ON V.id_estado = E.id_estado INNER JOIN Tipo_vehiculosTBL T ON V.id_tipo = T.cod 
	INNER JOIN Color_vehiculosTBL C ON V.color_id = C.id INNER JOIN Gama_vehiculosTBL G ON V.gama_id = G.id 
	WHERE  M.marca = ISNULL(@parametro_busqueda, M.marca)
	OR E.estado = ISNULL(@parametro_busqueda, E.estado)	
	OR T.tipo = ISNULL(@parametro_busqueda, T.tipo)
	OR C.Color = ISNULL(@parametro_busqueda, C.Color)
	OR G.Gama = ISNULL(@parametro_busqueda, G.Gama)
	OR V.modelo = ISNULL(@parametro_busqueda, V.modelo)
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Consultar_vehiculoXPlaca]    Script Date: 26/05/2019 5:32:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_Consultar_vehiculoXPlaca]
@matricula VARCHAR(50) = NULL
AS
BEGIN	
	SELECT  matricula,id_marca,modelo,placa,precio_km,id_estado,id_sede,id_tipo
	FROM VehiculosTBL
	WHERE matricula LIKE ISNULL(@matricula, matricula) 
END
GO
/****** Object:  StoredProcedure [dbo].[SP_ConsultarClientes]    Script Date: 26/05/2019 5:32:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ConsultarClientes]
@parametro_busqueda VARCHAR(50) = NULL
AS
BEGIN	
	SELECT n_documento, nombre, apellido, fecha_nacimiento, direccion, telefono
	FROM ClientesTBL
	WHERE n_documento LIKE ISNULL(@parametro_busqueda, n_documento) 
	or nombre LIKE ISNULL(@parametro_busqueda, nombre)
	or apellido LIKE ISNULL(@parametro_busqueda, apellido)
END
GO
/****** Object:  StoredProcedure [dbo].[SP_ConsultarClientesporDocumento]    Script Date: 26/05/2019 5:32:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--EXEC SP_ConsultarClientesporDocumento '80813032'
CREATE PROCEDURE [dbo].[SP_ConsultarClientesporDocumento]
@n_documento VARCHAR(50) = NULL
AS
BEGIN	
	SELECT c.n_documento, nombre,apellido, fecha_nacimiento,direccion,telefono,id_documento,id_estado,p.tipo_permiso
	FROM ClientesTBL c inner join AseguradoraTBL p on c.n_documento = p.n_documento 
	where 	c.n_documento = @n_documento
	
END
GO
/****** Object:  StoredProcedure [dbo].[SP_ConsultarEstados]    Script Date: 26/05/2019 5:32:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_ConsultarEstados]

AS
BEGIN	
	SELECT id_estado,estado
	FROM EstadosTBL
			
	
END
GO
/****** Object:  StoredProcedure [dbo].[SP_ConsultarMarca]    Script Date: 26/05/2019 5:32:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_ConsultarMarca]
AS
BEGIN	
	SELECT  id_marca,marca
	FROM MarcasTBL
	END
GO
/****** Object:  StoredProcedure [dbo].[SP_ConsultarMarcaxLetra]    Script Date: 26/05/2019 5:32:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_ConsultarMarcaxLetra]
@parametro_busqueda VARCHAR(50) = NULL
AS
BEGIN	
	SELECT  id_marca ID,marca marca
	FROM MarcasTBL 
	WHERE marca LIKE ISNULL(@parametro_busqueda, marca)

			
	
END
GO
/****** Object:  StoredProcedure [dbo].[SP_ConsultarPermiso]    Script Date: 26/05/2019 5:32:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_ConsultarPermiso]

AS
BEGIN	
	SELECT tipo_permiso, tipo_permiso + ' ' + vehiculos as licencia
	FROM LicenciasTBL	
END
GO
/****** Object:  StoredProcedure [dbo].[SP_ConsultarTipoDocumentos]    Script Date: 26/05/2019 5:32:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[SP_ConsultarTipoDocumentos]

AS
BEGIN	
	SELECT id_documento,tipo_documento
	FROM Tipo_documentosTBL
			
	
END
GO
/****** Object:  StoredProcedure [dbo].[SP_ConsultarTipoVehiculos]    Script Date: 26/05/2019 5:32:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_ConsultarTipoVehiculos]
AS
BEGIN

	SELECT cod,tipo
	FROM Tipo_vehiculosTBL
	

END
GO
/****** Object:  StoredProcedure [dbo].[SP_Devolucion_Vehiculo]    Script Date: 26/05/2019 5:32:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_Devolucion_Vehiculo]
@id_encabezado VARCHAR(50),
@fecha_fin VARCHAR(50),
@k_fin VARCHAR(50),
@matricula VARCHAR(50),
@observaciones VARCHAR(50)
AS
BEGIN
	SET NOCOUNT ON;   
    IF EXISTS (SELECT id_encabezado FROM DetallesalquilerTBL WHERE id_encabezado = @id_encabezado  )
    BEGIN
                     
						UPDATE DetallesalquilerTBL SET f_fin = @fecha_fin ,k_fin = @k_fin,observaciones = @observaciones
						WHERE id_encabezado = @id_encabezado
						
 					
						UPDATE VehiculosTBL SET id_estado = 6
						WHERE matricula = @matricula
						
	
		
	END
	ELSE
		SELECT '1' AS strResultado, 'Este numero de alquiler no existe' AS Mensaje
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Devolver_Vehiculo]    Script Date: 26/05/2019 5:32:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Devolver_Vehiculo]
@ReservaId AS BIGINT,
@KMDespues AS INT,
@Observaciones AS VARCHAR(300),
@Multa AS BIGINT
AS
BEGIN
DECLARE @DocumentoCliente AS VARCHAR(50), @Placa AS VARCHAR(50), @FechaComienzo AS VARCHAR(10), @KMAntes AS INT, @VehiculoMatricula AS VARCHAR(50)
SET @VehiculoMatricula = (SELECT MatriculaVehiculo FROM ReservasTBL WHERE id = @ReservaId)
SET @Placa = (SELECT placa FROM VehiculosTBL WHERE matricula = @VehiculoMatricula)
SET @DocumentoCliente = (SELECT DocumentoCliente FROM ReservasTBL WHERE id = @ReservaId)
SET @FechaComienzo = (SELECT FechaInicial FROM ReservasTBL  WHERE id = @ReservaId)
SET @KMAntes = (SELECT KM_Inicial FROM AlquileresTBL WHERE ReservaId = @ReservaId)
UPDATE VehiculosTBL SET id_estado = 6 WHERE matricula = @VehiculoMatricula;
INSERT INTO DevolucionesTBL (DocumentoCliente, Placa, FechaComienzo, KMAntes, KMDespues, Observaciones, FechaEntrega, VehiculoMatricula, Multa)
VALUES(@DocumentoCliente, @Placa, @FechaComienzo, @KMAntes, @KMDespues, @Observaciones, CONVERT(VARCHAR, GETDATE(), 111), @VehiculoMatricula, @Multa);
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Insertar_Alquiler]    Script Date: 26/05/2019 5:32:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_Insertar_Alquiler]
@n_documento VARCHAR(50),
@fecha_elaboracion varchar (50),
@matricula VARCHAR(50),
@fecha_ini VARCHAR(50),
@k_ini VARCHAR(50),
@observaciones VARCHAR(50),
@id_descuento INT = NULL
AS
BEGIN
	SET NOCOUNT ON;   
    IF EXISTS (SELECT id_estado FROM VehiculosTBL WHERE id_estado in ( '6') and matricula = @matricula  )
    BEGIN
            INSERT INTO AlquilerTBL (n_documento,fecha_elaboracion)
            SELECT @n_documento,@fecha_elaboracion 

            IF @@ROWCOUNT = 1
			BEGIN 
					DECLARE @id_encabezado INT
					SET @id_encabezado = @@IDENTITY
                     
						INSERT INTO DetallesalquilerTBL (matricula,f_ini,k_ini,observaciones,id_descuento,id_encabezado)
						SELECT @matricula,@fecha_ini,@k_ini,@observaciones,@id_descuento,@id_encabezado
 						
						UPDATE VehiculosTBL SET id_estado = 5
						WHERE matricula = @matricula	
							
			END
			SELECT '1' AS strResultado,'Se realizo el alquiler correctamente' AS Mensaje
			
	END
	ELSE
	BEGIN
		SELECT '0' AS strResultado,'El registro ya Existe' AS Mensaje

	END
	

END
	
GO
/****** Object:  StoredProcedure [dbo].[SP_InsertarClientes]    Script Date: 26/05/2019 5:32:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_InsertarClientes]
@n_documento VARCHAR(50),
@nombre VARCHAR(50),
@apellido VARCHAR(50),
@fecha_nacimiento VARCHAR(10),
@direccion VARCHAR(50),
@telefono INT,
@id_documento INT,
@id_estado INT,
--Campos Opcionales:
@tipo_permiso VARCHAR(2) = NULL,
@permisoAseguradora bit,
@nomaseguradora varchar(30)

AS
BEGIN
	
	SET NOCOUNT ON;
	IF NOT EXISTS (SELECT * FROM ClientesTBL WHERE n_documento = @n_documento)
	BEGIN
		INSERT INTO ClientesTBL(n_documento, nombre, apellido, fecha_nacimiento, direccion, telefono, id_documento,id_estado)
		SELECT @n_documento, @nombre, @apellido, @fecha_nacimiento, @direccion, @telefono, @id_documento, @id_estado

		IF @tipo_permiso IS NOT NULL
		BEGIN
			INSERT INTO AseguradoraTBL(n_documento, tipo_permiso, Permiso,NomAseguradora)
			SELECT @n_documento, @tipo_permiso, @PermisoAseguradora,@nomaseguradora
		END
		SELECT '1' AS strResultado, 'Se agregó el cliente' AS Mensaje
	END    
	ELSE
	BEGIN
		IF @tipo_permiso IS NOT NULL
		BEGIN
			IF NOT EXISTS (SELECT * FROM AseguradoraTBL WHERE n_documento = @n_documento AND tipo_permiso = @tipo_permiso)
			BEGIN
				INSERT INTO AseguradoraTBL(n_documento, tipo_permiso, Permiso,NomAseguradora)
				SELECT @n_documento, @tipo_permiso, @PermisoAseguradora,@nomaseguradora
				SELECT '2' AS strResultado --Existe el cliente, se agregó el permiso
			END
			ELSE
			BEGIN
				SELECT '0' AS strResultado,
				'El Cliente ya Existe' AS Mensaje
			END
		END
	END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_InsertarDetallesAlquiler]    Script Date: 26/05/2019 5:32:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_InsertarDetallesAlquiler]
@id_detallesalquiler int,
@matricula VARCHAR(50),
@f_ini date,
@f_fin date,
@k_ini float,
@k_fin float,
@observaciones varchar(50),
@id_descuento int,
@id_encabezado int

AS
BEGIN
	
	SET NOCOUNT ON;
	IF NOT EXISTS (SELECT * FROM DetallesalquilerTBL WHERE matricula = @matricula and @id_encabezado = id_encabezado )
	BEGIN
		INSERT INTO DetallesalquilerTBL (id_detallesalquiler,matricula,f_ini,f_fin,k_ini,k_fin,observaciones,id_descuento,id_encabezado)
		SELECT @id_detallesalquiler,@matricula,@f_ini,@f_fin,@k_ini,@k_fin,@observaciones,@id_descuento,@id_encabezado

		SELECT '1' AS strResultado
	END    
	ELSE
	BEGIN
		SELECT '0' AS strResultado
	END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_InsertarEstados]    Script Date: 26/05/2019 5:32:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_InsertarEstados]
@Estado CHAR(50)

AS
BEGIN
	
	SET NOCOUNT ON;
	IF NOT EXISTS (SELECT * FROM EstadosTBL WHERE estado like @Estado)
	BEGIN
		INSERT INTO EstadosTBL (estado)
		SELECT @Estado

		SELECT '1' AS strResultado
	END    
	ELSE
	BEGIN
		SELECT '0' AS strResultado
	END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_InsertarLicencias]    Script Date: 26/05/2019 5:32:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_InsertarLicencias]
@tipo_permiso VARCHAR(2),
@vehiculos VARCHAR(50),
@id_estado int

AS
BEGIN
	
	SET NOCOUNT ON;
	IF NOT EXISTS (SELECT * FROM LicenciasTBL WHERE tipo_permiso  like @tipo_permiso )
	BEGIN
		INSERT INTO LicenciasTBL (tipo_permiso,vehiculos,id_estado)
		SELECT @tipo_permiso,@vehiculos,@id_estado

		SELECT '1' AS strResultado
	END    
	ELSE
	BEGIN
		SELECT '0' AS strResultado
	END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_InsertarMarcas]    Script Date: 26/05/2019 5:32:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_InsertarMarcas]
@marca VARCHAR(50)

AS
BEGIN
	
	SET NOCOUNT ON;
	IF NOT EXISTS (SELECT * FROM MarcasTBL WHERE marca  like @marca )
	BEGIN
		INSERT INTO MarcasTBL (Marca)
		SELECT @marca

		SELECT '1' AS strResultado, 'Se agregó la marca' AS Mensaje
	END    
	ELSE
	BEGIN
		SELECT '0' AS strResultado, 'La marca ya esta registrada' AS Mensaje
	END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_InsertarTipoDocumentos]    Script Date: 26/05/2019 5:32:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_InsertarTipoDocumentos]
@tipo_documento CHAR(50)

AS
BEGIN
	
	SET NOCOUNT ON;
	IF NOT EXISTS (SELECT * FROM Tipo_documentosTBL WHERE tipo_documento = @tipo_documento)
	BEGIN
		INSERT INTO Tipo_documentosTBL (tipo_documento)
		SELECT @tipo_documento

		SELECT '1' AS strResultado
	END    
	ELSE
	BEGIN
		SELECT '0' AS strResultado
	END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_InsertarTipoVehiculos]    Script Date: 26/05/2019 5:32:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_InsertarTipoVehiculos]
@cod varchar(2),
@tipo varchar (50)
AS
BEGIN



	SET NOCOUNT ON;
	IF NOT EXISTS (SELECT * FROM Tipo_vehiculosTBL WHERE cod = @cod)
	BEGIN
		INSERT INTO Tipo_vehiculosTBL
		SELECT @cod,@tipo

		SELECT '1' AS strResultado
	END    
	ELSE
	BEGIN
		SELECT '0' AS strResultado
	END

END
GO
/****** Object:  StoredProcedure [dbo].[SP_InsertarUsuarios]    Script Date: 26/05/2019 5:32:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_InsertarUsuarios]
@nombre_usuario VARCHAR(50),
@contrasena VARCHAR(50),
@nombre VARCHAR(50),
@apellido VARCHAR(50)
AS
BEGIN
	
	SET NOCOUNT ON;
	IF NOT EXISTS (SELECT * FROM UsuariosTBL WHERE nombre_usuario = @nombre_usuario )
	BEGIN
		INSERT INTO UsuariosTBL (nombre_usuario,contrasena,nombre,apellido)
		SELECT @nombre_usuario,@contrasena, @nombre,@apellido

		SELECT '1' AS strResultado,'Se agregó el usuario' AS Mensaje
	END    
	ELSE
	BEGIN
		SELECT '0' AS strResultado,'El usuario ya existe' AS Mensaje
	END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_InsertarVehiculos]    Script Date: 26/05/2019 5:32:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_InsertarVehiculos]
@matricula VARCHAR(50),
@id_marca int,
@modelo int,
@placa VARCHAR(50),
@precioo_km VARCHAR(50),
@id_estado INT,
@id_sede INT,
@id_tipo VARCHAR(2)
AS
BEGIN
	
	SET NOCOUNT ON;
	IF NOT EXISTS (SELECT * FROM VehiculosTBL WHERE matricula  = @matricula )
	BEGIN
		INSERT INTO VehiculosTBL(matricula,id_marca,modelo,placa,precio_km,id_estado,id_sede,id_tipo)
		SELECT @matricula,@id_marca,@modelo,@placa,@precioo_km,@id_estado,@id_sede,@id_tipo

		SELECT '1' AS strResultado, 'Se agregó el Vehiculo' AS Mensaje
	END    
	ELSE
	BEGIN
		SELECT '0' AS strResultado, 'El Vehiculo ya exiiste' AS Mensaje
	END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Reserva_Insert]    Script Date: 26/05/2019 5:32:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Reserva_Insert]
@DocumentoCliente AS VARCHAR(50),
@FechaInicial AS VARCHAR(20),
@FechaFinal AS VARCHAR(20), 
@MatriculaVehiculo AS VARCHAR(50)
AS 
BEGIN
DECLARE @CantidadDias INT
SET @CantidadDias =	CONVERT(NUMERIC(18),(CAST(@FechaFinal AS dateTIME)-CAST(@FechaInicial AS dateTIME) ))
INSERT INTO ReservasTBL (DocumentoCliente, FechaInicial, FechaFinal, MatriculaVehiculo, CantidadDias, AseguradoraId)
VALUES(@DocumentoCliente, @FechaInicial, @FechaFinal, @MatriculaVehiculo, @CantidadDias, 1)
END

GO
/****** Object:  StoredProcedure [dbo].[SP_ValidarLogueo]    Script Date: 26/05/2019 5:32:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_ValidarLogueo]
@nombre_usuario varchar(10),
@contrasena varchar(5)
AS
BEGIN	
	SET NOCOUNT ON;
	IF EXISTS(SELECT * FROM UsuariosTBL WHERE nombre_usuario = @nombre_usuario AND contrasena = @contrasena)
	BEGIN
		SELECT 1 AS strMensaje, 'Logueo exitoso' AS Mensaje
	END
	ELSE
	BEGIN
		SELECT 0 AS strMensaje, 'Error en el Logueo' AS Mensaje
	END
END
GO
USE [master]
GO
ALTER DATABASE [db_alquiler] SET  READ_WRITE 
GO
