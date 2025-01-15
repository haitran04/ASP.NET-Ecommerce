USE [master]
GO
/****** Object:  Database [ASPNET2]    Script Date: 1/15/2025 2:01:19 PM ******/
CREATE DATABASE [ASPNET2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ASPNET2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\ASPNET2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ASPNET2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\ASPNET2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [ASPNET2] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ASPNET2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ASPNET2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ASPNET2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ASPNET2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ASPNET2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ASPNET2] SET ARITHABORT OFF 
GO
ALTER DATABASE [ASPNET2] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ASPNET2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ASPNET2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ASPNET2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ASPNET2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ASPNET2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ASPNET2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ASPNET2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ASPNET2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ASPNET2] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ASPNET2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ASPNET2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ASPNET2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ASPNET2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ASPNET2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ASPNET2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ASPNET2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ASPNET2] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ASPNET2] SET  MULTI_USER 
GO
ALTER DATABASE [ASPNET2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ASPNET2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ASPNET2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ASPNET2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ASPNET2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ASPNET2] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ASPNET2] SET QUERY_STORE = ON
GO
ALTER DATABASE [ASPNET2] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [ASPNET2]
GO
/****** Object:  Table [dbo].[Brand]    Script Date: 1/15/2025 2:01:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brand](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Image] [nvarchar](100) NULL,
	[Slug] [varchar](100) NULL,
	[ShowOnHomePage] [bit] NULL,
	[DisplayOrder] [int] NULL,
	[CreatedOnUtc] [datetime] NULL,
	[UpdatedOnUtc] [datetime] NULL,
	[Deleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 1/15/2025 2:01:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Image] [nchar](100) NULL,
	[Slug] [varchar](100) NULL,
	[ShowOnHomePage] [bit] NULL,
	[DisplayOrder] [int] NULL,
	[Deleted] [bit] NULL,
	[CreatedOnUtc] [datetime] NULL,
	[UpdatedOnUtc] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 1/15/2025 2:01:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[UserId] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[CreatedOnUtc] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 1/15/2025 2:01:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 1/15/2025 2:01:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Image] [nchar](100) NULL,
	[CategoryId] [int] NULL,
	[ShortDes] [nvarchar](100) NULL,
	[FullDescription] [nvarchar](500) NULL,
	[Price] [float] NULL,
	[PriceDiscount] [float] NULL,
	[TypeId] [int] NULL,
	[Slug] [varchar](50) NULL,
	[BrandId] [int] NULL,
	[Deleted] [bit] NULL,
	[ShowOnHomePage] [bit] NULL,
	[DisplayOrder] [int] NULL,
	[CreatedOnUtc] [datetime] NULL,
	[UpdatedOnUtc] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 1/15/2025 2:01:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[IsAdmin] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Brand] ON 

INSERT [dbo].[Brand] ([Id], [Name], [Image], [Slug], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc], [Deleted]) VALUES (1, N'Apple', N'apple.jpg', N'apple', 1, 1, CAST(N'2025-01-08T14:12:51.673' AS DateTime), NULL, 0)
INSERT [dbo].[Brand] ([Id], [Name], [Image], [Slug], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc], [Deleted]) VALUES (2, N'Samsung', N'samsung.jpg', N'samsung', 1, 2, CAST(N'2025-01-08T14:12:51.673' AS DateTime), NULL, 0)
INSERT [dbo].[Brand] ([Id], [Name], [Image], [Slug], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc], [Deleted]) VALUES (3, N'Xiaomi', N'xiaomi.jpg', N'xiaomi', 1, 3, CAST(N'2025-01-08T14:12:51.673' AS DateTime), NULL, 0)
INSERT [dbo].[Brand] ([Id], [Name], [Image], [Slug], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc], [Deleted]) VALUES (4, N'Oppo', N'oppo.jpg', N'oppo', 1, 4, CAST(N'2025-01-08T14:12:51.673' AS DateTime), NULL, 0)
INSERT [dbo].[Brand] ([Id], [Name], [Image], [Slug], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc], [Deleted]) VALUES (5, N'Vivo', N'vivo.jpg', N'vivo', 1, 5, CAST(N'2025-01-08T14:12:51.673' AS DateTime), NULL, 0)
INSERT [dbo].[Brand] ([Id], [Name], [Image], [Slug], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc], [Deleted]) VALUES (6, N'Dell', N'dell.jpg', N'dell', 0, 6, CAST(N'2025-01-08T14:12:51.673' AS DateTime), NULL, 0)
INSERT [dbo].[Brand] ([Id], [Name], [Image], [Slug], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc], [Deleted]) VALUES (7, N'Era', N'era.jpg', N'era', 1, 7, NULL, NULL, NULL)
INSERT [dbo].[Brand] ([Id], [Name], [Image], [Slug], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc], [Deleted]) VALUES (8, N'Dareu', N'dareu.jpg', N'dareu', 1, 8, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Brand] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Id], [Name], [Image], [Slug], [ShowOnHomePage], [DisplayOrder], [Deleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (1, N'Điện thoại', N'phone.jpg                                                                                           ', N'phone', 1, 1, 0, CAST(N'2025-01-08T14:12:51.677' AS DateTime), NULL)
INSERT [dbo].[Category] ([Id], [Name], [Image], [Slug], [ShowOnHomePage], [DisplayOrder], [Deleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (2, N'Máy tính bảng', N'maytinhbang.jpg                                                                                     ', N'may-tinh-bang', 1, 2, 0, CAST(N'2025-01-08T14:12:51.677' AS DateTime), NULL)
INSERT [dbo].[Category] ([Id], [Name], [Image], [Slug], [ShowOnHomePage], [DisplayOrder], [Deleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (3, N'Laptop', N'laptop.jpg                                                                                          ', N'laptop', 1, 3, 0, CAST(N'2025-01-08T14:12:51.677' AS DateTime), NULL)
INSERT [dbo].[Category] ([Id], [Name], [Image], [Slug], [ShowOnHomePage], [DisplayOrder], [Deleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (4, N'Tai nghe', N'tainghe.jpg                                                                                         ', N'tai-nghe', 1, 4, 0, CAST(N'2025-01-08T14:12:51.677' AS DateTime), NULL)
INSERT [dbo].[Category] ([Id], [Name], [Image], [Slug], [ShowOnHomePage], [DisplayOrder], [Deleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (5, N'Đồng hồ', N'dongho.jpg                                                                                          ', N'dong-ho', 1, 5, 0, CAST(N'2025-01-08T14:12:51.677' AS DateTime), NULL)
INSERT [dbo].[Category] ([Id], [Name], [Image], [Slug], [ShowOnHomePage], [DisplayOrder], [Deleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (6, N'Màn hình', N'manhinh.jpg                                                                                         ', N'man-hinh', 0, 6, 0, CAST(N'2025-01-08T14:12:51.677' AS DateTime), NULL)
INSERT [dbo].[Category] ([Id], [Name], [Image], [Slug], [ShowOnHomePage], [DisplayOrder], [Deleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (7, N'Bàn phím', N'banphim.jpg                                                                                         ', N'ban-phim', 1, 7, 0, NULL, NULL)
INSERT [dbo].[Category] ([Id], [Name], [Image], [Slug], [ShowOnHomePage], [DisplayOrder], [Deleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (8, N'Chuột', N'chuot.jpg                                                                                           ', N'chuot', 1, 8, 0, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (1, N'DonHang-20250108152212', 7, 17, CAST(N'2025-01-08T15:22:12.103' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (2, N'DonHang-20250115035708', 7, 17, CAST(N'2025-01-15T03:57:08.673' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (3, N'DonHang-20250115035923', 7, 17, CAST(N'2025-01-15T03:59:23.047' AS DateTime))
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetail] ON 

INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (1, 1, 1, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (2, 2, 1, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (3, 3, 1, 1)
SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([Id], [Name], [Image], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (1, N'iPhone 16 Pro Max 256GB', N'iphone16prm.jpg                                                                                     ', 1, N'iPhone 16 Pro Max có thiết kế titan cấp 5 với lớp hoàn thiện mới, tinh tế được xử lý bề mặt vi điểm.', N'iPhone 16 Pro Max sở hữu màn hình 6.9 inch với công nghệ ProMotion, mang lại trải nghiệm hiển thị mượt mà và sắc nét, lý tưởng cho giải trí và làm việc. Với chip A18 Pro mạnh mẽ, mẫu iPhone đời mới này cung cấp hiệu suất vượt trội, giúp xử lý mượt mà các tác vụ nặng như chơi game hay edit video. Chiếc điện thoại iPhone 16 mới này còn sở hữu hệ thống camera Ultra Wide 48MP cho khả năng chụp ảnh cực kỳ chi tiết, mang đến chất lượng hình ảnh ấn tượng trong mọi tình huống.', 32790000, 31790000, 1, N'iphone-16', 1, 0, 1, 1, CAST(N'2025-01-08T14:12:51.677' AS DateTime), NULL)
INSERT [dbo].[Product] ([Id], [Name], [Image], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (2, N'Galaxy Tab S8', N'galaxytabs8.jpg                                                                                     ', 2, N'Tablet mạnh mẽ', N'Samsung Galaxy Tab S8 với màn hình AMOLED.', 14790000, 13790000, 1, N'galaxy-tab-s8', 2, 0, 1, 2, CAST(N'2025-01-08T14:12:51.677' AS DateTime), NULL)
INSERT [dbo].[Product] ([Id], [Name], [Image], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (3, N'Apple MacBook Air M2 2023', N'macbook2024.jpg                                                                                     ', 3, N'Thiết kế sang trọng, lịch lãm - siêu mỏng 11.3mm, chỉ 1.24kg', N'Apple Macbook Air M2 2024 16GB 256GB thiết kế siêu mỏng 1.13cm, trang bị chip M2 8 nhân GPU, 16 nhân Neural Engine, RAM khủng 16GB, SSD 256GB, màn hình IPS Liquid Retina Display cùng hệ thống 4 loa cho trải nghiệm đỉnh cao.', 22890000, 20890000, 1, N'macbook-air', 1, 0, 1, 3, CAST(N'2025-01-08T14:12:51.677' AS DateTime), NULL)
INSERT [dbo].[Product] ([Id], [Name], [Image], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (4, N'Oppo Watch', N'oppo-watch.jpg                                                                                      ', 5, N'Chiếc đồng hồ thời thượng', N'Oppo Watch với thiết kế đẹp mắt.', 6990000, 5990000, 1, N'oppo-watch', 4, 0, 1, 4, CAST(N'2025-01-08T14:12:51.677' AS DateTime), NULL)
INSERT [dbo].[Product] ([Id], [Name], [Image], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (5, N'Vivo Y21', N'vivo-y21.jpg                                                                                        ', 1, N'Smartphone phổ thông', N'Vivo Y21 với pin dung lượng lớn.', 4900000, 3900000, 1, N'vivo-y21', 5, 0, 1, 5, CAST(N'2025-01-08T14:12:51.677' AS DateTime), NULL)
INSERT [dbo].[Product] ([Id], [Name], [Image], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (6, N'Dell Monitor 24', N'dell-monitor.jpg                                                                                    ', 6, N'Màn hình chất lượng cao', N'Màn hình Dell 24" với độ phân giải Full HD.', 5390000, 4390000, 1, N'dell-monitor-24', 6, 0, 0, 6, CAST(N'2025-01-08T14:12:51.677' AS DateTime), NULL)
INSERT [dbo].[Product] ([Id], [Name], [Image], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (7, N'OPPO Reno13 F 8GB 256GB', N'oppo-reno13.jpg                                                                                     ', 1, N'Màn hình OPPO Reno13 F AMOLED 6.67 inch với độ phân giải Full HD+', N'Điện thoại OPPO Reno13 F sở hữu màn hình AMOLED 6.67 inch với độ phân giải 1080x2400 px, mang lại trải nghiệm hình ảnh sống động cùng tần số quét 120Hz. Kèm theo đó là chipset MediaTek Helio G100 cung cấp hiệu năng mạnh mẽ, hỗ trợ tốt cho các nhu cầu đa nhiệm và chơi game. Camera 50MP trên máy còn cho phép chụp ảnh sắc nét và quay video 4K, đáp ứng mọi yêu cầu về chất lượng hình ảnh và video.', 8900000, 7900000, 1, N'oppo-reno', 4, 0, 1, 7, CAST(N'2025-01-08T14:12:51.677' AS DateTime), CAST(N'2025-01-08T14:12:51.677' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Image], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (8, N'Monitor Xiaomi 27 inch', N'xiaomi-monitor.jpg                                                                                  ', 6, N'Màn hình chất lượng cao', N'Màn hình Dell 24" với độ phân giải Full HD.', 2190000, 1690000, 1, N'xiaomi-monitor', 3, 0, 0, 8, CAST(N'2025-01-08T14:12:51.677' AS DateTime), CAST(N'2025-01-08T14:12:51.677' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Image], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (9, N'Keyboard E-Dra Alpha Brown Switch', N'era.jpg                                                                                             ', 7, N'Kết nối đa dạng: Hỗ trợ kết nối 2.4Ghz và Bluetooth, thuận tiện cho nhiều thiết bị.', N'Bàn phím cơ E-Dra không dây EK368L Alpha Brown Switch có thể kết nối qua cả Wireless 2.4G và Bluetooth 5.0, mang đến sự linh hoạt tối đa khi gõ nhập. Với số lượng 68 phím, bàn phím E-Dra này cung cấp đầy đủ các phím cần thiết, giúp tiết kiệm không gian mà vẫn đảm bảo hiệu suất công việc. Bên cạnh đó, sản phẩm bàn phím E-Dra còn sở hữu pin 2xAA, đảm bảo thời gian sử dụng lâu dài, có thể lên đến 6 tháng mà không cần thay pin thường xuyên.', 549000, 449000, 1, N'key-board-era', 7, NULL, NULL, 9, CAST(N'2025-01-08T14:25:32.667' AS DateTime), NULL)
INSERT [dbo].[Product] ([Id], [Name], [Image], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (10, N'Apple Magic Keyboard 2', N'apple-magic-keyboard.jpg                                                                            ', 7, N'Kết nối đa dạng: Hỗ trợ kết nối 2.4Ghz và Bluetooth, thuận tiện cho nhiều thiết bị.', N'Thiết kế siêu mỏng,kiểu dáng đẹp,kết nối Bluetooth hoặc cổng Lightning', 4990000, 2990000, 1, N'key-board-apple', 1, NULL, NULL, 10, CAST(N'2025-01-08T14:25:54.553' AS DateTime), NULL)
INSERT [dbo].[Product] ([Id], [Name], [Image], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (11, N'Chuột chơi game không dây Dareu EM911Y', N'dareu-em911.jpg                                                                                     ', 8, N'Cho phép theo dõi chuyển động, phản hồi sắc nét với cảm biến quang không dây - 8000 DPI', N'Chuột chơi game không dây DAREU EM911X RGB sở hữu kết nối Wireless 2.4 G đem lại khả năng kết nối cũng như truyền dữ liệu cực nhanh và cho tín hiệu ổn định. Cảm biến của sản phẩm chuột Dareu này cũng rất chính xác cùng hệ thống đèn LED tuyệt đẹp thể hiện cá tính người sử dụng.', 699000, 490000, 1, N'mouse-dareu', 8, NULL, NULL, 11, CAST(N'2025-01-14T15:19:33.000' AS DateTime), NULL)
INSERT [dbo].[Product] ([Id], [Name], [Image], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (12, N'iPhone 16', N'iphone16prm.jpg                                                                                     ', 1, N'iPhone 16 Pro Max có thiết kế titan cấp 5 với lớp hoàn thiện mới, tinh tế được xử lý bề mặt vi điểm.', N'iPhone 16 Pro Max sở hữu màn hình 6.9 inch với công nghệ ProMotion, mang lại trải nghiệm hiển thị mượt mà và sắc nét, lý tưởng cho giải trí và làm việc. Với chip A18 Pro mạnh mẽ, mẫu iPhone đời mới này cung cấp hiệu suất vượt trội, giúp xử lý mượt mà các tác vụ nặng như chơi game hay edit video. Chiếc điện thoại iPhone 16 mới này còn sở hữu hệ thống camera Ultra Wide 48MP cho khả năng chụp ảnh cực kỳ chi tiết, mang đến chất lượng hình ảnh ấn tượng trong mọi tình huống.', 32790000, 32790000, 1, N'iphone-16', 1, NULL, NULL, 12, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Image], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (17, N'Laptop ASUS Vivobook 15 X1504ZA-NJ517W', N'laptop-asus.jpg                                                                                     ', 3, N'Màn hình FHD 15.6 inch với độ sáng 250 nits và độ phủ màu 45%', N'Laptop Asus Vivobook 15 X1504ZA-NJ517W được trang bị bộ vi xử lý Intel Core i5-1235U cùng card đồ họa Intel Xe Graphics hạn chế độ trễ của khung hình.', 13990000, 10990000, 1, N'laptop-asus', 5, NULL, NULL, 13, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Image], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (18, N'Laptop ASUS TUF Gaming A15', N'asus-tuf.jpg                                                                                        ', 3, N'Trang bị bộ vi xử lý AMD Ryzen 7 7435HS, mang lại hiệu năng mạnh mẽ cho cả công việc và giải trí.', N'Laptop Asus TUF Gaming A15 FA506NFR-HN006W mang tới hiệu suất vượt trội khi được trang bị bộ đôi CPU AMD Ryzen 7 7435HS và GPU NVIDIA GeForce RTX 2050.', 17490000, 14490000, 1, N'laptop-asus', 5, NULL, NULL, 14, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Image], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (19, N'Laptop Acer Aspire 3 Spin', N'aceraspire.jpg                                                                                      ', 3, N'Thiết kế 2-trong-1 linh hoạt, kết hợp giữa laptop và máy tính bảng', N'Laptop Acer Aspire 3 Spin 14 A3SP14-31PT-387Z với chip Intel Core i3-N305, 8GB RAM và SSD 512GB, mang lại hiệu năng ổn định cho các tác vụ, kể cả đồ hoạ.', 9490000, 6490000, 1, N'acer-aspire', 5, 0, 1, 15, CAST(N'2025-01-15T13:43:42.890' AS DateTime), NULL)
INSERT [dbo].[Product] ([Id], [Name], [Image], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (20, N'Laptop Lenovo LOQ 15IAX9', N'lenovoloq.jpg                                                                                       ', 3, N'Trang bị bộ vi xử lý Intel Core i5-12450HX giúp xử lý tác vụ nhanh chóng và mượt mà', N'Laptop Lenovo LOQ 15IAX9 83GS001RVN được trang bị bộ xử lý Intel Core i5-12450HX với 8 lõi, 12 luồng cùng RAM DDR5-4800 cho khả năng đa nhiệm ấn tượng.', 20490000, 17490000, 1, N'lenovo-loq', 5, 0, 1, 16, CAST(N'2025-01-15T13:43:42.890' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [Password], [IsAdmin]) VALUES (1, N'Ðang', N'Nguy?n', N'dangnguyen@example.com', N'dang123', 1)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [Password], [IsAdmin]) VALUES (2, N'Hoa', N'Tr?n', N'hoatran@example.com', N'hoa123', 0)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [Password], [IsAdmin]) VALUES (3, N'H?i', N'Lê', N'haile@example.com', N'hai123', 0)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [Password], [IsAdmin]) VALUES (4, N'Th?o', N'Vu', N'thaovu@example.com', N'thao123', 0)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [Password], [IsAdmin]) VALUES (5, N'Phúc', N'Ph?m', N'phucpham@example.com', N'phuc123', 0)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [Password], [IsAdmin]) VALUES (6, N'Minh', N'Ð?ng', N'minhdang@example.com', N'minh123', 1)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [Password], [IsAdmin]) VALUES (7, N'Hai', N'Tran', N'user1@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [Password], [IsAdmin]) VALUES (8, N'Hai', N'Tram', N'admin@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', NULL)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([Id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Order]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([BrandId])
REFERENCES [dbo].[Brand] ([Id])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([Id])
GO
USE [master]
GO
ALTER DATABASE [ASPNET2] SET  READ_WRITE 
GO
