USE [master]
GO
/****** Object:  Database [MyStreaming]    Script Date: 29/11/2021 01:28:09 p. m. ******/
CREATE DATABASE [MyStreaming]
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

INSERT [dbo].[capitulo] ([id], [url_video], [des_video], [titulo_video], [id_temporada], [estatus]) VALUES (1, N'https://static.videezy.com/system/resources/previews/000/021/525/original/green-screen-effect---old-movie-egining.mp4', N'Videos de TikTok que son una locura', N'LOCURA ABSOLUTA EN TIKTOK', 1, 0)
INSERT [dbo].[capitulo] ([id], [url_video], [des_video], [titulo_video], [id_temporada], [estatus]) VALUES (2, N'https://static.videezy.com/system/resources/previews/000/045/545/original/Countdown_purple.mp4', N'Programa Next, los videos más lamentable', N'NEXT, EL PROGAMA MÁS LAMENTABLE', 2, 1)
INSERT [dbo].[capitulo] ([id], [url_video], [des_video], [titulo_video], [id_temporada], [estatus]) VALUES (3, N'https://static.videezy.com/system/resources/previews/000/042/599/original/Road_Trip_Countdown.mp4', N'Reacciono a mis memes', N'REACCIONANDO A MIS MEMES #5', 1, 1)
INSERT [dbo].[capitulo] ([id], [url_video], [des_video], [titulo_video], [id_temporada], [estatus]) VALUES (4, N'https://static.videezy.com/system/resources/previews/000/045/546/original/Countdown_red.mp4', N'Cómo ligar', N'CÓMO LIGAR (En la Prehistoria)', 2, 1)
INSERT [dbo].[capitulo] ([id], [url_video], [des_video], [titulo_video], [id_temporada], [estatus]) VALUES (4, N'https://static.videezy.com/system/resources/previews/000/045/546/original/Countdown_red.mp4', N'Este es un video de prueba', N'Video de prueba', 4, 1)
SET IDENTITY_INSERT [dbo].[capitulo] OFF
GO
SET IDENTITY_INSERT [dbo].[suscripcion] ON 

INSERT [dbo].[suscripcion] ([id], [id_usuario], [codigo_suscripcion], [monto], [pagado], [fecha_suscripcion], [fecha_pago]) VALUES (1, 1, N'22', 222, 1, CAST(N'2021-11-27' AS Date), CAST(N'2021-12-27' AS Date))
INSERT [dbo].[suscripcion] ([id], [id_usuario], [codigo_suscripcion], [monto], [pagado], [fecha_suscripcion], [fecha_pago]) VALUES (2, 12, N'TuCodigo12', 115.5, 1, CAST(N'2021-11-29' AS Date), CAST(N'2021-12-29' AS Date))
INSERT [dbo].[suscripcion] ([id], [id_usuario], [codigo_suscripcion], [monto], [pagado], [fecha_suscripcion], [fecha_pago]) VALUES (3, 13, N'TuCodigo13', 115.5, 1, CAST(N'2021-11-29' AS Date), CAST(N'2021-12-29' AS Date))
INSERT [dbo].[suscripcion] ([id], [id_usuario], [codigo_suscripcion], [monto], [pagado], [fecha_suscripcion], [fecha_pago]) VALUES (4, 14, N'TuCodigo14', 115.5, 1, CAST(N'2021-11-29' AS Date), CAST(N'2021-12-29' AS Date))
SET IDENTITY_INSERT [dbo].[suscripcion] OFF
GO
SET IDENTITY_INSERT [dbo].[temporadas] ON 

INSERT [dbo].[temporadas] ([id], [nombre_temporada]) VALUES (1, N'Temporada 1')
INSERT [dbo].[temporadas] ([id], [nombre_temporada]) VALUES (2, N'Temporada 2')
INSERT [dbo].[temporadas] ([id], [nombre_temporada]) VALUES (3, N'Temporada 3')
INSERT [dbo].[temporadas] ([id], [nombre_temporada]) VALUES (4, N'Temporada 4')
INSERT [dbo].[temporadas] ([id], [nombre_temporada]) VALUES (5, N'Temporada 5')
INSERT [dbo].[temporadas] ([id], [nombre_temporada]) VALUES (6, N'Temporada 6')
SET IDENTITY_INSERT [dbo].[temporadas] OFF
GO
SET IDENTITY_INSERT [dbo].[usuario] ON 

INSERT [dbo].[usuario] ([id], [correo], [contrasenia], [tipo_usuario], [estatus]) VALUES (1, N'admin', N'123', 1, 1)
INSERT [dbo].[usuario] ([id], [correo], [contrasenia], [tipo_usuario], [estatus]) VALUES (12, N'suscriptor', N'123', 2, 1)
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
