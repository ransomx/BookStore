
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 04/18/2016 11:24:08
-- Generated from EDMX file: c:\users\xrans\documents\visual studio 2015\Projects\BookStores\BookStores\BookStoreModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [BookStore];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_BooksOrders_Books]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[BooksOrders] DROP CONSTRAINT [FK_BooksOrders_Books];
GO
IF OBJECT_ID(N'[dbo].[FK_BooksOrders_Orders]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[BooksOrders] DROP CONSTRAINT [FK_BooksOrders_Orders];
GO
IF OBJECT_ID(N'[dbo].[FK_OrdersCustomers]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Orders1] DROP CONSTRAINT [FK_OrdersCustomers];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Books]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Books];
GO
IF OBJECT_ID(N'[dbo].[Customers]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Customers];
GO
IF OBJECT_ID(N'[dbo].[Administrators]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Administrators];
GO
IF OBJECT_ID(N'[dbo].[Orders1]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Orders1];
GO
IF OBJECT_ID(N'[dbo].[BooksOrders]', 'U') IS NOT NULL
    DROP TABLE [dbo].[BooksOrders];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Books'
CREATE TABLE [dbo].[Books] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [ISBN] nvarchar(max)  NOT NULL,
    [Title] nvarchar(max)  NOT NULL,
    [Author] nvarchar(max)  NOT NULL,
    [Category] nvarchar(max)  NOT NULL,
    [Price] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Customers'
CREATE TABLE [dbo].[Customers] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Email] nvarchar(max)  NOT NULL,
    [Address] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Administrators'
CREATE TABLE [dbo].[Administrators] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Email] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Orders1'
CREATE TABLE [dbo].[Orders1] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [ISBN_f] nvarchar(max)  NOT NULL,
    [Email_f] nvarchar(max)  NOT NULL,
    [Customers_Email] nvarchar(max)  NULL
);
GO

-- Creating table 'BooksOrders'
CREATE TABLE [dbo].[BooksOrders] (
    [Book_ISBN] nvarchar(max)  NOT NULL,
    [Orders_Id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [ISBN] in table 'Books'
ALTER TABLE [dbo].[Books]
ADD CONSTRAINT [PK_Books]
    PRIMARY KEY CLUSTERED ([ISBN] ASC);
GO

-- Creating primary key on [Email] in table 'Customers'
ALTER TABLE [dbo].[Customers]
ADD CONSTRAINT [PK_Customers]
    PRIMARY KEY CLUSTERED ([Email] ASC);
GO

-- Creating primary key on [Email] in table 'Administrators'
ALTER TABLE [dbo].[Administrators]
ADD CONSTRAINT [PK_Administrators]
    PRIMARY KEY CLUSTERED ([Email] ASC);
GO

-- Creating primary key on [Id] in table 'Orders1'
ALTER TABLE [dbo].[Orders1]
ADD CONSTRAINT [PK_Orders1]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Book_ISBN], [Orders_Id] in table 'BooksOrders'
ALTER TABLE [dbo].[BooksOrders]
ADD CONSTRAINT [PK_BooksOrders]
    PRIMARY KEY CLUSTERED ([Book_ISBN], [Orders_Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Book_ISBN] in table 'BooksOrders'
ALTER TABLE [dbo].[BooksOrders]
ADD CONSTRAINT [FK_BooksOrders_Books]
    FOREIGN KEY ([Book_ISBN])
    REFERENCES [dbo].[Books]
        ([ISBN])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Orders_Id] in table 'BooksOrders'
ALTER TABLE [dbo].[BooksOrders]
ADD CONSTRAINT [FK_BooksOrders_Orders]
    FOREIGN KEY ([Orders_Id])
    REFERENCES [dbo].[Orders1]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_BooksOrders_Orders'
CREATE INDEX [IX_FK_BooksOrders_Orders]
ON [dbo].[BooksOrders]
    ([Orders_Id]);
GO

-- Creating foreign key on [Customers_Email] in table 'Orders1'
ALTER TABLE [dbo].[Orders1]
ADD CONSTRAINT [FK_OrdersCustomers]
    FOREIGN KEY ([Customers_Email])
    REFERENCES [dbo].[Customers]
        ([Email])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_OrdersCustomers'
CREATE INDEX [IX_FK_OrdersCustomers]
ON [dbo].[Orders1]
    ([Customers_Email]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------