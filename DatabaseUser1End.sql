USE [master]
GO
/****** Object:  Database [User1]    Script Date: 14.01.2025 15:30:40 ******/
CREATE DATABASE [User1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'User1', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\User1.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'User1_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\User1_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [User1] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [User1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [User1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [User1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [User1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [User1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [User1] SET ARITHABORT OFF 
GO
ALTER DATABASE [User1] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [User1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [User1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [User1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [User1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [User1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [User1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [User1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [User1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [User1] SET  DISABLE_BROKER 
GO
ALTER DATABASE [User1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [User1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [User1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [User1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [User1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [User1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [User1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [User1] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [User1] SET  MULTI_USER 
GO
ALTER DATABASE [User1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [User1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [User1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [User1] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [User1] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [User1] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [User1] SET QUERY_STORE = OFF
GO
USE [User1]
GO
/****** Object:  Table [dbo].[TypeInsert]    Script Date: 14.01.2025 15:30:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeInsert](
	[Id] [int] NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TypeInsert] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserGender]    Script Date: 14.01.2025 15:30:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserGender](
	[Id] [int] NOT NULL,
	[Gender] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_UserGender] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRole]    Script Date: 14.01.2025 15:30:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRole](
	[Id] [int] NOT NULL,
	[Role] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_UserRole] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 14.01.2025 15:30:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdRole] [int] NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Login] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[NumberPhone] [nvarchar](50) NOT NULL,
	[SeriaPass] [int] NULL,
	[NumberPass] [int] NULL,
	[BirthdayDate] [date] NOT NULL,
	[LastInsert] [nvarchar](50) NULL,
	[IdTypeInsert] [int] NULL,
	[IdGender] [int] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[TypeInsert] ([Id], [Type]) VALUES (1, N'Неуспешно')
INSERT [dbo].[TypeInsert] ([Id], [Type]) VALUES (2, N'Успешно')
GO
INSERT [dbo].[UserGender] ([Id], [Gender]) VALUES (1, N'женский')
INSERT [dbo].[UserGender] ([Id], [Gender]) VALUES (2, N'мужской')
GO
INSERT [dbo].[UserRole] ([Id], [Role]) VALUES (1, N'Администратор')
INSERT [dbo].[UserRole] ([Id], [Role]) VALUES (2, N'Исполнитель')
INSERT [dbo].[UserRole] ([Id], [Role]) VALUES (3, N'Менеджер')
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [IdRole], [UserName], [Email], [Login], [Password], [NumberPhone], [SeriaPass], [NumberPass], [BirthdayDate], [LastInsert], [IdTypeInsert], [IdGender]) VALUES (0, 1, N'Андреев Евгений Андреевич', N'gdfjuhgjf@mail.ru', N'Andreev', N'qwe123qwe', N'+7(567) - 456-45-54', NULL, NULL, CAST(N'2005-02-01' AS Date), NULL, NULL, 2)
INSERT [dbo].[Users] ([Id], [IdRole], [UserName], [Email], [Login], [Password], [NumberPhone], [SeriaPass], [NumberPass], [BirthdayDate], [LastInsert], [IdTypeInsert], [IdGender]) VALUES (1, 3, N'Акимов Ян Алексеевич', N'gohufreilagrau-3818@yopmail.com', N'akimovya', N'bn069Caj', N'+7(781) - 785-58-37', 2367, 558134, CAST(N'1993-07-03' AS Date), N'1,67523E+12', 2, 2)
INSERT [dbo].[Users] ([Id], [IdRole], [UserName], [Email], [Login], [Password], [NumberPhone], [SeriaPass], [NumberPass], [BirthdayDate], [LastInsert], [IdTypeInsert], [IdGender]) VALUES (2, 2, N'Гончарова Ульяна Львовна', N'xawugosune-1385@yopmail.com', N'goncharovaul', N'pW4qZhL!', N'+7(230) - 906-88-15', 7101, 669343, CAST(N'1975-06-22' AS Date), N'1,6763E+12', 2, 1)
INSERT [dbo].[Users] ([Id], [IdRole], [UserName], [Email], [Login], [Password], [NumberPhone], [SeriaPass], [NumberPass], [BirthdayDate], [LastInsert], [IdTypeInsert], [IdGender]) VALUES (3, 1, N'Анохина Елизавета Матвеевна', N'leuttevitrafo1998@mail.ru', N'anochinaem', N'y6UNmaJg', N'+7(555) - 444-83-16', 3455, 719630, CAST(N'1991-08-16' AS Date), N'1,67605E+12', 2, 1)
INSERT [dbo].[Users] ([Id], [IdRole], [UserName], [Email], [Login], [Password], [NumberPhone], [SeriaPass], [NumberPass], [BirthdayDate], [LastInsert], [IdTypeInsert], [IdGender]) VALUES (4, 3, N'Николаев Илья Владиславович', N'frapreubrulloba1141@yandex.ru', N'nickolaeviv', N'ebOt@4y$', N'+7(392) - 682-44-42', 2377, 871623, CAST(N'1970-12-22' AS Date), N'1,6754E+12', 2, 2)
INSERT [dbo].[Users] ([Id], [IdRole], [UserName], [Email], [Login], [Password], [NumberPhone], [SeriaPass], [NumberPass], [BirthdayDate], [LastInsert], [IdTypeInsert], [IdGender]) VALUES (5, 2, N'Уткин Дмитрий Платонович', N'zapramaxesu-7741@yopmail.com', N'utkindp', N'zQt8g@GH', N'+7(836) - 429-03-86', 8755, 921148, CAST(N'1999-05-04' AS Date), N'1,6765E+12', 1, 2)
INSERT [dbo].[Users] ([Id], [IdRole], [UserName], [Email], [Login], [Password], [NumberPhone], [SeriaPass], [NumberPass], [BirthdayDate], [LastInsert], [IdTypeInsert], [IdGender]) VALUES (6, 2, N'Куликова Стефания Никитична', N'rouzecroummegre-3899@yopmail.com', N'kulikovasn', N'TCmE7Jon', N'+7(283) - 945-30-92', 4355, 104594, CAST(N'1994-12-06' AS Date), N'1,67615E+12', 2, 1)
INSERT [dbo].[Users] ([Id], [IdRole], [UserName], [Email], [Login], [Password], [NumberPhone], [SeriaPass], [NumberPass], [BirthdayDate], [LastInsert], [IdTypeInsert], [IdGender]) VALUES (7, 2, N'Волков Егор Матвеевич', N'ziyeuddocrabri-4748@@yopmail.com', N'volkovem', N'pbgO3Vv5', N'+7(621) - 359-36-69', 2791, 114390, CAST(N'1995-03-28' AS Date), N'1,67649E+12', 2, 2)
INSERT [dbo].[Users] ([Id], [IdRole], [UserName], [Email], [Login], [Password], [NumberPhone], [SeriaPass], [NumberPass], [BirthdayDate], [LastInsert], [IdTypeInsert], [IdGender]) VALUES (8, 1, N'Соколова Софья Георгиевна', N'ketameissoinnei-1951@yopmail.com', N'sokolovasg', N'lITaH?Bs', N'+7(440) - 561-03-14', 5582, 126286, CAST(N'1977-03-27' AS Date), N'1,6765E+12', 1, 1)
INSERT [dbo].[Users] ([Id], [IdRole], [UserName], [Email], [Login], [Password], [NumberPhone], [SeriaPass], [NumberPass], [BirthdayDate], [LastInsert], [IdTypeInsert], [IdGender]) VALUES (9, 3, N'Голубева Полина Андреевна', N'yipraubaponou-5849@yopmail.com', N'golubevapa', N's|ke*p@~', N'+7(331) - 918-24-34', 2978, 133653, CAST(N'1975-04-12' AS Date), N'1,67558E+12', 2, 1)
INSERT [dbo].[Users] ([Id], [IdRole], [UserName], [Email], [Login], [Password], [NumberPhone], [SeriaPass], [NumberPass], [BirthdayDate], [LastInsert], [IdTypeInsert], [IdGender]) VALUES (10, 3, N'Вишневская Мария Андреевна', N'crapedocouca-3572@yopmail.com', N'vishnevskayama', N'OCaywHJZ', N'+7(493) - 219-39-42', 7512, 141956, CAST(N'1975-12-23' AS Date), NULL, 2, 1)
INSERT [dbo].[Users] ([Id], [IdRole], [UserName], [Email], [Login], [Password], [NumberPhone], [SeriaPass], [NumberPass], [BirthdayDate], [LastInsert], [IdTypeInsert], [IdGender]) VALUES (11, 3, N'Васильева Арина Данииловна', N'ceigoixakaunni-9227@yopmail.com', N'vasilevad', N'DAWuV%#u', N'+7(407) - 485-50-30', 5046, 158433, CAST(N'2000-01-22' AS Date), NULL, 1, 1)
INSERT [dbo].[Users] ([Id], [IdRole], [UserName], [Email], [Login], [Password], [NumberPhone], [SeriaPass], [NumberPass], [BirthdayDate], [LastInsert], [IdTypeInsert], [IdGender]) VALUES (12, 3, N'Павлов Дмитрий Максимович', N'yeimmeiwauzomo-7054@yopmail.com', N'pavlovdm', N'ptoED%zE', N'+7(919) - 478-24-97', 2460, 169505, CAST(N'1983-10-03' AS Date), N'1,67554E+12', 1, 2)
INSERT [dbo].[Users] ([Id], [IdRole], [UserName], [Email], [Login], [Password], [NumberPhone], [SeriaPass], [NumberPass], [BirthdayDate], [LastInsert], [IdTypeInsert], [IdGender]) VALUES (13, 2, N'Горбунова Мирослава Артуровна', N'pixil59@gmail.com', N'gorbunovama', N'ZFR2~Zl*', N'+7(482) - 802-95-80', 3412, 174593, CAST(N'1998-03-03' AS Date), N'1,67653E+12', 2, 1)
INSERT [dbo].[Users] ([Id], [IdRole], [UserName], [Email], [Login], [Password], [NumberPhone], [SeriaPass], [NumberPass], [BirthdayDate], [LastInsert], [IdTypeInsert], [IdGender]) VALUES (14, 3, N'Демина София Романовна', N'deummecillummu-4992@mail.ru', N'deminasr', N'D%DVKyDN', N'+7(455) - 944-64-49', 4950, 183034, CAST(N'1993-06-08' AS Date), N'1,67607E+12', 1, 1)
INSERT [dbo].[Users] ([Id], [IdRole], [UserName], [Email], [Login], [Password], [NumberPhone], [SeriaPass], [NumberPass], [BirthdayDate], [LastInsert], [IdTypeInsert], [IdGender]) VALUES (15, 2, N'Петрова Алина Робертовна', N'vilagajaunne-5170@yandex.ru', N'petrovaar', N'z7ZE?8N5', N'+7(710) - 388-25-63', 5829, 219464, CAST(N'1980-09-23' AS Date), N'1,67527E+12', 2, 1)
INSERT [dbo].[Users] ([Id], [IdRole], [UserName], [Email], [Login], [Password], [NumberPhone], [SeriaPass], [NumberPass], [BirthdayDate], [LastInsert], [IdTypeInsert], [IdGender]) VALUES (16, 2, N'Плотников Григорий Александрович', N'frusubroppotou656@yandex.ru', N'plotnikovga', N'yh+S4@yc', N'+7(759) - 452-38-46', 6443, 208059, CAST(N'1991-03-13' AS Date), N'1,67588E+12', 2, 2)
INSERT [dbo].[Users] ([Id], [IdRole], [UserName], [Email], [Login], [Password], [NumberPhone], [SeriaPass], [NumberPass], [BirthdayDate], [LastInsert], [IdTypeInsert], [IdGender]) VALUES (17, 2, N'Прохорова Есения Тимофеевна', N'vhopkins@lewis-mullen.com', N'prochorovaet', N'wLF186dB', N'+7(687) - 801-13-32', 7079, 213265, CAST(N'1998-04-14' AS Date), NULL, NULL, 1)
INSERT [dbo].[Users] ([Id], [IdRole], [UserName], [Email], [Login], [Password], [NumberPhone], [SeriaPass], [NumberPass], [BirthdayDate], [LastInsert], [IdTypeInsert], [IdGender]) VALUES (18, 2, N'Чернов Алексей Егорович', N'nlewis@yahoo.com', N'chernovae', N'Sjkr*1zV', N'+7(425) - 783-22-53', 8207, 522702, CAST(N'1980-04-16' AS Date), N'1,67561E+12', 2, 2)
INSERT [dbo].[Users] ([Id], [IdRole], [UserName], [Email], [Login], [Password], [NumberPhone], [SeriaPass], [NumberPass], [BirthdayDate], [LastInsert], [IdTypeInsert], [IdGender]) VALUES (19, 3, N'Горбунов Степан Артёмович', N'garciadavid@mckinney-mcbride.com', N'gorbunovsa', N'hFhK%$JI', N'+7(889) - 449-43-91', 9307, 232158, CAST(N'1993-07-23' AS Date), N'1,67632E+12', 2, 2)
INSERT [dbo].[Users] ([Id], [IdRole], [UserName], [Email], [Login], [Password], [NumberPhone], [SeriaPass], [NumberPass], [BirthdayDate], [LastInsert], [IdTypeInsert], [IdGender]) VALUES (20, 2, N'Рябинина Софья Артёмовна', N'loudittoimmolau1900@gmail.com', N'ryabininasa', N'&yw1da4K', N'+7(825) - 301-82-50', 1357, 242839, CAST(N'1990-06-01' AS Date), NULL, NULL, 1)
INSERT [dbo].[Users] ([Id], [IdRole], [UserName], [Email], [Login], [Password], [NumberPhone], [SeriaPass], [NumberPass], [BirthdayDate], [LastInsert], [IdTypeInsert], [IdGender]) VALUES (21, 2, N'Козлова Яна Даниловна', N'hittuprofassa4984@mail.com', N'kozlovayd', N'wCH7dl3k', N'+7(397) - 334-20-86', 1167, 256636, CAST(N'1987-12-21' AS Date), NULL, NULL, 1)
INSERT [dbo].[Users] ([Id], [IdRole], [UserName], [Email], [Login], [Password], [NumberPhone], [SeriaPass], [NumberPass], [BirthdayDate], [LastInsert], [IdTypeInsert], [IdGender]) VALUES (22, 3, N'Лукьянова Ульяна Олеговна', N'freineiciweijau888@yandex.ru', N'lyckyanovayo', N'JadQ24D5', N'+7(241) - 570-30-40', 1768, 266986, CAST(N'1981-10-22' AS Date), NULL, NULL, 1)
INSERT [dbo].[Users] ([Id], [IdRole], [UserName], [Email], [Login], [Password], [NumberPhone], [SeriaPass], [NumberPass], [BirthdayDate], [LastInsert], [IdTypeInsert], [IdGender]) VALUES (23, 2, N'Кондрашова Арина Ивановна', N'jessica84@hotmail.com', N'kondrashovai', N'YlBz$8vJ', N'+7(713) - 462-82-65', 1710, 427875, CAST(N'1976-12-22' AS Date), N'1,6758E+12', 1, 1)
INSERT [dbo].[Users] ([Id], [IdRole], [UserName], [Email], [Login], [Password], [NumberPhone], [SeriaPass], [NumberPass], [BirthdayDate], [LastInsert], [IdTypeInsert], [IdGender]) VALUES (24, 3, N'Быкова Виктория Тимуровна', N'nokupekidda2001@gmail.com', N'bykovavt', N'nx8Z$K98', N'+7(854) - 822-23-31', 1806, 289145, CAST(N'1973-06-14' AS Date), NULL, NULL, 1)
INSERT [dbo].[Users] ([Id], [IdRole], [UserName], [Email], [Login], [Password], [NumberPhone], [SeriaPass], [NumberPass], [BirthdayDate], [LastInsert], [IdTypeInsert], [IdGender]) VALUES (25, 2, N'Гуляев Тимофей Даниилович', N'ginaritter@schneider-buchanan.com', N'gylyaevtd', N'lz$kp1?f', N'+7(439) - 713-61-17', 1587, 291249, CAST(N'1987-02-05' AS Date), N'2023-02-01 13:07:20', 1, 2)
INSERT [dbo].[Users] ([Id], [IdRole], [UserName], [Email], [Login], [Password], [NumberPhone], [SeriaPass], [NumberPass], [BirthdayDate], [LastInsert], [IdTypeInsert], [IdGender]) VALUES (26, 2, N'Ачыкел Микаил Уралович', N'dsfghsdjh@mail.ru', N'Mikail', N'123qwe123', N'+7(545) - 544-54-45', NULL, NULL, CAST(N'2005-01-12' AS Date), NULL, NULL, 2)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_TypeInsert] FOREIGN KEY([IdTypeInsert])
REFERENCES [dbo].[TypeInsert] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_TypeInsert]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_UserGender] FOREIGN KEY([IdGender])
REFERENCES [dbo].[UserGender] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_UserGender]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_UserRole] FOREIGN KEY([IdRole])
REFERENCES [dbo].[UserRole] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_UserRole]
GO
USE [master]
GO
ALTER DATABASE [User1] SET  READ_WRITE 
GO
