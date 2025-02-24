CREATE DATABASE [DUANTOTNGHIEP]
GO
USE [DUANTOTNGHIEP]
GO

/****** Object:  Table [dbo].[Accounts]    Script Date: 09/29/2021 20:07:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[Username] [nvarchar](100) NOT NULL,
	[Password] [nvarchar](150) NOT NULL,
	[Fullname] [nvarchar](50)  NOT NULL,
	[Address] [nvarchar](100)   NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Phone] [int]  NOT NULL,
	[Photo] [nvarchar](50) NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
CREATE TABLE [dbo].[Status](
	[Id] [nvarchar](20) NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Authorities]    Script Date: 09/29/2021 20:07:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Authorities](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](100) NOT NULL,
	[RoleId] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_UserRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Roles]    Script Date: 09/29/2021 20:07:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [nvarchar](10) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Categories]    Script Date: 09/29/2021 20:07:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] NOT NULL IDENTITY(1,1),
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 09/29/2021 20:07:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[OrderId] [bigint] NOT NULL,
	[ProductId] [int]  NULL,
	[Price] [float] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Orders]    Script Date: 09/29/2021 20:07:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
go
CREATE TABLE [dbo].[Orders](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](100) NOT NULL,
	[Fullname] [nvarchar](50) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[Phone] [int] NOT NULL,
	[Address] [nvarchar](100) NOT NULL,
	[StatusId][nvarchar](20) not null,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Products]    Script Date: 09/29/2021 20:07:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
	[Image] [nvarchar](150) NOT NULL,
	[Price] [float] NOT NULL,
	[CreateDate] [date] NOT NULL,
	[Available] [bit] NOT NULL,
	[CategoryId] [int] NULL,
	[priceSale] [float] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FeedBack]    Script Date: 09/29/2021 20:07:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FeedBack](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Fullname] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Phone_number] [varchar](20) NOT NULL,
	[Subject_name] [nvarchar](50) NOT NULL,
	[Note] [Nvarchar](250) NOT NULL,
 CONSTRAINT [PK_FeedBack] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


/****** Object:  Khóa Ngoại    Script Date: 09/29/2021 20:07:02 PM ******/

ALTER TABLE [dbo].[Authorities]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Status] FOREIGN KEY([StatusId])
REFERENCES [dbo].[Status] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Authorities] CHECK CONSTRAINT [FK_UserRoles_Roles]
GO
ALTER TABLE [dbo].[Authorities]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_Users] FOREIGN KEY([Username])
REFERENCES [dbo].[Accounts] ([Username])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Authorities] CHECK CONSTRAINT [FK_UserRoles_Users]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE;
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Products]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Customers] FOREIGN KEY([Username])
REFERENCES [dbo].[Accounts] ([Username])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Customers]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK3ess0s7i9qs6sim1pf9kxhkpq] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK3ess0s7i9qs6sim1pf9kxhkpq]
GO

ALTER TABLE [dbo].[Accounts] ADD  CONSTRAINT [DF_Customers_Photo]  DEFAULT (N'Photo.gif') FOR [Photo]
GO
ALTER TABLE [dbo].[OrderDetails] ADD  CONSTRAINT [DF_Order_Details_UnitPrice]  DEFAULT ((0)) FOR [Price]
GO
ALTER TABLE [dbo].[OrderDetails] ADD  CONSTRAINT [DF_Order_Details_Quantity]  DEFAULT ((1)) FOR [Quantity]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders_OrderCreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_Image]  DEFAULT (N'Product.gif') FOR [Image]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_UnitPrice]  DEFAULT ((0)) FOR [Price]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_ProductCreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
/**
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_ProductUpdateDate]  DEFAULT (getdate()) FOR [UpdateDate]
GO
**/
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_Available]  DEFAULT ((1)) FOR [Available]
GO
/**
ALTER TABLE [dbo].[Accounts] ADD  CONSTRAINT [DF_Accounts_AccountCreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Accounts] ADD  CONSTRAINT [DF_Accounts_AccountUpdateDate]  DEFAULT (getdate()) FOR [UpdateDate]
GO
**/

/****** Insert:  Table [dbo].[Roles]    Script Date: 09/29/2021 20:07:02 PM ******/
GO
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (N'CUST', N'Khách hàng')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (N'STAF', N'Nhân viên')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (N'DIRE', N'Admin')
GO
/****** Insert:  Table [dbo].[Accounts]    Script Date: 09/29/2021 20:07:02 PM ******/
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname],[Address], [Email],[Phone], [Photo]) VALUES (N'TamTam', N'123', N'Nguyễn Tâm Tâm',N'12 Trần Quang Diệu , Quảng Ngãi', N'Tamzhy21@gmail.com',N'0974273333',N'user.png');
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Address], [Email],[Phone],[Photo]) VALUES (N'LamLe', N'0916857647', N'Lê Cao Lâm',N'34/12 Tân Thới Hiệp , Tp Hồ Chí Minh', N'lamlcps21030@fpt.edu.vn',N'0856296777',  N'user.png')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname],[Address], [Email],[Phone],[Photo]) VALUES (N'PhongTran', N'ThePhong1234567', N'Trần Phạm Thế Phong',N'12 Quang Trung , Sóc Trăng ', N'Phongtrankhongcodon01@gmail.com',N'0915770055', N'user.png')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Address], [Email],[Phone], [Photo]) VALUES (N'TrungHuynh', N'123', N'Huỳnh Minh Trung',N'TP Sóc Trăng', N'trunghuynh43210@gmail.com',N'0989117799',  N'user.png')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Address], [Email],[Phone], [Photo]) VALUES (N'KhanhHo', N'123', N'Hồ Văn Khánh',N'195 Gò Vấp , Tp Hồ Chí Minh', N'Khanhho123@gmail.com',N'0859170777',  N'user.png')

