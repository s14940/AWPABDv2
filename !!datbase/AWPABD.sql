USE [master]
GO

CREATE DATABASE [AWPABD]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AWPABD',  SIZE = 51200KB , MAXSIZE = UNLIMITED, FILEGROWTH = 51200KB ), 
 FILEGROUP [INDEX] 
( NAME = N'AWPABD_index',  SIZE = 51200KB , MAXSIZE = UNLIMITED, FILEGROWTH = 51200KB )
 LOG ON 
( NAME = N'AWPABD_log' , SIZE = 10240KB , MAXSIZE = 2048GB , FILEGROWTH = 10240KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AWPABD].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO


ALTER DATABASE [AWPABD] SET RECOVERY SIMPLE 
GO


USE [AWPABD]
GO
/****** Object:  Table [dbo].[BlokadyHistory]    Script Date: 30/05/2021 22:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BlokadyHistory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Id_Servers] [int] NOT NULL,
	[Id_Latency] [int] NOT NULL,
	[Data] [datetime] NULL,
	[Wartosc] [nvarchar](max) NULL,
 CONSTRAINT [PK_BlokadyHistory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DatabaseGroup]    Script Date: 30/05/2021 22:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DatabaseGroup](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nazwa] [nvarchar](100) NOT NULL,
	[Grupa] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_DatabaseGroup] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Databases]    Script Date: 30/05/2021 22:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Databases](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nazwa] [nvarchar](100) NOT NULL,
	[Opis] [nvarchar](250) NULL,
	[Wlaczona] [bit] NOT NULL,
	[Owner] [nvarchar](100) NULL,
	[Collation] [nvarchar](100) NULL,
	[Type] [nvarchar](100) NULL,
	[Status] [int] NULL,
	[Id_DatabaseGroup] [int] NOT NULL,
	[Id_Servers] [int] NOT NULL,
 CONSTRAINT [PK_Databases] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Files]    Script Date: 30/05/2021 22:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Files](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Id_Procedury] [int] NOT NULL,
	[Id_Servers] [int] NOT NULL,
	[LokalizacjaPliku] [nvarchar](250) NULL,
	[Nazwa] [nvarchar](100) NULL,
 CONSTRAINT [PK_Files] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Group]    Script Date: 30/05/2021 22:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Group](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nazwa] [nvarchar](100) NOT NULL,
	[Grupa] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_Group] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HostHistory]    Script Date: 30/05/2021 22:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HostHistory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Id_Servers] [int] NOT NULL,
	[Id_Latency] [int] NOT NULL,
	[Data] [datetime] NULL,
	[CPU] [int] NULL,
	[RAM] [int] NULL,
 CONSTRAINT [PK_HostHistory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Latency]    Script Date: 30/05/2021 22:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Latency](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nazwa] [nvarchar](100) NOT NULL,
	[Id_ServersS] [int] NOT NULL,
	[Id_ServersD] [int] NOT NULL,
	[Opis] [nvarchar](max) NULL,
	[Typ] [nvarchar](100) NULL,
 CONSTRAINT [PK_Latency] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LatencyHistory]    Script Date: 30/05/2021 22:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LatencyHistory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Id_Latency] [int] NOT NULL,
	[Data] [date] NULL,
	[Wartosc] [nvarchar](max) NULL,
 CONSTRAINT [PK_LatencyHistory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Logins]    Script Date: 30/05/2021 22:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Logins](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Login] [nvarchar](100) NOT NULL,
	[Haslo] [nvarchar](100) NOT NULL,
	[Telefon] [nvarchar](9) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Imie] [nvarchar](100) NOT NULL,
	[Nazwisko] [nvarchar](100) NOT NULL,
	[Status] [nvarchar](20) NULL,
	[Utworzony] [date] NULL,
	[Zmodyfikowany] [date] NULL,
	[Id_Group] [int] NOT NULL,
	[Id_Roles] [int] NOT NULL,
 CONSTRAINT [PK_Logins] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoginServers]    Script Date: 30/05/2021 22:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoginServers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Id_Login] [int] NOT NULL,
	[Id_Server] [int] NOT NULL,
 CONSTRAINT [PK_LoginServers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Procedury]    Script Date: 30/05/2021 22:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Procedury](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nazwa] [nvarchar](100) NOT NULL,
	[Body] [nvarchar](max) NULL,
	[Utworzona] [date] NOT NULL,
	[Zmodyfikowana] [date] NULL,
	[Opis] [nvarchar](250) NULL,
	[Id_Servers] [int] NULL,
 CONSTRAINT [PK_Procedury] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProceduryHistory]    Script Date: 30/05/2021 22:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProceduryHistory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Id_Procedury] [int] NOT NULL,
	[Id_Servers] [int] NOT NULL,
	[Data] [datetime] NULL,
	[Wynik] [nvarchar](max) NULL,
 CONSTRAINT [PK_ProceduryHistory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProcesyHistory]    Script Date: 30/05/2021 22:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProcesyHistory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Id_Servers] [int] NOT NULL,
	[Id_Latency] [int] NOT NULL,
	[Data] [datetime] NULL,
	[Wartosc] [nvarchar](max) NULL,
 CONSTRAINT [PK_ProcesyHistory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 30/05/2021 22:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Rola] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Servers]    Script Date: 30/05/2021 22:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Servers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nazwa] [nvarchar](100) NOT NULL,
	[DNS] [nvarchar](100) NOT NULL,
	[IP] [nvarchar](20) NOT NULL,
	[Klaster] [bit] NULL,
	[Opis] [nvarchar](250) NULL,
	[Aktywny] [bit] NULL,
	[Historia] [nvarchar](250) NULL,
	[Dodany] [date] NULL,
	[Zmodyfikowany] [date] NULL,
	[Id_ServersGroup] [int] NOT NULL,
	[port] [int] NULL,
 CONSTRAINT [PK_Servers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServersGroup]    Script Date: 30/05/2021 22:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServersGroup](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nazwa] [nvarchar](100) NOT NULL,
	[Grupa] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_ServersGroup] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BlokadyHistory]  WITH CHECK ADD  CONSTRAINT [FK_BlokadyHistory_LAtency] FOREIGN KEY([Id_Latency])
REFERENCES [dbo].[Latency] ([Id])
GO
ALTER TABLE [dbo].[BlokadyHistory] CHECK CONSTRAINT [FK_BlokadyHistory_LAtency]
GO
ALTER TABLE [dbo].[BlokadyHistory]  WITH CHECK ADD  CONSTRAINT [FK_BlokadyHistory_Servers] FOREIGN KEY([Id_Servers])
REFERENCES [dbo].[Servers] ([Id])
GO
ALTER TABLE [dbo].[BlokadyHistory] CHECK CONSTRAINT [FK_BlokadyHistory_Servers]
GO
ALTER TABLE [dbo].[Databases]  WITH CHECK ADD  CONSTRAINT [FK_Databases_DatabseGroup] FOREIGN KEY([Id_DatabaseGroup])
REFERENCES [dbo].[DatabaseGroup] ([Id])
GO
ALTER TABLE [dbo].[Databases] CHECK CONSTRAINT [FK_Databases_DatabseGroup]
GO
ALTER TABLE [dbo].[Databases]  WITH CHECK ADD  CONSTRAINT [FK_Databases_Servers] FOREIGN KEY([Id_Servers])
REFERENCES [dbo].[Servers] ([Id])
GO
ALTER TABLE [dbo].[Databases] CHECK CONSTRAINT [FK_Databases_Servers]
GO
ALTER TABLE [dbo].[Files]  WITH CHECK ADD  CONSTRAINT [FK_Files_Procedury] FOREIGN KEY([Id_Procedury])
REFERENCES [dbo].[Procedury] ([Id])
GO
ALTER TABLE [dbo].[Files] CHECK CONSTRAINT [FK_Files_Procedury]
GO
ALTER TABLE [dbo].[Files]  WITH CHECK ADD  CONSTRAINT [FK_Files_Servers] FOREIGN KEY([Id_Servers])
REFERENCES [dbo].[Servers] ([Id])
GO
ALTER TABLE [dbo].[Files] CHECK CONSTRAINT [FK_Files_Servers]
GO
ALTER TABLE [dbo].[HostHistory]  WITH CHECK ADD  CONSTRAINT [FK_HostHistory_Latency] FOREIGN KEY([Id_Latency])
REFERENCES [dbo].[Latency] ([Id])
GO
ALTER TABLE [dbo].[HostHistory] CHECK CONSTRAINT [FK_HostHistory_Latency]
GO
ALTER TABLE [dbo].[HostHistory]  WITH CHECK ADD  CONSTRAINT [FK_HostHistory_Servers] FOREIGN KEY([Id_Servers])
REFERENCES [dbo].[Servers] ([Id])
GO
ALTER TABLE [dbo].[HostHistory] CHECK CONSTRAINT [FK_HostHistory_Servers]
GO
ALTER TABLE [dbo].[Latency]  WITH CHECK ADD  CONSTRAINT [FK_Latency_ServersD] FOREIGN KEY([Id_ServersD])
REFERENCES [dbo].[Servers] ([Id])
GO
ALTER TABLE [dbo].[Latency] CHECK CONSTRAINT [FK_Latency_ServersD]
GO
ALTER TABLE [dbo].[Latency]  WITH CHECK ADD  CONSTRAINT [FK_Latency_ServersS] FOREIGN KEY([Id_ServersS])
REFERENCES [dbo].[Servers] ([Id])
GO
ALTER TABLE [dbo].[Latency] CHECK CONSTRAINT [FK_Latency_ServersS]
GO
ALTER TABLE [dbo].[LatencyHistory]  WITH CHECK ADD  CONSTRAINT [FK_LatencyHistory_Latency] FOREIGN KEY([Id_Latency])
REFERENCES [dbo].[Latency] ([Id])
GO
ALTER TABLE [dbo].[LatencyHistory] CHECK CONSTRAINT [FK_LatencyHistory_Latency]
GO
ALTER TABLE [dbo].[Logins]  WITH CHECK ADD  CONSTRAINT [FK_Logins_Group] FOREIGN KEY([Id_Group])
REFERENCES [dbo].[Group] ([Id])
GO
ALTER TABLE [dbo].[Logins] CHECK CONSTRAINT [FK_Logins_Group]
GO
ALTER TABLE [dbo].[Logins]  WITH CHECK ADD  CONSTRAINT [FK_Logins_Roles] FOREIGN KEY([Id_Roles])
REFERENCES [dbo].[Roles] ([Id])
GO
ALTER TABLE [dbo].[Logins] CHECK CONSTRAINT [FK_Logins_Roles]
GO
ALTER TABLE [dbo].[LoginServers]  WITH CHECK ADD  CONSTRAINT [FK_LoginServers_Login] FOREIGN KEY([Id_Login])
REFERENCES [dbo].[Logins] ([Id])
GO
ALTER TABLE [dbo].[LoginServers] CHECK CONSTRAINT [FK_LoginServers_Login]
GO
ALTER TABLE [dbo].[LoginServers]  WITH CHECK ADD  CONSTRAINT [FK_LoginServers_Servers] FOREIGN KEY([Id_Server])
REFERENCES [dbo].[Servers] ([Id])
GO
ALTER TABLE [dbo].[LoginServers] CHECK CONSTRAINT [FK_LoginServers_Servers]
GO
ALTER TABLE [dbo].[Procedury]  WITH CHECK ADD  CONSTRAINT [FK_Procedury_Servers] FOREIGN KEY([Id_Servers])
REFERENCES [dbo].[Servers] ([Id])
GO
ALTER TABLE [dbo].[Procedury] CHECK CONSTRAINT [FK_Procedury_Servers]
GO
ALTER TABLE [dbo].[ProceduryHistory]  WITH CHECK ADD  CONSTRAINT [FK_ProceduryHistory_Procedury] FOREIGN KEY([Id_Procedury])
REFERENCES [dbo].[Procedury] ([Id])
GO
ALTER TABLE [dbo].[ProceduryHistory] CHECK CONSTRAINT [FK_ProceduryHistory_Procedury]
GO
ALTER TABLE [dbo].[ProceduryHistory]  WITH CHECK ADD  CONSTRAINT [FK_ProceduryHistory_Servers] FOREIGN KEY([Id_Servers])
REFERENCES [dbo].[Servers] ([Id])
GO
ALTER TABLE [dbo].[ProceduryHistory] CHECK CONSTRAINT [FK_ProceduryHistory_Servers]
GO
ALTER TABLE [dbo].[ProcesyHistory]  WITH CHECK ADD  CONSTRAINT [FK_ProcesyHistory_Latency] FOREIGN KEY([Id_Latency])
REFERENCES [dbo].[Latency] ([Id])
GO
ALTER TABLE [dbo].[ProcesyHistory] CHECK CONSTRAINT [FK_ProcesyHistory_Latency]
GO
ALTER TABLE [dbo].[ProcesyHistory]  WITH CHECK ADD  CONSTRAINT [FK_ProcesyHistory_Servers] FOREIGN KEY([Id_Servers])
REFERENCES [dbo].[Servers] ([Id])
GO
ALTER TABLE [dbo].[ProcesyHistory] CHECK CONSTRAINT [FK_ProcesyHistory_Servers]
GO
ALTER TABLE [dbo].[Servers]  WITH CHECK ADD  CONSTRAINT [FK_Servers_ServersGroup] FOREIGN KEY([Id_ServersGroup])
REFERENCES [dbo].[ServersGroup] ([Id])
GO
ALTER TABLE [dbo].[Servers] CHECK CONSTRAINT [FK_Servers_ServersGroup]
GO
/****** Object:  Trigger [dbo].[LoginINSERTTrigger]    Script Date: 30/05/2021 22:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[LoginINSERTTrigger] on [dbo].[Logins]
FOR INSERT 
as
update logins set Utworzony=getdate() where id=(select id from inserted)
GO
ALTER TABLE [dbo].[Logins] ENABLE TRIGGER [LoginINSERTTrigger]
GO
/****** Object:  Trigger [dbo].[LoginUPDATETrigger]    Script Date: 30/05/2021 22:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[LoginUPDATETrigger] on [dbo].[Logins]
FOR UPDATE
as
update logins set Zmodyfikowany=getdate() where id=(select id from inserted)
GO
ALTER TABLE [dbo].[Logins] ENABLE TRIGGER [LoginUPDATETrigger]
GO
/****** Object:  Trigger [dbo].[ProceduryINSERTTrigger]    Script Date: 30/05/2021 22:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[ProceduryINSERTTrigger] on [dbo].[Procedury]
FOR INSERT
as
update Procedury set Utworzona=getdate() where id=(select id from inserted)
GO
ALTER TABLE [dbo].[Procedury] ENABLE TRIGGER [ProceduryINSERTTrigger]
GO
/****** Object:  Trigger [dbo].[ProceduryUPDATETrigger]    Script Date: 30/05/2021 22:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[ProceduryUPDATETrigger] on [dbo].[Procedury]
FOR UPDATE
as
update Procedury set Zmodyfikowana=getdate() where id=(select id from inserted)
GO
ALTER TABLE [dbo].[Procedury] ENABLE TRIGGER [ProceduryUPDATETrigger]
GO
/****** Object:  Trigger [dbo].[ServersINSERTTrigger]    Script Date: 30/05/2021 22:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[ServersINSERTTrigger] on [dbo].[Servers]
FOR INSERT
as
update Servers set Dodany=getdate() where id=(select id from inserted)
GO
ALTER TABLE [dbo].[Servers] ENABLE TRIGGER [ServersINSERTTrigger]
GO
/****** Object:  Trigger [dbo].[ServersUPDATETrigger]    Script Date: 30/05/2021 22:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[ServersUPDATETrigger] on [dbo].[Servers]
FOR UPDATE
as
update Servers set Zmodyfikowany=getdate() where id=(select id from inserted)
GO
ALTER TABLE [dbo].[Servers] ENABLE TRIGGER [ServersUPDATETrigger]
GO
