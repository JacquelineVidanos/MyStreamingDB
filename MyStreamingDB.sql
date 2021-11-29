 USE [master]
GO
/****** Object:  Database [MyStreaming]    Script Date: 29/11/2021 01:28:09 p. m. ******/
CREATE DATABASE [MyStreaming]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MyStreaming', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\MyStreaming.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MyStreaming_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\MyStreaming_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 COLLATE SQL_Latin1_General_CP1_CI_AS
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [MyStreaming] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MyStreaming].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MyStreaming] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MyStreaming] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MyStreaming] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MyStreaming] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MyStreaming] SET ARITHABORT OFF 
GO
ALTER DATABASE [MyStreaming] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MyStreaming] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MyStreaming] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MyStreaming] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MyStreaming] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MyStreaming] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MyStreaming] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MyStreaming] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MyStreaming] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MyStreaming] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MyStreaming] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MyStreaming] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MyStreaming] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MyStreaming] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MyStreaming] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MyStreaming] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MyStreaming] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MyStreaming] SET RECOVERY FULL 
GO
ALTER DATABASE [MyStreaming] SET  MULTI_USER 
GO
ALTER DATABASE [MyStreaming] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MyStreaming] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MyStreaming] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MyStreaming] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MyStreaming] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MyStreaming] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'MyStreaming', N'ON'
GO
ALTER DATABASE [MyStreaming] SET QUERY_STORE = OFF
GO
USE [MyStreaming]
GO
/****** Object:  Table [dbo].[alertas]    Script Date: 29/11/2021 01:28:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[alertas](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[meta_suscriptores] [int] NOT NULL,
	[estatus] [bit] NOT NULL,
	[num_suscriptores] [int] NOT NULL,
 CONSTRAINT [PK_alertas] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[capitulo]    Script Date: 29/11/2021 01:28:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[capitulo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[url_video] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[des_video] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[titulo_video] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[id_temporada] [int] NOT NULL,
	[estatus] [int] NOT NULL,
 CONSTRAINT [PK_capitulo] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cont_exclusivo]    Script Date: 29/11/2021 01:28:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cont_exclusivo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_capitulo] [int] NOT NULL,
 CONSTRAINT [PK_cont_exclusivo] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[datos_bancarios]    Script Date: 29/11/2021 01:28:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[datos_bancarios](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nom_tar] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[num_tar] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[fech_vencimiento] [date] NOT NULL,
	[cod_seguridad] [int] NOT NULL,
	[id_usuario] [int] NOT NULL,
	[activo] [bit] NOT NULL,
 CONSTRAINT [PK_datos_bancarios] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[favoritos]    Script Date: 29/11/2021 01:28:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[favoritos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_usuario] [int] NOT NULL,
	[id_capitulo] [int] NOT NULL,
 CONSTRAINT [PK_favoritos] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[images]    Script Date: 29/11/2021 01:28:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[images](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[url_ima] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[id_capitulo] [int] NULL,
	[id_tempo] [int] NULL,
 CONSTRAINT [PK_images] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[suscripcion]    Script Date: 29/11/2021 01:28:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[suscripcion](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_usuario] [int] NOT NULL,
	[codigo_suscripcion] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[monto] [float] NOT NULL,
	[pagado] [bit] NOT NULL,
	[fecha_suscripcion] [date] NOT NULL,
	[fecha_pago] [date] NOT NULL,
 CONSTRAINT [PK_suscripcion] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[temporadas]    Script Date: 29/11/2021 01:28:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[temporadas](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre_temporada] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_temporadas] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuario]    Script Date: 29/11/2021 01:28:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuario](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[correo] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[contrasenia] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[tipo_usuario] [int] NOT NULL,
	[estatus] [bit] NOT NULL,
 CONSTRAINT [PK_usuario] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ver_tarde]    Script Date: 29/11/2021 01:28:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ver_tarde](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_usuario] [int] NOT NULL,
	[id_capitulo] [int] NOT NULL,
 CONSTRAINT [PK_ver_tarde] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[alertas] ON 

INSERT [dbo].[alertas] ([id], [meta_suscriptores], [estatus], [num_suscriptores]) VALUES (1, 2, 1, 4)
INSERT [dbo].[alertas] ([id], [meta_suscriptores], [estatus], [num_suscriptores]) VALUES (2, 2, 1, 1)
SET IDENTITY_INSERT [dbo].[alertas] OFF
GO
SET IDENTITY_INSERT [dbo].[capitulo] ON 

INSERT [dbo].[capitulo] ([id], [url_video], [des_video], [titulo_video], [id_temporada], [estatus]) VALUES (1, N'https://youtu.be/CgIySHjpi98', N'Videos de TikTok que son una locura', N'LOCURA ABSOLUTA EN TIKTOK', 1, 0)
INSERT [dbo].[capitulo] ([id], [url_video], [des_video], [titulo_video], [id_temporada], [estatus]) VALUES (2, N'https://youtu.be/Uo-ZphDU06Y', N'Programa Next, los videos más lamentable', N'NEXT, EL PROGAMA MÁS LAMENTABLE', 2, 1)
INSERT [dbo].[capitulo] ([id], [url_video], [des_video], [titulo_video], [id_temporada], [estatus]) VALUES (3, N'https://youtu.be/c7DpRIk4lKY', N'Reacciono a mis memes', N'REACCIONANDO A MIS MEMES #5', 1, 1)
INSERT [dbo].[capitulo] ([id], [url_video], [des_video], [titulo_video], [id_temporada], [estatus]) VALUES (4, N'https://youtu.be/Q-liVFbLHJU', N'Cómo ligar', N'CÓMO LIGAR (En la Prehistoria)', 2, 1)
SET IDENTITY_INSERT [dbo].[capitulo] OFF
GO
SET IDENTITY_INSERT [dbo].[suscripcion] ON 

INSERT [dbo].[suscripcion] ([id], [id_usuario], [codigo_suscripcion], [monto], [pagado], [fecha_suscripcion], [fecha_pago]) VALUES (1, 1, N'22', 222, 0, CAST(N'2021-11-27' AS Date), CAST(N'2021-12-27' AS Date))
INSERT [dbo].[suscripcion] ([id], [id_usuario], [codigo_suscripcion], [monto], [pagado], [fecha_suscripcion], [fecha_pago]) VALUES (2, 12, N'TuCodigo12', 115.5, 0, CAST(N'2021-11-29' AS Date), CAST(N'2021-12-29' AS Date))
INSERT [dbo].[suscripcion] ([id], [id_usuario], [codigo_suscripcion], [monto], [pagado], [fecha_suscripcion], [fecha_pago]) VALUES (3, 13, N'TuCodigo13', 115.5, 0, CAST(N'2021-11-29' AS Date), CAST(N'2021-12-29' AS Date))
INSERT [dbo].[suscripcion] ([id], [id_usuario], [codigo_suscripcion], [monto], [pagado], [fecha_suscripcion], [fecha_pago]) VALUES (4, 14, N'TuCodigo14', 115.5, 0, CAST(N'2021-11-29' AS Date), CAST(N'2021-12-29' AS Date))
SET IDENTITY_INSERT [dbo].[suscripcion] OFF
GO
SET IDENTITY_INSERT [dbo].[temporadas] ON 

INSERT [dbo].[temporadas] ([id], [nombre_temporada]) VALUES (1, N'Temporada 1')
INSERT [dbo].[temporadas] ([id], [nombre_temporada]) VALUES (2, N'Temporada 2')
INSERT [dbo].[temporadas] ([id], [nombre_temporada]) VALUES (3, N'Temporada 3')
INSERT [dbo].[temporadas] ([id], [nombre_temporada]) VALUES (4, N'Temporada 4')
INSERT [dbo].[temporadas] ([id], [nombre_temporada]) VALUES (5, N'Temporada 5')
SET IDENTITY_INSERT [dbo].[temporadas] OFF
GO
SET IDENTITY_INSERT [dbo].[usuario] ON 

INSERT [dbo].[usuario] ([id], [correo], [contrasenia], [tipo_usuario], [estatus]) VALUES (1, N'ari.1999.aei@gmail.com', N'123', 2, 1)
INSERT [dbo].[usuario] ([id], [correo], [contrasenia], [tipo_usuario], [estatus]) VALUES (12, N'ari.2000.aei@gmail.com', N'123', 2, 1)
INSERT [dbo].[usuario] ([id], [correo], [contrasenia], [tipo_usuario], [estatus]) VALUES (13, N'ari@gmail.com', N'123', 2, 1)
INSERT [dbo].[usuario] ([id], [correo], [contrasenia], [tipo_usuario], [estatus]) VALUES (14, N'correo@gmail.com', N'123', 2, 1)
SET IDENTITY_INSERT [dbo].[usuario] OFF
GO
ALTER TABLE [dbo].[capitulo]  WITH CHECK ADD  CONSTRAINT [fk3] FOREIGN KEY([id_temporada])
REFERENCES [dbo].[temporadas] ([id])
GO
ALTER TABLE [dbo].[capitulo] CHECK CONSTRAINT [fk3]
GO
ALTER TABLE [dbo].[cont_exclusivo]  WITH CHECK ADD  CONSTRAINT [fk6] FOREIGN KEY([id_capitulo])
REFERENCES [dbo].[capitulo] ([id])
GO
ALTER TABLE [dbo].[cont_exclusivo] CHECK CONSTRAINT [fk6]
GO
ALTER TABLE [dbo].[datos_bancarios]  WITH CHECK ADD  CONSTRAINT [fk1] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[usuario] ([id])
GO
ALTER TABLE [dbo].[datos_bancarios] CHECK CONSTRAINT [fk1]
GO
ALTER TABLE [dbo].[favoritos]  WITH CHECK ADD  CONSTRAINT [fk7] FOREIGN KEY([id_capitulo])
REFERENCES [dbo].[capitulo] ([id])
GO
ALTER TABLE [dbo].[favoritos] CHECK CONSTRAINT [fk7]
GO
ALTER TABLE [dbo].[favoritos]  WITH CHECK ADD  CONSTRAINT [fk8] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[usuario] ([id])
GO
ALTER TABLE [dbo].[favoritos] CHECK CONSTRAINT [fk8]
GO
ALTER TABLE [dbo].[images]  WITH CHECK ADD  CONSTRAINT [fk4] FOREIGN KEY([id_capitulo])
REFERENCES [dbo].[capitulo] ([id])
GO
ALTER TABLE [dbo].[images] CHECK CONSTRAINT [fk4]
GO
ALTER TABLE [dbo].[images]  WITH CHECK ADD  CONSTRAINT [fk5] FOREIGN KEY([id_tempo])
REFERENCES [dbo].[temporadas] ([id])
GO
ALTER TABLE [dbo].[images] CHECK CONSTRAINT [fk5]
GO
ALTER TABLE [dbo].[suscripcion]  WITH CHECK ADD  CONSTRAINT [fk2] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[usuario] ([id])
GO
ALTER TABLE [dbo].[suscripcion] CHECK CONSTRAINT [fk2]
GO
ALTER TABLE [dbo].[ver_tarde]  WITH CHECK ADD  CONSTRAINT [fk10] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[usuario] ([id])
GO
ALTER TABLE [dbo].[ver_tarde] CHECK CONSTRAINT [fk10]
GO
ALTER TABLE [dbo].[ver_tarde]  WITH CHECK ADD  CONSTRAINT [fk9] FOREIGN KEY([id_capitulo])
REFERENCES [dbo].[capitulo] ([id])
GO
ALTER TABLE [dbo].[ver_tarde] CHECK CONSTRAINT [fk9]
GO
/****** Object:  Trigger [dbo].[setNumSuscriptores]    Script Date: 29/11/2021 01:28:10 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[setNumSuscriptores]
ON [dbo].[suscripcion] --Tabla a asignar el Trigger
FOR INSERT --Evento que se desea lanzar Trigger
AS
declare @numS int 
set @numS = (SELECT COUNT(DISTINCT id_usuario) from suscripcion)
UPDATE alertas 
  set [num_suscriptores] = (@numS);
GO
ALTER TABLE [dbo].[suscripcion] ENABLE TRIGGER [setNumSuscriptores]
GO
/****** Object:  Trigger [dbo].[setCodigoSus]    Script Date: 29/11/2021 01:28:10 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[setCodigoSus]
ON [dbo].[usuario] --Tabla a asignar el Trigger
FOR INSERT --Evento que se desea lanzar Trigger
AS
declare @f_act DATETIME = SYSDATETIME()
declare @f_new DATETIME
declare @mto decimal(6,2) = 115.50
declare @idU int
set @idU = (SELECT id FROM Inserted)
declare @codsus varchar(255)
set @codsus = (select CONCAT('TuCodigo',@idU))
set @f_new = (select DATEADD(month, 1, @f_act))
insert into dbo.suscripcion(id_usuario,codigo_suscripcion,monto,pagado,fecha_suscripcion,fecha_pago) 
values(@idU,@codsus,@mto,1,@f_act,@f_new)
GO
ALTER TABLE [dbo].[usuario] ENABLE TRIGGER [setCodigoSus]
GO
USE [master]
GO
ALTER DATABASE [MyStreaming] SET  READ_WRITE 
GO