GO
/****** Insert:  Table [dbo].[Authorities]    Script Date: 09/29/2021 20:07:02 PM ******/
SET IDENTITY_INSERT [dbo].[Authorities] ON 
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (1, N'TamTam', N'DIRE')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (2, N'LamLe', N'DIRE')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (3, N'PhongTran', N'STAF')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (4, N'TrungHuynh', N'STAF')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (5, N'KhanhHo', N'STAF')
SET IDENTITY_INSERT [dbo].[Authorities] OFF
GO
/****** Insert:  Table [dbo].[Categories]    Script Date: 09/29/2021 20:07:02 PM ******/
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'1000', N'Jordan')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'1001', N'Nike')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'1002', N'Adidas')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'1003', N'Yeezy')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'1004', N'Balenciaga')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'1005', N'Converse')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'1006', N'MLB')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'1007', N'Puma')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'1008', N'Vans')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
/****** Insert:  Table [dbo].[Products]    Script Date: 09/29/2021 20:07:02 PM ******/
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1000, N'AIR JORDAN 1 LOW', N'AIR-JORDAN-1-LOW.PNG', 4870000,'2023-12-09', 0, N'1000', 4383000)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1001, N'AIR JORDAN 1 LOW BLACK AND WHITE', N'AIR-JORDAN-1-LOW-BLACK-AND-WHITE.PNG', 4200000,'2023-12-09', 1, N'1000','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1002, N'AIR JORDAN 1 LOW SE', N'AIR-JORDAN-1-LOW-SE.PNG', 5060000, '2023-12-09', 1, N'1000',4301000)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1003, N'AIR JORDAN 1 MID', N'AIR-JORDAN-1-MID.PNG', 4570000, '2023-12-09', 1, N'1000','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1004, N'AIR JORDAN 2 LOW', N'AIR-JORDAN-2-LOW.PNG', 4640000, '2023-12-09', 1, N'1000','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1005, N'AIR JORDAN 2 MID', N'AIR-JORDAN-2-MID.PNG', 5290000, '2023-12-09', 1, N'1000','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1006, N'AIR JORDAN 4 BLACK', N'AIR-JORDAN-4-BLACK.PNG', 5300000, '2023-12-09', 1, N'1000',4240000)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1007, N'JORDAN 1 HI OG', N'JORDAN-1 HI-OG.PNG', 4370000, '2023-12-09', 1, N'1000',3933000)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1008, N'JORDAN 1 HI ZOOM CMFT', N'JORDAN-1-HI-ZOOM-CMFT.PNG', 4640000, '2023-12-09', 1, N'1000','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1009, N'JORDAN 1 LOW ALUMINUM', N'JORDAN-1-LOW-ALUMINUM.PNG', 4710000, '2023-12-09', 1, N'1000','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1010, N'JORDAN 1 LOW ELEVATE', N'JORDAN-1-LOW-ELEVATE.PNG', 4800000, '2023-12-09',1, N'1000','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1011, N'JORDAN STAY LOYAL 2', N'JORDAN-STAY-LOYAL-2.PNG', 4800000, '2023-12-09', 1, N'1000',4080000)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1012, N'NIKE AIR JORDAN 4 PINE GREEN', N'NIKE-AIR-JORDAN-4-PINE-GREEN.PNG', 4140000, '2023-12-09', 1, N'1000','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1013, N'NIKE DUNK LOW CHICAGO SPLIT', N'NIKE-DUNK-LOW-CHICAGO-SPLIT.PNG', 3900000, '2023-12-09', 1, N'1000',3705000)
GO
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1014, N'AIR JORDAN 1 MID CARBON FIBER', N'Air-Jordan-1-mid-carbon-fiber.png', 4830000, '2023-12-09', 0, N'1000','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1015, N'AIR JORDAN 1 MID GUAVA ICE', N'Air-jordan-1-mid-guava-ice.png', 5060000, '2023-12-09', 1, N'1000',4301000)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1016, N'AIR JORDAN 1 RETRO HIGH OG PALOMINO', N'Air-jordan-1-retro-high-og-palomino.png', 5520000, '2023-12-09', 1, N'1000','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1017, N'AIR JORDAN 1 RETRO HIGH UNION LA BLACK TOE', N'Air-Jordan-1-Retro-High-Union-LA-Black-Toe.png', 4870000, '2023-12-09', 1, N'1000','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1018, N'AIR JORDAN 6 RETRO TRAVIS SCOTT LIKE AUTH', N'Air-Jordan-6-Retro-Travis-Scott-like-auth.png', 4140000,'2023-12-09', 1, N'1000','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1019, N'JORDAN 1 LOW TRAVIS SCOTT FRAGMENT', N'Jordan-1-low-travis-scott-fragment.png', 5750000, '2023-12-09', 1, N'1000',4600000)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1020, N'JORDAN 1 RETRO HIGH OG SP UNION LA SUPPLY THE SUMMER OF 96', N'JORDAN-1-RETRO-HIGH-OG-SP-UNION-LA-SUPPLY-THE-SUMMER-OF-96.png',4830000 , '2023-12-09', 1, N'1000','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1021, N'JORDAN 6 RETRO TRAVIS SCOTT BRITISH KHAKI', N'Jordan-6-Retro-Travis-Scott-British-Khaki.png', 3910000, '2023-12-09', 1, N'1000','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1022, N'NIKE AIR JORDAN 1 DIOR REPLICA', N'Nike-air-jordan-1-dior-replica.png', 4320000, '2023-12-09', 1, N'1000','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1023, N'NIKE AIR JORDAN 1 LOW DARK TEAL', N'Nike-air-jordan-1-low-dark-teal.png', 4370000, '2023-12-09', 1, N'1000',3496000)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1024, N'NIKE AIR JORDAN 1 LOW PURPLE MAGENTA', N'Nike-air-jordan-1-low-purple-magenta.png', 4830000, '2023-12-09',0, N'1000','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1025, N'NIKE AIR JORDAN 4 RETRO PINE GREEN', N'Nike-Air-Jordan-4-Retro-Pine-Green.png', 4830000, '2023-12-09', 1, N'1000','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1026, N'NIKE UNION LA X AIR JORDAN 1 BLUE TOE', N'Nike-Union-LA-x-Air-Jordan-1-Blue-Toe.png', 4600000, '2023-12-09', 1, N'1000','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1027, N'NIKE WMNS AIR JORDAN 1 LOW SIREN RED', N'Nike-Wmns-Air-Jordan-1-Low-Siren-Red.png', 5290000, '2023-12-09', 1, N'1000','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1028, N'TRAVIS SCOTT AIR JORDAN 1 LOW OLIVE', N'Travis-scott-air-jordan-1-low-olive.png', 4600000, '2023-12-09', 1, N'1000','')
go
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1100, N'AIR FORCE 1 NBY', N'AIR-FORCE 1-NBY-NAM.PNG', 2760000,'2023-12-09', 1, N'1001',2622000)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1101, N'AIR FORCE 1 FONTANKA', N'AIR-FORCE-1-FONTANKA-NAM.PNG', 3680000,'2023-12-09', 1, N'1001','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1102, N'AIR FORCE 1 LOW RETRO', N'AIR-FORCE-1-LOW-RETRO-NAM.PNG', 4370000,'2023-12-09',1, N'1001',3933000)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1103, N'AIR FORCE 1', N'AIR-FORCE-1-NAM1.PNG', 4320000, '2023-12-09', 1, N'1001','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1104, N'AIR FORCE 1', N'AIR-FORCE-1-NAM-NU.PNG', 3810000,'2023-12-09', 0, N'1001','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1105, N'AIR MAX 90', N'AIR-MAX-90-NAM.PNG', 2990000, '2023-12-09', 1, N'1001','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1106, N'AIR MAX EXCEE', N'AIR-MAX-EXCEE-NAM.PNG', 2500000,'2023-12-09', 1, N'1001',2250000)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1107, N'NIKE AIR FORCE 1 07', N'NIKE-AIR-FORCE-1-07-NAM.PNG', 2300000,'2023-12-09', 1, N'1001','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1108, N'NIKE AIR MAX 2017', N'NIKE-AIR-MAX-2017-NAM.PNG', 3560000, '2023-12-09', 1, N'1001','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1109, N'NIKE COURT ROYALE', N'NIKE-COURT-ROYALE-NAM.PNG', 4570000,'2023-12-09', 1, N'1001','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1110, N'NIKE DOWN SHIFTER 12', N'NIKE-DOWN-SHIFTER-12-NAM.PNG', 3450000,'2023-12-09', 1, N'1001','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1111, N'NIKE QUEST 4', N'NIKE-QUEST-4-NAM.PNG', 3950000,'2023-12-09', 0, N'1001','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1112, N'NIKE REVOLUTION 6 NN', N'NIKE-REVOLUTION-6-NN-NAM.PNG', 2320000,'2023-12-09', 1, N'1001','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1113, N'NIKE SB ALLEYOOP', N'NIKE-SB-ALLEYOOP-NAM.PNG', 3680000,'2023-12-09', 1, N'1001','')
go
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1114, N'NIKE AIR FORCE 1 WHITE RED', N'Nike-Air-Force-1-White-Red.png', 2760000, '2023-12-09',1, N'1001','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1115, N'NIKE AIR MAX 1 BLACK', N'Nike-Air-Max-1-Black.png', 4830000,'2023-12-09',1, N'1001','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1116, N'NIKE AIR MAX 270', N'Nike-Air-Max-270.png', 5750000,'2023-12-09',1, N'1001','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1117, N'NIKE AIR MAX 270 PINK', N'nike-air-max-270-hong.png', 3450000, '2023-12-09',1, N'1001','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1118, N'NIKE AIR ZOOM ALPHAFLY', N'Nike-Air-Zoom-Alphafly.png', 4370000, '2023-12-09',1, N'1001','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1119, N'NIKE COURT LEGACY', N'NiKe-COURT-LEGACY.png', 2990000, '2023-12-09',1, N'1001','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1120, N'NIKE FEAR OF GOD', N'NIKE-fear-of-god.png', 5520000, '2023-12-09',1, N'1001','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1121, N'NIKE KOBE 6 MAMBACITA', N'nike-kobe-6-mambacita.png', 3220000, '2023-12-09',1, N'1001','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1122, N'NIKE SACAI VAPORWFFLE SPORT FUCHSIA GAME ROYAL',N'Nike-sacai-Vaporwaffle-Sport-Fuchsia-Game-Royal.png', 5060000, '2023-12-09',1, N'1001','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1123, N'NIKE SB DUNK LOW BEN JERRYS CHUNKY DUNKY', N'nike-sb-dunk-low-ben-jerrys-chunky-dunky.png', 5750000, '2023-12-09',1, N'1001','')

INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1200, N'ADIDAS ADISTAR', N'ADIDAS_ADISTAR.png', 2760000,'2023-12-09', 1, N'1002','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1201, N'ADIDAS BOSTON 10', N'ADIDAS_BOSTON_10-(NAM).png', 2530000,'2023-12-09', 0, N'1002','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1202, N'ADIDAS GRAND COURT', N'ADIDAS_GRAND_COURT_(NAM).png', 3450000, '2023-12-09',1, N'1002','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1203, N'ADIDAS SAMBA CLASSIC', N'ADIDAS-SAMBA-CLASSIC-(NAM).png', 5060000,'2023-12-09', 1, N'1002','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1204, N'ADIDAS ULTRA 4D', N'ADIDAS-ULTRA-4D.png', 2760000,'2023-12-09', 1, N'1002','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1205, N'ALPHABOOST', N'ALPHABOOST-(NAM).png', 3220000, '2023-12-09', 1, N'1002','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1206, N'ASIDAS STAN SMITH', N'ASIDAS-STAN-SMITH-(NAM).png', 2640000, '2023-12-09',1, N'1002','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1207, N'FORUM LOW GREEN', N'FORUM-LOW-GREEN-(NAM).png', 3910000, '2023-12-09', 0, N'1002','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1208, N'NEW BALANCE 550 WHITE RED BLACK', N'NEW-BALANCE-550-WHITE-RED-BLACK-(NAM).png', 4025000,'2023-12-09', 1, N'1002','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1209, N'NMD R1 SPEVTOO', N'NMD_R1-SPEVTOO-(NAM).png', 4600000, '2023-12-09',1, N'1002','')
GO
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1210, N'NMD R1 V1 SILVER GOLD', N'NMD-R1.V1-SILVER-GOLD-(NAM).png', 5290000,'2023-12-09', 1, N'1002','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1211, N'SOLAR HU NMD', N'SOLAR-HU-NMD-(NAM).png', 3680000,'2023-12-09', 1, N'1002','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1212, N'X9000L4 ADIDAS', N'X9000L4-ADIDAS-(NAM).png', 2300000, '2023-12-09',1, N'1002','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1213, N'ADIDAS FORUM LOW CL', N'ADIDAS-FORUM-LOW-CL.png', 2640000, '2023-12-09',1, N'1002','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1214, N'ADIDAS GALAXY 6 W', N'ADIDAS-GALAXY-6-W-(NU).png', 3910000,'2023-12-09', 1, N'1002','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1215, N'ADIDAS GRADAS CLOUD WHITE', N'ADIDAS-GRADAS-CLOUD-WHITE-(NU).png', 4000000,'2023-12-09', 1, N'1002','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1216, N'ADIDAS PUREMOTION', N'ADIDAS-PUREMOTION-(NU).png', 4600000, '2023-12-09',1, N'1002','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1217, N'ADIDAS RUN FALCON 3.0', N'ADIDAS-RUN-FALCON-3.0.png', 5290000,'2023-12-09', 1, N'1002','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1218, N'EGDE LUX 4', N'EGDE-LUX-4-(NU).png', 2300000, '2023-12-09',0, N'1002','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1219, N'FALCON PINK PURPLE', N'FALCON-PINK-PURPLE-(NU).png', 2760000,'2023-12-09', 1, N'1002','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1220, N'FALCON W', N'FALCON-W.png', 2530000, '2023-12-09', 1, N'1002','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1221, N'FORUM LOW GREEN', N'FORUM-LOW-GREEN-(NU).png', 3450000, '2023-12-09',1, N'1002','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1222, N'NMD R1 SPECTOO', N'NMD_R1-SPECTOO-(NU).png', 5750000,'2023-12-09', 1, N'1002','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1223, N'SN1997 X MARIMEKKO', N'SN1997-X-MARIMEKKO-(NU).png', 2760000,'2023-12-09', 1, N'1002','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1224, N'ULTRABOOST 20 BLUE BOOST', N'ULTRABOOST-20-BLUE-BOOST-(NU).png', 4800000, '2023-12-09',1, N'1002',4080000)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1225, N'ULTRABOOST 20 METALLIC GOLD', N'ULTRABOOST-20-METALLIC-GOLD-(NU).png', 2990000,'2023-12-09', 1, N'1002','')
GO
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1226, N'ADIDAS 4DFWD 2 WHITE POWER BLUE', N'Adidas-4DFWD-2-White-Power-Blue.png', 2760000, '2023-12-09',0, N'1002','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1227, N'ADIDAS 4DFWD PILSE 2 OFF WHITE', N'Adidas-4DFWD-Pulse-2-Off-White.PNG', 2940000, '2023-12-09',1, N'1002','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1228, N'ADIDAS 4DFWD PILSE 2 SHADOW NAVY PURPLE METALLIC', N'Adidas-4DFWD-Pulse-2-Shadow-Navy-Purple-Metallic.png', 4830000, '2023-12-09',1, N'1002',3864000)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1229, N'ADIDAS ALPHABOUNCE INSTINCT CARBON', N'Adidas-Alphabounce-Instinct-Carbon.png', 3200000, '2023-12-09',1, N'1002',2880000)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1230, N'ADIDAS PARLEY X SUPERNOVA 2', N'Adidas-Parley-x-Supernova-2.png', 3910000, '2023-12-09',1, N'1002','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1231, N'ADIDAS PHARRELL X SOLAR HU BLACK FUTURE', N'Adidas-Pharrell-x-Solar-Hu-Black-Future.png', 4600000, '2023-12-09',1, N'1002','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1232, N'ADIDAS SOLAR GLIDE 5 GREY SIX', N'Adidas-Solar-Glide-5-Grey-Six.png', 3450000, '2023-12-09',1, N'1002','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1233, N'ADIDAS SUPERNOVA GORE TEX BLACK SILVER METALLIC', N'Adidas-Supernova-GORE-TEX-Black-Silver-Metallic.png', 3450000, '2023-12-09',1, N'1002','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1234, N'ADIDAS SUPERSTAR BEAM GREEN', N'Adidas-Superstar-Beam-Green.png', 5080000, '2023-12-09',1, N'1002','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1235, N'ADIDAS SUPERSTAR METALLIC 3 STRIPES', N'Adidas-Superstar-Metallic-3-Stripes.png', 5520000, '2023-12-09',1, N'1002','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1236, N'ADIDAS SUPERSTAR ORIGINALS CLOUD WHITE', N'Adidas-Superstar-Originals-Cloud-White.png', 4600000, '2023-12-09',1, N'1002','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1237, N'ADIDAS TERREX AGRAVIC FLOW 2 TRAIL', N'Adidas-Terrex-Agravic-Flow-2-Trail.png', 4140000, '2023-12-09',1, N'1002','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1238, N'ADIDAS TERREX AX3 GREY', N'Adidas-Terrex-AX3-Grey.png', 5060000, '2023-12-09',1, N'1002','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1239, N'ADIDAS ULTRABOOST 21 WHITE SCREAMING GREEN', N'Adidas-UltraBoost-21-White-Screaming-Green.png', 2990000, '2023-12-09',1, N'1002','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1240, N'ADIDAS ULTRABOOST 22 COLD', N'Adidas-UltraBoost-22-Cold.RDY-2.png', 2920000, '2023-12-09',1, N'1002','')
GO
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1300, N'YEEZY 700 V3 SAFFLOWER', N'YEEZY-700-V3-SAFFLOWER.PNG', 2760000, '2023-12-09', 0, N'1003','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1301, N'YEEZY BOOS 380', N'YEEZY-BOOS-380.PNG', 2550000, '2023-12-09', 1, N'1003','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1302, N'YEEZY BOOST 350', N'YEEZY-BOOST-350.PNG', 4200000,'2023-12-09', 1, N'1003',3360000)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1303, N'YEEZY BOOST 350 PIRATE-BLACK', N'YEEZY-BOOST-350-PIRATE-BLACK.PNG', 2760000, '2023-12-09', 1, N'1003','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1304, N'YEEZY BOOST 350 V2.1', N'YEEZY-BOOST-350-V2.1.PNG', 2640000, '2023-12-09', 1, N'1003','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1305, N'YEEZY BOOST 350 V2.3', N'YEEZY-BOOST-350-V2.3.PNG', 2760000, '2023-12-09', 1, N'1003','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1306, N'YEEZY BOOST 350 V2', N'YEEZY-BOOST-350-V2.PNG', 2340000, '2023-12-09', 1, N'1003','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1307, N'YEEZY BOOST 350 V2 BLACK RED', N'YEEZY-BOOST-350-V2-BLACK-RED.PNG', 2430000,'2023-12-09', 1, N'1003','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1308, N'YEEZY BOOST 350 V2 BONE', N'YEEZY-BOOST-350-V2-BONE.PNG', 2990000, '2023-12-09', 1, N'1003','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1309, N'YEEZY BOOST 350 V2 DAZZLING BLUE', N'YEEZY-BOOST-350-V2-DAZZLING-BLUE.PNG', 3330000,'2023-12-09', 1, N'1003',2997000)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1310, N'YEEZY BOOST 350 V2 NATURAL', N'YEEZY-BOOST-350-V2-NATURAL.PNG', 3680000,'2023-12-09', 1, N'1003','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1311, N'YEEZY BOOST 350 V2 ONYX', N'YEEZY-BOOST-350-V2-ONYX.PNG', 2530000, '2023-12-09', 1, N'1003','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1312, N'YEEZY BOOST 350 V2 YEEZREEL', N'YEEZY-BOOST-350-V2-YEEZREEL.PNG', 2990000, '2023-12-09', 1, N'1003','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1313, N'YEEZY BOOST 350 VE BELUGA REFLECTIVE', N'YEEZY-BOOST-350-VE-BELUGA-REFLECTIVE.PNG', 2870000, '2023-12-09', 1, N'1003','')
go
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1314, N'YEEZY 350 CREAM WHITE', N'yeezy-350-cream-white.png', 4140000,'2023-12-09', 1, N'1003','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1315, N'YEEZY 350 V2 BLACK', N'yeezy-350-v2-black.png', 2760000, '2023-12-09', 1, N'1003','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1316, N'YEEZY 350 V2', N'yeezy-350-v2.png', 2660000, '2023-12-09', 1, N'1003',2394000)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1317, N'YEEZY 350 TAIL LIGHT', N'yeezy-350-tail-light.png', 2760000, '2023-12-09', 0, N'1003','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1318, N'YEEZY 350 V2 MX', N'yeezy-350-v2-mx.png', 2480000, '2023-12-09', 1, N'1003','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1319, N'YEEZY 700 V2 INTERTIA', N'yeezy-700-v2-inertia.png', 2410000,'2023-12-09', 1, N'1003','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1320, N'YEEZY 700 V2 VANTA', N'yeezy-700-v2-vanta.png', 2990000, '2023-12-09', 1, N'1003','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1321, N'YEEZY BOOST 350 V2', N'Yeezy-Boost-350-V2.png', 3330000,'2023-12-09', 1, N'1003','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1322, N'YEEZY BOOST 350 V2 YECHEIL', N'Yeezy-Boost-350-V2-Yecheil.png', 3680000,'2023-12-09', 1, N'1003','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1323, N'YEEZY BOOST 700', N'Yeezy-Boost-700.png', 3680000,'2023-12-09', 1, N'1003',2944000)
go
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1400, N'BALENCIAGA 3XL SNEAKERS', N'BALENCIAGA-3XL-SNEAKERS.PNG', 2500000, '2023-12-09', 1, N'1004','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1401, N'BALENCIAGA MAN BLACK AND WHITE', N'Balenciaga-Man-Black-And-White.PNG', 2800000, '2023-12-09', 1, N'1004','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1402, N'BALENCIAGA TRACK 3.0', N'Balenciaga-track-3-0.PNG', 2600000, '2023-12-09', 0, N'1004','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1403, N'BALENCIAGA TRACK 3.0 BLACK YELLOW', N'Balenciaga-track-3-0-den-le-vang.PNG', 2900000, '2023-12-09', 1, N'1004','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1404, N'BALENCIAGA TRACK 3.0 WHITE', N'Balenciaga-track-3-0-white.PNG', 3000000, '2023-12-09', 1, N'1004',2700000)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1405, N'BALENCIAGA TRACK ORANGE WHITE', N'Balenciaga-track-orange-white.PNG', 2650000, '2023-12-09', 1, N'1004','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1406, N'BALENCIAGA TRACK SNEAKER FULL BACK', N'Balenciaga-track-sneaker-full-black.PNG', 3160000, '2023-12-09', 1, N'1004','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1407, N'BALENCIAGA TRIPLE S', N'Balenciaga-triple-s.PNG', 3180000, '2023-12-09', 1, N'1004','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1408, N'BALENCIAGA TRIPLE S AIRSOLE SNEAKER WHITE GREY', N'BALENCIAGA-TRIPLE-S-AIRSOLE-SNEAKER-WHITE-&-GREY.PNG', 3330000, '2023-12-09', 1, N'1004','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1409, N'BALENCIAGA TRIPLE S BEIGE CREAM GREY BLACK', N'Balenciaga-triple-s-beige-cream-grey-black.PNG', 3500000, '2023-12-09', 1, N'1004',3150000)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1410, N'BALENCIAGA TRIPLE S BLACK', N'Balenciaga-triple-s-black.PNG', 3230000, '2023-12-09', 1, N'1004','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1411, N'BALENCIAGA TRIPLE S CLEAR SOLE SNEAKER IN BROWN', N'BALENCIAGA-TRIPLE-S-CLEAR-SOLE-SNEAKER-IN-BROWN.PNG', 2880000, '2023-12-09', 1, N'1004','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1412, N'BALENCIAGA TRIPLE S CLEAR SOLE SNEAKER IN GRAY WHITE', N'BALENCIAGA-TRIPLE-S-CLEAR-SOLE-SNEAKER-IN-GRAY-WHITE.PNG', 2220000, '2023-12-09', 0, N'1004','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1413, N'BALENCIAGA TRIPLE S CLEAR SOLE SNEAKER IN NAVY', N'BALENCIAGA-TRIPLE-S-CLEAR-SOLE-SNEAKER-IN-NAVY.PNG', 3650000, '2023-12-09', 1, N'1004','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1414, N'BALENCIAGA TRIPLE S PINK', N'Balenciaga-triple-s-de-khi-hong-ban-i8.PNG', 3500000, '2023-12-09', 1, N'1004','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1415, N'BALENCIAGA TRIPLE S PINK WHITE BLUE', N'Balenciaga-triple-s-de-khi-hong-trang-xanh.PNG', 4500000, '2023-12-09', 1, N'1004',4050000)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1416, N'BALENCIAGA TRIPLE S SPLIT BASE', N'Balenciaga-triple-s-de-tach.PNG', 2160000, '2023-12-09', 1, N'1004','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1417, N'BALENCIAGA TRIPLE S WHITE', N'Balenciaga-triple-s-white.PNG', 2670000, '2023-12-09', 1, N'1004','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1418, N'BALENCIAGA X ADIDAS TRIPLE S WHITE', N'Balenciaga-X-Adidas-Triple-S-White.PNG', 3750000, '2023-12-09', 1, N'1004','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1419, N'BALENCIAGA X ADIDAS TRIPLE S BLACK', N'Balenciaga-X-Adidas-Triple-S-Black.PNG', 3800000, '2023-12-09', 1, N'1004','')
GO
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1500, N'CONVERSE CDG PLAY X CHUCK TAYLOR 1970s CREAM WHITE 70 LOW', N'Converse-CDG-Play-X-Chuck-Taylor-1970s-Cream-White-70-Low.PNG', 2030000,'2023-12-09', 1, N'1005','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1501, N'CONVERSE CHUCK 70 HYBRID FLORAL LOW TOP', N'Converse-Chuck-70-Hybrid-Floral-Low-Top.PNG', 2700000,'2023-12-09', 1, N'1005',2430000)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1502, N'CONVERSE CHUCK 1970S HIGH ALL WHITE', N'Converse-Chuck-1970s-High-All-White.PNG', 3220000,'2023-12-09', 1, N'1005','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1503, N'CONVERSE CHUCK TAYLOR ALL STAR', N'Converse-Chuck-Taylor-All-Star.PNG', 2450000,'2023-12-09', 1, N'1005',2205000)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1504, N'CONVERSE CHUCK TAYLOR ALL-STAR 1970S COLORS VINTAGE CANVAS', N'Converse-Chuck-Taylor-All-Star-1970s-Colors-Vintage-Canvas.PNG', 2000000,'2023-12-09', 1, N'1005','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1505, N'CONVERSE CHUCK TAYLOR ALL STAR 1970S LOW SUNFLOWER', N'Converse-Chuck-Taylor-All-Star-1970s-Low-Sunflower.PNG', 2800000,'2023-12-09', 1, N'1005',2520000)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1506, N'CONVERSE CHUCK TAYLOR ALL STAR 1970S MIDNIGHT CLOVER', N'Converse-Chuck-Taylor-All-Star-1970s-Midnight-Clover.PNG', 2220000,'2023-12-09', 0, N'1005',1998000)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1507, N'CONVERSE CHUCK TAYLOR ALL STAR ALL WHITE', N'Converse-Chuck-Taylor-All-Star-All-White.PNG', 4670000,'2023-12-09', 1, N'1005',4203000)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1508, N'CONVERSE CHUCK TAYLOR ALL STAR CX', N'Converse-Chuck-Taylor-All-Star-CX.PNG', 3250000,'2023-12-09', 1, N'1005','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1509, N'CONVERSE CHUCK TAYLOR ALL STAR RENEW', N'Converse-Chuck-Taylor-All-Star-Renew.PNG', 3700000,'2023-12-09', 1, N'1005',3330000)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1510, N'CONVERSE M9166 CHUCK TAYLOR ALL STAR OX BAJO TOP NEGRO ZAPATILLAS', N'Converse-M9166-Chuck-Taylor-All-Star-OX-Bajo-Top-Negro-Zapatillas.PNG', 2870000,'2023-12-09', 1, N'1005','')
GO
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1600, N'MLB BIGBALL CHUNKY A CLASSIC 3D LOGO NEW YORK YANKEES WHITE', N'MLB-Bigball-Chunky-A-Classic-3D-Logo-New-York-Yankees-White.PNG', 3230000,'2023-12-09', 1, N'1006',2907000)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1601, N'MLB BIGBALL CHUNKY A CLEVELAND GUARDIANS', N'MLB-BigBall-Chunky-A-Cleveland-Guardians.PNG', 2030000,'2023-12-09', 1, N'1006','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1602, N'MLB BIGBALL CHUNKY A GRADIENT CLASSIC MONOGRAM NEW YORK YANKEES', N'MLB-BigBall-Chunky-A-Gradient-Classic-Monogram-New-York-Yankees.PNG', 2131000,'2023-12-09', 1, N'1006','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1603, N'MLB BIGBALL CHUNKY A LOS ANGELES ANGEL IVORY', N'MLB-BigBall-Chunky-A-Los-Angeles-Angels-Ivory.PNG', 1340000,'2023-12-09', 1, N'1006','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1604, N'MLB BIGBALL CHUNKY A NEW YORK', N'MLB-BigBall-Chunky-A-New-York.PNG', 1200000,'2023-12-09', 1, N'1006','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1605, N'MLB BIGBALL CHUNKY A NY YANKEES', N'MLB-BigBall-Chunky-A-NY-Yankees.PNG', 1020000,'2023-12-09', 0, N'1006','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1606, N'MLB BIGBALL CHUNKY BOSTON RED SOX', N'MLB-BigBall-Chunky-Boston-Red-Sox.PNG', 1450000,'2023-12-09', 1, N'1006','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1607, N'MLB BIGBALL CHUNKY CUBE MONOGRAM NEW YORK YANKEES', N'MLB-BigBall-Chunky-Cube-Monogram-New-York-Yankees.PNG', 2340000,'2023-12-09', 1, N'1006',1989000)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1608, N'MLB BIGBALL CHUNKY EMBO NEW YORK YANKEES', N'MLB-BigBall-Chunky-Embo-New-York-Yankees.PNG', 2310000,'2023-12-09', 10, N'1006','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1609, N'MLB BIGBALL CHUNKY LITE SD NEW YORK YANKEES SHOES', N'MLB-BigBall-Chunky-Lite-SD-New-York-Yankees-Shoes.PNG', 5480000,'2023-12-09', 0, N'1006',4384000)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1610, N'MLB BIGBALL CHUNKY LT NEW YANKEES', N'MLB-BigBall-Chunky-LT-New-Yankees.PNG', 1720000,'2023-12-09', 1, N'1006','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1611, N'MLB BIGBALL CHUNKY MASK NEW YORK YANKE', N'MLB-BigBall-Chunky-Mask-New-York-Yanke.PNG', 3890000,'2023-12-09', 1, N'1006','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1612, N'MLB BIGBALL CHUNKY MESH NEW YORK YANKEES', N'MLB-Bigball-Chunky-Mesh-New-York-Yankees.PNG', 2000000,'2023-12-09', 1, N'1006','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1613, N'MLB BIGBALL CHUNKY MICKEY NEW YORK YANKESS', N'MLB-BigBall-Chunky-Mickey-NewYork-Yankess.PNG', 2020000,'2023-12-09', 1, N'1006','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1614, N'MLB BIGBALL CHUNKY MONO LT', N'MLB-Bigball-Chunky-Mono-LT.PNG', 2450000,'2023-12-09', 1, N'1006',2205000)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1615, N'MLB BIGBALL CHUNKY NY 2020', N'MLB-BigBall-Chunky–NY-2020.PNG', 2000000,'2023-12-09', 1, N'1006',1800000)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1616, N'MLB BIGBALL CHUNKY P', N'MLB-BigBall-Chunky-P.PNG', 2320000,'2023-12-09', 1, N'1006','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1617, N'MLB BIGBALL CHUNKY P BOSTON', N'MLB-BigBall-Chunky-P-Boston.PNG',4650000,'2023-12-09', 1, N'1006',4185000)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1618, N'MLB BIGBALL CHUNKY P MEGA BOSTON RED SOX', N'MLB-BigBall-Chunky-P-Mega-Boston-Red-Sox.PNG', 1450000,'2023-12-09', 1, N'1006','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1619, N'MLB BIGBALL CHUNKY P MEGA NEW YORK YANKEES', N'MLB-Big-Ball-Chunky-P-Mega-New-York-Yankees.PNG', 2820000,'2023-12-09', 1, N'1006','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1620, N'MLB BIGBALL CHUNKY SAFFIANO DIAMOND MONOGRAM NEW YORK', N'MLB-BigBall-Chunky-Saffiano-Diamond-Monogram-New-York.PNG', 1200000,'2023-12-09', 1, N'1006','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1621, N'MLB BIGBALL CHUNKY SCREEN NEW YORK', N'MLB-BigBall-Chunky-Screen-New-York-Yankees.PNG', 3300000,'2023-12-09', 1, N'1006','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1622, N'MLB CHUNKY CLASSIC P BOSTON RED SOX', N'MLB-Chunky-Classic-P-Boston-Red-Sox.PNG', 2620000,'2023-12-09', 1, N'1006','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1623, N'MLB CHUNKY CLASSIC P LA DODGER D.BLUE', N'MLB-Chunky-Classic-P-LA-Dodger-DBlue.PNG', 1990000,'2023-12-09', 1, N'1006','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1624, N'MLB CHUNKY HIGH LIGHT PAISLEY NEW YORK YANKEES', N'MLB-Chunky-High-Light-Paisley-New-York-Yankees.PNG', 1750000,'2023-12-09', 1, N'1006','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1625, N'MLB CHUNKY LINER BASIC SD NEW YORK', N'MLB-Chunky-Liner-Basic-SD-New-York.PNG', 1650000,'2023-12-09', 1, N'1006','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1626, N'MLB CHUNKY LINER DIAMOND MONOGRAM BOSTON RED SOX', N'MLB-Chunky-Liner-Diamond-Monogram-Boston-Red-Sox.PNG', 2400000,'2023-12-09', 1, N'1006','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1627, N'MLB CHUNKY LINER HIGH BOSTON RED SOX', N'MLB-Chunky-Liner-High-Boston-Red-Sox.PNG', 2500000,'2023-12-09', 1, N'1006','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1628, N'MLB CHUNKY LINER HIGHT NEW YORK YANKEES', N'MLB-Chunky-Liner-High-New-York-Yankees.PNG', 1670000,'2023-12-09', 1, N'1006','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1629, N'MLB CHUNKY RUNNER BASIC LA DODGERS IVORY', N'MLB-Chunky-Runner-Basic-LA-Dodgers-Ivory.PNG', 2640000,'2023-12-09', 0, N'1006','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1630, N'MLB CHUNKY WIDE NEW YORK YANKEES', N'MLB-Chunky-Wide-New-York-Yankees.PNG', 2560000,'2023-12-09', 1, N'1006','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1631, N'MLB LA DODGERS', N'MLB-LA-Dodgers.PNG', 2890000,'2023-12-09', 1, N'1006','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1632, N'MLB LINER BASIC', N'MLB-Liner-Basic.PNG', 1560000,'2023-12-09', 1, N'1006','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1633, N'MLB LINER BASIC NEW YORK YANKEES', N'MLB-Liner-Basic-New-York-Yankees.PNG', 1300000,'2023-12-09',1, N'1006','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1634, N'MLB NEW YORK YANKEES', N'MLB-New-York-Yankees.PNG', 1880000,'2023-12-09', 1, N'1006','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1635, N'SNEAKER MLB BIGBALL CHUNKY LITE LA DODGERS GREY', N'Sneaker-MLB-Bigball-Chunky-Lite-LA-Dodgers-Grey.PNG', 2070000,'2023-12-09', 1, N'1006','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1636, N'SNEAKER MLB LA BIGBALL CHUNKY A', N'Sneaker-MLB-LA-Big-Ball-Chunky-A.PNG', 2000000,'2023-12-09', 0, N'1006','')
go
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1700, N'PUMA ANZARUN OPEN ROAD', N'Puma-Anzarun-Open-Road.PNG', 2000000,'2023-12-09', 0, N'1007','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1701, N'PUMA BETTER FOAM EMERGE', N'Puma-Better-Foam-Emerge.PNG', 2200000,'2023-12-09', 1, N'1007',1980000)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1702, N'PUMA CELL SPEED', N'Puma-Cell-Speed-Blue-White-Green.PNG', 1520000,'2023-12-09', 1, N'1007','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1703, N'PUMA CLUB NYLON SNEAKERS', N'Puma-Club-Nylon-Sneakers.PNG', 1420000,'2023-12-09', 1, N'1007','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1704, N'PUMA CLYDE NYE', N'Puma-Clyde-NYE.PNG', 2340000,'2023-12-09', 1, N'1007','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1705, N'PUMA DRIVE FUSION TECH', N'Puma-Drive-Fusion-Tech.PNG', 2450000,'2023-12-09', 1, N'1007','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1706, N'PUMA ERUPT TRAIL RUNNING SHOES', N'Puma-Erupt-Trail-Running-Shoes.PNG', 2230000,'2023-12-09', 1, N'1007','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1707, N'PUMA HYBRID RUNNER DESERT', N'Puma-Hybrid-Runner-Desert.PNG', 2880000,'2023-12-09', 1, N'1007','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1708, N'PUMA IGNITE FLASH FS', N'Puma-Ignite-Flash-FS.PNG', 2220000,'2023-12-09', 10, N'1007','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1709, N'PUMA ROMA MERCEDES AMG PETRONAS', N'Puma-Roma-Mercedes-AMG-Petronas.PNG', 2000000,'2023-12-09', 1, N'1007','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1710, N'PUMA RS-X 3D SHOES', N'Puma-RS-X-3D-Shoes.PNG', 2400000,'2023-12-09', 1, N'1007','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1711, N'PUMA RS-X EFEKT TURBO', N'Puma-Rs-X-Efekt-Turbo.PNG', 3000000,'2023-12-09', 1, N'1007','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1712, N'PUMA RS-Z AS', N'Puma-RS-Z-AS.PNG', 2100000,'2023-12-09', 1, N'1007','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1713, N'PUMA SF PITLANE NIGHT', N'Puma-SF-Pitlane-Night.PNG', 3250000,'2023-12-09', 1, N'1007','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1714, N'PUMA SUEDE CLASSIC COLORED', N'Puma-Suede-Classic-Colored.PNG', 3600000,'2023-12-09', 1, N'1007',3060000)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1715, N'PUMA SUEDE CLASSIC X PEPSI', N'Puma-Suede-Classic-X-Pepsi.PNG', 1890000,'2023-12-09', 1, N'1007','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1716, N'PUMA SUEDE CROC', N'Puma-Suede-Croc.PNG', 1560000,'2023-12-09',0, N'1007','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1717, N'PUMA UNISEX SOFTRIDE VITAL CAT RUNNING SHOES', N'Puma-Unisex-Softride-Vital-Cat-Running-Shoes.PNG', 2000000,'2023-12-09', 1, N'1007','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1718, N'PUMA UPRISE KNIT', N'Puma-Uprise-Knit.PNG', 1830000,'2023-12-09', 1, N'1007','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1719, N'PUMA V COURT BULK EB SNEAKERS', N'Puma-V-Court-Bulk-EB-Sneakers.PNG', 2300000,'2023-12-09', 1, N'1007','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1720, N'PUMA X-RAY ROYAL HIGH RISK RED', N'Puma-X-Ray-Royal-High-Risk-Red.PNG', 2600000,'2023-12-09', 1, N'1007','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1721, N'UNISEX PUMA RS-X 3D HARBO MIST', N'Unisex-Puma-RS-X-3D-Harbo-Mist.PNG', 2330000,'2023-12-09', 1, N'1007','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1722, N'UNISEX PUMA RS-X TRACKS', N'Unisex-Puma-RS-X-Tracks.PNG', 2650000,'2023-12-09', 1, N'1007',2385000)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1723, N'UNISEX RS-X EFEKT GRADIENT', N'Unisex-RSX-Efekt-Gradient.PNG', 2780000,'2023-12-09', 1, N'1007','')
go
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1800, N'VANS AUTHENTIC', N'Vans-Authentic.PNG', 3200000,'2023-12-09', 1, N'1008','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1801, N'VANS CLASSIC SK8 HI BLACK WHITE', N'Vans-Classic-SK8-HI-Black-White.PNG', 2700000,'2023-12-09', 1, N'1008',2295000)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1802, N'VANS MN ROWAN PRO', N'Vans-MN-Rowan-Pro.PNG', 2530000,'2023-12-09', 1, N'1008','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1803, N'VANS OLD SKOOL SF STYLE 36 MIX & MATCH', N'Vans-Old Skool-SF-Style-36-Mix-&-match.PNG', 3530000,'2023-12-09', 1, N'1008',3177000)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1804, N'VANS OLD SKOOL', N'Vans-Old-Skool.PNG', 2870000,'2023-12-09', 0, N'1008','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1805, N'VANS OLD SKOOL BLACK WHITE', N'Vans-Old-Skool-Black-White.PNG', 3250000,'2023-12-09', 1, N'1008',2925000)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1806, N'VANS OLD SKOOL FLAME All BLACK', N'Vans-Old-Skool-Flame-All-Black.PNG', 2630000,'2023-12-09', 1, N'1008','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1807, N'VANS OLD SKOOL STYLE 36 CLASSIC SPORT', N'Vans-Old-Skool-Style-36-Classic-Sport.PNG', 3500000,'2023-12-09', 1, N'1008',2975000)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1808, N'VANS OLD SKOOL TIERRA WHACK', N'Vans-Old-Skool-Tierra-Whack.PNG', 2270000,'2023-12-09', 1, N'1008','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1809, N'VANS OLD SKOOL X J.CREW RED ORCHE', N'Vans-Old-Skool-X-J.Crew-Red-Orche.PNG', 4420000,'2023-12-09', 1, N'1008','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1810, N'VANS SENTRY OLD SKOOL', N'Vans-Sentry-Old-Skool.PNG', 2900000,'2023-12-09', 1, N'1008',2610000)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1811, N'VANS SK8 LOW BLACK', N'Vans-Sk8-Low-Black.PNG', 3520000,'2023-12-09', 1, N'1008','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1812, N'VANS SPORT SUEDE', N'Vans-Sport-Suede.PNG', 2200000,'2023-12-09', 1, N'1008','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1813, N'VANS UA CLASSIC SLIP ON WE ARE BEAUTIFUL', N'Vans-UA-Classic-Slip-On We-Are-Beautiful.PNG', 3730000,'2023-12-09', 1, N'1008',2984000)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1814, N'VANS UA OLD SKOOL CRYSTAL SIDESTRIPE', N'Vans-Ua-Old-Skool-Crystal-Sidestripe.PNG', 2710000,'2023-12-09', 1, N'1008','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1815, N'Vans UA OLD SKOOL STYLE 36 SE BIKES', N'Vans-UA-Old-Skool-Style-36-SE-Bikes.PNG', 3520000,'2023-12-09', 1, N'1008','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1816, N'VANS UA OLD SKOOL VANS COLLAGE', N'Vans-UA-Old-Skool-Vans-Collage.PNG', 3200000,'2023-12-09', 1, N'1008','')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1817, N'VANS UA OLD SKOOL VR3 GROWTH GARDEN VR3', N'Vans-UA-Old-Skool-VR3-Growth-Garden-VR3.PNG', 2000000,'2023-12-09', 1, N'1008',1800000)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1818, N'VANS UA SK8 HI LOGO REPEAT', N'VANS-UA-SK8-HI-LOGO-REPEAT.PNG', 1950000,'2023-12-09', 1, N'1008',1755000)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId],[priceSale]) VALUES (1819, N'VANS WARD LOW TOP SNEAKE BLACK WHITE', N'Vans-Ward-Low-Top-Sneake- Black-White.PNG', 3530000,'2023-12-09', 1, N'1008','')

