USE [master]
GO
/****** Object:  Database [ELibrary]    Script Date: 29/3/2023 2:46:09 PM ******/
CREATE DATABASE [ELibrary]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ELibrary', FILENAME = N'/var/opt/mssql/data/ELibrary.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ELibrary_log', FILENAME = N'/var/opt/mssql/data/ELibrary_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ELibrary] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ELibrary].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ELibrary] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ELibrary] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ELibrary] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ELibrary] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ELibrary] SET ARITHABORT OFF 
GO
ALTER DATABASE [ELibrary] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ELibrary] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ELibrary] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ELibrary] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ELibrary] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ELibrary] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ELibrary] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ELibrary] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ELibrary] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ELibrary] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ELibrary] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ELibrary] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ELibrary] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ELibrary] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ELibrary] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ELibrary] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ELibrary] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ELibrary] SET RECOVERY FULL 
GO
ALTER DATABASE [ELibrary] SET  MULTI_USER 
GO
ALTER DATABASE [ELibrary] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ELibrary] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ELibrary] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ELibrary] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ELibrary] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ELibrary] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ELibrary', N'ON'
GO
ALTER DATABASE [ELibrary] SET QUERY_STORE = OFF
GO
USE [ELibrary]
GO
/****** Object:  Table [dbo].[admin_login_tbl]    Script Date: 29/3/2023 2:46:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[admin_login_tbl](
	[username] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NULL,
	[full_name] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[author_master_tbl]    Script Date: 29/3/2023 2:46:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[author_master_tbl](
	[author_id] [nvarchar](10) NOT NULL,
	[author_name] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[author_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[book_issue_request_tbl]    Script Date: 29/3/2023 2:46:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[book_issue_request_tbl](
	[member_id] [nvarchar](50) NULL,
	[book_id] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[book_issue_tbl]    Script Date: 29/3/2023 2:46:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[book_issue_tbl](
	[member_id] [nvarchar](10) NULL,
	[book_id] [nvarchar](10) NULL,
	[issue_date] [nvarchar](50) NULL,
	[due_date] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[book_master_tbl]    Script Date: 29/3/2023 2:46:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[book_master_tbl](
	[book_id] [nvarchar](10) NOT NULL,
	[book_name] [nvarchar](max) NULL,
	[genre] [nvarchar](max) NULL,
	[author_id] [nvarchar](10) NULL,
	[publisher_id] [nvarchar](10) NULL,
	[publish_date] [nvarchar](50) NULL,
	[language] [nvarchar](50) NULL,
	[edition] [nvarchar](max) NULL,
	[book_cost] [nchar](10) NULL,
	[no_of_pages] [nchar](10) NULL,
	[book_description] [nvarchar](max) NULL,
	[actual_stock] [nchar](10) NULL,
	[current_stock] [nchar](10) NULL,
	[book_img_link] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[book_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[member_master_tbl]    Script Date: 29/3/2023 2:46:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[member_master_tbl](
	[member_id] [nvarchar](10) NOT NULL,
	[full_name] [nvarchar](50) NULL,
	[dob] [nvarchar](50) NULL,
	[contact_no] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[state] [nvarchar](50) NULL,
	[city] [nvarchar](50) NULL,
	[pincode] [nvarchar](50) NULL,
	[full_address] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
	[account_status] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[member_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[publisher_master_tbl]    Script Date: 29/3/2023 2:46:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[publisher_master_tbl](
	[publisher_id] [nvarchar](10) NOT NULL,
	[publisher_name] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[publisher_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[book_issue_tbl]  WITH CHECK ADD  CONSTRAINT [fk_book_issue_book] FOREIGN KEY([book_id])
REFERENCES [dbo].[book_master_tbl] ([book_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[book_issue_tbl] CHECK CONSTRAINT [fk_book_issue_book]
GO
ALTER TABLE [dbo].[book_issue_tbl]  WITH CHECK ADD  CONSTRAINT [fk_book_issue_member] FOREIGN KEY([member_id])
REFERENCES [dbo].[member_master_tbl] ([member_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[book_issue_tbl] CHECK CONSTRAINT [fk_book_issue_member]
GO
USE [master]
GO
ALTER DATABASE [ELibrary] SET  READ_WRITE 
GO
