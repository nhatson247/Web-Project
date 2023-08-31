SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Categories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](255) NULL,
	[ParentCategoryId] [int] NULL,
 CONSTRAINT [PK__Categori__19093A2B930B6DD6] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Countries](
	[CountryName] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_Countries] PRIMARY KEY CLUSTERED 
(
	[CountryName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Customers](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerName] [nvarchar](255) NOT NULL,
	[ContactName] [nvarchar](255) NOT NULL,
	[Address] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[PostalCode] [nvarchar](255) NULL,
	[Country] [nvarchar](255) NULL,
	[Email] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
 CONSTRAINT [PK__Customer__A4AE64B875C16EF9] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Employees](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[LastName] [nvarchar](255) NOT NULL,
	[FirstName] [nvarchar](255) NOT NULL,
	[BirthDate] [date] NULL,
	[Photo] [nvarchar](255) NULL,
	[Notes] [ntext] NULL,
	[Email] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
 CONSTRAINT [PK__Employee__7AD04FF19DF2ECC8] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [OrderDetails](
	[OrderDetailID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[SalePrice] [money] NULL,
 CONSTRAINT [PK__OrderDet__D3B9D30CFA2E64CC] PRIMARY KEY CLUSTERED 
(
	[OrderDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NULL,
	[OrderTime] [datetime] NOT NULL,
	[EmployeeID] [int] NULL,
	[AcceptTime] [datetime] NULL,
	[ShipperID] [int] NULL,
	[ShippedTime] [datetime] NULL,
	[FinishedTime] [datetime] NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK__Orders__C3905BAF123F60F0] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [OrderStatus](
	[Status] [int] NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_OrderStatus] PRIMARY KEY CLUSTERED 
(
	[Status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ProductAttributes](
	[AttributeID] [bigint] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[AttributeName] [nvarchar](255) NOT NULL,
	[AttributeValue] [nvarchar](max) NOT NULL,
	[DisplayOrder] [int] NOT NULL,
 CONSTRAINT [PK_ProductAttributes] PRIMARY KEY CLUSTERED 
(
	[AttributeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ProductPhotos](
	[PhotoID] [bigint] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[Photo] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](255) NOT NULL,
	[DisplayOrder] [int] NOT NULL,
	[IsHidden] [bit] NOT NULL,
 CONSTRAINT [PK_ProductGallery] PRIMARY KEY CLUSTERED 
(
	[PhotoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](255) NOT NULL,
	[SupplierID] [int] NULL,
	[CategoryID] [int] NULL,
	[Unit] [nvarchar](255) NOT NULL,
	[Price] [money] NOT NULL,
	[Photo] [nvarchar](255) NULL,
 CONSTRAINT [PK__Products__B40CC6ED62D75622] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Shippers](
	[ShipperID] [int] IDENTITY(1,1) NOT NULL,
	[ShipperName] [nvarchar](255) NOT NULL,
	[Phone] [nvarchar](255) NULL,
 CONSTRAINT [PK__Shippers__1F8AFFB9B7DFE051] PRIMARY KEY CLUSTERED 
(
	[ShipperID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Suppliers](
	[SupplierID] [int] IDENTITY(1,1) NOT NULL,
	[SupplierName] [nvarchar](255) NOT NULL,
	[ContactName] [nvarchar](255) NOT NULL,
	[Address] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[PostalCode] [nvarchar](255) NULL,
	[Country] [nvarchar](255) NULL,
	[Phone] [nvarchar](255) NULL,
 CONSTRAINT [PK__Supplier__4BE6669444240C78] PRIMARY KEY CLUSTERED 
(
	[SupplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [Categories] ON 
GO
INSERT [Categories] ([CategoryID], [CategoryName], [Description], [ParentCategoryId]) VALUES (1, N'Beverages', N'Soft drinks, coffees, teas, beers, and ales', NULL)
GO
INSERT [Categories] ([CategoryID], [CategoryName], [Description], [ParentCategoryId]) VALUES (2, N'Condiments', N'Sweet and savory sauces, relishes, spreads, and seasonings', NULL)
GO
INSERT [Categories] ([CategoryID], [CategoryName], [Description], [ParentCategoryId]) VALUES (3, N'Confections', N'Desserts, candies, and sweet breads', NULL)
GO
INSERT [Categories] ([CategoryID], [CategoryName], [Description], [ParentCategoryId]) VALUES (4, N'Dairy Products', N'Cheeses', NULL)
GO
INSERT [Categories] ([CategoryID], [CategoryName], [Description], [ParentCategoryId]) VALUES (5, N'Grains/Cereals', N'Breads, crackers, pasta, and cereal', NULL)
GO
INSERT [Categories] ([CategoryID], [CategoryName], [Description], [ParentCategoryId]) VALUES (6, N'Meat/Poultry', N'Prepared meats', NULL)
GO
INSERT [Categories] ([CategoryID], [CategoryName], [Description], [ParentCategoryId]) VALUES (7, N'Produce', N'Dried fruit and bean curd', NULL)
GO
INSERT [Categories] ([CategoryID], [CategoryName], [Description], [ParentCategoryId]) VALUES (8, N'Seafood', N'Seaweed and fish', NULL)
GO
SET IDENTITY_INSERT [Categories] OFF
GO
INSERT [Countries] ([CountryName]) VALUES (N'Argentina')
GO
INSERT [Countries] ([CountryName]) VALUES (N'Australia')
GO
INSERT [Countries] ([CountryName]) VALUES (N'Austria')
GO
INSERT [Countries] ([CountryName]) VALUES (N'Belgium')
GO
INSERT [Countries] ([CountryName]) VALUES (N'Brazil')
GO
INSERT [Countries] ([CountryName]) VALUES (N'Canada')
GO
INSERT [Countries] ([CountryName]) VALUES (N'Denmark')
GO
INSERT [Countries] ([CountryName]) VALUES (N'Finland')
GO
INSERT [Countries] ([CountryName]) VALUES (N'France')
GO
INSERT [Countries] ([CountryName]) VALUES (N'Germany')
GO
INSERT [Countries] ([CountryName]) VALUES (N'Ireland')
GO
INSERT [Countries] ([CountryName]) VALUES (N'Italy')
GO
INSERT [Countries] ([CountryName]) VALUES (N'Japan')
GO
INSERT [Countries] ([CountryName]) VALUES (N'Mexico')
GO
INSERT [Countries] ([CountryName]) VALUES (N'Netherlands')
GO
INSERT [Countries] ([CountryName]) VALUES (N'Norway')
GO
INSERT [Countries] ([CountryName]) VALUES (N'Poland')
GO
INSERT [Countries] ([CountryName]) VALUES (N'Portugal')
GO
INSERT [Countries] ([CountryName]) VALUES (N'Singapore')
GO
INSERT [Countries] ([CountryName]) VALUES (N'Spain')
GO
INSERT [Countries] ([CountryName]) VALUES (N'Sweden')
GO
INSERT [Countries] ([CountryName]) VALUES (N'Switzerland')
GO
INSERT [Countries] ([CountryName]) VALUES (N'UK')
GO
INSERT [Countries] ([CountryName]) VALUES (N'USA')
GO
INSERT [Countries] ([CountryName]) VALUES (N'Venezuela')
GO
INSERT [Countries] ([CountryName]) VALUES (N'Vietnam')
GO
SET IDENTITY_INSERT [Customers] ON 
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country], [Email], [Password]) VALUES (1, N'Alfreds Futterkiste', N'Maria Anders', N'Obere Str. 57', N'Franfurk', N'12209', N'Germany', NULL, NULL)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country], [Email], [Password]) VALUES (2, N'Ana Trujillo Emparedados y helados', N'Ana Trujillo', N'Avda. de la Constitución 2222', N'México D.F.', N'05021', N'Mexico', NULL, NULL)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country], [Email], [Password]) VALUES (3, N'Antonio Moreno Taquería', N'Antonio Moreno', N'Mataderos 2312', N'México D.F.', N'05023', N'Mexico', NULL, NULL)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country], [Email], [Password]) VALUES (4, N'Around the Horn', N'Thomas Hardy', N'120 Hanover Sq.', N'London', N'WA1 1DP', N'UK', NULL, NULL)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country], [Email], [Password]) VALUES (5, N'Berglunds snabbköp', N'Christina Berglund', N'Berguvsvägen 8', N'Luleå', N'S-958 22', N'Sweden', NULL, NULL)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country], [Email], [Password]) VALUES (6, N'Blauer See Delikatessen', N'Hanna Moos', N'Forsterstr. 57', N'Mannheim', N'68306', N'Germany', NULL, NULL)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country], [Email], [Password]) VALUES (7, N'Blondel père et fils', N'Frédérique Citeaux', N'24, place Kléber', N'Strasbourg', N'67000', N'France', NULL, NULL)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country], [Email], [Password]) VALUES (8, N'Bólido Comidas preparadas', N'Martín Sommer', N'C/ Araquil, 67', N'Madrid', N'28023', N'Spain', NULL, NULL)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country], [Email], [Password]) VALUES (9, N'Bon app''', N'Laurence Lebihans', N'12, rue des Bouchers', N'Marseille', N'13008', N'France', NULL, NULL)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country], [Email], [Password]) VALUES (10, N'Bottom-Dollar Marketse', N'Elizabeth Lincoln', N'23 Tsawassen Blvd.', N'Tsawassen', N'T2F 8M4', N'Canada', NULL, NULL)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country], [Email], [Password]) VALUES (11, N'B''s Beverages', N'Victoria Ashworth', N'Fauntleroy Circus', N'London', N'EC2 5NT', N'UK', NULL, NULL)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country], [Email], [Password]) VALUES (12, N'Cactus Comidas para llevar', N'Patricio Simpson', N'Cerrito 333', N'Buenos Aires', N'1010', N'Argentina', NULL, NULL)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country], [Email], [Password]) VALUES (13, N'Centro comercial Moctezuma', N'Francisco Chang', N'Sierras de Granada 9993', N'México D.F.', N'05022', N'Mexico', NULL, NULL)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country], [Email], [Password]) VALUES (14, N'Chop-suey Chinese', N'Yang Wang', N'Hauptstr. 29', N'Bern', N'3012', N'Switzerland', NULL, NULL)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country], [Email], [Password]) VALUES (15, N'Comércio Mineiro', N'Pedro Afonso', N'Av. dos Lusíadas, 23', N'São Paulo', N'05432-043', N'Brazil', NULL, NULL)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country], [Email], [Password]) VALUES (16, N'Consolidated Holdings', N'Elizabeth Brown', N'Berkeley Gardens 12 Brewery', N'London', N'WX1 6LT', N'UK', NULL, NULL)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country], [Email], [Password]) VALUES (17, N'Drachenblut Delikatessend', N'Sven Ottlieb', N'Walserweg 21', N'Aachen', N'52066', N'Germany', NULL, NULL)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country], [Email], [Password]) VALUES (18, N'Du monde entier', N'Janine Labrune', N'67, rue des Cinquante Otages', N'Nantes', N'44000', N'France', NULL, NULL)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country], [Email], [Password]) VALUES (19, N'Eastern Connection', N'Ann Devon', N'35 King George', N'London', N'WX3 6FW', N'UK', NULL, NULL)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country], [Email], [Password]) VALUES (20, N'Ernst Handel', N'Roland Mendel', N'Kirchgasse 6', N'Graz', N'8010', N'Austria', NULL, NULL)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country], [Email], [Password]) VALUES (21, N'Familia Arquibaldo', N'Aria Cruz', N'Rua Orós, 92', N'São Paulo', N'05442-030', N'Brazil', NULL, NULL)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country], [Email], [Password]) VALUES (22, N'FISSA Fabrica Inter. Salchichas S.A.', N'Diego Roel', N'C/ Moralzarzal, 86', N'Madrid', N'28034', N'Spain', NULL, NULL)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country], [Email], [Password]) VALUES (23, N'Folies gourmandes', N'Martine Rancé', N'184, chaussée de Tournai', N'Lille', N'59000', N'France', NULL, NULL)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country], [Email], [Password]) VALUES (24, N'Folk och fä HB', N'Maria Larsson', N'Åkergatan 24', N'Bräcke', N'S-844 67', N'Sweden', NULL, NULL)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country], [Email], [Password]) VALUES (25, N'Frankenversand', N'Peter Franken', N'Berliner Platz 43', N'München', N'80805', N'Germany', NULL, NULL)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country], [Email], [Password]) VALUES (26, N'France restauration', N'Carine Schmitt', N'54, rue Royale', N'Nantes', N'44000', N'France', NULL, NULL)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country], [Email], [Password]) VALUES (27, N'Franchi S.p.A.', N'Paolo Accorti', N'Via Monte Bianco 34', N'Torino', N'10100', N'Italy', NULL, NULL)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country], [Email], [Password]) VALUES (28, N'Furia Bacalhau e Frutos do Mar', N'Lino Rodriguez', N'Jardim das rosas n. 32', N'Lisboa', N'1675', N'Portugal', NULL, NULL)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country], [Email], [Password]) VALUES (29, N'Galería del gastrónomo', N'Eduardo Saavedra', N'Rambla de Cataluña, 23', N'Barcelona', N'08022', N'Spain', NULL, NULL)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country], [Email], [Password]) VALUES (30, N'Godos Cocina Típica', N'José Pedro Freyre', N'C/ Romero, 33', N'Sevilla', N'41101', N'Spain', NULL, NULL)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country], [Email], [Password]) VALUES (31, N'Gourmet Lanchonetes', N'André Fonseca', N'Av. Brasil, 442', N'Campinas', N'04876-786', N'Brazil', NULL, NULL)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country], [Email], [Password]) VALUES (32, N'Great Lakes Food Market', N'Howard Snyder', N'2732 Baker Blvd.', N'Eugene', N'97403', N'USA', NULL, NULL)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country], [Email], [Password]) VALUES (33, N'GROSELLA-Restaurante', N'Manuel Pereira', N'5ª Ave. Los Palos Grandes', N'Caracas', N'1081', N'Venezuela', NULL, NULL)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country], [Email], [Password]) VALUES (34, N'Hanari Carnes', N'Mario Pontes', N'Rua do Paço, 67', N'Rio de Janeiro', N'05454-876', N'Brazil', NULL, NULL)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country], [Email], [Password]) VALUES (35, N'HILARIÓN-Abastos', N'Carlos Hernández', N'Carrera 22 con Ave. Carlos Soublette #8-35', N'San Cristóbal', N'5022', N'Venezuela', NULL, NULL)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country], [Email], [Password]) VALUES (36, N'Hungry Coyote Import Store', N'Yoshi Latimer', N'City Center Plaza 516 Main St.', N'Elgin', N'97827', N'USA', NULL, NULL)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country], [Email], [Password]) VALUES (37, N'Hungry Owl All-Night Grocers', N'Patricia McKenna', N'8 Johnstown Road', N'Cork', N'', N'Ireland', NULL, NULL)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country], [Email], [Password]) VALUES (38, N'Island Trading', N'Helen Bennett', N'Garden House Crowther Way', N'Cowes', N'PO31 7PJ', N'UK', NULL, NULL)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country], [Email], [Password]) VALUES (39, N'Königlich Essen', N'Philip Cramer', N'Maubelstr. 90', N'Brandenburg', N'14776', N'Germany', NULL, NULL)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country], [Email], [Password]) VALUES (40, N'La corne d''abondance', N'Daniel Tonini', N'67, avenue de l''Europe', N'Versailles', N'78000', N'France', NULL, NULL)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country], [Email], [Password]) VALUES (41, N'La maison d''Asie', N'Annette Roulet', N'1 rue Alsace-Lorraine', N'Toulouse', N'31000', N'France', NULL, NULL)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country], [Email], [Password]) VALUES (42, N'Laughing Bacchus Wine Cellars', N'Yoshi Tannamuri', N'1900 Oak St.', N'Vancouver', N'V3F 2K1', N'Canada', NULL, NULL)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country], [Email], [Password]) VALUES (43, N'Lazy K Kountry Store', N'John Steel', N'12 Orchestra Terrace', N'Walla Walla', N'99362', N'USA', NULL, NULL)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country], [Email], [Password]) VALUES (44, N'Lehmanns Marktstand', N'Renate Messner', N'Magazinweg 7', N'Frankfurt a.M.', N'60528', N'Germany', NULL, NULL)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country], [Email], [Password]) VALUES (45, N'Let''s Stop N Shop', N'Jaime Yorres', N'87 Polk St. Suite 5', N'San Francisco', N'94117', N'USA', NULL, NULL)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country], [Email], [Password]) VALUES (46, N'LILA-Supermercado', N'Carlos González', N'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', N'Barquisimeto', N'3508', N'Venezuela', NULL, NULL)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country], [Email], [Password]) VALUES (47, N'LINO-Delicateses', N'Felipe Izquierdo', N'Ave. 5 de Mayo Porlamar', N'I. de Margarita', N'4980', N'Venezuela', NULL, NULL)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country], [Email], [Password]) VALUES (48, N'Lonesome Pine Restaurant', N'Fran Wilson', N'89 Chiaroscuro Rd.', N'Portland', N'97219', N'USA', NULL, NULL)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country], [Email], [Password]) VALUES (49, N'Magazzini Alimentari Riuniti', N'Giovanni Rovelli', N'Via Ludovico il Moro 22', N'Bergamo', N'24100', N'Italy', NULL, NULL)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country], [Email], [Password]) VALUES (50, N'Maison Dewey', N'Catherine Dewey', N'Rue Joseph-Bens 532', N'Bruxelles', N'B-1180', N'Belgium', NULL, NULL)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country], [Email], [Password]) VALUES (51, N'Mère Paillarde', N'Jean Fresnière', N'43 rue St. Laurent', N'Montréal', N'H1J 1C3', N'Canada', NULL, NULL)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country], [Email], [Password]) VALUES (52, N'Morgenstern Gesundkost', N'Alexander Feuer', N'Heerstr. 22', N'Leipzig', N'04179', N'Germany', NULL, NULL)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country], [Email], [Password]) VALUES (53, N'North/South', N'Simon Crowther', N'South House 300 Queensbridge', N'London', N'SW7 1RZ', N'UK', NULL, NULL)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country], [Email], [Password]) VALUES (54, N'Océano Atlántico Ltda.', N'Yvonne Moncada', N'Ing. Gustavo Moncada 8585 Piso 20-A', N'Buenos Aires', N'1010', N'Argentina', NULL, NULL)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country], [Email], [Password]) VALUES (55, N'Old World Delicatessen', N'Rene Phillips', N'2743 Bering St.', N'Anchorage', N'99508', N'USA', NULL, NULL)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country], [Email], [Password]) VALUES (56, N'Ottilies Käseladen', N'Henriette Pfalzheim', N'Mehrheimerstr. 369', N'Köln', N'50739', N'Germany', NULL, NULL)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country], [Email], [Password]) VALUES (57, N'Paris spécialités', N'Marie Bertrand', N'265, boulevard Charonne', N'Paris', N'75012', N'France', NULL, NULL)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country], [Email], [Password]) VALUES (58, N'Pericles Comidas clásicas', N'Guillermo Fernández', N'Calle Dr. Jorge Cash 321', N'México D.F.', N'05033', N'Mexico', NULL, NULL)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country], [Email], [Password]) VALUES (59, N'Piccolo und mehr', N'Georg Pipps', N'Geislweg 14', N'Salzburg', N'5020', N'Austria', NULL, NULL)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country], [Email], [Password]) VALUES (60, N'Princesa Isabel Vinhoss', N'Isabel de Castro', N'Estrada da saúde n. 58', N'Lisboa', N'1756', N'Portugal', NULL, NULL)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country], [Email], [Password]) VALUES (61, N'Que Delícia', N'Bernardo Batista', N'Rua da Panificadora, 12', N'Rio de Janeiro', N'02389-673', N'Brazil', NULL, NULL)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country], [Email], [Password]) VALUES (62, N'Queen Cozinha', N'Lúcia Carvalho', N'Alameda dos Canàrios, 891', N'São Paulo', N'05487-020', N'Brazil', NULL, NULL)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country], [Email], [Password]) VALUES (63, N'QUICK-Stop', N'Horst Kloss', N'Taucherstraße 10', N'Cunewalde', N'01307', N'Germany', NULL, NULL)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country], [Email], [Password]) VALUES (64, N'Rancho grande', N'Sergio Gutiérrez', N'Av. del Libertador 900', N'Buenos Aires', N'1010', N'Argentina', NULL, NULL)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country], [Email], [Password]) VALUES (65, N'Rattlesnake Canyon Grocery', N'Paula Wilson', N'2817 Milton Dr.', N'Albuquerque', N'87110', N'USA', NULL, NULL)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country], [Email], [Password]) VALUES (66, N'Reggiani Caseifici', N'Maurizio Moroni', N'Strada Provinciale 124', N'Reggio Emilia', N'42100', N'Italy', NULL, NULL)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country], [Email], [Password]) VALUES (67, N'Ricardo Adocicados', N'Janete Limeira', N'Av. Copacabana, 267', N'Rio de Janeiro', N'02389-890', N'Brazil', NULL, NULL)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country], [Email], [Password]) VALUES (68, N'Richter Supermarkt', N'Michael Holz', N'Grenzacherweg 237', N'Genève', N'1203', N'Switzerland', NULL, NULL)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country], [Email], [Password]) VALUES (69, N'Romero y tomillo', N'Alejandra Camino', N'Gran Vía, 1', N'Madrid', N'28001', N'Spain', NULL, NULL)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country], [Email], [Password]) VALUES (70, N'Santé Gourmet', N'Jonas Bergulfsen', N'Erling Skakkes gate 78', N'Stavern', N'4110', N'Norway', NULL, NULL)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country], [Email], [Password]) VALUES (71, N'Save-a-lot Markets', N'Jose Pavarotti', N'187 Suffolk Ln.', N'Boise', N'83720', N'USA', NULL, NULL)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country], [Email], [Password]) VALUES (72, N'Seven Seas Imports', N'Hari Kumar', N'90 Wadhurst Rd.', N'London', N'OX15 4NB', N'UK', NULL, NULL)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country], [Email], [Password]) VALUES (73, N'Simons bistro', N'Jytte Petersen', N'Vinbæltet 34', N'København', N'1734', N'Denmark', NULL, NULL)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country], [Email], [Password]) VALUES (74, N'Spécialités du monde', N'Dominique Perrier', N'25, rue Lauriston', N'Paris', N'75016', N'France', NULL, NULL)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country], [Email], [Password]) VALUES (75, N'Split Rail Beer & Ale', N'Art Braunschweiger', N'P.O. Box 555', N'Lander', N'82520', N'USA', NULL, NULL)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country], [Email], [Password]) VALUES (76, N'Suprêmes délices', N'Pascale Cartrain', N'Boulevard Tirou, 255', N'Charleroi', N'B-6000', N'Belgium', NULL, NULL)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country], [Email], [Password]) VALUES (77, N'The Big Cheese', N'Liz Nixon', N'89 Jefferson Way Suite 2', N'Portland', N'97201', N'USA', NULL, NULL)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country], [Email], [Password]) VALUES (78, N'The Cracker Box', N'Liu Wong', N'55 Grizzly Peak Rd.', N'Butte', N'59801', N'USA', NULL, NULL)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country], [Email], [Password]) VALUES (79, N'Toms Spezialitäten', N'Karin Josephs', N'Luisenstr. 48', N'Münster', N'44087', N'Germany', NULL, NULL)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country], [Email], [Password]) VALUES (80, N'Tortuga Restaurante', N'Miguel Angel Paolino', N'Avda. Azteca 123', N'México D.F.', N'05033', N'Mexico', NULL, NULL)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country], [Email], [Password]) VALUES (81, N'Tradição Hipermercados', N'Anabela Domingues', N'Av. Inês de Castro, 414', N'São Paulo', N'05634-030', N'Brazil', NULL, NULL)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country], [Email], [Password]) VALUES (82, N'Trail''s Head Gourmet Provisioners', N'Helvetius Nagy', N'722 DaVinci Blvd.', N'Kirkland', N'98034', N'USA', NULL, NULL)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country], [Email], [Password]) VALUES (83, N'Vaffeljernet', N'Palle Ibsen', N'Smagsløget 45', N'Århus', N'8200', N'Denmark', NULL, NULL)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country], [Email], [Password]) VALUES (84, N'Victuailles en stock', N'Mary Saveley', N'2, rue du Commerce', N'Lyon', N'69004', N'France', NULL, NULL)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country], [Email], [Password]) VALUES (85, N'Vins et alcools Chevalier', N'Paul Henriot', N'59 rue de l''Abbaye', N'Reims', N'51100', N'France', NULL, NULL)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country], [Email], [Password]) VALUES (86, N'Die Wandernde Kuh', N'Rita Müller', N'Adenauerallee 900', N'Stuttgart', N'70563', N'Germany', NULL, NULL)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country], [Email], [Password]) VALUES (87, N'Wartian Herkku', N'Pirkko Koskitalo', N'Torikatu 38', N'Oulu', N'90110', N'Finland', NULL, NULL)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country], [Email], [Password]) VALUES (88, N'Wellington Importadora', N'Paula Parente', N'Rua do Mercado, 12', N'Resende', N'08737-363', N'Brazil', NULL, NULL)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country], [Email], [Password]) VALUES (89, N'White Clover Markets', N'Karl Jablonski', N'305 - 14th Ave. S. Suite 3B', N'Seattle', N'98128', N'USA', NULL, NULL)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country], [Email], [Password]) VALUES (90, N'Wilman Kala', N'Matti Karttunen', N'Keskuskatu 45', N'Helsinki', N'21240', N'Finland', NULL, NULL)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country], [Email], [Password]) VALUES (91, N'Wolski', N'Zbyszek', N'ul. Filtrowa 68', N'Walla', N'01-012', N'Poland', NULL, NULL)
GO
SET IDENTITY_INSERT [Customers] OFF
GO
SET IDENTITY_INSERT [Employees] ON 
GO
INSERT [Employees] ([EmployeeID], [LastName], [FirstName], [BirthDate], [Photo], [Notes], [Email], [Password]) VALUES (1, N'Davolio', N'Nancy', CAST(N'1968-12-08' AS Date), N'http://dummyimage.com/140x180.png/cc0000/ffffff&text=Employee Photo', N'Education includes a BA in psychology from Colorado State University. She also completed (The Art of the Cold Call). Nancy is a member of ''Toastmasters International''.', N'nancy.davolio@liteshop.com', N'e10adc3949ba59abbe56e057f20f883e')
GO
INSERT [Employees] ([EmployeeID], [LastName], [FirstName], [BirthDate], [Photo], [Notes], [Email], [Password]) VALUES (2, N'Fuller', N'Andrew', CAST(N'1952-02-19' AS Date), N'http://dummyimage.com/140x180.png/5fa2dd/ffffff&text=Employee Photo', N'Andrew received his BTS commercial and a Ph.D. in international marketing from the University of Dallas. He is fluent in French and Italian and reads German. He joined the company as a sales representative, was promoted to sales manager and was then named vice president of sales. Andrew is a member of the Sales Management Roundtable, the Seattle Chamber of Commerce, and the Pacific Rim Importers Association.', N'andrew.fuller@liteshop.com', N'e10adc3949ba59abbe56e057f20f883e')
GO
INSERT [Employees] ([EmployeeID], [LastName], [FirstName], [BirthDate], [Photo], [Notes], [Email], [Password]) VALUES (3, N'Leverling', N'Janet', CAST(N'1963-08-30' AS Date), N'http://dummyimage.com/140x180.png/5fa2dd/ffffff&text=Employee Photo', N'Janet has a BS degree in chemistry from Boston College). She has also completed a certificate program in food retailing management. Janet was hired as a sales associate and was promoted to sales representative.', N'janet.leverling@liteshop.com', N'e10adc3949ba59abbe56e057f20f883e')
GO
INSERT [Employees] ([EmployeeID], [LastName], [FirstName], [BirthDate], [Photo], [Notes], [Email], [Password]) VALUES (4, N'Peacock', N'Margaret', CAST(N'1958-09-19' AS Date), N'http://dummyimage.com/140x180.png/5fa2dd/ffffff&text=Employee Photo', N'Margaret holds a BA in English literature from Concordia College and an MA from the American Institute of Culinary Arts. She was temporarily assigned to the London office before returning to her permanent post in Seattle.', N'margaret.peacock@liteshop.com', N'e10adc3949ba59abbe56e057f20f883e')
GO
INSERT [Employees] ([EmployeeID], [LastName], [FirstName], [BirthDate], [Photo], [Notes], [Email], [Password]) VALUES (5, N'Buchanan', N'Steven', CAST(N'1955-03-04' AS Date), N'http://dummyimage.com/140x180.png/cc0000/ffffff&text=Employee Photo', N'Steven Buchanan graduated from St. Andrews University, Scotland, with a BSC degree. Upon joining the company as a sales representative, he spent 6 months in an orientation program at the Seattle office and then returned to his permanent post in London, where he was promoted to sales manager. Mr. Buchanan has completed the courses ''Successful Telemarketing'' and ''International Sales Management''. He is fluent in French.', N'steven.buchanan@liteshop.com', N'e10adc3949ba59abbe56e057f20f883e')
GO
INSERT [Employees] ([EmployeeID], [LastName], [FirstName], [BirthDate], [Photo], [Notes], [Email], [Password]) VALUES (6, N'Suyama', N'Michael', CAST(N'1963-07-02' AS Date), N'http://dummyimage.com/140x180.png/ff4444/ffffff&text=Employee Photo', N'Michael is a graduate of Sussex University (MA, economics) and the University of California at Los Angeles (MBA, marketing). He has also taken the courses ''Multi-Cultural Selling'' and ''Time Management for the Sales Professional''. He is fluent in Japanese and can read and write French, Portuguese, and Spanish.', N'michael.suyama@liteshop.com', N'e10adc3949ba59abbe56e057f20f883e')
GO
INSERT [Employees] ([EmployeeID], [LastName], [FirstName], [BirthDate], [Photo], [Notes], [Email], [Password]) VALUES (7, N'King', N'Robert', CAST(N'1960-05-29' AS Date), N'http://dummyimage.com/140x180.png/ff4444/ffffff&text=Employee Photo', N'Robert King served in the Peace Corps and traveled extensively before completing his degree in English at the University of Michigan and then joining the company. After completing a course entitled ''Selling in Europe'', he was transferred to the London office.', N'robert.king@liteshop.com', N'e10adc3949ba59abbe56e057f20f883e')
GO
INSERT [Employees] ([EmployeeID], [LastName], [FirstName], [BirthDate], [Photo], [Notes], [Email], [Password]) VALUES (8, N'Callahan', N'Laura', CAST(N'1958-01-09' AS Date), N'http://dummyimage.com/140x180.png/ff4444/ffffff&text=Employee Photo', N'Laura received a BA in psychology from the University of Washington. She has also completed a course in business French. She reads and writes French.', N'laura.callahan@liteshop.com', N'e10adc3949ba59abbe56e057f20f883e')
GO
INSERT [Employees] ([EmployeeID], [LastName], [FirstName], [BirthDate], [Photo], [Notes], [Email], [Password]) VALUES (9, N'Dodsworth', N'Anne', CAST(N'1969-07-02' AS Date), N'http://dummyimage.com/140x180.png/ff4444/ffffff&text=Employee Photo', N'Anne has a BA degree in English from St. Lawrence College. She is fluent in French and German.', N'anne.dodsworth@liteshop.com', N'e10adc3949ba59abbe56e057f20f883e')
GO
INSERT [Employees] ([EmployeeID], [LastName], [FirstName], [BirthDate], [Photo], [Notes], [Email], [Password]) VALUES (10, N'West', N'Adam', CAST(N'1928-09-19' AS Date), N'https://dummyimage.com/140x180.png/ffff00/ff0000&text=Employee Photo', N'An old chum.', N'adam.west@liteshop.com', N'e10adc3949ba59abbe56e057f20f883e')
GO
SET IDENTITY_INSERT [Employees] OFF
GO
SET IDENTITY_INSERT [OrderDetails] ON 
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (1, 10248, 11, 12, 21.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (2, 10248, 42, 10, 14.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (3, 10248, 72, 5, 34.8000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (4, 10249, 14, 9, 23.2500)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (5, 10249, 51, 40, 53.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (6, 10250, 41, 10, 9.6500)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (7, 10250, 51, 35, 53.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (8, 10250, 65, 15, 21.0500)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (9, 10251, 22, 6, 21.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (10, 10251, 57, 15, 19.5000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (11, 10251, 65, 20, 21.0500)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (12, 10252, 20, 40, 81.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (13, 10252, 33, 25, 2.5000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (14, 10252, 60, 40, 34.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (15, 10253, 31, 20, 12.5000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (16, 10253, 39, 42, 18.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (17, 10253, 49, 40, 20.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (18, 10254, 24, 15, 4.5000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (19, 10254, 55, 21, 24.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (20, 10254, 74, 21, 10.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (21, 10255, 2, 20, 19.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (22, 10255, 16, 35, 17.4500)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (23, 10255, 36, 25, 19.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (24, 10255, 59, 30, 55.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (25, 10256, 53, 15, 32.8000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (26, 10256, 77, 12, 13.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (27, 10257, 27, 25, 43.9000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (28, 10257, 39, 6, 18.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (29, 10257, 77, 15, 13.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (30, 10258, 2, 50, 19.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (31, 10258, 5, 65, 21.3500)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (32, 10258, 32, 6, 32.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (33, 10259, 21, 10, 10.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (34, 10259, 37, 1, 26.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (35, 10260, 41, 16, 9.6500)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (36, 10260, 57, 50, 19.5000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (37, 10260, 62, 15, 49.3000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (38, 10260, 70, 21, 15.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (39, 10261, 21, 20, 10.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (40, 10261, 35, 20, 18.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (41, 10262, 5, 12, 21.3500)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (42, 10262, 7, 15, 30.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (43, 10262, 56, 2, 38.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (44, 10263, 16, 60, 17.4500)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (45, 10263, 24, 28, 4.5000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (46, 10263, 30, 60, 25.8900)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (47, 10263, 74, 36, 10.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (48, 10264, 2, 35, 19.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (49, 10264, 41, 25, 9.6500)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (50, 10265, 17, 30, 39.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (51, 10265, 70, 20, 15.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (52, 10266, 12, 12, 38.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (53, 10267, 40, 50, 18.4000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (54, 10267, 59, 70, 55.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (55, 10267, 76, 15, 18.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (56, 10268, 29, 10, 123.7900)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (57, 10268, 72, 4, 34.8000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (58, 10269, 33, 60, 2.5000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (59, 10269, 72, 20, 34.8000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (60, 10270, 36, 30, 19.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (61, 10270, 43, 25, 46.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (62, 10271, 33, 24, 2.5000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (63, 10272, 20, 6, 81.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (64, 10272, 31, 40, 12.5000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (65, 10272, 72, 24, 34.8000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (66, 10273, 10, 24, 31.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (67, 10273, 31, 15, 12.5000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (68, 10273, 33, 20, 2.5000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (69, 10273, 40, 60, 18.4000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (70, 10273, 76, 33, 18.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (71, 10274, 71, 20, 21.5000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (72, 10274, 72, 7, 34.8000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (73, 10275, 24, 12, 4.5000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (74, 10275, 59, 6, 55.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (75, 10276, 10, 15, 31.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (76, 10276, 13, 10, 6.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (77, 10277, 28, 20, 45.6000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (78, 10277, 62, 12, 49.3000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (79, 10278, 44, 16, 19.4500)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (80, 10278, 59, 15, 55.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (81, 10278, 63, 8, 43.9000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (82, 10278, 73, 25, 15.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (83, 10279, 17, 15, 39.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (84, 10280, 24, 12, 4.5000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (85, 10280, 55, 20, 24.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (86, 10280, 75, 30, 7.7500)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (87, 10281, 19, 1, 9.2000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (88, 10281, 24, 6, 4.5000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (89, 10281, 35, 4, 18.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (90, 10282, 30, 6, 25.8900)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (91, 10282, 57, 2, 19.5000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (92, 10283, 15, 20, 15.5000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (93, 10283, 19, 18, 9.2000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (94, 10283, 60, 35, 34.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (95, 10283, 72, 3, 34.8000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (96, 10284, 27, 15, 43.9000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (97, 10284, 44, 21, 19.4500)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (98, 10284, 60, 20, 34.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (99, 10284, 67, 5, 14.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (100, 10285, 1, 45, 18.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (101, 10285, 40, 40, 18.4000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (102, 10285, 53, 36, 32.8000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (103, 10286, 35, 100, 18.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (104, 10286, 62, 40, 49.3000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (105, 10287, 16, 40, 17.4500)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (106, 10287, 34, 20, 14.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (107, 10287, 46, 15, 12.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (108, 10288, 54, 10, 7.4500)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (109, 10288, 68, 3, 12.5000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (110, 10289, 3, 30, 10.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (111, 10289, 64, 9, 33.2500)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (112, 10290, 5, 20, 21.3500)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (113, 10290, 29, 15, 123.7900)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (114, 10290, 49, 15, 20.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (115, 10290, 77, 10, 13.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (116, 10291, 13, 20, 6.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (117, 10291, 44, 24, 19.4500)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (118, 10291, 51, 2, 53.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (119, 10292, 20, 20, 81.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (120, 10293, 18, 12, 62.5000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (121, 10293, 24, 10, 4.5000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (122, 10293, 63, 5, 43.9000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (123, 10293, 75, 6, 7.7500)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (124, 10294, 1, 18, 18.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (125, 10294, 17, 15, 39.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (126, 10294, 43, 15, 46.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (127, 10294, 60, 21, 34.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (128, 10294, 75, 6, 7.7500)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (129, 10295, 56, 4, 38.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (130, 10296, 11, 12, 21.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (131, 10296, 16, 30, 17.4500)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (132, 10296, 69, 15, 36.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (133, 10297, 39, 60, 18.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (134, 10297, 72, 20, 34.8000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (135, 10298, 2, 40, 19.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (136, 10298, 36, 40, 19.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (137, 10298, 59, 30, 55.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (138, 10298, 62, 15, 49.3000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (139, 10299, 19, 15, 9.2000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (140, 10299, 70, 20, 15.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (141, 10300, 66, 30, 17.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (142, 10300, 68, 20, 12.5000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (143, 10301, 40, 10, 18.4000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (144, 10301, 56, 20, 38.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (145, 10302, 17, 40, 39.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (146, 10302, 28, 28, 45.6000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (147, 10302, 43, 12, 46.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (148, 10303, 40, 40, 18.4000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (149, 10303, 65, 30, 21.0500)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (150, 10303, 68, 15, 12.5000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (151, 10304, 49, 30, 20.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (152, 10304, 59, 10, 55.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (153, 10304, 71, 2, 21.5000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (154, 10305, 18, 25, 62.5000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (155, 10305, 29, 25, 123.7900)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (156, 10305, 39, 30, 18.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (157, 10306, 30, 10, 25.8900)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (158, 10306, 53, 10, 32.8000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (159, 10306, 54, 5, 7.4500)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (160, 10307, 62, 10, 49.3000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (161, 10307, 68, 3, 12.5000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (162, 10308, 69, 1, 36.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (163, 10308, 70, 5, 15.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (164, 10309, 4, 20, 22.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (165, 10309, 6, 30, 25.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (166, 10309, 42, 2, 14.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (167, 10309, 43, 20, 46.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (168, 10309, 71, 3, 21.5000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (169, 10310, 16, 10, 17.4500)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (170, 10310, 62, 5, 49.3000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (171, 10311, 42, 6, 14.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (172, 10311, 69, 7, 36.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (173, 10312, 28, 4, 45.6000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (174, 10312, 43, 24, 46.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (175, 10312, 53, 20, 32.8000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (176, 10312, 75, 10, 7.7500)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (177, 10313, 36, 12, 19.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (178, 10314, 32, 40, 32.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (179, 10314, 58, 30, 13.2500)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (180, 10314, 62, 25, 49.3000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (181, 10315, 34, 14, 14.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (182, 10315, 70, 30, 15.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (183, 10316, 41, 10, 9.6500)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (184, 10316, 62, 70, 49.3000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (185, 10317, 1, 20, 18.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (186, 10318, 41, 20, 9.6500)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (187, 10318, 76, 6, 18.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (188, 10319, 17, 8, 39.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (189, 10319, 28, 14, 45.6000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (190, 10319, 76, 30, 18.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (191, 10320, 71, 30, 21.5000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (192, 10321, 35, 10, 18.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (193, 10322, 52, 20, 7.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (194, 10323, 15, 5, 15.5000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (195, 10323, 25, 4, 14.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (196, 10323, 39, 4, 18.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (197, 10324, 16, 21, 17.4500)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (198, 10324, 35, 70, 18.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (199, 10324, 46, 30, 12.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (200, 10324, 59, 40, 55.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (201, 10324, 63, 80, 43.9000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (202, 10325, 6, 6, 25.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (203, 10325, 13, 12, 6.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (204, 10325, 14, 9, 23.2500)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (205, 10325, 31, 4, 12.5000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (206, 10325, 72, 40, 34.8000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (207, 10326, 4, 24, 22.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (208, 10326, 57, 16, 19.5000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (209, 10326, 75, 50, 7.7500)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (210, 10327, 2, 25, 19.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (211, 10327, 11, 50, 21.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (212, 10327, 30, 35, 25.8900)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (213, 10327, 58, 30, 13.2500)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (214, 10328, 59, 9, 55.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (215, 10328, 65, 40, 21.0500)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (216, 10328, 68, 10, 12.5000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (217, 10329, 19, 10, 9.2000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (218, 10329, 30, 8, 25.8900)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (219, 10329, 38, 20, 263.5000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (220, 10329, 56, 12, 38.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (221, 10330, 26, 50, 31.2300)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (222, 10330, 72, 25, 34.8000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (223, 10331, 54, 15, 7.4500)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (224, 10332, 18, 40, 62.5000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (225, 10332, 42, 10, 14.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (226, 10332, 47, 16, 9.5000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (227, 10333, 14, 10, 23.2500)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (228, 10333, 21, 10, 10.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (229, 10333, 71, 40, 21.5000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (230, 10334, 52, 8, 7.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (231, 10334, 68, 10, 12.5000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (232, 10335, 2, 7, 19.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (233, 10335, 31, 25, 12.5000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (234, 10335, 32, 6, 32.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (235, 10335, 51, 48, 53.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (236, 10336, 4, 18, 22.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (237, 10337, 23, 40, 9.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (238, 10337, 26, 24, 31.2300)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (239, 10337, 36, 20, 19.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (240, 10337, 37, 28, 26.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (241, 10337, 72, 25, 34.8000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (242, 10338, 17, 20, 39.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (243, 10338, 30, 15, 25.8900)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (244, 10339, 4, 10, 22.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (245, 10339, 17, 70, 39.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (246, 10339, 62, 28, 49.3000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (247, 10340, 18, 20, 62.5000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (248, 10340, 41, 12, 9.6500)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (249, 10340, 43, 40, 46.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (250, 10341, 33, 8, 2.5000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (251, 10341, 59, 9, 55.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (252, 10342, 2, 24, 19.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (253, 10342, 31, 56, 12.5000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (254, 10342, 36, 40, 19.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (255, 10342, 55, 40, 24.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (256, 10343, 64, 50, 33.2500)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (257, 10343, 68, 4, 12.5000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (258, 10343, 76, 15, 18.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (259, 10344, 4, 35, 22.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (260, 10344, 8, 70, 40.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (261, 10345, 8, 70, 40.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (262, 10345, 19, 80, 9.2000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (263, 10345, 42, 9, 14.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (264, 10346, 17, 36, 39.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (265, 10346, 56, 20, 38.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (266, 10347, 25, 10, 14.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (267, 10347, 39, 50, 18.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (268, 10347, 40, 4, 18.4000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (269, 10347, 75, 6, 7.7500)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (270, 10348, 1, 15, 18.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (271, 10348, 23, 25, 9.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (272, 10349, 54, 24, 7.4500)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (273, 10350, 50, 15, 16.2500)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (274, 10350, 69, 18, 36.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (275, 10351, 38, 20, 263.5000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (276, 10351, 41, 13, 9.6500)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (277, 10351, 44, 77, 19.4500)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (278, 10351, 65, 10, 21.0500)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (279, 10352, 24, 10, 4.5000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (280, 10352, 54, 20, 7.4500)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (281, 10353, 11, 12, 21.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (282, 10353, 38, 50, 263.5000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (283, 10354, 1, 12, 18.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (284, 10354, 29, 4, 123.7900)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (285, 10355, 24, 25, 4.5000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (286, 10355, 57, 25, 19.5000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (287, 10356, 31, 30, 12.5000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (288, 10356, 55, 12, 24.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (289, 10356, 69, 20, 36.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (290, 10357, 10, 30, 31.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (291, 10357, 26, 16, 31.2300)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (292, 10357, 60, 8, 34.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (293, 10358, 24, 10, 4.5000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (294, 10358, 34, 10, 14.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (295, 10358, 36, 20, 19.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (296, 10359, 16, 56, 17.4500)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (297, 10359, 31, 70, 12.5000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (298, 10359, 60, 80, 34.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (299, 10360, 28, 30, 45.6000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (300, 10360, 29, 35, 123.7900)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (301, 10360, 38, 10, 263.5000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (302, 10360, 49, 35, 20.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (303, 10360, 54, 28, 7.4500)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (304, 10361, 39, 54, 18.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (305, 10361, 60, 55, 34.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (306, 10362, 25, 50, 14.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (307, 10362, 51, 20, 53.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (308, 10362, 54, 24, 7.4500)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (309, 10363, 31, 20, 12.5000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (310, 10363, 75, 12, 7.7500)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (311, 10363, 76, 12, 18.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (312, 10364, 69, 30, 36.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (313, 10364, 71, 5, 21.5000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (314, 10365, 11, 24, 21.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (315, 10366, 65, 5, 21.0500)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (316, 10366, 77, 5, 13.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (317, 10367, 34, 36, 14.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (318, 10367, 54, 18, 7.4500)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (319, 10367, 65, 15, 21.0500)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (320, 10367, 77, 7, 13.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (321, 10368, 21, 5, 10.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (322, 10368, 28, 13, 45.6000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (323, 10368, 57, 25, 19.5000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (324, 10368, 64, 35, 33.2500)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (325, 10369, 29, 20, 123.7900)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (326, 10369, 56, 18, 38.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (327, 10370, 1, 15, 18.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (328, 10370, 64, 30, 33.2500)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (329, 10370, 74, 20, 10.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (330, 10371, 36, 6, 19.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (331, 10372, 20, 12, 81.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (332, 10372, 38, 40, 263.5000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (333, 10372, 60, 70, 34.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (334, 10372, 72, 42, 34.8000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (335, 10373, 58, 80, 13.2500)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (336, 10373, 71, 50, 21.5000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (337, 10374, 31, 30, 12.5000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (338, 10374, 58, 15, 13.2500)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (339, 10375, 14, 15, 23.2500)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (340, 10375, 54, 10, 7.4500)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (341, 10376, 31, 42, 12.5000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (342, 10377, 28, 20, 45.6000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (343, 10377, 39, 20, 18.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (344, 10378, 71, 6, 21.5000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (345, 10379, 41, 8, 9.6500)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (346, 10379, 63, 16, 43.9000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (347, 10379, 65, 20, 21.0500)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (348, 10380, 30, 18, 25.8900)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (349, 10380, 53, 20, 32.8000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (350, 10380, 60, 6, 34.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (351, 10380, 70, 30, 15.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (352, 10381, 74, 14, 10.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (353, 10382, 5, 32, 21.3500)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (354, 10382, 18, 9, 62.5000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (355, 10382, 29, 14, 123.7900)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (356, 10382, 33, 60, 2.5000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (357, 10382, 74, 50, 10.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (358, 10383, 13, 20, 6.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (359, 10383, 50, 15, 16.2500)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (360, 10383, 56, 20, 38.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (361, 10384, 20, 28, 81.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (362, 10384, 60, 15, 34.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (363, 10385, 7, 10, 30.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (364, 10385, 60, 20, 34.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (365, 10385, 68, 8, 12.5000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (366, 10386, 24, 15, 4.5000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (367, 10386, 34, 10, 14.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (368, 10387, 24, 15, 4.5000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (369, 10387, 28, 6, 45.6000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (370, 10387, 59, 12, 55.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (371, 10387, 71, 15, 21.5000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (372, 10388, 45, 15, 9.5000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (373, 10388, 52, 20, 7.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (374, 10388, 53, 40, 32.8000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (375, 10389, 10, 16, 31.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (376, 10389, 55, 15, 24.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (377, 10389, 62, 20, 49.3000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (378, 10389, 70, 30, 15.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (379, 10390, 31, 60, 12.5000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (380, 10390, 35, 40, 18.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (381, 10390, 46, 45, 12.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (382, 10390, 72, 24, 34.8000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (383, 10391, 13, 18, 6.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (384, 10392, 69, 50, 36.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (385, 10393, 2, 25, 19.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (386, 10393, 14, 42, 23.2500)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (387, 10393, 25, 7, 14.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (388, 10393, 26, 70, 31.2300)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (389, 10393, 31, 32, 12.5000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (390, 10394, 13, 10, 6.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (391, 10394, 62, 10, 49.3000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (392, 10395, 46, 28, 12.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (393, 10395, 53, 70, 32.8000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (394, 10395, 69, 8, 36.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (395, 10396, 23, 40, 9.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (396, 10396, 71, 60, 21.5000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (397, 10396, 72, 21, 34.8000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (398, 10397, 21, 10, 10.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (399, 10397, 51, 18, 53.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (400, 10398, 35, 30, 18.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (401, 10398, 55, 120, 24.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (402, 10399, 68, 60, 12.5000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (403, 10399, 71, 30, 21.5000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (404, 10399, 76, 35, 18.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (405, 10399, 77, 14, 13.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (406, 10400, 29, 21, 123.7900)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (407, 10400, 35, 35, 18.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (408, 10400, 49, 30, 20.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (409, 10401, 30, 18, 25.8900)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (410, 10401, 56, 70, 38.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (411, 10401, 65, 20, 21.0500)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (412, 10401, 71, 60, 21.5000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (413, 10402, 23, 60, 9.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (414, 10402, 63, 65, 43.9000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (415, 10403, 16, 21, 17.4500)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (416, 10403, 48, 70, 12.7500)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (417, 10404, 26, 30, 31.2300)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (418, 10404, 42, 40, 14.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (419, 10404, 49, 30, 20.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (420, 10405, 3, 50, 10.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (421, 10406, 1, 10, 18.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (422, 10406, 21, 30, 10.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (423, 10406, 28, 42, 45.6000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (424, 10406, 36, 5, 19.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (425, 10406, 40, 2, 18.4000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (426, 10407, 11, 30, 21.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (427, 10407, 69, 15, 36.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (428, 10407, 71, 15, 21.5000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (429, 10408, 37, 10, 26.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (430, 10408, 54, 6, 7.4500)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (431, 10408, 62, 35, 49.3000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (432, 10409, 14, 12, 23.2500)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (433, 10409, 21, 12, 10.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (434, 10410, 33, 49, 2.5000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (435, 10410, 59, 16, 55.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (436, 10411, 41, 25, 9.6500)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (437, 10411, 44, 40, 19.4500)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (438, 10411, 59, 9, 55.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (439, 10412, 14, 20, 23.2500)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (440, 10413, 1, 24, 18.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (441, 10413, 62, 40, 49.3000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (442, 10413, 76, 14, 18.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (443, 10414, 19, 18, 9.2000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (444, 10414, 33, 50, 2.5000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (445, 10415, 17, 2, 39.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (446, 10415, 33, 20, 2.5000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (447, 10416, 19, 20, 9.2000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (448, 10416, 53, 10, 32.8000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (449, 10416, 57, 20, 19.5000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (450, 10417, 38, 50, 263.5000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (451, 10417, 46, 2, 12.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (452, 10417, 68, 36, 12.5000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (453, 10417, 77, 35, 13.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (454, 10418, 2, 60, 19.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (455, 10418, 47, 55, 9.5000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (456, 10418, 61, 16, 28.5000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (457, 10418, 74, 15, 10.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (458, 10419, 60, 60, 34.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (459, 10419, 69, 20, 36.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (460, 10420, 9, 20, 97.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (461, 10420, 13, 2, 6.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (462, 10420, 70, 8, 15.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (463, 10420, 73, 20, 15.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (464, 10421, 19, 4, 9.2000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (465, 10421, 26, 30, 31.2300)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (466, 10421, 53, 15, 32.8000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (467, 10421, 77, 10, 13.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (468, 10422, 26, 2, 31.2300)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (469, 10423, 31, 14, 12.5000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (470, 10423, 59, 20, 55.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (471, 10424, 35, 60, 18.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (472, 10424, 38, 49, 263.5000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (473, 10424, 68, 30, 12.5000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (474, 10425, 55, 10, 24.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (475, 10425, 76, 20, 18.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (476, 10426, 56, 5, 38.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (477, 10426, 64, 7, 33.2500)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (478, 10427, 14, 35, 23.2500)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (479, 10428, 46, 20, 12.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (480, 10429, 50, 40, 16.2500)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (481, 10429, 63, 35, 43.9000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (482, 10430, 17, 45, 39.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (483, 10430, 21, 50, 10.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (484, 10430, 56, 30, 38.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (485, 10430, 59, 70, 55.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (486, 10431, 17, 50, 39.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (487, 10431, 40, 50, 18.4000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (488, 10431, 47, 30, 9.5000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (489, 10432, 26, 10, 31.2300)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (490, 10432, 54, 40, 7.4500)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (491, 10433, 56, 28, 38.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (492, 10434, 11, 6, 21.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (493, 10434, 76, 18, 18.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (494, 10435, 2, 10, 19.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (495, 10435, 22, 12, 21.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (496, 10435, 72, 10, 34.8000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (497, 10436, 46, 5, 12.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (498, 10436, 56, 40, 38.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (499, 10436, 64, 30, 33.2500)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (500, 10436, 75, 24, 7.7500)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (501, 10437, 53, 15, 32.8000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (502, 10438, 19, 15, 9.2000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (503, 10438, 34, 20, 14.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (504, 10438, 57, 15, 19.5000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (505, 10439, 12, 15, 38.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (506, 10439, 16, 16, 17.4500)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (507, 10439, 64, 6, 33.2500)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (508, 10439, 74, 30, 10.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (509, 10440, 2, 45, 19.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (510, 10440, 16, 49, 17.4500)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (511, 10440, 29, 24, 123.7900)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (512, 10440, 61, 90, 28.5000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (513, 10441, 27, 50, 43.9000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (514, 10442, 11, 30, 21.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (515, 10442, 54, 80, 7.4500)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (516, 10442, 66, 60, 17.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (517, 10443, 11, 6, 21.0000)
GO
INSERT [OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (518, 10443, 28, 12, 45.6000)
GO
SET IDENTITY_INSERT [OrderDetails] OFF
GO
SET IDENTITY_INSERT [Orders] ON 
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10248, 90, CAST(N'2020-07-04T00:00:00.000' AS DateTime), 5, CAST(N'2020-07-04T12:00:00.000' AS DateTime), 3, CAST(N'2020-07-05T00:00:00.000' AS DateTime), CAST(N'2020-07-07T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10249, 81, CAST(N'2020-07-05T00:00:00.000' AS DateTime), 6, CAST(N'2020-07-05T12:00:00.000' AS DateTime), 1, CAST(N'2020-07-06T00:00:00.000' AS DateTime), CAST(N'2020-07-08T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10250, 34, CAST(N'2020-07-08T00:00:00.000' AS DateTime), 4, CAST(N'2020-07-08T12:00:00.000' AS DateTime), 2, CAST(N'2020-07-09T00:00:00.000' AS DateTime), CAST(N'2020-07-11T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10251, 84, CAST(N'2020-07-08T00:00:00.000' AS DateTime), 3, CAST(N'2020-07-08T12:00:00.000' AS DateTime), 1, CAST(N'2020-07-09T00:00:00.000' AS DateTime), CAST(N'2020-07-11T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10252, 76, CAST(N'2020-07-09T00:00:00.000' AS DateTime), 4, CAST(N'2020-07-09T12:00:00.000' AS DateTime), 2, CAST(N'2020-07-10T00:00:00.000' AS DateTime), CAST(N'2020-07-12T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10253, 34, CAST(N'2020-07-10T00:00:00.000' AS DateTime), 3, CAST(N'2020-07-10T12:00:00.000' AS DateTime), 2, CAST(N'2020-07-11T00:00:00.000' AS DateTime), CAST(N'2020-07-13T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10254, 14, CAST(N'2020-07-11T00:00:00.000' AS DateTime), 5, CAST(N'2020-07-11T12:00:00.000' AS DateTime), 2, CAST(N'2020-07-12T00:00:00.000' AS DateTime), CAST(N'2020-07-14T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10255, 68, CAST(N'2020-07-12T00:00:00.000' AS DateTime), 9, CAST(N'2020-07-12T12:00:00.000' AS DateTime), 3, CAST(N'2020-07-13T00:00:00.000' AS DateTime), CAST(N'2020-07-15T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10256, 88, CAST(N'2020-07-15T00:00:00.000' AS DateTime), 3, CAST(N'2020-07-15T12:00:00.000' AS DateTime), 2, CAST(N'2020-07-16T00:00:00.000' AS DateTime), CAST(N'2020-07-18T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10257, 35, CAST(N'2020-07-16T00:00:00.000' AS DateTime), 4, CAST(N'2020-07-16T12:00:00.000' AS DateTime), 3, CAST(N'2020-07-17T00:00:00.000' AS DateTime), CAST(N'2020-07-19T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10258, 20, CAST(N'2020-07-17T00:00:00.000' AS DateTime), 1, CAST(N'2020-07-17T12:00:00.000' AS DateTime), 1, CAST(N'2020-07-18T00:00:00.000' AS DateTime), CAST(N'2020-07-20T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10259, 13, CAST(N'2020-07-18T00:00:00.000' AS DateTime), 4, CAST(N'2020-07-18T12:00:00.000' AS DateTime), 3, CAST(N'2020-07-19T00:00:00.000' AS DateTime), CAST(N'2020-07-21T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10260, 55, CAST(N'2020-07-19T00:00:00.000' AS DateTime), 4, CAST(N'2020-07-19T12:00:00.000' AS DateTime), 1, CAST(N'2020-07-20T00:00:00.000' AS DateTime), CAST(N'2020-07-22T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10261, 61, CAST(N'2020-07-19T00:00:00.000' AS DateTime), 4, CAST(N'2020-07-19T12:00:00.000' AS DateTime), 2, CAST(N'2020-07-20T00:00:00.000' AS DateTime), CAST(N'2020-07-22T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10262, 65, CAST(N'2020-07-22T00:00:00.000' AS DateTime), 8, CAST(N'2020-07-22T12:00:00.000' AS DateTime), 3, CAST(N'2020-07-23T00:00:00.000' AS DateTime), CAST(N'2020-07-25T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10263, 20, CAST(N'2020-07-23T00:00:00.000' AS DateTime), 9, CAST(N'2020-07-23T12:00:00.000' AS DateTime), 3, CAST(N'2020-07-24T00:00:00.000' AS DateTime), CAST(N'2020-07-26T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10264, 24, CAST(N'2020-07-24T00:00:00.000' AS DateTime), 6, CAST(N'2020-07-24T12:00:00.000' AS DateTime), 3, CAST(N'2020-07-25T00:00:00.000' AS DateTime), CAST(N'2020-07-27T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10265, 7, CAST(N'2020-07-25T00:00:00.000' AS DateTime), 2, CAST(N'2020-07-25T12:00:00.000' AS DateTime), 1, CAST(N'2020-07-26T00:00:00.000' AS DateTime), CAST(N'2020-07-28T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10266, 87, CAST(N'2020-07-26T00:00:00.000' AS DateTime), 3, CAST(N'2020-07-26T12:00:00.000' AS DateTime), 3, CAST(N'2020-07-27T00:00:00.000' AS DateTime), CAST(N'2020-07-29T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10267, 25, CAST(N'2020-07-29T00:00:00.000' AS DateTime), 4, CAST(N'2020-07-29T12:00:00.000' AS DateTime), 1, CAST(N'2020-07-30T00:00:00.000' AS DateTime), CAST(N'2020-08-01T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10268, 33, CAST(N'2020-07-30T00:00:00.000' AS DateTime), 8, CAST(N'2020-07-30T12:00:00.000' AS DateTime), 3, CAST(N'2020-07-31T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10269, 89, CAST(N'2020-07-31T00:00:00.000' AS DateTime), 5, CAST(N'2020-07-31T12:00:00.000' AS DateTime), 1, CAST(N'2020-08-01T00:00:00.000' AS DateTime), CAST(N'2020-08-03T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10270, 87, CAST(N'2020-08-01T00:00:00.000' AS DateTime), 1, CAST(N'2020-08-01T12:00:00.000' AS DateTime), 1, CAST(N'2020-08-02T00:00:00.000' AS DateTime), CAST(N'2020-08-04T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10271, 75, CAST(N'2020-08-01T00:00:00.000' AS DateTime), 6, CAST(N'2020-08-01T12:00:00.000' AS DateTime), 2, CAST(N'2020-08-02T00:00:00.000' AS DateTime), CAST(N'2020-08-04T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10272, 65, CAST(N'2020-08-02T00:00:00.000' AS DateTime), 6, CAST(N'2020-08-02T12:00:00.000' AS DateTime), 2, CAST(N'2020-08-03T00:00:00.000' AS DateTime), CAST(N'2020-08-05T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10273, 63, CAST(N'2020-08-05T00:00:00.000' AS DateTime), 3, CAST(N'2020-08-05T12:00:00.000' AS DateTime), 3, CAST(N'2020-08-06T00:00:00.000' AS DateTime), CAST(N'2020-08-08T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10274, 85, CAST(N'2020-08-06T00:00:00.000' AS DateTime), 6, CAST(N'2020-08-06T12:00:00.000' AS DateTime), 1, CAST(N'2020-08-07T00:00:00.000' AS DateTime), CAST(N'2020-08-09T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10275, 49, CAST(N'2020-08-07T00:00:00.000' AS DateTime), 1, CAST(N'2020-08-07T12:00:00.000' AS DateTime), 1, CAST(N'2020-08-08T00:00:00.000' AS DateTime), CAST(N'2020-08-10T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10276, 80, CAST(N'2020-08-08T00:00:00.000' AS DateTime), 8, CAST(N'2020-08-08T12:00:00.000' AS DateTime), 3, CAST(N'2020-08-09T00:00:00.000' AS DateTime), CAST(N'2020-08-11T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10277, 52, CAST(N'2020-08-09T00:00:00.000' AS DateTime), 2, CAST(N'2020-08-09T12:00:00.000' AS DateTime), 3, CAST(N'2020-08-10T00:00:00.000' AS DateTime), CAST(N'2020-08-12T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10278, 5, CAST(N'2020-08-12T00:00:00.000' AS DateTime), 8, CAST(N'2020-08-12T12:00:00.000' AS DateTime), 2, CAST(N'2020-08-13T00:00:00.000' AS DateTime), CAST(N'2020-08-15T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10279, 44, CAST(N'2020-08-13T00:00:00.000' AS DateTime), 8, CAST(N'2020-08-13T12:00:00.000' AS DateTime), 2, CAST(N'2020-08-14T00:00:00.000' AS DateTime), CAST(N'2020-08-16T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10280, 5, CAST(N'2020-08-14T00:00:00.000' AS DateTime), 2, CAST(N'2020-08-14T12:00:00.000' AS DateTime), 1, CAST(N'2020-08-15T00:00:00.000' AS DateTime), CAST(N'2020-08-17T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10281, 69, CAST(N'2020-08-14T00:00:00.000' AS DateTime), 4, CAST(N'2020-08-14T12:00:00.000' AS DateTime), 1, CAST(N'2020-08-15T00:00:00.000' AS DateTime), CAST(N'2020-08-17T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10282, 69, CAST(N'2020-08-15T00:00:00.000' AS DateTime), 4, CAST(N'2020-08-15T12:00:00.000' AS DateTime), 1, CAST(N'2020-08-16T00:00:00.000' AS DateTime), CAST(N'2020-08-18T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10283, 46, CAST(N'2020-08-16T00:00:00.000' AS DateTime), 3, CAST(N'2020-08-16T12:00:00.000' AS DateTime), 3, CAST(N'2020-08-17T00:00:00.000' AS DateTime), CAST(N'2020-08-19T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10284, 44, CAST(N'2020-08-19T00:00:00.000' AS DateTime), 4, CAST(N'2020-08-19T12:00:00.000' AS DateTime), 1, CAST(N'2020-08-20T00:00:00.000' AS DateTime), CAST(N'2020-08-22T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10285, 63, CAST(N'2020-08-20T00:00:00.000' AS DateTime), 1, CAST(N'2020-08-20T12:00:00.000' AS DateTime), 2, CAST(N'2020-08-21T00:00:00.000' AS DateTime), CAST(N'2020-08-23T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10286, 63, CAST(N'2020-08-21T00:00:00.000' AS DateTime), 8, CAST(N'2020-08-21T12:00:00.000' AS DateTime), 3, CAST(N'2020-08-22T00:00:00.000' AS DateTime), CAST(N'2020-08-24T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10287, 67, CAST(N'2020-08-22T00:00:00.000' AS DateTime), 8, CAST(N'2020-08-22T12:00:00.000' AS DateTime), 3, CAST(N'2020-08-23T00:00:00.000' AS DateTime), CAST(N'2020-08-25T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10288, 66, CAST(N'2020-08-23T00:00:00.000' AS DateTime), 4, CAST(N'2020-08-23T12:00:00.000' AS DateTime), 1, CAST(N'2020-08-24T00:00:00.000' AS DateTime), CAST(N'2020-08-26T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10289, 11, CAST(N'2020-08-26T00:00:00.000' AS DateTime), 7, CAST(N'2020-08-26T12:00:00.000' AS DateTime), 3, CAST(N'2020-08-27T00:00:00.000' AS DateTime), CAST(N'2020-08-29T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10290, 15, CAST(N'2020-08-27T00:00:00.000' AS DateTime), 8, CAST(N'2020-08-27T12:00:00.000' AS DateTime), 1, CAST(N'2020-08-28T00:00:00.000' AS DateTime), CAST(N'2020-08-30T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10291, 61, CAST(N'2020-08-27T00:00:00.000' AS DateTime), 6, CAST(N'2020-08-27T12:00:00.000' AS DateTime), 2, CAST(N'2020-08-28T00:00:00.000' AS DateTime), CAST(N'2020-08-30T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10292, 81, CAST(N'2020-08-28T00:00:00.000' AS DateTime), 1, CAST(N'2020-08-28T12:00:00.000' AS DateTime), 2, CAST(N'2020-08-29T00:00:00.000' AS DateTime), CAST(N'2020-08-31T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10293, 80, CAST(N'2020-08-29T00:00:00.000' AS DateTime), 1, CAST(N'2020-08-29T12:00:00.000' AS DateTime), 3, CAST(N'2020-08-30T00:00:00.000' AS DateTime), CAST(N'2020-09-01T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10294, 65, CAST(N'2020-08-30T00:00:00.000' AS DateTime), 4, CAST(N'2020-08-30T12:00:00.000' AS DateTime), 2, CAST(N'2020-08-31T00:00:00.000' AS DateTime), CAST(N'2020-09-02T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10295, 85, CAST(N'2020-09-02T00:00:00.000' AS DateTime), 2, CAST(N'2020-09-02T12:00:00.000' AS DateTime), 2, CAST(N'2020-09-03T00:00:00.000' AS DateTime), CAST(N'2020-09-05T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10296, 46, CAST(N'2020-09-03T00:00:00.000' AS DateTime), 6, CAST(N'2020-09-03T12:00:00.000' AS DateTime), 1, CAST(N'2020-09-04T00:00:00.000' AS DateTime), CAST(N'2020-09-06T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10297, 7, CAST(N'2020-09-04T00:00:00.000' AS DateTime), 5, CAST(N'2020-09-04T12:00:00.000' AS DateTime), 2, CAST(N'2020-09-05T00:00:00.000' AS DateTime), CAST(N'2020-09-07T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10298, 37, CAST(N'2020-09-05T00:00:00.000' AS DateTime), 6, CAST(N'2020-09-05T12:00:00.000' AS DateTime), 2, CAST(N'2020-09-06T00:00:00.000' AS DateTime), CAST(N'2020-09-08T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10299, 67, CAST(N'2020-09-06T00:00:00.000' AS DateTime), 4, CAST(N'2020-09-06T12:00:00.000' AS DateTime), 2, CAST(N'2020-09-07T00:00:00.000' AS DateTime), CAST(N'2020-09-09T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10300, 49, CAST(N'2020-09-09T00:00:00.000' AS DateTime), 2, CAST(N'2020-09-09T12:00:00.000' AS DateTime), 2, CAST(N'2020-09-10T00:00:00.000' AS DateTime), CAST(N'2020-09-12T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10301, 86, CAST(N'2020-09-09T00:00:00.000' AS DateTime), 8, CAST(N'2020-09-09T12:00:00.000' AS DateTime), 2, CAST(N'2020-09-10T00:00:00.000' AS DateTime), CAST(N'2020-09-12T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10302, 76, CAST(N'2020-09-10T00:00:00.000' AS DateTime), 4, CAST(N'2020-09-10T12:00:00.000' AS DateTime), 2, CAST(N'2020-09-11T00:00:00.000' AS DateTime), CAST(N'2020-09-13T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10303, 30, CAST(N'2020-09-11T00:00:00.000' AS DateTime), 7, CAST(N'2020-09-11T12:00:00.000' AS DateTime), 2, CAST(N'2020-09-12T00:00:00.000' AS DateTime), CAST(N'2020-09-14T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10304, 80, CAST(N'2020-09-12T00:00:00.000' AS DateTime), 1, CAST(N'2020-09-12T12:00:00.000' AS DateTime), 2, CAST(N'2020-09-13T00:00:00.000' AS DateTime), CAST(N'2020-09-15T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10305, 55, CAST(N'2020-09-13T00:00:00.000' AS DateTime), 8, CAST(N'2020-09-13T12:00:00.000' AS DateTime), 3, CAST(N'2020-09-14T00:00:00.000' AS DateTime), CAST(N'2020-09-16T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10306, 69, CAST(N'2020-09-16T00:00:00.000' AS DateTime), 1, CAST(N'2020-09-16T12:00:00.000' AS DateTime), 3, CAST(N'2020-09-17T00:00:00.000' AS DateTime), CAST(N'2020-09-19T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10307, 48, CAST(N'2020-09-17T00:00:00.000' AS DateTime), 2, CAST(N'2020-09-17T12:00:00.000' AS DateTime), 2, CAST(N'2020-09-18T00:00:00.000' AS DateTime), CAST(N'2020-09-20T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10308, 2, CAST(N'2020-09-18T00:00:00.000' AS DateTime), 7, CAST(N'2020-09-18T12:00:00.000' AS DateTime), 3, CAST(N'2020-09-19T00:00:00.000' AS DateTime), CAST(N'2020-09-21T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10309, 37, CAST(N'2020-09-19T00:00:00.000' AS DateTime), 3, CAST(N'2020-09-19T12:00:00.000' AS DateTime), 1, CAST(N'2020-09-20T00:00:00.000' AS DateTime), CAST(N'2020-09-22T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10310, 77, CAST(N'2020-09-20T00:00:00.000' AS DateTime), 8, CAST(N'2020-09-20T12:00:00.000' AS DateTime), 2, CAST(N'2020-09-21T00:00:00.000' AS DateTime), CAST(N'2020-09-23T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10311, 18, CAST(N'2020-09-20T00:00:00.000' AS DateTime), 1, CAST(N'2020-09-20T12:00:00.000' AS DateTime), 3, CAST(N'2020-09-21T00:00:00.000' AS DateTime), CAST(N'2020-09-23T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10312, 86, CAST(N'2020-09-23T00:00:00.000' AS DateTime), 2, CAST(N'2020-09-23T12:00:00.000' AS DateTime), 2, CAST(N'2020-09-24T00:00:00.000' AS DateTime), CAST(N'2020-09-26T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10313, 63, CAST(N'2020-09-24T00:00:00.000' AS DateTime), 2, CAST(N'2020-09-24T12:00:00.000' AS DateTime), 2, CAST(N'2020-09-25T00:00:00.000' AS DateTime), CAST(N'2020-09-27T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10314, 65, CAST(N'2020-09-25T00:00:00.000' AS DateTime), 1, CAST(N'2020-09-25T12:00:00.000' AS DateTime), 2, CAST(N'2020-09-26T00:00:00.000' AS DateTime), CAST(N'2020-09-28T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10315, 38, CAST(N'2020-09-26T00:00:00.000' AS DateTime), 4, CAST(N'2020-09-26T12:00:00.000' AS DateTime), 2, CAST(N'2020-09-27T00:00:00.000' AS DateTime), CAST(N'2020-09-29T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10316, 65, CAST(N'2020-09-27T00:00:00.000' AS DateTime), 1, CAST(N'2020-09-27T12:00:00.000' AS DateTime), 3, CAST(N'2020-09-28T00:00:00.000' AS DateTime), CAST(N'2020-09-30T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10317, 48, CAST(N'2020-09-30T00:00:00.000' AS DateTime), 6, CAST(N'2020-09-30T12:00:00.000' AS DateTime), 1, CAST(N'2020-10-01T00:00:00.000' AS DateTime), CAST(N'2020-10-03T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10318, 38, CAST(N'2020-10-01T00:00:00.000' AS DateTime), 8, CAST(N'2020-10-01T12:00:00.000' AS DateTime), 2, CAST(N'2020-10-02T00:00:00.000' AS DateTime), CAST(N'2020-10-04T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10319, 80, CAST(N'2020-10-02T00:00:00.000' AS DateTime), 7, CAST(N'2020-10-02T12:00:00.000' AS DateTime), 3, CAST(N'2020-10-03T00:00:00.000' AS DateTime), CAST(N'2020-10-05T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10320, 87, CAST(N'2020-10-03T00:00:00.000' AS DateTime), 5, CAST(N'2020-10-03T12:00:00.000' AS DateTime), 3, CAST(N'2020-10-04T00:00:00.000' AS DateTime), CAST(N'2020-10-06T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10321, 38, CAST(N'2020-10-03T00:00:00.000' AS DateTime), 3, CAST(N'2020-10-03T12:00:00.000' AS DateTime), 2, CAST(N'2020-10-04T00:00:00.000' AS DateTime), CAST(N'2020-10-06T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10322, 58, CAST(N'2020-10-04T00:00:00.000' AS DateTime), 7, CAST(N'2020-10-04T12:00:00.000' AS DateTime), 3, CAST(N'2020-10-05T00:00:00.000' AS DateTime), CAST(N'2020-10-07T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10323, 39, CAST(N'2020-10-07T00:00:00.000' AS DateTime), 4, CAST(N'2020-10-07T12:00:00.000' AS DateTime), 1, CAST(N'2020-10-08T00:00:00.000' AS DateTime), CAST(N'2020-10-10T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10324, 71, CAST(N'2020-10-08T00:00:00.000' AS DateTime), 9, CAST(N'2020-10-08T12:00:00.000' AS DateTime), 1, CAST(N'2020-10-09T00:00:00.000' AS DateTime), CAST(N'2020-10-11T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10325, 39, CAST(N'2020-10-09T00:00:00.000' AS DateTime), 1, CAST(N'2020-10-09T12:00:00.000' AS DateTime), 3, CAST(N'2020-10-10T00:00:00.000' AS DateTime), CAST(N'2020-10-12T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10326, 8, CAST(N'2020-10-10T00:00:00.000' AS DateTime), 4, CAST(N'2020-10-10T12:00:00.000' AS DateTime), 2, CAST(N'2020-10-11T00:00:00.000' AS DateTime), CAST(N'2020-10-13T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10327, 24, CAST(N'2020-10-11T00:00:00.000' AS DateTime), 2, CAST(N'2020-10-11T12:00:00.000' AS DateTime), 1, CAST(N'2020-10-12T00:00:00.000' AS DateTime), CAST(N'2020-10-14T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10328, 28, CAST(N'2020-10-14T00:00:00.000' AS DateTime), 4, CAST(N'2020-10-14T12:00:00.000' AS DateTime), 3, CAST(N'2020-10-15T00:00:00.000' AS DateTime), CAST(N'2020-10-17T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10329, 75, CAST(N'2020-10-15T00:00:00.000' AS DateTime), 4, CAST(N'2020-10-15T12:00:00.000' AS DateTime), 2, CAST(N'2020-10-16T00:00:00.000' AS DateTime), CAST(N'2020-10-18T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10330, 46, CAST(N'2020-10-16T00:00:00.000' AS DateTime), 3, CAST(N'2020-10-16T12:00:00.000' AS DateTime), 1, CAST(N'2020-10-17T00:00:00.000' AS DateTime), CAST(N'2020-10-19T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10331, 9, CAST(N'2020-10-16T00:00:00.000' AS DateTime), 9, CAST(N'2020-10-16T12:00:00.000' AS DateTime), 1, CAST(N'2020-10-17T00:00:00.000' AS DateTime), CAST(N'2020-10-19T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10332, 51, CAST(N'2020-10-17T00:00:00.000' AS DateTime), 3, CAST(N'2020-10-17T12:00:00.000' AS DateTime), 2, CAST(N'2020-10-18T00:00:00.000' AS DateTime), CAST(N'2020-10-20T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10333, 87, CAST(N'2020-10-18T00:00:00.000' AS DateTime), 5, CAST(N'2020-10-18T12:00:00.000' AS DateTime), 3, CAST(N'2020-10-19T00:00:00.000' AS DateTime), CAST(N'2020-10-21T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10334, 84, CAST(N'2020-10-21T00:00:00.000' AS DateTime), 8, CAST(N'2020-10-21T12:00:00.000' AS DateTime), 2, CAST(N'2020-10-22T00:00:00.000' AS DateTime), CAST(N'2020-10-24T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10335, 37, CAST(N'2020-10-22T00:00:00.000' AS DateTime), 7, CAST(N'2020-10-22T12:00:00.000' AS DateTime), 2, CAST(N'2020-10-23T00:00:00.000' AS DateTime), CAST(N'2020-10-25T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10336, 60, CAST(N'2020-10-23T00:00:00.000' AS DateTime), 7, CAST(N'2020-10-23T12:00:00.000' AS DateTime), 2, CAST(N'2020-10-24T00:00:00.000' AS DateTime), CAST(N'2020-10-26T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10337, 25, CAST(N'2020-10-24T00:00:00.000' AS DateTime), 4, CAST(N'2020-10-24T12:00:00.000' AS DateTime), 3, CAST(N'2020-10-25T00:00:00.000' AS DateTime), CAST(N'2020-10-27T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10338, 55, CAST(N'2020-10-25T00:00:00.000' AS DateTime), 4, CAST(N'2020-10-25T12:00:00.000' AS DateTime), 3, CAST(N'2020-10-26T00:00:00.000' AS DateTime), CAST(N'2020-10-28T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10339, 51, CAST(N'2020-10-28T00:00:00.000' AS DateTime), 2, CAST(N'2020-10-28T12:00:00.000' AS DateTime), 2, CAST(N'2020-10-29T00:00:00.000' AS DateTime), CAST(N'2020-10-31T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10340, 9, CAST(N'2020-10-29T00:00:00.000' AS DateTime), 1, CAST(N'2020-10-29T12:00:00.000' AS DateTime), 3, CAST(N'2020-10-30T00:00:00.000' AS DateTime), CAST(N'2020-11-01T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10341, 73, CAST(N'2020-10-29T00:00:00.000' AS DateTime), 7, CAST(N'2020-10-29T12:00:00.000' AS DateTime), 3, CAST(N'2020-10-30T00:00:00.000' AS DateTime), CAST(N'2020-11-01T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10342, 25, CAST(N'2020-10-30T00:00:00.000' AS DateTime), 4, CAST(N'2020-10-30T12:00:00.000' AS DateTime), 2, CAST(N'2020-10-31T00:00:00.000' AS DateTime), CAST(N'2020-11-02T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10343, 44, CAST(N'2020-10-31T00:00:00.000' AS DateTime), 4, CAST(N'2020-10-31T12:00:00.000' AS DateTime), 1, CAST(N'2020-11-01T00:00:00.000' AS DateTime), CAST(N'2020-11-03T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10344, 89, CAST(N'2020-11-01T00:00:00.000' AS DateTime), 4, CAST(N'2020-11-01T12:00:00.000' AS DateTime), 2, CAST(N'2020-11-02T00:00:00.000' AS DateTime), CAST(N'2020-11-04T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10345, 63, CAST(N'2020-11-04T00:00:00.000' AS DateTime), 2, CAST(N'2020-11-04T12:00:00.000' AS DateTime), 2, CAST(N'2020-11-05T00:00:00.000' AS DateTime), CAST(N'2020-11-07T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10346, 65, CAST(N'2020-11-05T00:00:00.000' AS DateTime), 3, CAST(N'2020-11-05T12:00:00.000' AS DateTime), 3, CAST(N'2020-11-06T00:00:00.000' AS DateTime), CAST(N'2020-11-08T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10347, 21, CAST(N'2020-11-06T00:00:00.000' AS DateTime), 4, CAST(N'2020-11-06T12:00:00.000' AS DateTime), 3, CAST(N'2020-11-07T00:00:00.000' AS DateTime), CAST(N'2020-11-09T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10348, 86, CAST(N'2020-11-07T00:00:00.000' AS DateTime), 4, CAST(N'2020-11-07T12:00:00.000' AS DateTime), 2, CAST(N'2020-11-08T00:00:00.000' AS DateTime), CAST(N'2020-11-10T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10349, 75, CAST(N'2020-11-08T00:00:00.000' AS DateTime), 7, CAST(N'2020-11-08T12:00:00.000' AS DateTime), 1, CAST(N'2020-11-09T00:00:00.000' AS DateTime), CAST(N'2020-11-11T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10350, 41, CAST(N'2020-11-11T00:00:00.000' AS DateTime), 6, CAST(N'2020-11-11T12:00:00.000' AS DateTime), 2, CAST(N'2020-11-12T00:00:00.000' AS DateTime), CAST(N'2020-11-14T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10351, 20, CAST(N'2020-11-11T00:00:00.000' AS DateTime), 1, CAST(N'2020-11-11T12:00:00.000' AS DateTime), 1, CAST(N'2020-11-12T00:00:00.000' AS DateTime), CAST(N'2020-11-14T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10352, 28, CAST(N'2020-11-12T00:00:00.000' AS DateTime), 3, CAST(N'2020-11-12T12:00:00.000' AS DateTime), 3, CAST(N'2020-11-13T00:00:00.000' AS DateTime), CAST(N'2020-11-15T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10353, 59, CAST(N'2020-11-13T00:00:00.000' AS DateTime), 7, CAST(N'2020-11-13T12:00:00.000' AS DateTime), 3, CAST(N'2020-11-14T00:00:00.000' AS DateTime), CAST(N'2020-11-16T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10354, 58, CAST(N'2020-11-14T00:00:00.000' AS DateTime), 8, CAST(N'2020-11-14T12:00:00.000' AS DateTime), 3, CAST(N'2020-11-15T00:00:00.000' AS DateTime), CAST(N'2020-11-17T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10355, 4, CAST(N'2020-11-15T00:00:00.000' AS DateTime), 6, CAST(N'2020-11-15T12:00:00.000' AS DateTime), 1, CAST(N'2020-11-16T00:00:00.000' AS DateTime), CAST(N'2020-11-18T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10356, 86, CAST(N'2020-11-18T00:00:00.000' AS DateTime), 6, CAST(N'2020-11-18T12:00:00.000' AS DateTime), 2, CAST(N'2020-11-19T00:00:00.000' AS DateTime), CAST(N'2020-11-21T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10357, 46, CAST(N'2020-11-19T00:00:00.000' AS DateTime), 1, CAST(N'2020-11-19T12:00:00.000' AS DateTime), 3, CAST(N'2020-11-20T00:00:00.000' AS DateTime), CAST(N'2020-11-22T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10358, 41, CAST(N'2020-11-20T00:00:00.000' AS DateTime), 5, CAST(N'2020-11-20T12:00:00.000' AS DateTime), 1, CAST(N'2020-11-21T00:00:00.000' AS DateTime), CAST(N'2020-11-23T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10359, 72, CAST(N'2020-11-21T00:00:00.000' AS DateTime), 5, CAST(N'2020-11-21T12:00:00.000' AS DateTime), 3, CAST(N'2020-11-22T00:00:00.000' AS DateTime), CAST(N'2020-11-24T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10360, 7, CAST(N'2020-11-22T00:00:00.000' AS DateTime), 4, CAST(N'2020-11-22T12:00:00.000' AS DateTime), 3, CAST(N'2020-11-23T00:00:00.000' AS DateTime), CAST(N'2020-11-25T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10361, 63, CAST(N'2020-11-22T00:00:00.000' AS DateTime), 1, CAST(N'2020-11-22T12:00:00.000' AS DateTime), 2, CAST(N'2020-11-23T00:00:00.000' AS DateTime), CAST(N'2020-11-25T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10362, 9, CAST(N'2020-11-25T00:00:00.000' AS DateTime), 3, CAST(N'2020-11-25T12:00:00.000' AS DateTime), 1, CAST(N'2020-11-26T00:00:00.000' AS DateTime), CAST(N'2020-11-28T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10363, 17, CAST(N'2020-11-26T00:00:00.000' AS DateTime), 4, CAST(N'2020-11-26T12:00:00.000' AS DateTime), 3, CAST(N'2020-11-27T00:00:00.000' AS DateTime), CAST(N'2020-11-29T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10364, 19, CAST(N'2020-11-26T00:00:00.000' AS DateTime), 1, CAST(N'2020-11-26T12:00:00.000' AS DateTime), 1, CAST(N'2020-11-27T00:00:00.000' AS DateTime), CAST(N'2020-11-29T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10365, 3, CAST(N'2020-11-27T00:00:00.000' AS DateTime), 3, CAST(N'2020-11-27T12:00:00.000' AS DateTime), 2, CAST(N'2020-11-28T00:00:00.000' AS DateTime), CAST(N'2020-11-30T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10366, 29, CAST(N'2020-11-28T00:00:00.000' AS DateTime), 8, CAST(N'2020-11-28T12:00:00.000' AS DateTime), 2, CAST(N'2020-11-29T00:00:00.000' AS DateTime), CAST(N'2020-12-01T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10367, 83, CAST(N'2020-11-28T00:00:00.000' AS DateTime), 7, CAST(N'2020-11-28T12:00:00.000' AS DateTime), 3, CAST(N'2020-11-29T00:00:00.000' AS DateTime), CAST(N'2020-12-01T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10368, 20, CAST(N'2020-11-29T00:00:00.000' AS DateTime), 2, CAST(N'2020-11-29T12:00:00.000' AS DateTime), 2, CAST(N'2020-11-30T00:00:00.000' AS DateTime), CAST(N'2020-12-02T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10369, 75, CAST(N'2020-12-02T00:00:00.000' AS DateTime), 8, CAST(N'2020-12-02T12:00:00.000' AS DateTime), 2, CAST(N'2020-12-03T00:00:00.000' AS DateTime), CAST(N'2020-12-05T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10370, 14, CAST(N'2020-12-03T00:00:00.000' AS DateTime), 6, CAST(N'2020-12-03T12:00:00.000' AS DateTime), 2, CAST(N'2020-12-04T00:00:00.000' AS DateTime), CAST(N'2020-12-06T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10371, 41, CAST(N'2020-12-03T00:00:00.000' AS DateTime), 1, CAST(N'2020-12-03T12:00:00.000' AS DateTime), 1, CAST(N'2020-12-04T00:00:00.000' AS DateTime), CAST(N'2020-12-06T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10372, 62, CAST(N'2020-12-04T00:00:00.000' AS DateTime), 5, CAST(N'2020-12-04T12:00:00.000' AS DateTime), 2, CAST(N'2020-12-05T00:00:00.000' AS DateTime), CAST(N'2020-12-07T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10373, 37, CAST(N'2020-12-05T00:00:00.000' AS DateTime), 4, CAST(N'2020-12-05T12:00:00.000' AS DateTime), 3, CAST(N'2020-12-06T00:00:00.000' AS DateTime), CAST(N'2020-12-08T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10374, 91, CAST(N'2020-12-05T00:00:00.000' AS DateTime), 1, CAST(N'2020-12-05T12:00:00.000' AS DateTime), 3, CAST(N'2020-12-06T00:00:00.000' AS DateTime), CAST(N'2020-12-08T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10375, 36, CAST(N'2020-12-06T00:00:00.000' AS DateTime), 3, CAST(N'2020-12-06T12:00:00.000' AS DateTime), 2, CAST(N'2020-12-07T00:00:00.000' AS DateTime), CAST(N'2020-12-09T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10376, 51, CAST(N'2020-12-09T00:00:00.000' AS DateTime), 1, CAST(N'2020-12-09T12:00:00.000' AS DateTime), 2, CAST(N'2020-12-10T00:00:00.000' AS DateTime), CAST(N'2020-12-12T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10377, 72, CAST(N'2020-12-09T00:00:00.000' AS DateTime), 1, CAST(N'2020-12-09T12:00:00.000' AS DateTime), 3, CAST(N'2020-12-10T00:00:00.000' AS DateTime), CAST(N'2020-12-12T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10378, 24, CAST(N'2020-12-10T00:00:00.000' AS DateTime), 5, CAST(N'2020-12-10T12:00:00.000' AS DateTime), 3, CAST(N'2020-12-11T00:00:00.000' AS DateTime), CAST(N'2020-12-13T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10379, 61, CAST(N'2020-12-11T00:00:00.000' AS DateTime), 2, CAST(N'2020-12-11T12:00:00.000' AS DateTime), 1, CAST(N'2020-12-12T00:00:00.000' AS DateTime), CAST(N'2020-12-14T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10380, 37, CAST(N'2020-12-12T00:00:00.000' AS DateTime), 8, CAST(N'2020-12-12T12:00:00.000' AS DateTime), 3, CAST(N'2020-12-13T00:00:00.000' AS DateTime), CAST(N'2020-12-15T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10381, 46, CAST(N'2020-12-12T00:00:00.000' AS DateTime), 3, CAST(N'2020-12-12T12:00:00.000' AS DateTime), 3, CAST(N'2020-12-13T00:00:00.000' AS DateTime), CAST(N'2020-12-15T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10382, 20, CAST(N'2020-12-13T00:00:00.000' AS DateTime), 4, CAST(N'2020-12-13T12:00:00.000' AS DateTime), 1, CAST(N'2020-12-14T00:00:00.000' AS DateTime), CAST(N'2020-12-16T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10383, 4, CAST(N'2020-12-16T00:00:00.000' AS DateTime), 8, CAST(N'2020-12-16T12:00:00.000' AS DateTime), 3, CAST(N'2020-12-17T00:00:00.000' AS DateTime), CAST(N'2020-12-19T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10384, 5, CAST(N'2020-12-16T00:00:00.000' AS DateTime), 3, CAST(N'2020-12-16T12:00:00.000' AS DateTime), 3, CAST(N'2020-12-17T00:00:00.000' AS DateTime), CAST(N'2020-12-19T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10385, 75, CAST(N'2020-12-17T00:00:00.000' AS DateTime), 1, CAST(N'2020-12-17T12:00:00.000' AS DateTime), 2, CAST(N'2020-12-18T00:00:00.000' AS DateTime), CAST(N'2020-12-20T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10386, 21, CAST(N'2020-12-18T00:00:00.000' AS DateTime), 9, CAST(N'2020-12-18T12:00:00.000' AS DateTime), 3, CAST(N'2020-12-19T00:00:00.000' AS DateTime), CAST(N'2020-12-21T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10387, 70, CAST(N'2020-12-18T00:00:00.000' AS DateTime), 1, CAST(N'2020-12-18T12:00:00.000' AS DateTime), 2, CAST(N'2020-12-19T00:00:00.000' AS DateTime), CAST(N'2020-12-21T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10388, 72, CAST(N'2020-12-19T00:00:00.000' AS DateTime), 2, CAST(N'2020-12-19T12:00:00.000' AS DateTime), 1, CAST(N'2020-12-20T00:00:00.000' AS DateTime), CAST(N'2020-12-22T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10389, 10, CAST(N'2020-12-20T00:00:00.000' AS DateTime), 4, CAST(N'2020-12-20T12:00:00.000' AS DateTime), 2, CAST(N'2020-12-21T00:00:00.000' AS DateTime), CAST(N'2020-12-23T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10390, 20, CAST(N'2020-12-23T00:00:00.000' AS DateTime), 6, CAST(N'2020-12-23T12:00:00.000' AS DateTime), 1, CAST(N'2020-12-24T00:00:00.000' AS DateTime), CAST(N'2020-12-26T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10391, 17, CAST(N'2020-12-23T00:00:00.000' AS DateTime), 3, CAST(N'2020-12-23T12:00:00.000' AS DateTime), 3, CAST(N'2020-12-24T00:00:00.000' AS DateTime), CAST(N'2020-12-26T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10392, 59, CAST(N'2020-12-24T00:00:00.000' AS DateTime), 2, CAST(N'2020-12-24T12:00:00.000' AS DateTime), 3, CAST(N'2020-12-25T00:00:00.000' AS DateTime), CAST(N'2020-12-27T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10393, 71, CAST(N'2020-12-25T00:00:00.000' AS DateTime), 1, CAST(N'2020-12-25T12:00:00.000' AS DateTime), 3, CAST(N'2020-12-26T00:00:00.000' AS DateTime), CAST(N'2020-12-28T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10394, 36, CAST(N'2020-12-25T00:00:00.000' AS DateTime), 1, CAST(N'2020-12-25T12:00:00.000' AS DateTime), 3, CAST(N'2020-12-26T00:00:00.000' AS DateTime), CAST(N'2020-12-28T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10395, 35, CAST(N'2020-12-26T00:00:00.000' AS DateTime), 6, CAST(N'2020-12-26T12:00:00.000' AS DateTime), 1, CAST(N'2020-12-27T00:00:00.000' AS DateTime), CAST(N'2020-12-29T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10396, 25, CAST(N'2020-12-27T00:00:00.000' AS DateTime), 1, CAST(N'2020-12-27T12:00:00.000' AS DateTime), 3, CAST(N'2020-12-28T00:00:00.000' AS DateTime), CAST(N'2020-12-30T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10397, 60, CAST(N'2020-12-27T00:00:00.000' AS DateTime), 5, CAST(N'2020-12-27T12:00:00.000' AS DateTime), 1, CAST(N'2020-12-28T00:00:00.000' AS DateTime), CAST(N'2020-12-30T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10398, 71, CAST(N'2020-12-30T00:00:00.000' AS DateTime), 2, CAST(N'2020-12-30T12:00:00.000' AS DateTime), 3, CAST(N'2020-12-31T00:00:00.000' AS DateTime), CAST(N'2021-01-02T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10399, 83, CAST(N'2020-12-31T00:00:00.000' AS DateTime), 8, CAST(N'2020-12-31T12:00:00.000' AS DateTime), 3, CAST(N'2021-01-01T00:00:00.000' AS DateTime), CAST(N'2021-01-03T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10400, 19, CAST(N'2021-01-01T00:00:00.000' AS DateTime), 1, CAST(N'2021-01-01T12:00:00.000' AS DateTime), 3, CAST(N'2021-01-02T00:00:00.000' AS DateTime), CAST(N'2021-01-04T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10401, 65, CAST(N'2021-01-01T00:00:00.000' AS DateTime), 1, CAST(N'2021-01-01T12:00:00.000' AS DateTime), 1, CAST(N'2021-01-02T00:00:00.000' AS DateTime), CAST(N'2021-01-04T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10402, 20, CAST(N'2021-01-02T00:00:00.000' AS DateTime), 8, CAST(N'2021-01-02T12:00:00.000' AS DateTime), 2, CAST(N'2021-01-03T00:00:00.000' AS DateTime), CAST(N'2021-01-05T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10403, 20, CAST(N'2021-01-03T00:00:00.000' AS DateTime), 4, CAST(N'2021-01-03T12:00:00.000' AS DateTime), 3, CAST(N'2021-01-04T00:00:00.000' AS DateTime), CAST(N'2021-01-06T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10404, 49, CAST(N'2021-01-03T00:00:00.000' AS DateTime), 2, CAST(N'2021-01-03T12:00:00.000' AS DateTime), 1, CAST(N'2021-01-04T00:00:00.000' AS DateTime), CAST(N'2021-01-06T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10405, 47, CAST(N'2021-01-06T00:00:00.000' AS DateTime), 1, CAST(N'2021-01-06T12:00:00.000' AS DateTime), 1, CAST(N'2021-01-07T00:00:00.000' AS DateTime), CAST(N'2021-01-09T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10406, 62, CAST(N'2021-01-07T00:00:00.000' AS DateTime), 7, CAST(N'2021-01-07T12:00:00.000' AS DateTime), 1, CAST(N'2021-01-08T00:00:00.000' AS DateTime), CAST(N'2021-01-10T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10407, 56, CAST(N'2021-01-07T00:00:00.000' AS DateTime), 2, CAST(N'2021-01-07T12:00:00.000' AS DateTime), 2, CAST(N'2021-01-08T00:00:00.000' AS DateTime), CAST(N'2021-01-10T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10408, 23, CAST(N'2021-01-08T00:00:00.000' AS DateTime), 8, CAST(N'2021-01-08T12:00:00.000' AS DateTime), 1, CAST(N'2021-01-09T00:00:00.000' AS DateTime), CAST(N'2021-01-11T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10409, 54, CAST(N'2021-01-09T00:00:00.000' AS DateTime), 3, CAST(N'2021-01-09T12:00:00.000' AS DateTime), 1, CAST(N'2021-01-10T00:00:00.000' AS DateTime), CAST(N'2021-01-12T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10410, 10, CAST(N'2021-01-10T00:00:00.000' AS DateTime), 3, CAST(N'2021-01-10T12:00:00.000' AS DateTime), 3, CAST(N'2021-01-11T00:00:00.000' AS DateTime), CAST(N'2021-01-13T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10411, 10, CAST(N'2021-01-10T00:00:00.000' AS DateTime), 9, CAST(N'2021-01-10T12:00:00.000' AS DateTime), 3, CAST(N'2021-01-11T00:00:00.000' AS DateTime), CAST(N'2021-01-13T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10412, 87, CAST(N'2021-01-13T00:00:00.000' AS DateTime), 8, CAST(N'2021-01-13T12:00:00.000' AS DateTime), 2, CAST(N'2021-01-14T00:00:00.000' AS DateTime), CAST(N'2021-01-16T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10413, 41, CAST(N'2021-01-14T00:00:00.000' AS DateTime), 3, CAST(N'2021-01-14T12:00:00.000' AS DateTime), 2, CAST(N'2021-01-15T00:00:00.000' AS DateTime), CAST(N'2021-01-17T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10414, 21, CAST(N'2021-01-14T00:00:00.000' AS DateTime), 2, CAST(N'2021-01-14T12:00:00.000' AS DateTime), 3, CAST(N'2021-01-15T00:00:00.000' AS DateTime), CAST(N'2021-01-17T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10415, 36, CAST(N'2021-01-15T00:00:00.000' AS DateTime), 3, CAST(N'2021-01-15T12:00:00.000' AS DateTime), 1, CAST(N'2021-01-16T00:00:00.000' AS DateTime), CAST(N'2021-01-18T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10416, 87, CAST(N'2021-01-16T00:00:00.000' AS DateTime), 8, CAST(N'2021-01-16T12:00:00.000' AS DateTime), 3, CAST(N'2021-01-17T00:00:00.000' AS DateTime), CAST(N'2021-01-19T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10417, 73, CAST(N'2021-01-16T00:00:00.000' AS DateTime), 4, CAST(N'2021-01-16T12:00:00.000' AS DateTime), 3, CAST(N'2021-01-17T00:00:00.000' AS DateTime), CAST(N'2021-01-19T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10418, 63, CAST(N'2021-01-17T00:00:00.000' AS DateTime), 4, CAST(N'2021-01-17T12:00:00.000' AS DateTime), 1, CAST(N'2021-01-18T00:00:00.000' AS DateTime), CAST(N'2021-01-20T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10419, 68, CAST(N'2021-01-20T00:00:00.000' AS DateTime), 4, CAST(N'2021-01-20T12:00:00.000' AS DateTime), 2, CAST(N'2021-01-21T00:00:00.000' AS DateTime), CAST(N'2021-01-23T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10420, 88, CAST(N'2021-01-21T00:00:00.000' AS DateTime), 3, CAST(N'2021-01-21T12:00:00.000' AS DateTime), 1, CAST(N'2021-01-22T00:00:00.000' AS DateTime), CAST(N'2021-01-24T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10421, 61, CAST(N'2021-01-21T00:00:00.000' AS DateTime), 8, CAST(N'2021-01-21T12:00:00.000' AS DateTime), 1, CAST(N'2021-01-22T00:00:00.000' AS DateTime), CAST(N'2021-01-24T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10422, 27, CAST(N'2021-01-22T00:00:00.000' AS DateTime), 2, CAST(N'2021-01-22T12:00:00.000' AS DateTime), 1, CAST(N'2021-01-23T00:00:00.000' AS DateTime), CAST(N'2021-01-25T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10423, 31, CAST(N'2021-01-23T00:00:00.000' AS DateTime), 6, CAST(N'2021-01-23T12:00:00.000' AS DateTime), 3, CAST(N'2021-01-24T00:00:00.000' AS DateTime), CAST(N'2021-01-26T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10424, 51, CAST(N'2021-01-23T00:00:00.000' AS DateTime), 7, CAST(N'2021-01-23T12:00:00.000' AS DateTime), 2, CAST(N'2021-01-24T00:00:00.000' AS DateTime), CAST(N'2021-01-26T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10425, 41, CAST(N'2021-01-24T00:00:00.000' AS DateTime), 6, CAST(N'2021-01-24T12:00:00.000' AS DateTime), 2, CAST(N'2021-01-25T00:00:00.000' AS DateTime), CAST(N'2021-01-27T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10426, 29, CAST(N'2021-01-27T00:00:00.000' AS DateTime), 4, CAST(N'2021-01-27T12:00:00.000' AS DateTime), 1, CAST(N'2021-01-28T00:00:00.000' AS DateTime), CAST(N'2021-01-30T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10427, 59, CAST(N'2021-01-27T00:00:00.000' AS DateTime), 4, CAST(N'2021-01-27T12:00:00.000' AS DateTime), 2, CAST(N'2021-01-28T00:00:00.000' AS DateTime), CAST(N'2021-01-30T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10428, 66, CAST(N'2021-01-28T00:00:00.000' AS DateTime), 7, CAST(N'2021-01-28T12:00:00.000' AS DateTime), 1, CAST(N'2021-01-29T00:00:00.000' AS DateTime), CAST(N'2021-01-31T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10429, 37, CAST(N'2021-01-29T00:00:00.000' AS DateTime), 3, CAST(N'2021-01-29T12:00:00.000' AS DateTime), 2, CAST(N'2021-01-30T00:00:00.000' AS DateTime), CAST(N'2021-02-01T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10430, 20, CAST(N'2021-01-30T00:00:00.000' AS DateTime), 4, CAST(N'2021-01-30T12:00:00.000' AS DateTime), 1, CAST(N'2021-01-31T00:00:00.000' AS DateTime), CAST(N'2021-02-02T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10431, 10, CAST(N'2021-01-30T00:00:00.000' AS DateTime), 4, CAST(N'2021-01-30T12:00:00.000' AS DateTime), 2, CAST(N'2021-01-31T00:00:00.000' AS DateTime), CAST(N'2021-02-02T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10432, 75, CAST(N'2021-01-31T00:00:00.000' AS DateTime), 3, CAST(N'2021-01-31T12:00:00.000' AS DateTime), 2, CAST(N'2021-02-01T00:00:00.000' AS DateTime), CAST(N'2021-02-03T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10433, 60, CAST(N'2021-02-03T00:00:00.000' AS DateTime), 3, CAST(N'2021-02-03T12:00:00.000' AS DateTime), 3, CAST(N'2021-02-04T00:00:00.000' AS DateTime), CAST(N'2021-02-06T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10434, 24, CAST(N'2021-02-03T00:00:00.000' AS DateTime), 3, CAST(N'2021-02-03T12:00:00.000' AS DateTime), 2, CAST(N'2021-02-04T00:00:00.000' AS DateTime), CAST(N'2021-02-06T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10435, 16, CAST(N'2021-02-04T00:00:00.000' AS DateTime), 8, CAST(N'2021-02-04T12:00:00.000' AS DateTime), 2, CAST(N'2021-02-05T00:00:00.000' AS DateTime), CAST(N'2021-02-07T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10436, 7, CAST(N'2021-02-05T00:00:00.000' AS DateTime), 3, CAST(N'2021-02-05T12:00:00.000' AS DateTime), 2, CAST(N'2021-02-06T00:00:00.000' AS DateTime), CAST(N'2021-02-08T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10437, 87, CAST(N'2021-02-05T00:00:00.000' AS DateTime), 8, CAST(N'2021-02-05T12:00:00.000' AS DateTime), 1, CAST(N'2021-02-06T00:00:00.000' AS DateTime), CAST(N'2021-02-08T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10438, 79, CAST(N'2021-02-06T00:00:00.000' AS DateTime), 3, CAST(N'2021-02-06T12:00:00.000' AS DateTime), 2, CAST(N'2021-02-07T00:00:00.000' AS DateTime), CAST(N'2021-02-09T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10439, 51, CAST(N'2021-02-07T00:00:00.000' AS DateTime), 6, CAST(N'2021-02-07T12:00:00.000' AS DateTime), 3, CAST(N'2021-02-08T00:00:00.000' AS DateTime), CAST(N'2021-02-10T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10440, 71, CAST(N'2021-02-10T00:00:00.000' AS DateTime), 4, CAST(N'2021-02-10T12:00:00.000' AS DateTime), 2, CAST(N'2021-02-11T00:00:00.000' AS DateTime), CAST(N'2021-02-13T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10441, 55, CAST(N'2021-02-10T00:00:00.000' AS DateTime), 3, CAST(N'2021-02-10T12:00:00.000' AS DateTime), 2, CAST(N'2021-02-11T00:00:00.000' AS DateTime), CAST(N'2021-02-13T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10442, 20, CAST(N'2021-02-11T00:00:00.000' AS DateTime), 3, CAST(N'2021-02-11T12:00:00.000' AS DateTime), 2, CAST(N'2021-02-12T00:00:00.000' AS DateTime), CAST(N'2021-02-14T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10443, 66, CAST(N'2021-02-12T00:00:00.000' AS DateTime), 8, CAST(N'2021-02-12T12:00:00.000' AS DateTime), 1, CAST(N'2021-02-13T00:00:00.000' AS DateTime), CAST(N'2021-02-15T00:00:00.000' AS DateTime), 4)
GO
SET IDENTITY_INSERT [Orders] OFF
GO
INSERT [OrderStatus] ([Status], [Description]) VALUES (-2, N'Rejected')
GO
INSERT [OrderStatus] ([Status], [Description]) VALUES (-1, N'Cancel')
GO
INSERT [OrderStatus] ([Status], [Description]) VALUES (1, N'Init')
GO
INSERT [OrderStatus] ([Status], [Description]) VALUES (2, N'Accepted')
GO
INSERT [OrderStatus] ([Status], [Description]) VALUES (3, N'Shipping')
GO
INSERT [OrderStatus] ([Status], [Description]) VALUES (4, N'Finished')
GO
SET IDENTITY_INSERT [Products] ON 
GO
INSERT [Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [Unit], [Price], [Photo]) VALUES (1, N'Chais', 1, 1, N'10 boxes x 20 bags', 18.0000, N'http://dummyimage.com/250x250.png/5fa2dd/ffffff&text=Product Photo')
GO
INSERT [Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [Unit], [Price], [Photo]) VALUES (2, N'Chang', 1, 1, N'24 - 12 oz bottles', 19.0000, N'http://dummyimage.com/250x250.png/5fa2dd/ffffff&text=Product Photo')
GO
INSERT [Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [Unit], [Price], [Photo]) VALUES (3, N'Aniseed Syrup', 1, 2, N'12 - 550 ml bottles', 10.0000, N'http://dummyimage.com/250x250.png/ff4444/ffffff&text=Product Photo')
GO
INSERT [Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [Unit], [Price], [Photo]) VALUES (4, N'Chef Anton''s Cajun Seasoning', 2, 2, N'48 - 6 oz jars', 22.0000, N'http://dummyimage.com/250x250.png/cc0000/ffffff&text=Product Photo')
GO
INSERT [Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [Unit], [Price], [Photo]) VALUES (5, N'Chef Anton''s Gumbo Mix', 2, 2, N'36 boxes', 21.3500, N'http://dummyimage.com/250x250.png/5fa2dd/ffffff&text=Product Photo')
GO
INSERT [Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [Unit], [Price], [Photo]) VALUES (6, N'Grandma''s Boysenberry Spread', 3, 2, N'12 - 8 oz jars', 25.0000, N'http://dummyimage.com/250x250.png/5fa2dd/ffffff&text=Product Photo')
GO
INSERT [Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [Unit], [Price], [Photo]) VALUES (7, N'Uncle Bob''s Organic Dried Pears', 3, 7, N'12 - 1 lb pkgs.', 30.0000, N'http://dummyimage.com/250x250.png/5fa2dd/ffffff&text=Product Photo')
GO
INSERT [Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [Unit], [Price], [Photo]) VALUES (8, N'Northwoods Cranberry Sauce', 3, 2, N'12 - 12 oz jars', 40.0000, N'http://dummyimage.com/250x250.png/dddddd/000000&text=Product Photo')
GO
INSERT [Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [Unit], [Price], [Photo]) VALUES (9, N'Mishi Kobe Niku', 4, 6, N'18 - 500 g pkgs.', 97.0000, N'http://dummyimage.com/250x250.png/dddddd/000000&text=Product Photo')
GO
INSERT [Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [Unit], [Price], [Photo]) VALUES (10, N'Ikura', 4, 8, N'12 - 200 ml jars', 31.0000, N'http://dummyimage.com/250x250.png/ff4444/ffffff&text=Product Photo')
GO
INSERT [Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [Unit], [Price], [Photo]) VALUES (11, N'Queso Cabrales', 5, 4, N'1 kg pkg.', 21.0000, N'http://dummyimage.com/250x250.png/dddddd/000000&text=Product Photo')
GO
INSERT [Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [Unit], [Price], [Photo]) VALUES (12, N'Queso Manchego La Pastora', 5, 4, N'10 - 500 g pkgs.', 38.0000, N'http://dummyimage.com/250x250.png/ff4444/ffffff&text=Product Photo')
GO
INSERT [Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [Unit], [Price], [Photo]) VALUES (13, N'Konbu', 6, 8, N'2 kg box', 6.0000, N'http://dummyimage.com/250x250.png/dddddd/000000&text=Product Photo')
GO
INSERT [Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [Unit], [Price], [Photo]) VALUES (14, N'Tofu', 6, 7, N'40 - 100 g pkgs.', 23.2500, N'http://dummyimage.com/250x250.png/cc0000/ffffff&text=Product Photo')
GO
INSERT [Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [Unit], [Price], [Photo]) VALUES (15, N'Genen Shouyu', 6, 2, N'24 - 250 ml bottles', 15.5000, N'http://dummyimage.com/250x250.png/5fa2dd/ffffff&text=Product Photo')
GO
INSERT [Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [Unit], [Price], [Photo]) VALUES (16, N'Pavlova', 7, 3, N'32 - 500 g boxes', 17.4500, N'http://dummyimage.com/250x250.png/dddddd/000000&text=Product Photo')
GO
INSERT [Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [Unit], [Price], [Photo]) VALUES (17, N'Alice Mutton', 7, 6, N'20 - 1 kg tins', 39.0000, N'http://dummyimage.com/250x250.png/ff4444/ffffff&text=Product Photo')
GO
INSERT [Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [Unit], [Price], [Photo]) VALUES (18, N'Carnarvon Tigers', 7, 8, N'16 kg pkg.', 62.5000, N'http://dummyimage.com/250x250.png/ff4444/ffffff&text=Product Photo')
GO
INSERT [Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [Unit], [Price], [Photo]) VALUES (19, N'Teatime Chocolate Biscuits', 8, 3, N'10 boxes x 12 pieces', 9.2000, N'http://dummyimage.com/250x250.png/ff4444/ffffff&text=Product Photo')
GO
INSERT [Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [Unit], [Price], [Photo]) VALUES (20, N'Sir Rodney''s Marmalade', 8, 3, N'30 gift boxes', 81.0000, N'http://dummyimage.com/250x250.png/dddddd/000000&text=Product Photo')
GO
INSERT [Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [Unit], [Price], [Photo]) VALUES (21, N'Sir Rodney''s Scones', 8, 3, N'24 pkgs. x 4 pieces', 10.0000, N'http://dummyimage.com/250x250.png/ff4444/ffffff&text=Product Photo')
GO
INSERT [Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [Unit], [Price], [Photo]) VALUES (22, N'Gustaf''s Knäckebröd', 9, 5, N'24 - 500 g pkgs.', 21.0000, N'http://dummyimage.com/250x250.png/ff4444/ffffff&text=Product Photo')
GO
INSERT [Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [Unit], [Price], [Photo]) VALUES (23, N'Tunnbröd', 9, 5, N'12 - 250 g pkgs.', 9.0000, N'http://dummyimage.com/250x250.png/dddddd/000000&text=Product Photo')
GO
INSERT [Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [Unit], [Price], [Photo]) VALUES (24, N'Guaraná Fantástica', 10, 1, N'12 - 355 ml cans', 4.5000, N'http://dummyimage.com/250x250.png/ff4444/ffffff&text=Product Photo')
GO
INSERT [Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [Unit], [Price], [Photo]) VALUES (25, N'NuNuCa Nuß-Nougat-Creme', 11, 3, N'20 - 450 g glasses', 14.0000, N'http://dummyimage.com/250x250.png/5fa2dd/ffffff&text=Product Photo')
GO
INSERT [Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [Unit], [Price], [Photo]) VALUES (26, N'Gumbär Gummibärchen', 11, 3, N'100 - 250 g bags', 31.2300, N'http://dummyimage.com/250x250.png/dddddd/000000&text=Product Photo')
GO
INSERT [Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [Unit], [Price], [Photo]) VALUES (27, N'Schoggi Schokolade', 11, 3, N'100 - 100 g pieces', 43.9000, N'http://dummyimage.com/250x250.png/dddddd/000000&text=Product Photo')
GO
INSERT [Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [Unit], [Price], [Photo]) VALUES (28, N'Rössle Sauerkraut', 12, 7, N'25 - 825 g cans', 45.6000, N'http://dummyimage.com/250x250.png/5fa2dd/ffffff&text=Product Photo')
GO
INSERT [Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [Unit], [Price], [Photo]) VALUES (29, N'Thüringer Rostbratwurst', 12, 6, N'50 bags x 30 sausgs.', 123.7900, N'http://dummyimage.com/250x250.png/dddddd/000000&text=Product Photo')
GO
INSERT [Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [Unit], [Price], [Photo]) VALUES (30, N'Nord-Ost Matjeshering', 13, 8, N'10 - 200 g glasses', 25.8900, N'http://dummyimage.com/250x250.png/ff4444/ffffff&text=Product Photo')
GO
INSERT [Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [Unit], [Price], [Photo]) VALUES (31, N'Gorgonzola Telino', 14, 4, N'12 - 100 g pkgs', 12.5000, N'http://dummyimage.com/250x250.png/dddddd/000000&text=Product Photo')
GO
INSERT [Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [Unit], [Price], [Photo]) VALUES (32, N'Mascarpone Fabioli', 14, 4, N'24 - 200 g pkgs.', 32.0000, N'http://dummyimage.com/250x250.png/cc0000/ffffff&text=Product Photo')
GO
INSERT [Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [Unit], [Price], [Photo]) VALUES (33, N'Geitost', 15, 4, N'500 g', 2.5000, N'http://dummyimage.com/250x250.png/dddddd/000000&text=Product Photo')
GO
INSERT [Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [Unit], [Price], [Photo]) VALUES (34, N'Sasquatch Ale', 16, 1, N'24 - 12 oz bottles', 14.0000, N'http://dummyimage.com/250x250.png/dddddd/000000&text=Product Photo')
GO
INSERT [Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [Unit], [Price], [Photo]) VALUES (35, N'Steeleye Stout', 16, 1, N'24 - 12 oz bottles', 18.0000, N'http://dummyimage.com/250x250.png/cc0000/ffffff&text=Product Photo')
GO
INSERT [Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [Unit], [Price], [Photo]) VALUES (36, N'Inlagd Sill', 17, 8, N'24 - 250 g jars', 19.0000, N'http://dummyimage.com/250x250.png/cc0000/ffffff&text=Product Photo')
GO
INSERT [Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [Unit], [Price], [Photo]) VALUES (37, N'Gravad lax', 17, 8, N'12 - 500 g pkgs.', 26.0000, N'http://dummyimage.com/250x250.png/cc0000/ffffff&text=Product Photo')
GO
INSERT [Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [Unit], [Price], [Photo]) VALUES (38, N'Côte de Blaye', 18, 1, N'12 - 75 cl bottles', 263.5000, N'http://dummyimage.com/250x250.png/dddddd/000000&text=Product Photo')
GO
INSERT [Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [Unit], [Price], [Photo]) VALUES (39, N'Chartreuse verte', 18, 1, N'750 cc per bottle', 18.0000, N'http://dummyimage.com/250x250.png/5fa2dd/ffffff&text=Product Photo')
GO
INSERT [Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [Unit], [Price], [Photo]) VALUES (40, N'Boston Crab Meat', 19, 8, N'24 - 4 oz tins', 18.4000, N'http://dummyimage.com/250x250.png/dddddd/000000&text=Product Photo')
GO
INSERT [Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [Unit], [Price], [Photo]) VALUES (41, N'Jack''s New England Clam Chowder', 19, 8, N'12 - 12 oz cans', 9.6500, N'http://dummyimage.com/250x250.png/5fa2dd/ffffff&text=Product Photo')
GO
INSERT [Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [Unit], [Price], [Photo]) VALUES (42, N'Singaporean Hokkien Fried Mee', 20, 5, N'32 - 1 kg pkgs.', 14.0000, N'http://dummyimage.com/250x250.png/5fa2dd/ffffff&text=Product Photo')
GO
INSERT [Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [Unit], [Price], [Photo]) VALUES (43, N'Ipoh Coffee', 20, 1, N'16 - 500 g tins', 46.0000, N'http://dummyimage.com/250x250.png/cc0000/ffffff&text=Product Photo')
GO
INSERT [Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [Unit], [Price], [Photo]) VALUES (44, N'Gula Malacca', 20, 2, N'20 - 2 kg bags', 19.4500, N'http://dummyimage.com/250x250.png/5fa2dd/ffffff&text=Product Photo')
GO
INSERT [Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [Unit], [Price], [Photo]) VALUES (45, N'Røgede sild', 21, 8, N'1k pkg.', 9.5000, N'http://dummyimage.com/250x250.png/cc0000/ffffff&text=Product Photo')
GO
INSERT [Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [Unit], [Price], [Photo]) VALUES (46, N'Spegesild', 21, 8, N'4 - 450 g glasses', 12.0000, N'http://dummyimage.com/250x250.png/dddddd/000000&text=Product Photo')
GO
INSERT [Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [Unit], [Price], [Photo]) VALUES (47, N'Zaanse koeken', 22, 3, N'10 - 4 oz boxes', 9.5000, N'http://dummyimage.com/250x250.png/5fa2dd/ffffff&text=Product Photo')
GO
INSERT [Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [Unit], [Price], [Photo]) VALUES (48, N'Chocolade', 22, 3, N'10 pkgs.', 12.7500, N'http://dummyimage.com/250x250.png/ff4444/ffffff&text=Product Photo')
GO
INSERT [Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [Unit], [Price], [Photo]) VALUES (49, N'Maxilaku', 23, 3, N'24 - 50 g pkgs.', 20.0000, N'http://dummyimage.com/250x250.png/ff4444/ffffff&text=Product Photo')
GO
INSERT [Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [Unit], [Price], [Photo]) VALUES (50, N'Valkoinen suklaa', 23, 3, N'12 - 100 g bars', 16.2500, N'http://dummyimage.com/250x250.png/5fa2dd/ffffff&text=Product Photo')
GO
INSERT [Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [Unit], [Price], [Photo]) VALUES (51, N'Manjimup Dried Apples', 24, 7, N'50 - 300 g pkgs.', 53.0000, N'http://dummyimage.com/250x250.png/dddddd/000000&text=Product Photo')
GO
INSERT [Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [Unit], [Price], [Photo]) VALUES (52, N'Filo Mix', 24, 5, N'16 - 2 kg boxes', 7.0000, N'http://dummyimage.com/250x250.png/ff4444/ffffff&text=Product Photo')
GO
INSERT [Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [Unit], [Price], [Photo]) VALUES (53, N'Perth Pasties', 24, 6, N'48 pieces', 32.8000, N'http://dummyimage.com/250x250.png/cc0000/ffffff&text=Product Photo')
GO
INSERT [Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [Unit], [Price], [Photo]) VALUES (54, N'Tourtière', 25, 6, N'16 pies', 7.4500, N'http://dummyimage.com/250x250.png/cc0000/ffffff&text=Product Photo')
GO
INSERT [Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [Unit], [Price], [Photo]) VALUES (55, N'Pâté chinois', 25, 6, N'24 boxes x 2 pies', 24.0000, N'http://dummyimage.com/250x250.png/dddddd/000000&text=Product Photo')
GO
INSERT [Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [Unit], [Price], [Photo]) VALUES (56, N'Gnocchi di nonna Alice', 26, 5, N'24 - 250 g pkgs.', 38.0000, N'http://dummyimage.com/250x250.png/5fa2dd/ffffff&text=Product Photo')
GO
INSERT [Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [Unit], [Price], [Photo]) VALUES (57, N'Ravioli Angelo', 26, 5, N'24 - 250 g pkgs.', 19.5000, N'http://dummyimage.com/250x250.png/5fa2dd/ffffff&text=Product Photo')
GO
INSERT [Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [Unit], [Price], [Photo]) VALUES (58, N'Escargots de Bourgogne', 27, 8, N'24 pieces', 13.2500, N'http://dummyimage.com/250x250.png/ff4444/ffffff&text=Product Photo')
GO
INSERT [Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [Unit], [Price], [Photo]) VALUES (59, N'Raclette Courdavault', 28, 4, N'5 kg pkg.', 55.0000, N'http://dummyimage.com/250x250.png/5fa2dd/ffffff&text=Product Photo')
GO
INSERT [Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [Unit], [Price], [Photo]) VALUES (60, N'Camembert Pierrot', 28, 4, N'15 - 300 g rounds', 34.0000, N'http://dummyimage.com/250x250.png/5fa2dd/ffffff&text=Product Photo')
GO
INSERT [Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [Unit], [Price], [Photo]) VALUES (61, N'Sirop d''érable', 29, 2, N'24 - 500 ml bottles', 28.5000, N'http://dummyimage.com/250x250.png/5fa2dd/ffffff&text=Product Photo')
GO
INSERT [Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [Unit], [Price], [Photo]) VALUES (62, N'Tarte au sucre', 29, 3, N'48 pies', 49.3000, N'http://dummyimage.com/250x250.png/dddddd/000000&text=Product Photo')
GO
INSERT [Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [Unit], [Price], [Photo]) VALUES (63, N'Vegie-spread', 7, 2, N'15 - 625 g jars', 43.9000, N'http://dummyimage.com/250x250.png/cc0000/ffffff&text=Product Photo')
GO
INSERT [Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [Unit], [Price], [Photo]) VALUES (64, N'Wimmers gute Semmelknödel', 12, 5, N'20 bags x 4 pieces', 33.2500, N'http://dummyimage.com/250x250.png/dddddd/000000&text=Product Photo')
GO
INSERT [Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [Unit], [Price], [Photo]) VALUES (65, N'Louisiana Fiery Hot Pepper Sauce', 2, 2, N'32 - 8 oz bottles', 21.0500, N'http://dummyimage.com/250x250.png/ff4444/ffffff&text=Product Photo')
GO
INSERT [Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [Unit], [Price], [Photo]) VALUES (66, N'Louisiana Hot Spiced Okra', 2, 2, N'24 - 8 oz jars', 17.0000, N'http://dummyimage.com/250x250.png/5fa2dd/ffffff&text=Product Photo')
GO
INSERT [Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [Unit], [Price], [Photo]) VALUES (67, N'Laughing Lumberjack Lager', 16, 1, N'24 - 12 oz bottles', 14.0000, N'http://dummyimage.com/250x250.png/dddddd/000000&text=Product Photo')
GO
INSERT [Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [Unit], [Price], [Photo]) VALUES (68, N'Scottish Longbreads', 8, 3, N'10 boxes x 8 pieces', 12.5000, N'http://dummyimage.com/250x250.png/ff4444/ffffff&text=Product Photo')
GO
INSERT [Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [Unit], [Price], [Photo]) VALUES (69, N'Gudbrandsdalsost', 15, 4, N'10 kg pkg.', 36.0000, N'http://dummyimage.com/250x250.png/ff4444/ffffff&text=Product Photo')
GO
INSERT [Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [Unit], [Price], [Photo]) VALUES (70, N'Outback Lager', 7, 1, N'24 - 355 ml bottles', 15.0000, N'http://dummyimage.com/250x250.png/ff4444/ffffff&text=Product Photo')
GO
INSERT [Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [Unit], [Price], [Photo]) VALUES (71, N'Fløtemysost', 15, 4, N'10 - 500 g pkgs.', 21.5000, N'http://dummyimage.com/250x250.png/ff4444/ffffff&text=Product Photo')
GO
INSERT [Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [Unit], [Price], [Photo]) VALUES (72, N'Mozzarella di Giovanni', 14, 4, N'24 - 200 g pkgs.', 34.8000, N'http://dummyimage.com/250x250.png/5fa2dd/ffffff&text=Product Photo')
GO
INSERT [Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [Unit], [Price], [Photo]) VALUES (73, N'Röd Kaviar', 17, 8, N'24 - 150 g jars', 15.0000, N'http://dummyimage.com/250x250.png/5fa2dd/ffffff&text=Product Photo')
GO
INSERT [Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [Unit], [Price], [Photo]) VALUES (74, N'Longlife Tofu', 4, 7, N'5 kg pkg.', 10.0000, N'http://dummyimage.com/250x250.png/dddddd/000000&text=Product Photo')
GO
INSERT [Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [Unit], [Price], [Photo]) VALUES (75, N'Rhönbräu Klosterbier', 12, 1, N'24 - 0.5 l bottles', 7.7500, N'http://dummyimage.com/250x250.png/ff4444/ffffff&text=Product Photo')
GO
INSERT [Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [Unit], [Price], [Photo]) VALUES (76, N'Lakkalikööri', 23, 1, N'500 ml', 18.0000, N'http://dummyimage.com/250x250.png/cc0000/ffffff&text=Product Photo')
GO
INSERT [Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [Unit], [Price], [Photo]) VALUES (77, N'Original Frankfurter grüne Soße', 12, 2, N'12 boxes', 13.0000, N'http://dummyimage.com/250x250.png/dddddd/000000&text=Product Photo')
GO
SET IDENTITY_INSERT [Products] OFF
GO
SET IDENTITY_INSERT [Shippers] ON 
GO
INSERT [Shippers] ([ShipperID], [ShipperName], [Phone]) VALUES (1, N'Speedy Express', N'(503) 555-9831')
GO
INSERT [Shippers] ([ShipperID], [ShipperName], [Phone]) VALUES (2, N'United Package', N'(503) 555-3199')
GO
INSERT [Shippers] ([ShipperID], [ShipperName], [Phone]) VALUES (3, N'Federal Shipping', N'(503) 555-9931')
GO
SET IDENTITY_INSERT [Shippers] OFF
GO
SET IDENTITY_INSERT [Suppliers] ON 
GO
INSERT [Suppliers] ([SupplierID], [SupplierName], [ContactName], [Address], [City], [PostalCode], [Country], [Phone]) VALUES (1, N'Exotic Liquid', N'Charlotte Cooper', N'49 Gilbert St.', N'Londona', N'EC1 4SD', N'UK', N'(171) 555-2222')
GO
INSERT [Suppliers] ([SupplierID], [SupplierName], [ContactName], [Address], [City], [PostalCode], [Country], [Phone]) VALUES (2, N'New Orleans Cajun Delights', N'Shelley Burke', N'P.O. Box 78934', N'New Orleans', N'70117', N'USA', N'(100) 555-4822')
GO
INSERT [Suppliers] ([SupplierID], [SupplierName], [ContactName], [Address], [City], [PostalCode], [Country], [Phone]) VALUES (3, N'Grandma Kelly''s Homestead', N'Regina Murphy', N'707 Oxford Rd.', N'Ann Arbor', N'48104', N'USA', N'(313) 555-5735')
GO
INSERT [Suppliers] ([SupplierID], [SupplierName], [ContactName], [Address], [City], [PostalCode], [Country], [Phone]) VALUES (4, N'Tokyo Traders', N'Yoshi Nagase', N'9-8 Sekimai Musashino-shi', N'Tokyo', N'100', N'Japan', N'(03) 3555-5011')
GO
INSERT [Suppliers] ([SupplierID], [SupplierName], [ContactName], [Address], [City], [PostalCode], [Country], [Phone]) VALUES (5, N'Cooperativa de Quesos ''Las Cabras''', N'Antonio del Valle Saavedra', N'Calle del Rosal 4', N'Oviedo', N'33007', N'Spain', N'(98) 598 76 54')
GO
INSERT [Suppliers] ([SupplierID], [SupplierName], [ContactName], [Address], [City], [PostalCode], [Country], [Phone]) VALUES (6, N'Mayumi''s', N'Mayumi Ohno', N'92 Setsuko Chuo-ku', N'Osaka', N'545', N'Japan', N'(06) 431-7877')
GO
INSERT [Suppliers] ([SupplierID], [SupplierName], [ContactName], [Address], [City], [PostalCode], [Country], [Phone]) VALUES (7, N'Pavlova, Ltd.', N'Ian Devling', N'74 Rose St. Moonie Ponds', N'Melbourne', N'3058', N'Australia', N'(03) 444-2343')
GO
INSERT [Suppliers] ([SupplierID], [SupplierName], [ContactName], [Address], [City], [PostalCode], [Country], [Phone]) VALUES (8, N'Specialty Biscuits, Ltd.', N'Peter Wilson', N'29 King''s Way', N'Manchester', N'M14 GSD', N'UK', N'(161) 555-4448')
GO
INSERT [Suppliers] ([SupplierID], [SupplierName], [ContactName], [Address], [City], [PostalCode], [Country], [Phone]) VALUES (9, N'PB Knäckebröd AB', N'Lars Peterson', N'Kaloadagatan 13', N'Göteborg', N'S-345 67', N'Sweden', N'031-987 65 43')
GO
INSERT [Suppliers] ([SupplierID], [SupplierName], [ContactName], [Address], [City], [PostalCode], [Country], [Phone]) VALUES (10, N'Refrescos Americanas LTDA', N'Carlos Diaz', N'Av. das Americanas 12.890', N'São Paulo', N'5442', N'Brazil', N'(11) 555 4640')
GO
INSERT [Suppliers] ([SupplierID], [SupplierName], [ContactName], [Address], [City], [PostalCode], [Country], [Phone]) VALUES (11, N'Heli Süßwaren GmbH & Co. KG', N'Petra Winkler dà dsf à fdsfsfsdf s', N'Tiergartenstraße 5', N'Berlin', N'10785', N'Germany', N'(010) 9984510')
GO
INSERT [Suppliers] ([SupplierID], [SupplierName], [ContactName], [Address], [City], [PostalCode], [Country], [Phone]) VALUES (12, N'Plutzer Lebensmittelgroßmärkte AG', N'Martin Bein PL', N'Bogenallee 77', N'Londona', N'60439', N'Germany', N'(069) 992755')
GO
INSERT [Suppliers] ([SupplierID], [SupplierName], [ContactName], [Address], [City], [PostalCode], [Country], [Phone]) VALUES (13, N'Nord-Ost-Fisch Handelsgesellschaft mbH', N'Sven Petersen', N'Frahmredder 112a', N'Cuxhaven', N'27478', N'Germany', N'(04721) 8713')
GO
INSERT [Suppliers] ([SupplierID], [SupplierName], [ContactName], [Address], [City], [PostalCode], [Country], [Phone]) VALUES (14, N'Formaggi Fortini s.r.l.', N'Elio Rossi', N'Viale Dante, 75', N'Ravenna', N'48100', N'Italy', N'(0544) 60323')
GO
INSERT [Suppliers] ([SupplierID], [SupplierName], [ContactName], [Address], [City], [PostalCode], [Country], [Phone]) VALUES (15, N'Norske Meierier', N'Beate Vileid', N'Hatlevegen 5', N'Sandvika', N'1320', N'Norway', N'(0)2-953010')
GO
INSERT [Suppliers] ([SupplierID], [SupplierName], [ContactName], [Address], [City], [PostalCode], [Country], [Phone]) VALUES (16, N'Bigfoot Breweries', N'Cheryl Saylor', N'3400 - 8th Avenue Suite 210', N'Bend', N'97101', N'USA', N'(503) 555-9931')
GO
INSERT [Suppliers] ([SupplierID], [SupplierName], [ContactName], [Address], [City], [PostalCode], [Country], [Phone]) VALUES (17, N'Svensk Sjöföda AB', N'Michael Björn', N'Brovallavägen 231', N'Stockholm', N'S-123 45', N'Sweden', N'08-123 45 67')
GO
INSERT [Suppliers] ([SupplierID], [SupplierName], [ContactName], [Address], [City], [PostalCode], [Country], [Phone]) VALUES (18, N'Aux joyeux', N'Guylène Nodier', N'203, Rue des Francs-Bourgeois', N'Paris', N'75004', N'France', N'(1) 03.83.00.68')
GO
INSERT [Suppliers] ([SupplierID], [SupplierName], [ContactName], [Address], [City], [PostalCode], [Country], [Phone]) VALUES (19, N'New England Seafood Cannery', N'Robb Merchant', N'Order Processing Dept. 2100 Paul Revere Blvd.', N'Boston', N'02134', N'USA', N'(617) 555-3267')
GO
INSERT [Suppliers] ([SupplierID], [SupplierName], [ContactName], [Address], [City], [PostalCode], [Country], [Phone]) VALUES (20, N'Leka Trading', N'Chandra Leka', N'471 Serangoon Loop, Suite #402', N'Singapore', N'0512', N'Singapore', N'555-8787')
GO
INSERT [Suppliers] ([SupplierID], [SupplierName], [ContactName], [Address], [City], [PostalCode], [Country], [Phone]) VALUES (21, N'Lyngbysild', N'Niels Petersen', N'Lyngbysild Fiskebakken 10', N'Lyngby', N'2800', N'Denmark', N'43844108')
GO
INSERT [Suppliers] ([SupplierID], [SupplierName], [ContactName], [Address], [City], [PostalCode], [Country], [Phone]) VALUES (22, N'Zaanse Snoepfabriek', N'Dirk Luchte', N'Verkoop Rijnweg 22', N'Zaandam', N'9999 ZZ', N'Netherlands', N'(12345) 1212')
GO
INSERT [Suppliers] ([SupplierID], [SupplierName], [ContactName], [Address], [City], [PostalCode], [Country], [Phone]) VALUES (23, N'Karkki Oy', N'Anne Heikkonen', N'77 Nguyễn Huệ', N'Londona', N'53120', N'Netherlands', N'(953) 10956')
GO
INSERT [Suppliers] ([SupplierID], [SupplierName], [ContactName], [Address], [City], [PostalCode], [Country], [Phone]) VALUES (24, N'G''day, Mate', N'Wendy Mackenzie', N'170 Prince Edward Parade Hunter''s Hill', N'Sydney', N'2042', N'Australia', N'(02) 555-5914')
GO
INSERT [Suppliers] ([SupplierID], [SupplierName], [ContactName], [Address], [City], [PostalCode], [Country], [Phone]) VALUES (25, N'Ma Maison', N'Jean-Guy Lauzon', N'2960 Rue St. Laurent da fdsf dsà', N'Montréal', N'H1J 1C3', N'Canada', N'(514) 555-9022')
GO
INSERT [Suppliers] ([SupplierID], [SupplierName], [ContactName], [Address], [City], [PostalCode], [Country], [Phone]) VALUES (26, N'Pasta Buttini s.r.l.', N'Giovanni Giudici', N'Via dei Gelsomini, 153', N'Salerno', N'84100', N'Italy', N'(089) 6547665')
GO
INSERT [Suppliers] ([SupplierID], [SupplierName], [ContactName], [Address], [City], [PostalCode], [Country], [Phone]) VALUES (27, N'Escargots Nouveaux', N'Marie Delamare', N'22, rue H. Voiron', N'Montceau', N'71300', N'France', N'85.57.00.07')
GO
INSERT [Suppliers] ([SupplierID], [SupplierName], [ContactName], [Address], [City], [PostalCode], [Country], [Phone]) VALUES (28, N'Gai pâturage', N'Eliane Noz', N'Bat. B 3, rue des Alpes', N'Annecy', N'74000', N'France', N'38.76.98.06')
GO
INSERT [Suppliers] ([SupplierID], [SupplierName], [ContactName], [Address], [City], [PostalCode], [Country], [Phone]) VALUES (29, N'Forêts d''érables', N'Chantal Goulet', N'148 rue Chasseur', N'Ste-Hyacinthe', N'J2S 7S8', N'Canada', N'(514) 555-2955')
GO
SET IDENTITY_INSERT [Suppliers] OFF
GO
SET ANSI_PADDING ON
GO
ALTER TABLE [Employees] ADD  CONSTRAINT [UK_Employees_Email] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [OrderDetails] ADD  CONSTRAINT [UK_OrderDetails_1] UNIQUE NONCLUSTERED 
(
	[OrderID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Categories] ADD  CONSTRAINT [DF__Categorie__Categ__35BCFE0A]  DEFAULT (NULL) FOR [CategoryName]
GO
ALTER TABLE [Categories] ADD  CONSTRAINT [DF__Categorie__Descr__36B12243]  DEFAULT (NULL) FOR [Description]
GO
ALTER TABLE [Customers] ADD  CONSTRAINT [DF__Customers__Custo__38996AB5]  DEFAULT (NULL) FOR [CustomerName]
GO
ALTER TABLE [Customers] ADD  CONSTRAINT [DF__Customers__Conta__398D8EEE]  DEFAULT (NULL) FOR [ContactName]
GO
ALTER TABLE [Customers] ADD  CONSTRAINT [DF__Customers__Addre__3A81B327]  DEFAULT (NULL) FOR [Address]
GO
ALTER TABLE [Customers] ADD  CONSTRAINT [DF__Customers__City__3B75D760]  DEFAULT (NULL) FOR [City]
GO
ALTER TABLE [Customers] ADD  CONSTRAINT [DF__Customers__Posta__3C69FB99]  DEFAULT (NULL) FOR [PostalCode]
GO
ALTER TABLE [Customers] ADD  CONSTRAINT [DF__Customers__Count__3D5E1FD2]  DEFAULT (NULL) FOR [Country]
GO
ALTER TABLE [Employees] ADD  CONSTRAINT [DF__Employees__LastN__3F466844]  DEFAULT (NULL) FOR [LastName]
GO
ALTER TABLE [Employees] ADD  CONSTRAINT [DF__Employees__First__403A8C7D]  DEFAULT (NULL) FOR [FirstName]
GO
ALTER TABLE [Employees] ADD  CONSTRAINT [DF__Employees__Birth__412EB0B6]  DEFAULT (NULL) FOR [BirthDate]
GO
ALTER TABLE [Employees] ADD  CONSTRAINT [DF__Employees__Photo__4222D4EF]  DEFAULT (NULL) FOR [Photo]
GO
ALTER TABLE [OrderDetails] ADD  CONSTRAINT [DF__OrderDeta__Quant__48CFD27E]  DEFAULT (NULL) FOR [Quantity]
GO
ALTER TABLE [Orders] ADD  CONSTRAINT [DF__Orders__Customer__440B1D61]  DEFAULT (NULL) FOR [CustomerID]
GO
ALTER TABLE [Orders] ADD  CONSTRAINT [DF__Orders__OrderDat__45F365D3]  DEFAULT (NULL) FOR [OrderTime]
GO
ALTER TABLE [Orders] ADD  CONSTRAINT [DF__Orders__Employee__44FF419A]  DEFAULT (NULL) FOR [EmployeeID]
GO
ALTER TABLE [Orders] ADD  CONSTRAINT [DF__Orders__ShipperI__46E78A0C]  DEFAULT (NULL) FOR [ShipperID]
GO
ALTER TABLE [ProductPhotos] ADD  CONSTRAINT [DF_ProductGallery_IsHidden]  DEFAULT ((0)) FOR [IsHidden]
GO
ALTER TABLE [Products] ADD  CONSTRAINT [DF__Products__Produc__4AB81AF0]  DEFAULT (NULL) FOR [ProductName]
GO
ALTER TABLE [Products] ADD  CONSTRAINT [DF__Products__Suppli__4BAC3F29]  DEFAULT (NULL) FOR [SupplierID]
GO
ALTER TABLE [Products] ADD  CONSTRAINT [DF__Products__Catego__4CA06362]  DEFAULT (NULL) FOR [CategoryID]
GO
ALTER TABLE [Products] ADD  CONSTRAINT [DF__Products__Unit__4D94879B]  DEFAULT (NULL) FOR [Unit]
GO
ALTER TABLE [Products] ADD  CONSTRAINT [DF__Products__Price__4E88ABD4]  DEFAULT (NULL) FOR [Price]
GO
ALTER TABLE [Shippers] ADD  CONSTRAINT [DF__Shippers__Shippe__619B8048]  DEFAULT (NULL) FOR [ShipperName]
GO
ALTER TABLE [Shippers] ADD  CONSTRAINT [DF__Shippers__Phone__628FA481]  DEFAULT (NULL) FOR [Phone]
GO
ALTER TABLE [Suppliers] ADD  CONSTRAINT [DF__Suppliers__Suppl__6477ECF3]  DEFAULT (NULL) FOR [SupplierName]
GO
ALTER TABLE [Suppliers] ADD  CONSTRAINT [DF__Suppliers__Conta__656C112C]  DEFAULT (NULL) FOR [ContactName]
GO
ALTER TABLE [Suppliers] ADD  CONSTRAINT [DF__Suppliers__Addre__66603565]  DEFAULT (NULL) FOR [Address]
GO
ALTER TABLE [Suppliers] ADD  CONSTRAINT [DF__Suppliers__City__6754599E]  DEFAULT (NULL) FOR [City]
GO
ALTER TABLE [Suppliers] ADD  CONSTRAINT [DF__Suppliers__Posta__68487DD7]  DEFAULT (NULL) FOR [PostalCode]
GO
ALTER TABLE [Suppliers] ADD  CONSTRAINT [DF__Suppliers__Count__693CA210]  DEFAULT (NULL) FOR [Country]
GO
ALTER TABLE [Suppliers] ADD  CONSTRAINT [DF__Suppliers__Phone__6A30C649]  DEFAULT (NULL) FOR [Phone]
GO
ALTER TABLE [Customers]  WITH CHECK ADD  CONSTRAINT [FK_Customers_Countries] FOREIGN KEY([Country])
REFERENCES [Countries] ([CountryName])
ON UPDATE CASCADE
GO
ALTER TABLE [Customers] CHECK CONSTRAINT [FK_Customers_Countries]
GO
ALTER TABLE [OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders] FOREIGN KEY([OrderID])
REFERENCES [Orders] ([OrderID])
GO
ALTER TABLE [OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders]
GO
ALTER TABLE [OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Products] FOREIGN KEY([ProductID])
REFERENCES [Products] ([ProductID])
GO
ALTER TABLE [OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Products]
GO
ALTER TABLE [Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Customers] FOREIGN KEY([CustomerID])
REFERENCES [Customers] ([CustomerID])
GO
ALTER TABLE [Orders] CHECK CONSTRAINT [FK_Orders_Customers]
GO
ALTER TABLE [Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Employees] FOREIGN KEY([EmployeeID])
REFERENCES [Employees] ([EmployeeID])
GO
ALTER TABLE [Orders] CHECK CONSTRAINT [FK_Orders_Employees]
GO
ALTER TABLE [Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_OrderStatus] FOREIGN KEY([Status])
REFERENCES [OrderStatus] ([Status])
GO
ALTER TABLE [Orders] CHECK CONSTRAINT [FK_Orders_OrderStatus]
GO
ALTER TABLE [Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Shippers] FOREIGN KEY([ShipperID])
REFERENCES [Shippers] ([ShipperID])
GO
ALTER TABLE [Orders] CHECK CONSTRAINT [FK_Orders_Shippers]
GO
ALTER TABLE [ProductAttributes]  WITH CHECK ADD  CONSTRAINT [FK_ProductAttributes_Products] FOREIGN KEY([ProductID])
REFERENCES [Products] ([ProductID])
GO
ALTER TABLE [ProductAttributes] CHECK CONSTRAINT [FK_ProductAttributes_Products]
GO
ALTER TABLE [ProductPhotos]  WITH CHECK ADD  CONSTRAINT [FK_ProductGallery_Products] FOREIGN KEY([ProductID])
REFERENCES [Products] ([ProductID])
GO
ALTER TABLE [ProductPhotos] CHECK CONSTRAINT [FK_ProductGallery_Products]
GO
ALTER TABLE [Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([CategoryID])
REFERENCES [Categories] ([CategoryID])
GO
ALTER TABLE [Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
ALTER TABLE [Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Suppliers] FOREIGN KEY([SupplierID])
REFERENCES [Suppliers] ([SupplierID])
GO
ALTER TABLE [Products] CHECK CONSTRAINT [FK_Products_Suppliers]
GO
ALTER TABLE [Suppliers]  WITH CHECK ADD  CONSTRAINT [FK_Suppliers_Countries] FOREIGN KEY([Country])
REFERENCES [Countries] ([CountryName])
ON UPDATE CASCADE
GO
ALTER TABLE [Suppliers] CHECK CONSTRAINT [FK_Suppliers_Countries]
GO