SET IDENTITY_INSERT [dbo].[Products] OFF

/****** Insert:  Table [dbo].[Orders]    Script Date: 09/29/2021 20:07:02 PM ******/
GO
INSERT [dbo].[Status]([Id],[Status]) VALUES(1,N'Đang Xử lí')
INSERT [dbo].[Status]([Id],[Status]) VALUES(2,N'Đang Giao Hàng')
INSERT [dbo].[Status]([Id],[Status]) VALUES(3,N'Đã hoàn hành')
/****** Insert:  Table [dbo].[Orders]    Script Date: 09/29/2021 20:07:02 PM ******/
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 
INSERT [dbo].[Orders] ([Id], [Username], [Fullname], [CreateDate] ,[Phone], [Address],[StatusId] ) VALUES (100, N'TamTam', N'Nguyễn Tâm Tâm', '2023-12-11', N'0974273333', N'12 Trần Quang Diệu , Quảng Ngãi','1')
INSERT [dbo].[Orders] ([Id], [Username], [Fullname], [CreateDate] ,[Phone], [Address],[StatusId] ) VALUES (101, N'KhanhHo', N'Hồ Văn Khánh','2023-12-10', N'0859170777', N'195 Gò Vấp , Tp Hồ Chí Minh','3')
INSERT [dbo].[Orders] ([Id], [Username], [Fullname], [CreateDate] ,[Phone], [Address],[StatusId] ) VALUES (102, N'LamLe', N'Lê Cao Lâm', '2023-12-11', N'0856296777', N'34/12 Tân Thới Hiệp , Tp Hồ Chí Minh','1')
INSERT [dbo].[Orders] ([Id], [Username], [Fullname], [CreateDate], [Phone], [Address],[StatusId] ) VALUES (103, N'PhongTran',N'Trần Phạm Thế Phong', '2023-12-12', N'0915770055', N'12 Quang Trung , Sóc Trăng','1')
INSERT [dbo].[Orders] ([Id], [Username], [Fullname], [CreateDate], [Phone], [Address],[StatusId] ) VALUES (104, N'TrungHuynh', N'Huỳnh Minh Trung', '2023-12-14', N'0989117799', N'343/73 Nguyễn Trọng Tuyển , TP Hồ Chí Minh','1')
SET IDENTITY_INSERT [dbo].[Orders] OFF

/****** Insert:  Table [dbo].[OrderDetails]    Script Date: 09/29/2021 20:07:02 PM ******/
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (1000, 100, 1201, 2760000, 2)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (1001, 101, 1202, 2530000, 1)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (1002, 102, 1102, 4370000, 2)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (1003, 103, 1301, 2550000, 2)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (1004, 104, 1301, 2550000, 1)
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
GO



