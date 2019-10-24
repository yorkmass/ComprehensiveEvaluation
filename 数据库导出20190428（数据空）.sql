/* 通过对Web数据管理产生 2019/4/28 20:43:40 */

/* 选择选项: database drop-commands table-schema table-data stored-procedures comments  */

/****** 对象: 数据库 ms4132928    脚本日期: 2019/4/28 20:43:40 ******/
IF EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = N'ms4132928')
	DROP DATABASE [ms4132928]
GO

CREATE DATABASE [ms4132928]  ON (NAME = N'ms4132928_data', FILENAME = N'D:\UserDBFile\ms4132928\ms4132928.mdf' , SIZE = 13, MAXSIZE = 20, FILEGROWTH = 5) LOG ON (NAME = N'ms4132928_log', FILENAME = N'D:\UserDBFile\ms4132928\ms4132928_log.ldf' , SIZE = 1, MAXSIZE = 20, FILEGROWTH = 5)
 COLLATE Chinese_PRC_CI_AS
GO

exec sp_dboption N'ms4132928', N'autoclose', N'false'
GO

exec sp_dboption N'ms4132928', N'bulkcopy', N'false'
GO

exec sp_dboption N'ms4132928', N'trunc. log', N'true'
GO

exec sp_dboption N'ms4132928', N'torn page detection', N'false'
GO

exec sp_dboption N'ms4132928', N'read only', N'false'
GO

exec sp_dboption N'ms4132928', N'dbo use', N'false'
GO

exec sp_dboption N'ms4132928', N'single', N'false'
GO

exec sp_dboption N'ms4132928', N'autoshrink', N'false'
GO

exec sp_dboption N'ms4132928', N'ANSI null default', N'false'
GO

exec sp_dboption N'ms4132928', N'recursive triggers', N'false'
GO

exec sp_dboption N'ms4132928', N'ANSI nulls', N'false'
GO

exec sp_dboption N'ms4132928', N'concat null yields null', N'false'
GO

exec sp_dboption N'ms4132928', N'cursor close on commit', N'false'
GO

exec sp_dboption N'ms4132928', N'default to local cursor', N'false'
GO

exec sp_dboption N'ms4132928', N'quoted identifier', N'false'
GO

exec sp_dboption N'ms4132928', N'ANSI warnings', N'false'
GO

exec sp_dboption N'ms4132928', N'auto create statistics', N'true'
GO

exec sp_dboption N'ms4132928', N'auto update statistics', N'true'
GO

if( (@@microsoftversion / power(2, 24) = 8) and (@@microsoftversion & 0xffff >= 724) )
	exec sp_dboption N'ms4132928', N'db chaining', N'false'
GO

use [ms4132928]
GO

/****** 对象: 表 [dbo].[Achievement]    脚本日期: 2019/4/28 20:43:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[Achievement]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [Achievement]
GO


/****** 对象: 表 [dbo].[AchievementTypeMapper]    脚本日期: 2019/4/28 20:43:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[AchievementTypeMapper]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [AchievementTypeMapper]
GO


/****** 对象: 表 [dbo].[Applications]    脚本日期: 2019/4/28 20:43:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[Applications]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [Applications]
GO


/****** 对象: 表 [dbo].[Attachment]    脚本日期: 2019/4/28 20:43:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[Attachment]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [Attachment]
GO


/****** 对象: 表 [dbo].[BasisScore]    脚本日期: 2019/4/28 20:43:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[BasisScore]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [BasisScore]
GO


/****** 对象: 表 [dbo].[Branches]    脚本日期: 2019/4/28 20:43:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[Branches]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [Branches]
GO


/****** 对象: 表 [dbo].[BranchesTags]    脚本日期: 2019/4/28 20:43:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[BranchesTags]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [BranchesTags]
GO


/****** 对象: 表 [dbo].[BranchUsers]    脚本日期: 2019/4/28 20:43:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[BranchUsers]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [BranchUsers]
GO


/****** 对象: 表 [dbo].[Certificate]    脚本日期: 2019/4/28 20:43:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[Certificate]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [Certificate]
GO


/****** 对象: 表 [dbo].[Competition]    脚本日期: 2019/4/28 20:43:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[Competition]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [Competition]
GO


/****** 对象: 表 [dbo].[CompositveScore]    脚本日期: 2019/4/28 20:43:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[CompositveScore]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [CompositveScore]
GO


/****** 对象: 表 [dbo].[Copyright]    脚本日期: 2019/4/28 20:43:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[Copyright]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [Copyright]
GO


/****** 对象: 表 [dbo].[DownloadResource]    脚本日期: 2019/4/28 20:43:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[DownloadResource]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [DownloadResource]
GO


/****** 对象: 表 [dbo].[Information]    脚本日期: 2019/4/28 20:43:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[Information]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [Information]
GO


/****** 对象: 表 [dbo].[InnovativeProject]    脚本日期: 2019/4/28 20:43:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[InnovativeProject]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [InnovativeProject]
GO


/****** 对象: 表 [dbo].[Others]    脚本日期: 2019/4/28 20:43:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[Others]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [Others]
GO


/****** 对象: 表 [dbo].[Patent]    脚本日期: 2019/4/28 20:43:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[Patent]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [Patent]
GO


/****** 对象: 表 [dbo].[RecreationSport]    脚本日期: 2019/4/28 20:43:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[RecreationSport]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [RecreationSport]
GO


/****** 对象: 表 [dbo].[ResearchProject]    脚本日期: 2019/4/28 20:43:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[ResearchProject]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ResearchProject]
GO


/****** 对象: 表 [dbo].[Roles]    脚本日期: 2019/4/28 20:43:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[Roles]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [Roles]
GO


/****** 对象: 表 [dbo].[Rules]    脚本日期: 2019/4/28 20:43:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[Rules]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [Rules]
GO


/****** 对象: 表 [dbo].[SemesterStatus]    脚本日期: 2019/4/28 20:43:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[SemesterStatus]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [SemesterStatus]
GO


/****** 对象: 表 [dbo].[SocialPratice]    脚本日期: 2019/4/28 20:43:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[SocialPratice]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [SocialPratice]
GO


/****** 对象: 表 [dbo].[SocialWorkProject]    脚本日期: 2019/4/28 20:43:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[SocialWorkProject]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [SocialWorkProject]
GO


/****** 对象: 表 [dbo].[Student]    脚本日期: 2019/4/28 20:43:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[Student]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [Student]
GO


/****** 对象: 表 [dbo].[StudentsAchievements]    脚本日期: 2019/4/28 20:43:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[StudentsAchievements]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [StudentsAchievements]
GO


/****** 对象: 表 [dbo].[SystemSetup]    脚本日期: 2019/4/28 20:43:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[SystemSetup]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [SystemSetup]
GO


/****** 对象: 表 [dbo].[Tags]    脚本日期: 2019/4/28 20:43:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[Tags]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [Tags]
GO


/****** 对象: 表 [dbo].[Thesis]    脚本日期: 2019/4/28 20:43:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[Thesis]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [Thesis]
GO


/****** 对象: 表 [dbo].[Users]    脚本日期: 2019/4/28 20:43:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[Users]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [Users]
GO


/****** 对象: 表 [dbo].[UsersInRoles]    脚本日期: 2019/4/28 20:43:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[UsersInRoles]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [UsersInRoles]
GO


/****** 对象: 表 [dbo].[Achievement]    脚本日期: 2019/4/28 20:43:40 ******/
CREATE TABLE [Achievement] (
	[AchievementID] [nvarchar] (40) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[Title] [nvarchar] (200) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[Semester] [nvarchar] (30) COLLATE Chinese_PRC_CI_AS NULL ,
	[ObtainDate] [datetime] NULL ,
	[Memo] [text] COLLATE Chinese_PRC_CI_AS NULL ,
	[AuditStatus] [nvarchar] (20) COLLATE Chinese_PRC_CI_AS NULL ,
	[AchievementType] [nvarchar] (20) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY]
GO


/****** 对象: 表 [dbo].[AchievementTypeMapper]    脚本日期: 2019/4/28 20:43:41 ******/
CREATE TABLE [AchievementTypeMapper] (
	[AchievementType] [nvarchar] (20) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[AchievementTypeCode] [nvarchar] (20) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY]
GO


/****** 对象: 表 [dbo].[Applications]    脚本日期: 2019/4/28 20:43:41 ******/
CREATE TABLE [Applications] (
	[ApplicationID] [nvarchar] (40) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[ApplicationName] [nvarchar] (100) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY]
GO


/****** 对象: 表 [dbo].[Attachment]    脚本日期: 2019/4/28 20:43:41 ******/
CREATE TABLE [Attachment] (
	[AttachmentID] [nvarchar] (40) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[AchievementID] [nvarchar] (40) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[AttachName] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[FileType] [nvarchar] (20) COLLATE Chinese_PRC_CI_AS NULL ,
	[FilePath] [nvarchar] (200) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY]
GO


/****** 对象: 表 [dbo].[BasisScore]    脚本日期: 2019/4/28 20:43:41 ******/
CREATE TABLE [BasisScore] (
	[BasicID] [int] IDENTITY (1, 1) NOT NULL ,
	[Sno] [nvarchar] (20) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[Name] [nvarchar] (16) COLLATE Chinese_PRC_CI_AS NULL ,
	[Class] [nvarchar] (20) COLLATE Chinese_PRC_CI_AS NULL ,
	[WeightAvgScore] [float] NULL ,
	[IdeologyMoralityScore] [float] NULL ,
	[BodyMindQualityScore] [float] NULL ,
	[Semester] [nvarchar] (30) COLLATE Chinese_PRC_CI_AS NULL ,
	[Political] [float] NULL ,
	[SocialMora] [float] NULL ,
	[Law] [float] NULL ,
	[Collective] [float] NULL ,
	[PublicWork] [float] NULL ,
	[Health] [float] NULL ,
	[ObeyRule] [float] NULL 
) ON [PRIMARY]
GO


/****** 对象: 表 [dbo].[Branches]    脚本日期: 2019/4/28 20:43:41 ******/
CREATE TABLE [Branches] (
	[BranchId] [int] NOT NULL ,
	[ParentBranchId] [int] NULL ,
	[BranchName] [nvarchar] (100) COLLATE Chinese_PRC_CI_AS NULL ,
	[GroupID] [nvarchar] (40) COLLATE Chinese_PRC_CI_AS NULL ,
	[HierarchyLevel] [int] NULL ,
	[FullPath] [nvarchar] (800) COLLATE Chinese_PRC_CI_AS NULL ,
	[OrderID] [int] NULL ,
	[DeleteMark] [bit] NULL ,
	[SeprateType] [int] NULL 
) ON [PRIMARY]
GO


/****** 对象: 表 [dbo].[BranchesTags]    脚本日期: 2019/4/28 20:43:41 ******/
CREATE TABLE [BranchesTags] (
	[TagID] [nvarchar] (40) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[BranchId] [int] NOT NULL 
) ON [PRIMARY]
GO


/****** 对象: 表 [dbo].[BranchUsers]    脚本日期: 2019/4/28 20:43:41 ******/
CREATE TABLE [BranchUsers] (
	[UserId] [nvarchar] (40) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[BranchId] [int] NOT NULL 
) ON [PRIMARY]
GO


/****** 对象: 表 [dbo].[Certificate]    脚本日期: 2019/4/28 20:43:41 ******/
CREATE TABLE [Certificate] (
	[AchievementID] [nvarchar] (40) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[TestDate] [nvarchar] (20) COLLATE Chinese_PRC_CI_AS NULL ,
	[ExaminationCardNumber] [nvarchar] (40) COLLATE Chinese_PRC_CI_AS NULL ,
	[Mark] [nvarchar] (40) COLLATE Chinese_PRC_CI_AS NULL ,
	[Description] [nvarchar] (200) COLLATE Chinese_PRC_CI_AS NULL ,
	[LastUpdateTime] [datetime] NULL 
) ON [PRIMARY]
GO


/****** 对象: 表 [dbo].[Competition]    脚本日期: 2019/4/28 20:43:41 ******/
CREATE TABLE [Competition] (
	[AchievementID] [nvarchar] (40) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[CompetitionName] [nvarchar] (32) COLLATE Chinese_PRC_CI_AS NULL ,
	[Year] [int] NULL ,
	[AwardRank] [nvarchar] (10) COLLATE Chinese_PRC_CI_AS NULL ,
	[AwardLevel] [nvarchar] (10) COLLATE Chinese_PRC_CI_AS NULL ,
	[LastUpdateTime] [datetime] NULL ,
	[ExamLevel] [nchar] (10) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY]
GO


/****** 对象: 表 [dbo].[CompositveScore]    脚本日期: 2019/4/28 20:43:41 ******/
CREATE TABLE [CompositveScore] (
	[id] [int] IDENTITY (1, 1) NOT NULL ,
	[Sno] [nvarchar] (20) COLLATE Chinese_PRC_CI_AS NULL ,
	[Name] [nvarchar] (16) COLLATE Chinese_PRC_CI_AS NULL ,
	[Semester] [nvarchar] (30) COLLATE Chinese_PRC_CI_AS NULL ,
	[TotalScore] [float] NULL ,
	[AchievementTotalScore] [float] NULL 
) ON [PRIMARY]
GO


/****** 对象: 表 [dbo].[Copyright]    脚本日期: 2019/4/28 20:43:41 ******/
CREATE TABLE [Copyright] (
	[AchievementID] [nvarchar] (40) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[CopyrightType] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[CopyrightNum] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[Comment] [nvarchar] (200) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY]
GO


/****** 对象: 表 [dbo].[DownloadResource]    脚本日期: 2019/4/28 20:43:41 ******/
CREATE TABLE [DownloadResource] (
	[ResourceID] [int] IDENTITY (1, 1) NOT NULL ,
	[ResourceName] [varchar] (200) COLLATE Chinese_PRC_CI_AS NULL ,
	[Publisher] [varchar] (20) COLLATE Chinese_PRC_CI_AS NULL ,
	[ReleaseDate] [datetime] NULL ,
	[FilePath] [text] COLLATE Chinese_PRC_CI_AS NULL ,
	[ForTeacher] [bit] NULL ,
	[ForStudent] [bit] NULL 
) ON [PRIMARY]
GO


/****** 对象: 表 [dbo].[Information]    脚本日期: 2019/4/28 20:43:41 ******/
CREATE TABLE [Information] (
	[InformationID] [int] IDENTITY (1, 1) NOT NULL ,
	[Title] [varchar] (200) COLLATE Chinese_PRC_CI_AS NULL ,
	[Content] [text] COLLATE Chinese_PRC_CI_AS NULL ,
	[Author] [varchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[SubmitDate] [datetime] NULL ,
	[ForTeacher] [bit] NULL ,
	[ForStudent] [bit] NULL 
) ON [PRIMARY]
GO


/****** 对象: 表 [dbo].[InnovativeProject]    脚本日期: 2019/4/28 20:43:41 ******/
CREATE TABLE [InnovativeProject] (
	[AchievementID] [nvarchar] (40) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[InnovativeProjectLevel] [nvarchar] (10) COLLATE Chinese_PRC_CI_AS NULL ,
	[InnovativeProjectNo] [nvarchar] (20) COLLATE Chinese_PRC_CI_AS NULL ,
	[InnovativeProjectType] [nvarchar] (20) COLLATE Chinese_PRC_CI_AS NULL ,
	[ApprovalDate] [datetime] NULL 
) ON [PRIMARY]
GO


/****** 对象: 表 [dbo].[Others]    脚本日期: 2019/4/28 20:43:41 ******/
CREATE TABLE [Others] (
	[AchievementID] [nvarchar] (40) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[ProjectID] [nvarchar] (40) COLLATE Chinese_PRC_CI_AS NULL ,
	[ProjectName] [nvarchar] (40) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY]
GO


/****** 对象: 表 [dbo].[Patent]    脚本日期: 2019/4/28 20:43:41 ******/
CREATE TABLE [Patent] (
	[AchievementID] [nvarchar] (40) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[PatentType] [nvarchar] (30) COLLATE Chinese_PRC_CI_AS NULL ,
	[PatentScope] [nvarchar] (30) COLLATE Chinese_PRC_CI_AS NULL ,
	[PatentNum] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[Comment] [nvarchar] (200) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY]
GO


/****** 对象: 表 [dbo].[RecreationSport]    脚本日期: 2019/4/28 20:43:41 ******/
CREATE TABLE [RecreationSport] (
	[AchievementID] [nvarchar] (40) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[Year] [int] NULL ,
	[CompetitionName] [nvarchar] (32) COLLATE Chinese_PRC_CI_AS NULL ,
	[AwardType] [nvarchar] (10) COLLATE Chinese_PRC_CI_AS NULL ,
	[AwardLevel] [nvarchar] (10) COLLATE Chinese_PRC_CI_AS NULL ,
	[LastUpdateTime] [datetime] NULL 
) ON [PRIMARY]
GO


/****** 对象: 表 [dbo].[ResearchProject]    脚本日期: 2019/4/28 20:43:41 ******/
CREATE TABLE [ResearchProject] (
	[AchievementID] [nvarchar] (40) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[ProjectID] [nvarchar] (30) COLLATE Chinese_PRC_CI_AS NULL ,
	[ApprovalDate] [datetime] NULL ,
	[FinishDate] [datetime] NULL ,
	[ProjectLevel] [nvarchar] (30) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY]
GO


/****** 对象: 表 [dbo].[Roles]    脚本日期: 2019/4/28 20:43:42 ******/
CREATE TABLE [Roles] (
	[RoleId] [nvarchar] (40) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[RoleName] [nvarchar] (30) COLLATE Chinese_PRC_CI_AS NULL ,
	[ApplicationID] [nvarchar] (40) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY]
GO


/****** 对象: 表 [dbo].[Rules]    脚本日期: 2019/4/28 20:43:42 ******/
CREATE TABLE [Rules] (
	[RuleID] [nvarchar] (40) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[ParentRuleID] [nvarchar] (40) COLLATE Chinese_PRC_CI_AS NULL ,
	[RuleName] [nvarchar] (100) COLLATE Chinese_PRC_CI_AS NULL ,
	[Description] [nvarchar] (500) COLLATE Chinese_PRC_CI_AS NULL ,
	[OrderID] [int] NULL ,
	[Score] [float] NULL ,
	[NodeType] [nvarchar] (10) COLLATE Chinese_PRC_CI_AS NULL ,
	[IsDelete] [bit] NULL ,
	[BranchId] [int] NULL 
) ON [PRIMARY]
GO


/****** 对象: 表 [dbo].[SemesterStatus]    脚本日期: 2019/4/28 20:43:42 ******/
CREATE TABLE [SemesterStatus] (
	[Semester] [nvarchar] (30) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[SStatus] [bit] NULL ,
	[IsCalculateScore] [bit] NULL 
) ON [PRIMARY]
GO


/****** 对象: 表 [dbo].[SocialPratice]    脚本日期: 2019/4/28 20:43:42 ******/
CREATE TABLE [SocialPratice] (
	[AchievementID] [nvarchar] (40) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[PraticeDate] [nvarchar] (20) COLLATE Chinese_PRC_CI_AS NULL ,
	[PraticeLevel] [nvarchar] (20) COLLATE Chinese_PRC_CI_AS NULL ,
	[PraticeType] [nvarchar] (20) COLLATE Chinese_PRC_CI_AS NULL ,
	[LastUpdateTime] [datetime] NULL 
) ON [PRIMARY]
GO


/****** 对象: 表 [dbo].[SocialWorkProject]    脚本日期: 2019/4/28 20:43:42 ******/
CREATE TABLE [SocialWorkProject] (
	[AchievementID] [nvarchar] (40) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[organization] [nvarchar] (40) COLLATE Chinese_PRC_CI_AS NULL ,
	[PositionType] [nvarchar] (40) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY]
GO


/****** 对象: 表 [dbo].[Student]    脚本日期: 2019/4/28 20:43:42 ******/
CREATE TABLE [Student] (
	[Sno] [nvarchar] (20) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[UserId] [nvarchar] (40) COLLATE Chinese_PRC_CI_AS NULL ,
	[BranchId] [int] NULL ,
	[Name] [nvarchar] (16) COLLATE Chinese_PRC_CI_AS NULL ,
	[Sex] [nvarchar] (2) COLLATE Chinese_PRC_CI_AS NULL ,
	[College] [nvarchar] (30) COLLATE Chinese_PRC_CI_AS NULL ,
	[Major] [nvarchar] (30) COLLATE Chinese_PRC_CI_AS NULL ,
	[Class] [nvarchar] (20) COLLATE Chinese_PRC_CI_AS NULL ,
	[EntranceYear] [int] NULL ,
	[Grade] [int] NULL ,
	[SchoolingLength] [int] NULL ,
	[IDCardNo] [nvarchar] (20) COLLATE Chinese_PRC_CI_AS NULL ,
	[GraduationYear] [int] NULL ,
	[IsClassAdmin] [bit] NULL 
) ON [PRIMARY]
GO


/****** 对象: 表 [dbo].[StudentsAchievements]    脚本日期: 2019/4/28 20:43:42 ******/
CREATE TABLE [StudentsAchievements] (
	[AchievementID] [nvarchar] (40) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[Sno] [nvarchar] (20) COLLATE Chinese_PRC_CI_AS NULL ,
	[RuleID] [nvarchar] (40) COLLATE Chinese_PRC_CI_AS NULL ,
	[Mark] [float] NULL ,
	[Semester] [nvarchar] (30) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY]
GO


/****** 对象: 表 [dbo].[SystemSetup]    脚本日期: 2019/4/28 20:43:42 ******/
CREATE TABLE [SystemSetup] (
	[ID] [int] NOT NULL ,
	[AllowInputCompetition] [bit] NULL ,
	[AllowInputProject] [bit] NULL ,
	[AllowInputCertificate] [bit] NULL ,
	[AllowInputRecreationSport] [bit] NULL 
) ON [PRIMARY]
GO


/****** 对象: 表 [dbo].[Tags]    脚本日期: 2019/4/28 20:43:42 ******/
CREATE TABLE [Tags] (
	[TagID] [nvarchar] (40) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[GroupID] [nvarchar] (40) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY]
GO


/****** 对象: 表 [dbo].[Thesis]    脚本日期: 2019/4/28 20:43:42 ******/
CREATE TABLE [Thesis] (
	[AchievementID] [nvarchar] (40) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[JournalName] [nvarchar] (80) COLLATE Chinese_PRC_CI_AS NULL ,
	[ThesisType] [nvarchar] (20) COLLATE Chinese_PRC_CI_AS NULL ,
	[JournalLevel] [nvarchar] (20) COLLATE Chinese_PRC_CI_AS NULL ,
	[Author] [nvarchar] (20) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY]
GO


/****** 对象: 表 [dbo].[Users]    脚本日期: 2019/4/28 20:43:42 ******/
CREATE TABLE [Users] (
	[UserId] [nvarchar] (40) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[UserNum] [nvarchar] (16) COLLATE Chinese_PRC_CI_AS NULL ,
	[Name] [nvarchar] (16) COLLATE Chinese_PRC_CI_AS NULL ,
	[Email] [nvarchar] (40) COLLATE Chinese_PRC_CI_AS NULL ,
	[IDCard] [nvarchar] (20) COLLATE Chinese_PRC_CI_AS NULL ,
	[Mobile] [nvarchar] (15) COLLATE Chinese_PRC_CI_AS NULL ,
	[Tel] [nvarchar] (60) COLLATE Chinese_PRC_CI_AS NULL ,
	[Password] [nvarchar] (30) COLLATE Chinese_PRC_CI_AS NULL ,
	[PasswordSalt] [nvarchar] (30) COLLATE Chinese_PRC_CI_AS NULL ,
	[PasswordFormat] [nvarchar] (20) COLLATE Chinese_PRC_CI_AS NULL ,
	[IsLockOut] [bit] NULL ,
	[IsAvailable] [bit] NULL ,
	[DeleteMark] [bit] NULL ,
	[LastLogonTime] [datetime] NULL ,
	[UserCreateTime] [datetime] NULL 
) ON [PRIMARY]
GO


/****** 对象: 表 [dbo].[UsersInRoles]    脚本日期: 2019/4/28 20:43:42 ******/
CREATE TABLE [UsersInRoles] (
	[Id] [numeric](18, 0) IDENTITY (1, 1) NOT NULL ,
	[UserId] [nvarchar] (40) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[RoleId] [nvarchar] (40) COLLATE Chinese_PRC_CI_AS NOT NULL 
) ON [PRIMARY]
GO


/* Data for table Achievement */
/* Data for table AchievementTypeMapper */
INSERT [AchievementTypeMapper] ([AchievementType], [AchievementTypeCode]) VALUES ('成果获奖', 'Award')
INSERT [AchievementTypeMapper] ([AchievementType], [AchievementTypeCode]) VALUES ('创新创业项目', 'InnovativeProject')
INSERT [AchievementTypeMapper] ([AchievementType], [AchievementTypeCode]) VALUES ('讲座', 'Lecture')
INSERT [AchievementTypeMapper] ([AchievementType], [AchievementTypeCode]) VALUES ('竞赛', 'Competition')
INSERT [AchievementTypeMapper] ([AchievementType], [AchievementTypeCode]) VALUES ('科技创新竞赛', 'InnovationContest')
INSERT [AchievementTypeMapper] ([AchievementType], [AchievementTypeCode]) VALUES ('科研项目', 'ResearchProject')
INSERT [AchievementTypeMapper] ([AchievementType], [AchievementTypeCode]) VALUES ('论文', 'Thesis')
INSERT [AchievementTypeMapper] ([AchievementType], [AchievementTypeCode]) VALUES ('认证考试', 'Certificate')
INSERT [AchievementTypeMapper] ([AchievementType], [AchievementTypeCode]) VALUES ('社会实践', 'SocialPractice')
INSERT [AchievementTypeMapper] ([AchievementType], [AchievementTypeCode]) VALUES ('著作权', 'Copyright')
INSERT [AchievementTypeMapper] ([AchievementType], [AchievementTypeCode]) VALUES ('专利', 'Patent')
/* Data for table Applications */
INSERT [Applications] ([ApplicationID], [ApplicationName]) VALUES ('65C72B9B-5517-480B-9E79-080465F81212', '学生综合测评管理系统')
/* Data for table Attachment */
/* Data for table BasisScore */
SET identity_insert [BasisScore] on

SET identity_insert [BasisScore] off
GO
/* Data for table Branches */
INSERT [Branches] ([BranchId], [ParentBranchId], [BranchName], [GroupID], [HierarchyLevel], [FullPath], [OrderID], [DeleteMark], [SeprateType]) VALUES (1, NULL, '华北理工大学', '1', 0, '.1.', 1, 0, NULL)
INSERT [Branches] ([BranchId], [ParentBranchId], [BranchName], [GroupID], [HierarchyLevel], [FullPath], [OrderID], [DeleteMark], [SeprateType]) VALUES (2, 1, '机关', '1', 1, '.1.2.', 1, 0, NULL)
INSERT [Branches] ([BranchId], [ParentBranchId], [BranchName], [GroupID], [HierarchyLevel], [FullPath], [OrderID], [DeleteMark], [SeprateType]) VALUES (3, 1, '矿业工程学院', '1', 1, '.1.3.', 2, 0, NULL)
INSERT [Branches] ([BranchId], [ParentBranchId], [BranchName], [GroupID], [HierarchyLevel], [FullPath], [OrderID], [DeleteMark], [SeprateType]) VALUES (4, 1, '冶金与能源学院', '1', 1, '.1.4.', 3, 0, NULL)
INSERT [Branches] ([BranchId], [ParentBranchId], [BranchName], [GroupID], [HierarchyLevel], [FullPath], [OrderID], [DeleteMark], [SeprateType]) VALUES (5, 1, '机械工程学院', '1', 1, '.1.5.', 4, 0, NULL)
INSERT [Branches] ([BranchId], [ParentBranchId], [BranchName], [GroupID], [HierarchyLevel], [FullPath], [OrderID], [DeleteMark], [SeprateType]) VALUES (6, 1, '化学工程学院', '1', 1, '.1.6.', 5, 0, NULL)
INSERT [Branches] ([BranchId], [ParentBranchId], [BranchName], [GroupID], [HierarchyLevel], [FullPath], [OrderID], [DeleteMark], [SeprateType]) VALUES (7, 1, '建筑工程学院', '1', 1, '.1.7.', 6, 0, NULL)
INSERT [Branches] ([BranchId], [ParentBranchId], [BranchName], [GroupID], [HierarchyLevel], [FullPath], [OrderID], [DeleteMark], [SeprateType]) VALUES (8, 1, '基础医学院', '1', 1, '.1.8.', 7, 0, NULL)
INSERT [Branches] ([BranchId], [ParentBranchId], [BranchName], [GroupID], [HierarchyLevel], [FullPath], [OrderID], [DeleteMark], [SeprateType]) VALUES (9, 1, '临床医学院', '1', 1, '.1.9.', 8, 0, NULL)
INSERT [Branches] ([BranchId], [ParentBranchId], [BranchName], [GroupID], [HierarchyLevel], [FullPath], [OrderID], [DeleteMark], [SeprateType]) VALUES (10, 1, '公共卫生学院', '1', 1, '.1.10.', 9, 0, NULL)
INSERT [Branches] ([BranchId], [ParentBranchId], [BranchName], [GroupID], [HierarchyLevel], [FullPath], [OrderID], [DeleteMark], [SeprateType]) VALUES (11, 1, '生命科学学院', '1', 1, '.1.11.', 10, 0, NULL)
INSERT [Branches] ([BranchId], [ParentBranchId], [BranchName], [GroupID], [HierarchyLevel], [FullPath], [OrderID], [DeleteMark], [SeprateType]) VALUES (12, 1, '材料科学与工程学院', '1', 1, '.1.12.', 11, 0, NULL)
INSERT [Branches] ([BranchId], [ParentBranchId], [BranchName], [GroupID], [HierarchyLevel], [FullPath], [OrderID], [DeleteMark], [SeprateType]) VALUES (13, 1, '电气工程学院', '1', 1, '.1.13.', 12, 0, NULL)
INSERT [Branches] ([BranchId], [ParentBranchId], [BranchName], [GroupID], [HierarchyLevel], [FullPath], [OrderID], [DeleteMark], [SeprateType]) VALUES (14, 1, '管理学院', '1', 1, '.1.14.', 13, 0, NULL)
INSERT [Branches] ([BranchId], [ParentBranchId], [BranchName], [GroupID], [HierarchyLevel], [FullPath], [OrderID], [DeleteMark], [SeprateType]) VALUES (15, 1, '经济学院', '1', 1, '.1.15.', 14, 0, NULL)
INSERT [Branches] ([BranchId], [ParentBranchId], [BranchName], [GroupID], [HierarchyLevel], [FullPath], [OrderID], [DeleteMark], [SeprateType]) VALUES (16, 1, '护理与康复学院', '1', 1, '.1.16.', 15, 0, NULL)
INSERT [Branches] ([BranchId], [ParentBranchId], [BranchName], [GroupID], [HierarchyLevel], [FullPath], [OrderID], [DeleteMark], [SeprateType]) VALUES (17, 1, '中医学院', '1', 1, '.1.17.', 16, 0, NULL)
INSERT [Branches] ([BranchId], [ParentBranchId], [BranchName], [GroupID], [HierarchyLevel], [FullPath], [OrderID], [DeleteMark], [SeprateType]) VALUES (18, 1, '口腔医学院', '1', 1, '.1.18.', 17, 0, NULL)
INSERT [Branches] ([BranchId], [ParentBranchId], [BranchName], [GroupID], [HierarchyLevel], [FullPath], [OrderID], [DeleteMark], [SeprateType]) VALUES (19, 1, '药学院', '1', 1, '.1.19.', 18, 0, NULL)
INSERT [Branches] ([BranchId], [ParentBranchId], [BranchName], [GroupID], [HierarchyLevel], [FullPath], [OrderID], [DeleteMark], [SeprateType]) VALUES (20, 1, '信息工程学院', '1', 1, '.1.20.', 19, 0, NULL)
INSERT [Branches] ([BranchId], [ParentBranchId], [BranchName], [GroupID], [HierarchyLevel], [FullPath], [OrderID], [DeleteMark], [SeprateType]) VALUES (21, 1, '理学院', '1', 1, '.1.21.', 20, 0, NULL)
INSERT [Branches] ([BranchId], [ParentBranchId], [BranchName], [GroupID], [HierarchyLevel], [FullPath], [OrderID], [DeleteMark], [SeprateType]) VALUES (22, 1, '外国语学院', '1', 1, '.1.22.', 21, 0, NULL)
INSERT [Branches] ([BranchId], [ParentBranchId], [BranchName], [GroupID], [HierarchyLevel], [FullPath], [OrderID], [DeleteMark], [SeprateType]) VALUES (23, 1, '人文法律学院', '1', 1, '.1.23.', 22, 0, NULL)
INSERT [Branches] ([BranchId], [ParentBranchId], [BranchName], [GroupID], [HierarchyLevel], [FullPath], [OrderID], [DeleteMark], [SeprateType]) VALUES (24, 1, '艺术学院', '1', 1, '.1.24.', 24, 0, NULL)
INSERT [Branches] ([BranchId], [ParentBranchId], [BranchName], [GroupID], [HierarchyLevel], [FullPath], [OrderID], [DeleteMark], [SeprateType]) VALUES (25, 1, '心理学院', '1', 1, '.1.25.', 25, 0, NULL)
INSERT [Branches] ([BranchId], [ParentBranchId], [BranchName], [GroupID], [HierarchyLevel], [FullPath], [OrderID], [DeleteMark], [SeprateType]) VALUES (26, 1, '以升基地', '1', 1, '.1.26.', 26, 0, NULL)
INSERT [Branches] ([BranchId], [ParentBranchId], [BranchName], [GroupID], [HierarchyLevel], [FullPath], [OrderID], [DeleteMark], [SeprateType]) VALUES (27, 1, '教务处', '1', 1, '.1.27.', 27, 0, NULL)
INSERT [Branches] ([BranchId], [ParentBranchId], [BranchName], [GroupID], [HierarchyLevel], [FullPath], [OrderID], [DeleteMark], [SeprateType]) VALUES (28, 1, '图书馆', '1', 1, '.1.28.', 28, 0, NULL)
INSERT [Branches] ([BranchId], [ParentBranchId], [BranchName], [GroupID], [HierarchyLevel], [FullPath], [OrderID], [DeleteMark], [SeprateType]) VALUES (29, 1, '体育部', '1', 1, '.1.29.', 29, 0, NULL)
INSERT [Branches] ([BranchId], [ParentBranchId], [BranchName], [GroupID], [HierarchyLevel], [FullPath], [OrderID], [DeleteMark], [SeprateType]) VALUES (30, 1, '学生处', '1', 1, '.1.30.', 30, 0, NULL)
INSERT [Branches] ([BranchId], [ParentBranchId], [BranchName], [GroupID], [HierarchyLevel], [FullPath], [OrderID], [DeleteMark], [SeprateType]) VALUES (31, 1, '研究生学院', '1', 1, '.1.31.', 31, 0, NULL)
INSERT [Branches] ([BranchId], [ParentBranchId], [BranchName], [GroupID], [HierarchyLevel], [FullPath], [OrderID], [DeleteMark], [SeprateType]) VALUES (32, 1, '继续教育学院', '1', 1, '.1.32.', 32, 0, NULL)
INSERT [Branches] ([BranchId], [ParentBranchId], [BranchName], [GroupID], [HierarchyLevel], [FullPath], [OrderID], [DeleteMark], [SeprateType]) VALUES (33, 1, '国际教育中心', '1', 1, '.1.33.', 33, 0, NULL)
INSERT [Branches] ([BranchId], [ParentBranchId], [BranchName], [GroupID], [HierarchyLevel], [FullPath], [OrderID], [DeleteMark], [SeprateType]) VALUES (34, 1, '轻工学院', '1', 1, '.1.34.', 34, 0, NULL)
INSERT [Branches] ([BranchId], [ParentBranchId], [BranchName], [GroupID], [HierarchyLevel], [FullPath], [OrderID], [DeleteMark], [SeprateType]) VALUES (35, 1, '冀唐学院', '1', 1, '.1.35.', 35, 0, NULL)
INSERT [Branches] ([BranchId], [ParentBranchId], [BranchName], [GroupID], [HierarchyLevel], [FullPath], [OrderID], [DeleteMark], [SeprateType]) VALUES (36, 1, '迁安学院', '1', 1, '.1.36.', 36, 0, NULL)
INSERT [Branches] ([BranchId], [ParentBranchId], [BranchName], [GroupID], [HierarchyLevel], [FullPath], [OrderID], [DeleteMark], [SeprateType]) VALUES (37, 3, '测绘工程', '1', 2, '.1.3.37.', 1, 0, NULL)
INSERT [Branches] ([BranchId], [ParentBranchId], [BranchName], [GroupID], [HierarchyLevel], [FullPath], [OrderID], [DeleteMark], [SeprateType]) VALUES (38, 3, '地理信息科学', '1', 2, '.1.3.38.', 2, 0, NULL)
INSERT [Branches] ([BranchId], [ParentBranchId], [BranchName], [GroupID], [HierarchyLevel], [FullPath], [OrderID], [DeleteMark], [SeprateType]) VALUES (39, 3, '采矿工程', '1', 2, '.1.3.39.', 3, 0, NULL)
INSERT [Branches] ([BranchId], [ParentBranchId], [BranchName], [GroupID], [HierarchyLevel], [FullPath], [OrderID], [DeleteMark], [SeprateType]) VALUES (40, 3, '矿物加工工程', '1', 2, '.1.3.40.', 4, 0, NULL)
INSERT [Branches] ([BranchId], [ParentBranchId], [BranchName], [GroupID], [HierarchyLevel], [FullPath], [OrderID], [DeleteMark], [SeprateType]) VALUES (41, 3, '资源勘查工程', '1', 2, '.1.3.41.', 5, 0, NULL)
INSERT [Branches] ([BranchId], [ParentBranchId], [BranchName], [GroupID], [HierarchyLevel], [FullPath], [OrderID], [DeleteMark], [SeprateType]) VALUES (42, 3, '安全工程', '1', 2, '.1.3.42.', 6, 0, NULL)
INSERT [Branches] ([BranchId], [ParentBranchId], [BranchName], [GroupID], [HierarchyLevel], [FullPath], [OrderID], [DeleteMark], [SeprateType]) VALUES (43, 3, '石油工程', '1', 2, '.1.3.43.', 7, 0, NULL)
INSERT [Branches] ([BranchId], [ParentBranchId], [BranchName], [GroupID], [HierarchyLevel], [FullPath], [OrderID], [DeleteMark], [SeprateType]) VALUES (44, 4, '冶金工程', '1', 2, '.1.4.44.', 1, 0, NULL)
INSERT [Branches] ([BranchId], [ParentBranchId], [BranchName], [GroupID], [HierarchyLevel], [FullPath], [OrderID], [DeleteMark], [SeprateType]) VALUES (45, 4, '金属材料工程', '1', 2, '.1.4.45.', 2, 0, NULL)
INSERT [Branches] ([BranchId], [ParentBranchId], [BranchName], [GroupID], [HierarchyLevel], [FullPath], [OrderID], [DeleteMark], [SeprateType]) VALUES (46, 4, '能源与动力工程', '1', 2, '.1.4.46.', 3, 0, NULL)
INSERT [Branches] ([BranchId], [ParentBranchId], [BranchName], [GroupID], [HierarchyLevel], [FullPath], [OrderID], [DeleteMark], [SeprateType]) VALUES (47, 4, '材料成型及控制工程', '1', 2, '.1.4.47.', 4, 0, NULL)
INSERT [Branches] ([BranchId], [ParentBranchId], [BranchName], [GroupID], [HierarchyLevel], [FullPath], [OrderID], [DeleteMark], [SeprateType]) VALUES (48, 5, '过程装备与控制工程', '1', 2, '.1.5.48.', 1, 0, NULL)
INSERT [Branches] ([BranchId], [ParentBranchId], [BranchName], [GroupID], [HierarchyLevel], [FullPath], [OrderID], [DeleteMark], [SeprateType]) VALUES (49, 5, '机械设计制造及其自动化', '1', 2, '.1.5.49.', 2, 0, NULL)
INSERT [Branches] ([BranchId], [ParentBranchId], [BranchName], [GroupID], [HierarchyLevel], [FullPath], [OrderID], [DeleteMark], [SeprateType]) VALUES (50, 5, '工业设计', '1', 2, '.1.5.50.', 3, 0, NULL)
INSERT [Branches] ([BranchId], [ParentBranchId], [BranchName], [GroupID], [HierarchyLevel], [FullPath], [OrderID], [DeleteMark], [SeprateType]) VALUES (51, 5, '工业工程', '1', 2, '.1.5.51.', 4, 0, NULL)
INSERT [Branches] ([BranchId], [ParentBranchId], [BranchName], [GroupID], [HierarchyLevel], [FullPath], [OrderID], [DeleteMark], [SeprateType]) VALUES (52, 5, '包装工程', '1', 2, '.1.5.52.', 5, 0, NULL)
INSERT [Branches] ([BranchId], [ParentBranchId], [BranchName], [GroupID], [HierarchyLevel], [FullPath], [OrderID], [DeleteMark], [SeprateType]) VALUES (53, 6, '应用化学', '1', 2, '.1.6.53.', 1, 0, NULL)
INSERT [Branches] ([BranchId], [ParentBranchId], [BranchName], [GroupID], [HierarchyLevel], [FullPath], [OrderID], [DeleteMark], [SeprateType]) VALUES (54, 6, '环境工程', '1', 2, '.1.6.54.', 2, 0, NULL)
INSERT [Branches] ([BranchId], [ParentBranchId], [BranchName], [GroupID], [HierarchyLevel], [FullPath], [OrderID], [DeleteMark], [SeprateType]) VALUES (55, 6, '化学工程与工艺', '1', 2, '.1.6.55.', 3, 0, NULL)
INSERT [Branches] ([BranchId], [ParentBranchId], [BranchName], [GroupID], [HierarchyLevel], [FullPath], [OrderID], [DeleteMark], [SeprateType]) VALUES (56, 6, '环境科学', '1', 2, '.1.6.56.', 4, 0, NULL)
INSERT [Branches] ([BranchId], [ParentBranchId], [BranchName], [GroupID], [HierarchyLevel], [FullPath], [OrderID], [DeleteMark], [SeprateType]) VALUES (57, 6, '化学', '1', 2, '.1.6.57.', 5, 0, NULL)
INSERT [Branches] ([BranchId], [ParentBranchId], [BranchName], [GroupID], [HierarchyLevel], [FullPath], [OrderID], [DeleteMark], [SeprateType]) VALUES (58, 7, '建筑环境与能源应用工程', '1', 2, '.1.7.58.', 1, 0, NULL)
INSERT [Branches] ([BranchId], [ParentBranchId], [BranchName], [GroupID], [HierarchyLevel], [FullPath], [OrderID], [DeleteMark], [SeprateType]) VALUES (59, 7, '给排水科学与工程', '1', 2, '.1.7.59.', 2, 0, NULL)
INSERT [Branches] ([BranchId], [ParentBranchId], [BranchName], [GroupID], [HierarchyLevel], [FullPath], [OrderID], [DeleteMark], [SeprateType]) VALUES (60, 7, '建筑学', '1', 2, '.1.7.60.', 3, 0, NULL)
INSERT [Branches] ([BranchId], [ParentBranchId], [BranchName], [GroupID], [HierarchyLevel], [FullPath], [OrderID], [DeleteMark], [SeprateType]) VALUES (61, 7, '土木工程', '1', 2, '.1.7.61.', 4, 0, NULL)
INSERT [Branches] ([BranchId], [ParentBranchId], [BranchName], [GroupID], [HierarchyLevel], [FullPath], [OrderID], [DeleteMark], [SeprateType]) VALUES (62, 7, '工程管理', '1', 2, '.1.7.62.', 5, 0, NULL)
INSERT [Branches] ([BranchId], [ParentBranchId], [BranchName], [GroupID], [HierarchyLevel], [FullPath], [OrderID], [DeleteMark], [SeprateType]) VALUES (63, 7, '交通工程', '1', 2, '.1.7.63.', 6, 0, NULL)
INSERT [Branches] ([BranchId], [ParentBranchId], [BranchName], [GroupID], [HierarchyLevel], [FullPath], [OrderID], [DeleteMark], [SeprateType]) VALUES (64, 7, '交通运输', '1', 2, '.1.7.64.', 7, 0, NULL)
INSERT [Branches] ([BranchId], [ParentBranchId], [BranchName], [GroupID], [HierarchyLevel], [FullPath], [OrderID], [DeleteMark], [SeprateType]) VALUES (65, 7, '物流工程', '1', 2, '.1.7.65.', 8, 0, NULL)
INSERT [Branches] ([BranchId], [ParentBranchId], [BranchName], [GroupID], [HierarchyLevel], [FullPath], [OrderID], [DeleteMark], [SeprateType]) VALUES (66, 9, '临床医学', '1', 2, '.1.9.66.', 1, 0, NULL)
INSERT [Branches] ([BranchId], [ParentBranchId], [BranchName], [GroupID], [HierarchyLevel], [FullPath], [OrderID], [DeleteMark], [SeprateType]) VALUES (67, 9, '医学影像学', '1', 2, '.1.9.67.', 2, 0, NULL)
INSERT [Branches] ([BranchId], [ParentBranchId], [BranchName], [GroupID], [HierarchyLevel], [FullPath], [OrderID], [DeleteMark], [SeprateType]) VALUES (68, 9, '麻醉学', '1', 2, '.1.9.68.', 3, 0, NULL)
INSERT [Branches] ([BranchId], [ParentBranchId], [BranchName], [GroupID], [HierarchyLevel], [FullPath], [OrderID], [DeleteMark], [SeprateType]) VALUES (69, 9, '医学检验技术', '1', 2, '.1.9.69.', 4, 0, NULL)
INSERT [Branches] ([BranchId], [ParentBranchId], [BranchName], [GroupID], [HierarchyLevel], [FullPath], [OrderID], [DeleteMark], [SeprateType]) VALUES (70, 10, '预防医学', '1', 2, '.1.10.70.', 1, 0, NULL)
INSERT [Branches] ([BranchId], [ParentBranchId], [BranchName], [GroupID], [HierarchyLevel], [FullPath], [OrderID], [DeleteMark], [SeprateType]) VALUES (71, 11, '生物技术', '1', 2, '.1.11.71.', 1, 0, NULL)
INSERT [Branches] ([BranchId], [ParentBranchId], [BranchName], [GroupID], [HierarchyLevel], [FullPath], [OrderID], [DeleteMark], [SeprateType]) VALUES (72, 12, '无机非金属材料工程', '1', 2, '.1.12.72.', 1, 0, NULL)
INSERT [Branches] ([BranchId], [ParentBranchId], [BranchName], [GroupID], [HierarchyLevel], [FullPath], [OrderID], [DeleteMark], [SeprateType]) VALUES (73, 12, '材料化学', '1', 2, '.1.12.73.', 2, 0, NULL)
INSERT [Branches] ([BranchId], [ParentBranchId], [BranchName], [GroupID], [HierarchyLevel], [FullPath], [OrderID], [DeleteMark], [SeprateType]) VALUES (74, 12, '高分子材料与工程', '1', 2, '.1.12.74.', 3, 0, NULL)
INSERT [Branches] ([BranchId], [ParentBranchId], [BranchName], [GroupID], [HierarchyLevel], [FullPath], [OrderID], [DeleteMark], [SeprateType]) VALUES (75, 13, '测控技术与仪器', '1', 2, '.1.13.75.', 1, 0, NULL)
INSERT [Branches] ([BranchId], [ParentBranchId], [BranchName], [GroupID], [HierarchyLevel], [FullPath], [OrderID], [DeleteMark], [SeprateType]) VALUES (76, 13, '电子科学与技术', '1', 2, '.1.13.76.', 2, 0, NULL)
INSERT [Branches] ([BranchId], [ParentBranchId], [BranchName], [GroupID], [HierarchyLevel], [FullPath], [OrderID], [DeleteMark], [SeprateType]) VALUES (77, 13, '自动化', '1', 2, '.1.13.77.', 3, 0, NULL)
INSERT [Branches] ([BranchId], [ParentBranchId], [BranchName], [GroupID], [HierarchyLevel], [FullPath], [OrderID], [DeleteMark], [SeprateType]) VALUES (78, 13, '电气工程及其自动化', '1', 2, '.1.13.78.', 4, 0, NULL)
INSERT [Branches] ([BranchId], [ParentBranchId], [BranchName], [GroupID], [HierarchyLevel], [FullPath], [OrderID], [DeleteMark], [SeprateType]) VALUES (79, 14, '信息管理与信息系统', '1', 2, '.1.14.79.', 1, 0, NULL)
INSERT [Branches] ([BranchId], [ParentBranchId], [BranchName], [GroupID], [HierarchyLevel], [FullPath], [OrderID], [DeleteMark], [SeprateType]) VALUES (80, 14, '劳动与社会保障', '1', 2, '.1.14.80.', 2, 0, NULL)
INSERT [Branches] ([BranchId], [ParentBranchId], [BranchName], [GroupID], [HierarchyLevel], [FullPath], [OrderID], [DeleteMark], [SeprateType]) VALUES (81, 14, '工商管理', '1', 2, '.1.14.81.', 3, 0, NULL)
INSERT [Branches] ([BranchId], [ParentBranchId], [BranchName], [GroupID], [HierarchyLevel], [FullPath], [OrderID], [DeleteMark], [SeprateType]) VALUES (82, 14, '公共事业管理', '1', 2, '.1.14.82.', 4, 0, NULL)
INSERT [Branches] ([BranchId], [ParentBranchId], [BranchName], [GroupID], [HierarchyLevel], [FullPath], [OrderID], [DeleteMark], [SeprateType]) VALUES (83, 15, '国际经济与贸易', '1', 2, '.1.15.83.', 1, 0, NULL)
INSERT [Branches] ([BranchId], [ParentBranchId], [BranchName], [GroupID], [HierarchyLevel], [FullPath], [OrderID], [DeleteMark], [SeprateType]) VALUES (84, 15, '金融学', '1', 2, '.1.15.84.', 2, 0, NULL)
INSERT [Branches] ([BranchId], [ParentBranchId], [BranchName], [GroupID], [HierarchyLevel], [FullPath], [OrderID], [DeleteMark], [SeprateType]) VALUES (85, 15, '经济统计学', '1', 2, '.1.15.85.', 3, 0, NULL)
INSERT [Branches] ([BranchId], [ParentBranchId], [BranchName], [GroupID], [HierarchyLevel], [FullPath], [OrderID], [DeleteMark], [SeprateType]) VALUES (86, 16, '护理学', '1', 2, '.1.16.86.', 1, 0, NULL)
INSERT [Branches] ([BranchId], [ParentBranchId], [BranchName], [GroupID], [HierarchyLevel], [FullPath], [OrderID], [DeleteMark], [SeprateType]) VALUES (87, 16, '康复治疗学', '1', 2, '.1.16.87.', 2, 0, NULL)
INSERT [Branches] ([BranchId], [ParentBranchId], [BranchName], [GroupID], [HierarchyLevel], [FullPath], [OrderID], [DeleteMark], [SeprateType]) VALUES (88, 17, '中西医临床医学', '1', 2, '.1.17.88.', 1, 0, NULL)
INSERT [Branches] ([BranchId], [ParentBranchId], [BranchName], [GroupID], [HierarchyLevel], [FullPath], [OrderID], [DeleteMark], [SeprateType]) VALUES (89, 17, '中医学', '1', 2, '.1.17.89.', 2, 0, NULL)
INSERT [Branches] ([BranchId], [ParentBranchId], [BranchName], [GroupID], [HierarchyLevel], [FullPath], [OrderID], [DeleteMark], [SeprateType]) VALUES (90, 17, '针灸推拿学', '1', 2, '.1.17.90.', 3, 0, NULL)
INSERT [Branches] ([BranchId], [ParentBranchId], [BranchName], [GroupID], [HierarchyLevel], [FullPath], [OrderID], [DeleteMark], [SeprateType]) VALUES (91, 18, '口腔医学', '1', 2, '.1.18.91.', 1, 0, NULL)
INSERT [Branches] ([BranchId], [ParentBranchId], [BranchName], [GroupID], [HierarchyLevel], [FullPath], [OrderID], [DeleteMark], [SeprateType]) VALUES (92, 18, '医学实验技术', '1', 2, '.1.18.92.', 2, 0, NULL)
INSERT [Branches] ([BranchId], [ParentBranchId], [BranchName], [GroupID], [HierarchyLevel], [FullPath], [OrderID], [DeleteMark], [SeprateType]) VALUES (93, 19, '药学', '1', 2, '.1.19.93.', 1, 0, NULL)
INSERT [Branches] ([BranchId], [ParentBranchId], [BranchName], [GroupID], [HierarchyLevel], [FullPath], [OrderID], [DeleteMark], [SeprateType]) VALUES (94, 19, '药物制剂', '1', 2, '.1.19.94.', 2, 0, NULL)
INSERT [Branches] ([BranchId], [ParentBranchId], [BranchName], [GroupID], [HierarchyLevel], [FullPath], [OrderID], [DeleteMark], [SeprateType]) VALUES (95, 19, '中药学', '1', 2, '.1.19.95.', 3, 0, NULL)
INSERT [Branches] ([BranchId], [ParentBranchId], [BranchName], [GroupID], [HierarchyLevel], [FullPath], [OrderID], [DeleteMark], [SeprateType]) VALUES (96, 20, '电子信息工程', '1', 2, '.1.20.96.', 1, 0, NULL)
INSERT [Branches] ([BranchId], [ParentBranchId], [BranchName], [GroupID], [HierarchyLevel], [FullPath], [OrderID], [DeleteMark], [SeprateType]) VALUES (97, 20, '电子信息科学与技术', '1', 2, '.1.20.97.', 2, 0, NULL)
INSERT [Branches] ([BranchId], [ParentBranchId], [BranchName], [GroupID], [HierarchyLevel], [FullPath], [OrderID], [DeleteMark], [SeprateType]) VALUES (98, 20, '海洋技术', '1', 2, '.1.20.98.', 3, 0, NULL)
INSERT [Branches] ([BranchId], [ParentBranchId], [BranchName], [GroupID], [HierarchyLevel], [FullPath], [OrderID], [DeleteMark], [SeprateType]) VALUES (99, 20, '计算机科学与技术', '1', 2, '.1.20.99.', 4, 0, NULL)
INSERT [Branches] ([BranchId], [ParentBranchId], [BranchName], [GroupID], [HierarchyLevel], [FullPath], [OrderID], [DeleteMark], [SeprateType]) VALUES (100, 20, '通信工程', '1', 2, '.1.20.100.', 5, 0, NULL)
INSERT [Branches] ([BranchId], [ParentBranchId], [BranchName], [GroupID], [HierarchyLevel], [FullPath], [OrderID], [DeleteMark], [SeprateType]) VALUES (101, 20, '网络工程', '1', 2, '.1.20.101.', 6, 0, NULL)
INSERT [Branches] ([BranchId], [ParentBranchId], [BranchName], [GroupID], [HierarchyLevel], [FullPath], [OrderID], [DeleteMark], [SeprateType]) VALUES (102, 21, '信息与计算科学', '1', 2, '.1.21.102.', 1, 0, NULL)
INSERT [Branches] ([BranchId], [ParentBranchId], [BranchName], [GroupID], [HierarchyLevel], [FullPath], [OrderID], [DeleteMark], [SeprateType]) VALUES (103, 21, '数学与应用数学', '1', 2, '.1.21.103.', 2, 0, NULL)
INSERT [Branches] ([BranchId], [ParentBranchId], [BranchName], [GroupID], [HierarchyLevel], [FullPath], [OrderID], [DeleteMark], [SeprateType]) VALUES (104, 21, '统计学', '1', 2, '.1.21.104.', 3, 0, NULL)
INSERT [Branches] ([BranchId], [ParentBranchId], [BranchName], [GroupID], [HierarchyLevel], [FullPath], [OrderID], [DeleteMark], [SeprateType]) VALUES (105, 21, '应用统计学', '1', 2, '.1.21.105.', 4, 0, NULL)
INSERT [Branches] ([BranchId], [ParentBranchId], [BranchName], [GroupID], [HierarchyLevel], [FullPath], [OrderID], [DeleteMark], [SeprateType]) VALUES (106, 22, '英语', '1', 2, '.1.22.106.', 1, 0, NULL)
INSERT [Branches] ([BranchId], [ParentBranchId], [BranchName], [GroupID], [HierarchyLevel], [FullPath], [OrderID], [DeleteMark], [SeprateType]) VALUES (107, 22, '日语', '1', 2, '.1.22.107.', 2, 0, NULL)
INSERT [Branches] ([BranchId], [ParentBranchId], [BranchName], [GroupID], [HierarchyLevel], [FullPath], [OrderID], [DeleteMark], [SeprateType]) VALUES (108, 23, '法学', '1', 2, '.1.23.108.', 1, 0, NULL)
INSERT [Branches] ([BranchId], [ParentBranchId], [BranchName], [GroupID], [HierarchyLevel], [FullPath], [OrderID], [DeleteMark], [SeprateType]) VALUES (109, 23, '社会工作', '1', 2, '.1.23.109.', 2, 0, NULL)
INSERT [Branches] ([BranchId], [ParentBranchId], [BranchName], [GroupID], [HierarchyLevel], [FullPath], [OrderID], [DeleteMark], [SeprateType]) VALUES (110, 24, '视觉传达设计', '1', 2, '.1.24.110.', 1, 0, NULL)
INSERT [Branches] ([BranchId], [ParentBranchId], [BranchName], [GroupID], [HierarchyLevel], [FullPath], [OrderID], [DeleteMark], [SeprateType]) VALUES (111, 24, '绘画', '1', 2, '.1.24.111.', 2, 0, NULL)
INSERT [Branches] ([BranchId], [ParentBranchId], [BranchName], [GroupID], [HierarchyLevel], [FullPath], [OrderID], [DeleteMark], [SeprateType]) VALUES (112, 24, '动画', '1', 2, '.1.24.112.', 3, 0, NULL)
INSERT [Branches] ([BranchId], [ParentBranchId], [BranchName], [GroupID], [HierarchyLevel], [FullPath], [OrderID], [DeleteMark], [SeprateType]) VALUES (113, 24, '产品设计', '1', 2, '.1.24.113.', 4, 0, NULL)
INSERT [Branches] ([BranchId], [ParentBranchId], [BranchName], [GroupID], [HierarchyLevel], [FullPath], [OrderID], [DeleteMark], [SeprateType]) VALUES (114, 24, '环境设计', '1', 2, '.1.24.114.', 5, 0, NULL)
INSERT [Branches] ([BranchId], [ParentBranchId], [BranchName], [GroupID], [HierarchyLevel], [FullPath], [OrderID], [DeleteMark], [SeprateType]) VALUES (115, 24, '服装与服饰设计', '1', 2, '.1.24.115.', 6, 0, NULL)
INSERT [Branches] ([BranchId], [ParentBranchId], [BranchName], [GroupID], [HierarchyLevel], [FullPath], [OrderID], [DeleteMark], [SeprateType]) VALUES (116, 24, '艺术设计', '1', 2, '.1.24.116.', 7, 0, NULL)
INSERT [Branches] ([BranchId], [ParentBranchId], [BranchName], [GroupID], [HierarchyLevel], [FullPath], [OrderID], [DeleteMark], [SeprateType]) VALUES (117, 25, '应用心理学', '1', 2, '.1.25.117.', 1, 0, NULL)
INSERT [Branches] ([BranchId], [ParentBranchId], [BranchName], [GroupID], [HierarchyLevel], [FullPath], [OrderID], [DeleteMark], [SeprateType]) VALUES (118, 26, '以升创新班', '1', 2, '.1.26.118.', 1, 0, NULL)
INSERT [Branches] ([BranchId], [ParentBranchId], [BranchName], [GroupID], [HierarchyLevel], [FullPath], [OrderID], [DeleteMark], [SeprateType]) VALUES (119, 1, '团委', '1', 1, '.1.119.', 37, 0, NULL)
INSERT [Branches] ([BranchId], [ParentBranchId], [BranchName], [GroupID], [HierarchyLevel], [FullPath], [OrderID], [DeleteMark], [SeprateType]) VALUES (120, 1, '社科部', '1', 1, '.1.120.', 23, 0, NULL)
INSERT [Branches] ([BranchId], [ParentBranchId], [BranchName], [GroupID], [HierarchyLevel], [FullPath], [OrderID], [DeleteMark], [SeprateType]) VALUES (121, 1, '实验动物中心', '1', 1, '.1.121.', 38, 0, NULL)
INSERT [Branches] ([BranchId], [ParentBranchId], [BranchName], [GroupID], [HierarchyLevel], [FullPath], [OrderID], [DeleteMark], [SeprateType]) VALUES (122, 1, '科学技术处', '1', 1, '.1.122.', 39, 0, NULL)
INSERT [Branches] ([BranchId], [ParentBranchId], [BranchName], [GroupID], [HierarchyLevel], [FullPath], [OrderID], [DeleteMark], [SeprateType]) VALUES (123, 1, '现代技术教育中心', '1', 1, '.1.123.', 40, 0, NULL)
INSERT [Branches] ([BranchId], [ParentBranchId], [BranchName], [GroupID], [HierarchyLevel], [FullPath], [OrderID], [DeleteMark], [SeprateType]) VALUES (124, 1, '医学实验研究中心', '1', 1, '.1.124.', 41, 0, NULL)
/* Data for table BranchesTags */
/* Data for table BranchUsers */
INSERT [BranchUsers] ([UserId], [BranchId]) VALUES ('F07680E4-DAE0-4396-BBA2-104F78FA0BA3', 14)
/* Data for table Certificate */
/* Data for table Competition */
/* Data for table CompositveScore */
SET identity_insert [CompositveScore] on

SET identity_insert [CompositveScore] off
GO
/* Data for table Copyright */
/* Data for table DownloadResource */
SET identity_insert [DownloadResource] on

SET identity_insert [DownloadResource] off
GO
/* Data for table Information */
SET identity_insert [Information] on

INSERT [Information] ([InformationID], [Title], [Content], [Author], [SubmitDate], [ForTeacher], [ForStudent]) VALUES (1, '大学生综合测评管理系统开始试运行了！', '我校开始试运行华北理工大学综合测评管理系统，请各位老师通知学生录入相关加分信息！', '吕震宇', '2019/4/27 17:42:03', 1, 1)
INSERT [Information] ([InformationID], [Title], [Content], [Author], [SubmitDate], [ForTeacher], [ForStudent]) VALUES (3, '欢迎来到华北理工大学综合测评管理系统答辩', '<p>我们的大创项目是华北理工大学综合测评管理系统</p><h1>我叫姚懿！</h1>', '吕震宇', '2019/4/27 23:22:59', 1, 1)
SET identity_insert [Information] off
GO
/* Data for table InnovativeProject */
/* Data for table Others */
/* Data for table Patent */
/* Data for table RecreationSport */
/* Data for table ResearchProject */
/* Data for table Roles */
INSERT [Roles] ([RoleId], [RoleName], [ApplicationID]) VALUES ('7FFCB3EC-DD38-4D8A-A578-DDD6C7E629C6', '超级管理员', '65C72B9B-5517-480B-9E79-080465F81212')
INSERT [Roles] ([RoleId], [RoleName], [ApplicationID]) VALUES ('54589C8B-7687-4DE0-8B01-8F287047246D', '管理员', '65C72B9B-5517-480B-9E79-080465F81212')
INSERT [Roles] ([RoleId], [RoleName], [ApplicationID]) VALUES ('6E902DE1-8934-4695-AB7A-4EDF99B71543', '学院管理员', '65C72B9B-5517-480B-9E79-080465F81212')
INSERT [Roles] ([RoleId], [RoleName], [ApplicationID]) VALUES ('b7d9a5a6-2112-4b99-8ca7-578b2de4a9d9', '教师', '65C72B9B-5517-480B-9E79-080465F81212')
INSERT [Roles] ([RoleId], [RoleName], [ApplicationID]) VALUES ('9475d40b-f862-41f1-9c01-593c0095b600', '学生', '65C72B9B-5517-480B-9E79-080465F81212')
INSERT [Roles] ([RoleId], [RoleName], [ApplicationID]) VALUES ('2E541D5Q-8934-4695-AB7A-4EDF99B71543', '班级管理员', '65C72B9B-5517-480B-9E79-080465F81212')
/* Data for table Rules */
INSERT [Rules] ([RuleID], [ParentRuleID], [RuleName], [Description], [OrderID], [Score], [NodeType], [IsDelete], [BranchId]) VALUES ('M', NULL, '综测规则', NULL, 1, NULL, 'branch', 0, NULL)
INSERT [Rules] ([RuleID], [ParentRuleID], [RuleName], [Description], [OrderID], [Score], [NodeType], [IsDelete], [BranchId]) VALUES ('J', 'M', '基础性素质', NULL, 1, NULL, 'branch', 0, NULL)
INSERT [Rules] ([RuleID], [ParentRuleID], [RuleName], [Description], [OrderID], [Score], [NodeType], [IsDelete], [BranchId]) VALUES ('J1', 'J', '思想品德素质测评', NULL, 1, NULL, 'branch', 0, NULL)
INSERT [Rules] ([RuleID], [ParentRuleID], [RuleName], [Description], [OrderID], [Score], [NodeType], [IsDelete], [BranchId]) VALUES ('J101', 'J1', '思想政治表现', NULL, 1, NULL, 'leaf', 0, NULL)
INSERT [Rules] ([RuleID], [ParentRuleID], [RuleName], [Description], [OrderID], [Score], [NodeType], [IsDelete], [BranchId]) VALUES ('J102', 'J1', '社会公德', NULL, 2, NULL, 'leaf', 0, NULL)
INSERT [Rules] ([RuleID], [ParentRuleID], [RuleName], [Description], [OrderID], [Score], [NodeType], [IsDelete], [BranchId]) VALUES ('J103', 'J1', '遵纪守法', NULL, 3, NULL, 'leaf', 0, NULL)
INSERT [Rules] ([RuleID], [ParentRuleID], [RuleName], [Description], [OrderID], [Score], [NodeType], [IsDelete], [BranchId]) VALUES ('J104', 'J1', '集体观念', NULL, 4, NULL, 'leaf', 0, NULL)
INSERT [Rules] ([RuleID], [ParentRuleID], [RuleName], [Description], [OrderID], [Score], [NodeType], [IsDelete], [BranchId]) VALUES ('J105', 'J1', '公益劳动', NULL, 5, NULL, 'leaf', 0, NULL)
INSERT [Rules] ([RuleID], [ParentRuleID], [RuleName], [Description], [OrderID], [Score], [NodeType], [IsDelete], [BranchId]) VALUES ('J106', 'J1', '宿舍卫生', NULL, 6, NULL, 'leaf', 0, NULL)
INSERT [Rules] ([RuleID], [ParentRuleID], [RuleName], [Description], [OrderID], [Score], [NodeType], [IsDelete], [BranchId]) VALUES ('J107', 'J1', '行为规范', NULL, 7, NULL, 'leaf', 0, NULL)
INSERT [Rules] ([RuleID], [ParentRuleID], [RuleName], [Description], [OrderID], [Score], [NodeType], [IsDelete], [BranchId]) VALUES ('J2', 'J', '科学文化素质测评', '加权平均成绩', 2, NULL, 'branch', 0, NULL)
INSERT [Rules] ([RuleID], [ParentRuleID], [RuleName], [Description], [OrderID], [Score], [NodeType], [IsDelete], [BranchId]) VALUES ('J3', 'J', '身心素质测评', NULL, 3, NULL, 'branch', 0, NULL)
INSERT [Rules] ([RuleID], [ParentRuleID], [RuleName], [Description], [OrderID], [Score], [NodeType], [IsDelete], [BranchId]) VALUES ('F', 'M', '发展性素质', NULL, 2, NULL, 'branch', 0, NULL)
INSERT [Rules] ([RuleID], [ParentRuleID], [RuleName], [Description], [OrderID], [Score], [NodeType], [IsDelete], [BranchId]) VALUES ('F1', 'F', '科技学术与创新加分', NULL, 1, NULL, 'branch', 0, NULL)
INSERT [Rules] ([RuleID], [ParentRuleID], [RuleName], [Description], [OrderID], [Score], [NodeType], [IsDelete], [BranchId]) VALUES ('F101', 'F1', '学科竞赛', NULL, 1, NULL, 'branch', 0, NULL)
INSERT [Rules] ([RuleID], [ParentRuleID], [RuleName], [Description], [OrderID], [Score], [NodeType], [IsDelete], [BranchId]) VALUES ('F1040101', 'F104', '【国际专利】项目组第一成员', NULL, 1, '20', 'leaf', 0, NULL)
INSERT [Rules] ([RuleID], [ParentRuleID], [RuleName], [Description], [OrderID], [Score], [NodeType], [IsDelete], [BranchId]) VALUES ('F1040102', 'F104', '【国际专利】项目组第二成员', NULL, 2, '10', 'leaf', 0, NULL)
INSERT [Rules] ([RuleID], [ParentRuleID], [RuleName], [Description], [OrderID], [Score], [NodeType], [IsDelete], [BranchId]) VALUES ('F1040103', 'F104', '【国际专利】项目组第三成员', NULL, 3, '6', 'leaf', 0, NULL)
INSERT [Rules] ([RuleID], [ParentRuleID], [RuleName], [Description], [OrderID], [Score], [NodeType], [IsDelete], [BranchId]) VALUES ('F1040104', 'F104', '【国际专利】项目组第四、五成员', NULL, 4, '4', 'leaf', 0, NULL)
INSERT [Rules] ([RuleID], [ParentRuleID], [RuleName], [Description], [OrderID], [Score], [NodeType], [IsDelete], [BranchId]) VALUES ('F1040201', 'F104', '【发明专利国家标准】项目组第一成员', NULL, 5, '10', 'leaf', 0, NULL)
INSERT [Rules] ([RuleID], [ParentRuleID], [RuleName], [Description], [OrderID], [Score], [NodeType], [IsDelete], [BranchId]) VALUES ('F1040202', 'F104', '【发明专利国家标准】项目组第二成员', NULL, 6, '5', 'leaf', 0, NULL)
INSERT [Rules] ([RuleID], [ParentRuleID], [RuleName], [Description], [OrderID], [Score], [NodeType], [IsDelete], [BranchId]) VALUES ('F1040203', 'F104', '【发明专利国家标准】项目组第三成员', NULL, 7, '3', 'leaf', 0, NULL)
INSERT [Rules] ([RuleID], [ParentRuleID], [RuleName], [Description], [OrderID], [Score], [NodeType], [IsDelete], [BranchId]) VALUES ('F1040204', 'F104', '【发明专利国家标准】项目组第四、五成员', NULL, 8, '2', 'leaf', 0, NULL)
INSERT [Rules] ([RuleID], [ParentRuleID], [RuleName], [Description], [OrderID], [Score], [NodeType], [IsDelete], [BranchId]) VALUES ('F1040301', 'F104', '【实用新型行业标准】项目组第一成员', NULL, 9, '3', 'leaf', 0, NULL)
INSERT [Rules] ([RuleID], [ParentRuleID], [RuleName], [Description], [OrderID], [Score], [NodeType], [IsDelete], [BranchId]) VALUES ('F1040302', 'F104', '【实用新型行业标准】项目组第二成员', NULL, 10, '1', 'leaf', 0, NULL)
INSERT [Rules] ([RuleID], [ParentRuleID], [RuleName], [Description], [OrderID], [Score], [NodeType], [IsDelete], [BranchId]) VALUES ('F1040401', 'F104', '【软件著作权】项目组第一成员', NULL, 11, '3', 'leaf', 0, NULL)
INSERT [Rules] ([RuleID], [ParentRuleID], [RuleName], [Description], [OrderID], [Score], [NodeType], [IsDelete], [BranchId]) VALUES ('F1040402', 'F104', '【软件著作权】项目组第二成员', NULL, 12, '1', 'leaf', 0, NULL)
INSERT [Rules] ([RuleID], [ParentRuleID], [RuleName], [Description], [OrderID], [Score], [NodeType], [IsDelete], [BranchId]) VALUES ('F105', 'F1', '科技作品和创业计划竞赛加分', NULL, 5, NULL, 'branch', 0, NULL)
INSERT [Rules] ([RuleID], [ParentRuleID], [RuleName], [Description], [OrderID], [Score], [NodeType], [IsDelete], [BranchId]) VALUES ('F4', 'F', '社会工作加分', NULL, 4, NULL, 'branch', 0, NULL)
INSERT [Rules] ([RuleID], [ParentRuleID], [RuleName], [Description], [OrderID], [Score], [NodeType], [IsDelete], [BranchId]) VALUES ('F40101', 'F4', '班委委员、团支部委员、院级学生组织委员（优秀）', NULL, 1, '10', 'leaf', 0, NULL)
INSERT [Rules] ([RuleID], [ParentRuleID], [RuleName], [Description], [OrderID], [Score], [NodeType], [IsDelete], [BranchId]) VALUES ('F40102', 'F4', '班委委员、团支部委员、院级学生组织委员（及格）', NULL, 2, '6', 'leaf', 0, NULL)
INSERT [Rules] ([RuleID], [ParentRuleID], [RuleName], [Description], [OrderID], [Score], [NodeType], [IsDelete], [BranchId]) VALUES ('F40201', 'F4', '院级学生组织副部级、校级学生组织委员（优秀）', NULL, 3, '15', 'leaf', 0, NULL)
INSERT [Rules] ([RuleID], [ParentRuleID], [RuleName], [Description], [OrderID], [Score], [NodeType], [IsDelete], [BranchId]) VALUES ('F40202', 'F4', '院级学生组织副部级、校级学生组织委员（及格）', NULL, 4, '9', 'leaf', 0, NULL)
INSERT [Rules] ([RuleID], [ParentRuleID], [RuleName], [Description], [OrderID], [Score], [NodeType], [IsDelete], [BranchId]) VALUES ('F40301', 'F4', '班长、团支部书记、院级学生组织部级、校级学生组织副部级（优秀）', NULL, 5, '20', 'leaf', 0, NULL)
INSERT [Rules] ([RuleID], [ParentRuleID], [RuleName], [Description], [OrderID], [Score], [NodeType], [IsDelete], [BranchId]) VALUES ('F40302', 'F4', '班长、团支部书记、院级学生组织部级、校级学生组织副部级（及格秀）', NULL, 6, '12', 'leaf', 0, NULL)
INSERT [Rules] ([RuleID], [ParentRuleID], [RuleName], [Description], [OrderID], [Score], [NodeType], [IsDelete], [BranchId]) VALUES ('F40401', 'F4', '院级学生组织副主席、校级学生组织部级（优秀）', NULL, 7, '25', 'leaf', 0, NULL)
INSERT [Rules] ([RuleID], [ParentRuleID], [RuleName], [Description], [OrderID], [Score], [NodeType], [IsDelete], [BranchId]) VALUES ('F40402', 'F4', '院级学生组织副主席、校级学生组织部级（及格）', NULL, 8, '15', 'leaf', 0, NULL)
INSERT [Rules] ([RuleID], [ParentRuleID], [RuleName], [Description], [OrderID], [Score], [NodeType], [IsDelete], [BranchId]) VALUES ('F40501', 'F4', '校团委委员、院团委委员、院级组织委员、校级学生组织副主席和主席（优秀）', NULL, 9, '30', 'leaf', 0, NULL)
INSERT [Rules] ([RuleID], [ParentRuleID], [RuleName], [Description], [OrderID], [Score], [NodeType], [IsDelete], [BranchId]) VALUES ('F40502', 'F4', '校团委委员、院团委委员、院级组织委员、校级学生组织副主席和主席（及格）', NULL, 10, '18', 'leaf', 0, NULL)
INSERT [Rules] ([RuleID], [ParentRuleID], [RuleName], [Description], [OrderID], [Score], [NodeType], [IsDelete], [BranchId]) VALUES ('F5', 'F', '技能培训和其他', NULL, 5, NULL, 'branch', 0, NULL)
INSERT [Rules] ([RuleID], [ParentRuleID], [RuleName], [Description], [OrderID], [Score], [NodeType], [IsDelete], [BranchId]) VALUES ('F50101', 'F5', 'CET4成绩600分以上', NULL, 1, '10', 'leaf', 0, NULL)
INSERT [Rules] ([RuleID], [ParentRuleID], [RuleName], [Description], [OrderID], [Score], [NodeType], [IsDelete], [BranchId]) VALUES ('F50201', 'F5', 'CET6成绩535分以上', NULL, 2, '10', 'leaf', 0, NULL)
INSERT [Rules] ([RuleID], [ParentRuleID], [RuleName], [Description], [OrderID], [Score], [NodeType], [IsDelete], [BranchId]) VALUES ('F50202', 'F5', 'CET6成绩600分以上', NULL, 3, '20', 'leaf', 0, NULL)
INSERT [Rules] ([RuleID], [ParentRuleID], [RuleName], [Description], [OrderID], [Score], [NodeType], [IsDelete], [BranchId]) VALUES ('F50301', 'F5', '国家级非学术类文章', '各类公开媒体', 4, '50', 'leaf', 0, NULL)
INSERT [Rules] ([RuleID], [ParentRuleID], [RuleName], [Description], [OrderID], [Score], [NodeType], [IsDelete], [BranchId]) VALUES ('F50302', 'F5', '省级非学术类文章', '各类公开媒体', 5, '30', 'leaf', 0, NULL)
INSERT [Rules] ([RuleID], [ParentRuleID], [RuleName], [Description], [OrderID], [Score], [NodeType], [IsDelete], [BranchId]) VALUES ('F50303', 'F5', '市级非学术类文章', '各类公开媒体', 6, '20', 'leaf', 0, NULL)
INSERT [Rules] ([RuleID], [ParentRuleID], [RuleName], [Description], [OrderID], [Score], [NodeType], [IsDelete], [BranchId]) VALUES ('F50304', 'F5', '校级非学术类文章', '累计加分最高不超过20分', 7, '2', 'leaf', 0, NULL)
INSERT [Rules] ([RuleID], [ParentRuleID], [RuleName], [Description], [OrderID], [Score], [NodeType], [IsDelete], [BranchId]) VALUES ('F50305', 'F5', '院级非学术类文章', '累计加分最高不超过20分', 8, '0.5', 'leaf', 0, NULL)
INSERT [Rules] ([RuleID], [ParentRuleID], [RuleName], [Description], [OrderID], [Score], [NodeType], [IsDelete], [BranchId]) VALUES ('F6', 'F', '其他加分', '见义勇为、拾金不昧等等；最高50分', 6, NULL, 'branch', 0, NULL)
INSERT [Rules] ([RuleID], [ParentRuleID], [RuleName], [Description], [OrderID], [Score], [NodeType], [IsDelete], [BranchId]) VALUES ('F20102', 'F2', '其他社会实践活动', NULL, 2, '1', 'leaf', 0, NULL)
INSERT [Rules] ([RuleID], [ParentRuleID], [RuleName], [Description], [OrderID], [Score], [NodeType], [IsDelete], [BranchId]) VALUES ('F20103', 'F2', '青年志愿者活动', NULL, 3, '1', 'leaf', 0, NULL)
INSERT [Rules] ([RuleID], [ParentRuleID], [RuleName], [Description], [OrderID], [Score], [NodeType], [IsDelete], [BranchId]) VALUES ('Test', 'M', '大创项目', '大创项目测试', 212, '5', 'branch', 0, NULL)
INSERT [Rules] ([RuleID], [ParentRuleID], [RuleName], [Description], [OrderID], [Score], [NodeType], [IsDelete], [BranchId]) VALUES ('F1010101', 'F101', '院级一等奖', NULL, 1, '5', 'leaf', 0, NULL)
INSERT [Rules] ([RuleID], [ParentRuleID], [RuleName], [Description], [OrderID], [Score], [NodeType], [IsDelete], [BranchId]) VALUES ('F1010102', 'F101', '院级二等奖', NULL, 2, '4', 'leaf', 0, NULL)
INSERT [Rules] ([RuleID], [ParentRuleID], [RuleName], [Description], [OrderID], [Score], [NodeType], [IsDelete], [BranchId]) VALUES ('F1010103', 'F101', '院级三等奖', NULL, 3, '3', 'leaf', 0, NULL)
INSERT [Rules] ([RuleID], [ParentRuleID], [RuleName], [Description], [OrderID], [Score], [NodeType], [IsDelete], [BranchId]) VALUES ('F1010104', 'F101', '院级优秀奖', NULL, 4, '2', 'leaf', 0, NULL)
INSERT [Rules] ([RuleID], [ParentRuleID], [RuleName], [Description], [OrderID], [Score], [NodeType], [IsDelete], [BranchId]) VALUES ('F1010201', 'F101', '校、市级一等奖', NULL, 5, '10', 'leaf', 0, NULL)
INSERT [Rules] ([RuleID], [ParentRuleID], [RuleName], [Description], [OrderID], [Score], [NodeType], [IsDelete], [BranchId]) VALUES ('F1010202', 'F101', '校、市级二等奖', NULL, 6, '8', 'leaf', 0, NULL)
INSERT [Rules] ([RuleID], [ParentRuleID], [RuleName], [Description], [OrderID], [Score], [NodeType], [IsDelete], [BranchId]) VALUES ('F1010203', 'F101', '校、市级三等奖', NULL, 7, '6', 'leaf', 0, NULL)
INSERT [Rules] ([RuleID], [ParentRuleID], [RuleName], [Description], [OrderID], [Score], [NodeType], [IsDelete], [BranchId]) VALUES ('F1010204', 'F101', '校、市级优秀奖', NULL, 8, '4', 'leaf', 0, NULL)
INSERT [Rules] ([RuleID], [ParentRuleID], [RuleName], [Description], [OrderID], [Score], [NodeType], [IsDelete], [BranchId]) VALUES ('F1010301', 'F101', '省级一等奖', NULL, 9, '30', 'leaf', 0, NULL)
INSERT [Rules] ([RuleID], [ParentRuleID], [RuleName], [Description], [OrderID], [Score], [NodeType], [IsDelete], [BranchId]) VALUES ('F1010302', 'F101', '省级二等奖', NULL, 10, '20', 'leaf', 0, NULL)
INSERT [Rules] ([RuleID], [ParentRuleID], [RuleName], [Description], [OrderID], [Score], [NodeType], [IsDelete], [BranchId]) VALUES ('F1010303', 'F101', '省级三等奖', NULL, 11, '15', 'leaf', 0, NULL)
INSERT [Rules] ([RuleID], [ParentRuleID], [RuleName], [Description], [OrderID], [Score], [NodeType], [IsDelete], [BranchId]) VALUES ('F1010304', 'F101', '省级优秀奖', NULL, 12, '10', 'leaf', 0, NULL)
INSERT [Rules] ([RuleID], [ParentRuleID], [RuleName], [Description], [OrderID], [Score], [NodeType], [IsDelete], [BranchId]) VALUES ('F1010401', 'F101', '国家级一等奖', NULL, 13, '50', 'leaf', 0, NULL)
INSERT [Rules] ([RuleID], [ParentRuleID], [RuleName], [Description], [OrderID], [Score], [NodeType], [IsDelete], [BranchId]) VALUES ('F1010402', 'F101', '国家级二等奖', NULL, 14, '40', 'leaf', 0, NULL)
INSERT [Rules] ([RuleID], [ParentRuleID], [RuleName], [Description], [OrderID], [Score], [NodeType], [IsDelete], [BranchId]) VALUES ('F1010403', 'F101', '国家级三等奖', NULL, 15, '30', 'leaf', 0, NULL)
INSERT [Rules] ([RuleID], [ParentRuleID], [RuleName], [Description], [OrderID], [Score], [NodeType], [IsDelete], [BranchId]) VALUES ('F1010404', 'F101', '国家级优秀奖', NULL, 16, '20', 'leaf', 0, NULL)
INSERT [Rules] ([RuleID], [ParentRuleID], [RuleName], [Description], [OrderID], [Score], [NodeType], [IsDelete], [BranchId]) VALUES ('F102', 'F1', '学术论文加分', NULL, 2, NULL, 'branch', 0, NULL)
INSERT [Rules] ([RuleID], [ParentRuleID], [RuleName], [Description], [OrderID], [Score], [NodeType], [IsDelete], [BranchId]) VALUES ('F1020101', 'F102', '省级一般性期刊第一作者', NULL, 1, '30', 'leaf', 0, NULL)
INSERT [Rules] ([RuleID], [ParentRuleID], [RuleName], [Description], [OrderID], [Score], [NodeType], [IsDelete], [BranchId]) VALUES ('F1020102', 'F102', '省级一般性期刊第二、三作者', NULL, 2, '15', 'leaf', 0, NULL)
INSERT [Rules] ([RuleID], [ParentRuleID], [RuleName], [Description], [OrderID], [Score], [NodeType], [IsDelete], [BranchId]) VALUES ('F1020201', 'F102', '国家级一般性期刊第一作者', NULL, 3, '50', 'leaf', 0, NULL)
INSERT [Rules] ([RuleID], [ParentRuleID], [RuleName], [Description], [OrderID], [Score], [NodeType], [IsDelete], [BranchId]) VALUES ('F1020202', 'F102', '国家级一般性期刊第二、三作者', NULL, 4, '25', 'leaf', 0, NULL)
INSERT [Rules] ([RuleID], [ParentRuleID], [RuleName], [Description], [OrderID], [Score], [NodeType], [IsDelete], [BranchId]) VALUES ('F1020301', 'F102', 'SCI一区期刊第一作者', NULL, 5, '110', 'leaf', 0, NULL)
INSERT [Rules] ([RuleID], [ParentRuleID], [RuleName], [Description], [OrderID], [Score], [NodeType], [IsDelete], [BranchId]) VALUES ('F1020302', 'F102', 'SCI一区期刊第二、三作者', NULL, 6, '55', 'leaf', 0, NULL)
INSERT [Rules] ([RuleID], [ParentRuleID], [RuleName], [Description], [OrderID], [Score], [NodeType], [IsDelete], [BranchId]) VALUES ('F1020401', 'F102', 'SCI二区期刊第一作者', NULL, 7, '90', 'leaf', 0, NULL)
INSERT [Rules] ([RuleID], [ParentRuleID], [RuleName], [Description], [OrderID], [Score], [NodeType], [IsDelete], [BranchId]) VALUES ('F1020402', 'F102', 'SCI二区期刊第二、三作者', NULL, 8, '45', 'leaf', 0, NULL)
INSERT [Rules] ([RuleID], [ParentRuleID], [RuleName], [Description], [OrderID], [Score], [NodeType], [IsDelete], [BranchId]) VALUES ('F1020501', 'F102', 'SCI三区期刊第一作者', NULL, 9, '70', 'leaf', 0, NULL)
INSERT [Rules] ([RuleID], [ParentRuleID], [RuleName], [Description], [OrderID], [Score], [NodeType], [IsDelete], [BranchId]) VALUES ('F1020502', 'F102', 'SCI三区期刊第二、三作者', NULL, 10, '35', 'leaf', 0, NULL)
INSERT [Rules] ([RuleID], [ParentRuleID], [RuleName], [Description], [OrderID], [Score], [NodeType], [IsDelete], [BranchId]) VALUES ('F1020601', 'F102', 'SCI四区、SSCI、A&HCI(期刊）、EI(期刊)第一作者', NULL, 11, '60', 'leaf', 0, NULL)
INSERT [Rules] ([RuleID], [ParentRuleID], [RuleName], [Description], [OrderID], [Score], [NodeType], [IsDelete], [BranchId]) VALUES ('F1020602', 'F102', 'SCI四区、SSCI、A&HCI(期刊）、EI(期刊)第二、三作者', NULL, 12, '30', 'leaf', 0, NULL)
INSERT [Rules] ([RuleID], [ParentRuleID], [RuleName], [Description], [OrderID], [Score], [NodeType], [IsDelete], [BranchId]) VALUES ('F103', 'F1', '科研成果(科研课题)加分', '学科竞赛的加分标准*2，具体由学校科研处和学生工作处认定', 3, NULL, 'branch', 0, NULL)
INSERT [Rules] ([RuleID], [ParentRuleID], [RuleName], [Description], [OrderID], [Score], [NodeType], [IsDelete], [BranchId]) VALUES ('F104', 'F1', '知识产权', NULL, 4, NULL, 'branch', 0, NULL)
INSERT [Rules] ([RuleID], [ParentRuleID], [RuleName], [Description], [OrderID], [Score], [NodeType], [IsDelete], [BranchId]) VALUES ('F1050101', 'F105', '【大创项目】校级项目负责人或成员', NULL, 1, '8', 'leaf', 0, NULL)
INSERT [Rules] ([RuleID], [ParentRuleID], [RuleName], [Description], [OrderID], [Score], [NodeType], [IsDelete], [BranchId]) VALUES ('F1050201', 'F105', '【大创项目】省级项目负责人', NULL, 2, '30', 'leaf', 0, NULL)
INSERT [Rules] ([RuleID], [ParentRuleID], [RuleName], [Description], [OrderID], [Score], [NodeType], [IsDelete], [BranchId]) VALUES ('F1050301', 'F105', '【大创项目】国家级项目负责人', NULL, 3, '50', 'leaf', 0, NULL)
INSERT [Rules] ([RuleID], [ParentRuleID], [RuleName], [Description], [OrderID], [Score], [NodeType], [IsDelete], [BranchId]) VALUES ('F2', 'F', '社会实践加分', NULL, 2, NULL, 'branch', 0, NULL)
INSERT [Rules] ([RuleID], [ParentRuleID], [RuleName], [Description], [OrderID], [Score], [NodeType], [IsDelete], [BranchId]) VALUES ('F20101', 'F2', '积极参加社会实践活动', NULL, 1, '5', 'leaf', 0, NULL)
INSERT [Rules] ([RuleID], [ParentRuleID], [RuleName], [Description], [OrderID], [Score], [NodeType], [IsDelete], [BranchId]) VALUES ('F20201', 'F2', '院级社会实践先进个人', NULL, 2, '10', 'leaf', 0, NULL)
INSERT [Rules] ([RuleID], [ParentRuleID], [RuleName], [Description], [OrderID], [Score], [NodeType], [IsDelete], [BranchId]) VALUES ('F20202', 'F2', '市（校）级社会实践先进个人', NULL, 3, '15', 'leaf', 0, NULL)
INSERT [Rules] ([RuleID], [ParentRuleID], [RuleName], [Description], [OrderID], [Score], [NodeType], [IsDelete], [BranchId]) VALUES ('F20203', 'F2', '省级社会实践先进个人', NULL, 4, '30', 'leaf', 0, NULL)
INSERT [Rules] ([RuleID], [ParentRuleID], [RuleName], [Description], [OrderID], [Score], [NodeType], [IsDelete], [BranchId]) VALUES ('F20301', 'F2', '院级社会实践先进集体', NULL, 5, '8', 'leaf', 0, NULL)
INSERT [Rules] ([RuleID], [ParentRuleID], [RuleName], [Description], [OrderID], [Score], [NodeType], [IsDelete], [BranchId]) VALUES ('F20302', 'F2', '市（校）级社会实践先进集体', NULL, 6, '10', 'leaf', 0, NULL)
INSERT [Rules] ([RuleID], [ParentRuleID], [RuleName], [Description], [OrderID], [Score], [NodeType], [IsDelete], [BranchId]) VALUES ('F20303', 'F2', '省级社会实践先进集体', NULL, 7, '20', 'leaf', 0, NULL)
INSERT [Rules] ([RuleID], [ParentRuleID], [RuleName], [Description], [OrderID], [Score], [NodeType], [IsDelete], [BranchId]) VALUES ('F3', 'F', '文体艺术类竞赛活动加分', NULL, 3, NULL, 'branch', 0, NULL)
INSERT [Rules] ([RuleID], [ParentRuleID], [RuleName], [Description], [OrderID], [Score], [NodeType], [IsDelete], [BranchId]) VALUES ('F30101', 'F3', '院级一等奖', NULL, 1, '3', 'leaf', 0, NULL)
INSERT [Rules] ([RuleID], [ParentRuleID], [RuleName], [Description], [OrderID], [Score], [NodeType], [IsDelete], [BranchId]) VALUES ('F30102', 'F3', '院级二等奖', NULL, 2, '2', 'leaf', 0, NULL)
INSERT [Rules] ([RuleID], [ParentRuleID], [RuleName], [Description], [OrderID], [Score], [NodeType], [IsDelete], [BranchId]) VALUES ('F30103', 'F3', '院级三等奖', NULL, 3, '1', 'leaf', 0, NULL)
INSERT [Rules] ([RuleID], [ParentRuleID], [RuleName], [Description], [OrderID], [Score], [NodeType], [IsDelete], [BranchId]) VALUES ('F30104', 'F3', '院级优秀奖', NULL, 4, '0.5', 'leaf', 0, NULL)
INSERT [Rules] ([RuleID], [ParentRuleID], [RuleName], [Description], [OrderID], [Score], [NodeType], [IsDelete], [BranchId]) VALUES ('F30201', 'F3', '校、市级一等奖', NULL, 5, '8', 'leaf', 0, NULL)
INSERT [Rules] ([RuleID], [ParentRuleID], [RuleName], [Description], [OrderID], [Score], [NodeType], [IsDelete], [BranchId]) VALUES ('F30202', 'F3', '校、市级二等奖', NULL, 6, '6', 'leaf', 0, NULL)
INSERT [Rules] ([RuleID], [ParentRuleID], [RuleName], [Description], [OrderID], [Score], [NodeType], [IsDelete], [BranchId]) VALUES ('F30203', 'F3', '校、市级三等奖', NULL, 7, '4', 'leaf', 0, NULL)
INSERT [Rules] ([RuleID], [ParentRuleID], [RuleName], [Description], [OrderID], [Score], [NodeType], [IsDelete], [BranchId]) VALUES ('F30204', 'F3', '校、市级优秀奖', NULL, 8, '2', 'leaf', 0, NULL)
INSERT [Rules] ([RuleID], [ParentRuleID], [RuleName], [Description], [OrderID], [Score], [NodeType], [IsDelete], [BranchId]) VALUES ('F30301', 'F3', '省级一等奖', NULL, 9, '30', 'leaf', 0, NULL)
INSERT [Rules] ([RuleID], [ParentRuleID], [RuleName], [Description], [OrderID], [Score], [NodeType], [IsDelete], [BranchId]) VALUES ('F30302', 'F3', '省级二等奖', NULL, 10, '20', 'leaf', 0, NULL)
INSERT [Rules] ([RuleID], [ParentRuleID], [RuleName], [Description], [OrderID], [Score], [NodeType], [IsDelete], [BranchId]) VALUES ('F30303', 'F3', '省级三等奖', NULL, 11, '15', 'leaf', 0, NULL)
INSERT [Rules] ([RuleID], [ParentRuleID], [RuleName], [Description], [OrderID], [Score], [NodeType], [IsDelete], [BranchId]) VALUES ('F30304', 'F3', '省级优秀奖', NULL, 12, '10', 'leaf', 0, NULL)
/* Data for table SemesterStatus */
INSERT [SemesterStatus] ([Semester], [SStatus], [IsCalculateScore]) VALUES ('2018-2019学年春季学期', 0, 0)
INSERT [SemesterStatus] ([Semester], [SStatus], [IsCalculateScore]) VALUES ('2018-2019学年秋季学期', 1, 1)
INSERT [SemesterStatus] ([Semester], [SStatus], [IsCalculateScore]) VALUES ('2019-2020学年春季学期', 0, 0)
INSERT [SemesterStatus] ([Semester], [SStatus], [IsCalculateScore]) VALUES ('2019-2020学年秋季学期', 0, 0)
INSERT [SemesterStatus] ([Semester], [SStatus], [IsCalculateScore]) VALUES ('2020-2021学年春季学期', 0, 0)
INSERT [SemesterStatus] ([Semester], [SStatus], [IsCalculateScore]) VALUES ('2020-2021学年秋季学期', 0, 0)
/* Data for table SocialPratice */
/* Data for table SocialWorkProject */
/* Data for table Student */
/* Data for table StudentsAchievements */
/* Data for table SystemSetup */
/* Data for table Tags */
/* Data for table Thesis */
/* Data for table Users */
INSERT [Users] ([UserId], [UserNum], [Name], [Email], [IDCard], [Mobile], [Tel], [Password], [PasswordSalt], [PasswordFormat], [IsLockOut], [IsAvailable], [DeleteMark], [LastLogonTime], [UserCreateTime]) VALUES ('F07680E4-DAE0-4396-BBA2-104F78FA0BA3', '0914', '吕震宇', '1196531291@qq.com', NULL, '15032506306', '15032506306', '0914', NULL, NULL, 0, 1, 0, NULL, '2018/10/3 11:39:14')
/* Data for table UsersInRoles */
SET identity_insert [UsersInRoles] on

INSERT [UsersInRoles] ([Id], [UserId], [RoleId]) VALUES (1, 'F07680E4-DAE0-4396-BBA2-104F78FA0BA3', '6E902DE1-8934-4695-AB7A-4EDF99B71543')
INSERT [UsersInRoles] ([Id], [UserId], [RoleId]) VALUES (154, 'F07680E4-DAE0-4396-BBA2-104F78FA0BA3', '54589C8B-7687-4DE0-8B01-8F287047246D')
SET identity_insert [UsersInRoles] off
GO
/****** 对象: 表 [dbo].[Achievement]    脚本日期: 2019/4/28 20:43:52 ******/
ALTER TABLE [Achievement] WITH NOCHECK ADD 
	CONSTRAINT [PK_ACHIEVEMENT] PRIMARY KEY  NONCLUSTERED 
	(
		[AchievementID]
	)  ON [PRIMARY] 
GO


/****** 对象: 表 [dbo].[AchievementTypeMapper]    脚本日期: 2019/4/28 20:43:52 ******/
ALTER TABLE [AchievementTypeMapper] WITH NOCHECK ADD 
	CONSTRAINT [PK_AchievementTypeMapper] PRIMARY KEY  CLUSTERED 
	(
		[AchievementType]
	)  ON [PRIMARY] 
GO


/****** 对象: 表 [dbo].[Applications]    脚本日期: 2019/4/28 20:43:52 ******/
ALTER TABLE [Applications] WITH NOCHECK ADD 
	CONSTRAINT [PK_APPLICATIONS] PRIMARY KEY  NONCLUSTERED 
	(
		[ApplicationID]
	)  ON [PRIMARY] 
GO


/****** 对象: 表 [dbo].[Attachment]    脚本日期: 2019/4/28 20:43:52 ******/
ALTER TABLE [Attachment] WITH NOCHECK ADD 
	CONSTRAINT [PK_Attachment] PRIMARY KEY  CLUSTERED 
	(
		[AttachmentID]
	)  ON [PRIMARY] 
GO


/****** 对象: 表 [dbo].[BasisScore]    脚本日期: 2019/4/28 20:43:53 ******/
ALTER TABLE [BasisScore] WITH NOCHECK ADD 
	CONSTRAINT [PK_BasisScore] PRIMARY KEY  CLUSTERED 
	(
		[BasicID]
	)  ON [PRIMARY] 
GO


/****** 对象: 表 [dbo].[Branches]    脚本日期: 2019/4/28 20:43:53 ******/
ALTER TABLE [Branches] WITH NOCHECK ADD 
	CONSTRAINT [DF__Branches__Delete__44952D46] DEFAULT ((0)) FOR [DeleteMark],
	CONSTRAINT [PK_BRANCHES] PRIMARY KEY  NONCLUSTERED 
	(
		[BranchId]
	)  ON [PRIMARY] 
GO


/****** 对象: 表 [dbo].[BranchesTags]    脚本日期: 2019/4/28 20:43:53 ******/
ALTER TABLE [BranchesTags] WITH NOCHECK ADD 
	CONSTRAINT [PK_BRANCHESTAGS] PRIMARY KEY  NONCLUSTERED 
	(
		[TagID],
		[BranchId]
	)  ON [PRIMARY] 
GO


/****** 对象: 表 [dbo].[BranchUsers]    脚本日期: 2019/4/28 20:43:53 ******/
ALTER TABLE [BranchUsers] WITH NOCHECK ADD 
	CONSTRAINT [PK_BRANCHUSERS] PRIMARY KEY  NONCLUSTERED 
	(
		[UserId],
		[BranchId]
	)  ON [PRIMARY] 
GO


/****** 对象: 表 [dbo].[Certificate]    脚本日期: 2019/4/28 20:43:53 ******/
ALTER TABLE [Certificate] WITH NOCHECK ADD 
	CONSTRAINT [PK_CERTIFICATE] PRIMARY KEY  NONCLUSTERED 
	(
		[AchievementID]
	)  ON [PRIMARY] 
GO


/****** 对象: 表 [dbo].[Competition]    脚本日期: 2019/4/28 20:43:53 ******/
ALTER TABLE [Competition] WITH NOCHECK ADD 
	CONSTRAINT [PK_COMPETITION] PRIMARY KEY  NONCLUSTERED 
	(
		[AchievementID]
	)  ON [PRIMARY] 
GO


/****** 对象: 表 [dbo].[CompositveScore]    脚本日期: 2019/4/28 20:43:53 ******/
ALTER TABLE [CompositveScore] WITH NOCHECK ADD 
	CONSTRAINT [PK_CompositveScore] PRIMARY KEY  CLUSTERED 
	(
		[id]
	)  ON [PRIMARY] 
GO


/****** 对象: 表 [dbo].[Copyright]    脚本日期: 2019/4/28 20:43:53 ******/
ALTER TABLE [Copyright] WITH NOCHECK ADD 
	CONSTRAINT [PK_COPYRIGHT] PRIMARY KEY  NONCLUSTERED 
	(
		[AchievementID]
	)  ON [PRIMARY] 
GO


/****** 对象: 表 [dbo].[DownloadResource]    脚本日期: 2019/4/28 20:43:53 ******/
ALTER TABLE [DownloadResource] WITH NOCHECK ADD 
	CONSTRAINT [DF_DownloadResource_ForTeacher] DEFAULT ((1)) FOR [ForTeacher],
	CONSTRAINT [DF_DownloadResource_ForStudent] DEFAULT ((1)) FOR [ForStudent],
	CONSTRAINT [PK_DownloadResource] PRIMARY KEY  CLUSTERED 
	(
		[ResourceID]
	)  ON [PRIMARY] 
GO


/****** 对象: 表 [dbo].[Information]    脚本日期: 2019/4/28 20:43:53 ******/
ALTER TABLE [Information] WITH NOCHECK ADD 
	CONSTRAINT [DF_Information_ForTeacher] DEFAULT ((1)) FOR [ForTeacher],
	CONSTRAINT [DF_Information_ForStudent] DEFAULT ((1)) FOR [ForStudent],
	CONSTRAINT [PK_Information] PRIMARY KEY  CLUSTERED 
	(
		[InformationID]
	)  ON [PRIMARY] 
GO


/****** 对象: 表 [dbo].[InnovativeProject]    脚本日期: 2019/4/28 20:43:53 ******/
ALTER TABLE [InnovativeProject] WITH NOCHECK ADD 
	CONSTRAINT [PK_INNOVATIVEPROJECT] PRIMARY KEY  NONCLUSTERED 
	(
		[AchievementID]
	)  ON [PRIMARY] 
GO


/****** 对象: 表 [dbo].[Others]    脚本日期: 2019/4/28 20:43:53 ******/
ALTER TABLE [Others] WITH NOCHECK ADD 
	CONSTRAINT [PK_OTHERS] PRIMARY KEY  CLUSTERED 
	(
		[AchievementID]
	)  ON [PRIMARY] 
GO


/****** 对象: 表 [dbo].[Patent]    脚本日期: 2019/4/28 20:43:53 ******/
ALTER TABLE [Patent] WITH NOCHECK ADD 
	CONSTRAINT [PK_PATENT] PRIMARY KEY  NONCLUSTERED 
	(
		[AchievementID]
	)  ON [PRIMARY] 
GO


/****** 对象: 表 [dbo].[RecreationSport]    脚本日期: 2019/4/28 20:43:53 ******/
ALTER TABLE [RecreationSport] WITH NOCHECK ADD 
	CONSTRAINT [PK_RECREATIONSPORT] PRIMARY KEY  CLUSTERED 
	(
		[AchievementID]
	)  ON [PRIMARY] 
GO


/****** 对象: 表 [dbo].[ResearchProject]    脚本日期: 2019/4/28 20:43:53 ******/
ALTER TABLE [ResearchProject] WITH NOCHECK ADD 
	CONSTRAINT [PK_RESEARCHPROJECT] PRIMARY KEY  NONCLUSTERED 
	(
		[AchievementID]
	)  ON [PRIMARY] 
GO


/****** 对象: 表 [dbo].[Roles]    脚本日期: 2019/4/28 20:43:53 ******/
ALTER TABLE [Roles] WITH NOCHECK ADD 
	CONSTRAINT [PK_ROLES] PRIMARY KEY  NONCLUSTERED 
	(
		[RoleId]
	)  ON [PRIMARY] 
GO


/****** 对象: 表 [dbo].[Rules]    脚本日期: 2019/4/28 20:43:53 ******/
ALTER TABLE [Rules] WITH NOCHECK ADD 
	CONSTRAINT [PK_RULES] PRIMARY KEY  NONCLUSTERED 
	(
		[RuleID]
	)  ON [PRIMARY] 
GO


/****** 对象: 表 [dbo].[SemesterStatus]    脚本日期: 2019/4/28 20:43:54 ******/
ALTER TABLE [SemesterStatus] WITH NOCHECK ADD 
	CONSTRAINT [PK_SemesterStatus_1] PRIMARY KEY  CLUSTERED 
	(
		[Semester]
	)  ON [PRIMARY] 
GO


/****** 对象: 表 [dbo].[SocialPratice]    脚本日期: 2019/4/28 20:43:54 ******/
ALTER TABLE [SocialPratice] WITH NOCHECK ADD 
	CONSTRAINT [PK_SocialPratice] PRIMARY KEY  CLUSTERED 
	(
		[AchievementID]
	)  ON [PRIMARY] 
GO


/****** 对象: 表 [dbo].[SocialWorkProject]    脚本日期: 2019/4/28 20:43:54 ******/
ALTER TABLE [SocialWorkProject] WITH NOCHECK ADD 
	CONSTRAINT [PK_SOCIALWORKPROJECT] PRIMARY KEY  CLUSTERED 
	(
		[AchievementID]
	)  ON [PRIMARY] 
GO


/****** 对象: 表 [dbo].[Student]    脚本日期: 2019/4/28 20:43:54 ******/
ALTER TABLE [Student] WITH NOCHECK ADD 
	CONSTRAINT [PK_STUDENT] PRIMARY KEY  NONCLUSTERED 
	(
		[Sno]
	)  ON [PRIMARY] 
GO


/****** 对象: 表 [dbo].[StudentsAchievements]    脚本日期: 2019/4/28 20:43:54 ******/
ALTER TABLE [StudentsAchievements] WITH NOCHECK ADD 
	CONSTRAINT [PK_STUDENTSACHIEVEMENTS] PRIMARY KEY  NONCLUSTERED 
	(
		[AchievementID]
	)  ON [PRIMARY] 
GO


/****** 对象: 表 [dbo].[SystemSetup]    脚本日期: 2019/4/28 20:43:54 ******/
ALTER TABLE [SystemSetup] WITH NOCHECK ADD 
	CONSTRAINT [PK_SYSTEMSETUP] PRIMARY KEY  NONCLUSTERED 
	(
		[ID]
	)  ON [PRIMARY] 
GO


/****** 对象: 表 [dbo].[Tags]    脚本日期: 2019/4/28 20:43:54 ******/
ALTER TABLE [Tags] WITH NOCHECK ADD 
	CONSTRAINT [PK_TAGS] PRIMARY KEY  NONCLUSTERED 
	(
		[TagID]
	)  ON [PRIMARY] 
GO


/****** 对象: 表 [dbo].[Thesis]    脚本日期: 2019/4/28 20:43:54 ******/
ALTER TABLE [Thesis] WITH NOCHECK ADD 
	CONSTRAINT [PK_THESIS] PRIMARY KEY  NONCLUSTERED 
	(
		[AchievementID]
	)  ON [PRIMARY] 
GO


/****** 对象: 表 [dbo].[Users]    脚本日期: 2019/4/28 20:43:54 ******/
ALTER TABLE [Users] WITH NOCHECK ADD 
	CONSTRAINT [DF__Users__IsLockOut__4589517F] DEFAULT ((0)) FOR [IsLockOut],
	CONSTRAINT [DF__Users__IsAvailab__467D75B8] DEFAULT ((0)) FOR [IsAvailable],
	CONSTRAINT [DF__Users__DeleteMar__477199F1] DEFAULT ((0)) FOR [DeleteMark],
	CONSTRAINT [PK_USERS] PRIMARY KEY  NONCLUSTERED 
	(
		[UserId]
	)  ON [PRIMARY] 
GO


/****** 对象: 表 [dbo].[UsersInRoles]    脚本日期: 2019/4/28 20:43:54 ******/
ALTER TABLE [UsersInRoles] WITH NOCHECK ADD 
	CONSTRAINT [PK_USERSINROLES] PRIMARY KEY  NONCLUSTERED 
	(
		[Id]
	)  ON [PRIMARY] 
GO





/****** 对象: 表 [dbo].[Attachment]    脚本日期: 2019/4/28 20:43:54 ******/
ALTER TABLE [Attachment] ADD 
	CONSTRAINT [FK_ATTACHME_ACHIEVEME_ACHIEVEM] FOREIGN KEY 
	(
		[AchievementID]
	) REFERENCES [Achievement] (
		[AchievementID]
	)
GO


/****** 对象: 表 [dbo].[BasisScore]    脚本日期: 2019/4/28 20:43:54 ******/
ALTER TABLE [BasisScore] ADD 
	CONSTRAINT [FK_BASISSCO_BASISSCOR_STUDENT] FOREIGN KEY 
	(
		[Sno]
	) REFERENCES [Student] (
		[Sno]
	)
GO


/****** 对象: 表 [dbo].[Branches]    脚本日期: 2019/4/28 20:43:55 ******/
ALTER TABLE [Branches] ADD 
	CONSTRAINT [FK_BRANCHES_BRANCH_PA_BRANCHES] FOREIGN KEY 
	(
		[ParentBranchId]
	) REFERENCES [Branches] (
		[BranchId]
	)
GO


/****** 对象: 表 [dbo].[BranchesTags]    脚本日期: 2019/4/28 20:43:55 ******/
ALTER TABLE [BranchesTags] ADD 
	CONSTRAINT [FK_BRANCHES_BRANCHES__BRANCHES] FOREIGN KEY 
	(
		[BranchId]
	) REFERENCES [Branches] (
		[BranchId]
	),
	CONSTRAINT [FK_BRANCHES_BRANCHEST_TAGS] FOREIGN KEY 
	(
		[TagID]
	) REFERENCES [Tags] (
		[TagID]
	)
GO


/****** 对象: 表 [dbo].[BranchUsers]    脚本日期: 2019/4/28 20:43:55 ******/
ALTER TABLE [BranchUsers] ADD 
	CONSTRAINT [FK_BRANCHUS_BRANCH_US_BRANCHES] FOREIGN KEY 
	(
		[BranchId]
	) REFERENCES [Branches] (
		[BranchId]
	),
	CONSTRAINT [FK_BRANCHUS_USERS_BRA_USERS] FOREIGN KEY 
	(
		[UserId]
	) REFERENCES [Users] (
		[UserId]
	)
GO


/****** 对象: 表 [dbo].[Certificate]    脚本日期: 2019/4/28 20:43:55 ******/
ALTER TABLE [Certificate] ADD 
	CONSTRAINT [FK_CERTIFIC_INHERITAN_ACHIEVEM] FOREIGN KEY 
	(
		[AchievementID]
	) REFERENCES [Achievement] (
		[AchievementID]
	)
GO


/****** 对象: 表 [dbo].[Competition]    脚本日期: 2019/4/28 20:43:55 ******/
ALTER TABLE [Competition] ADD 
	CONSTRAINT [FK_COMPETIT_INHERITAN_ACHIEVEM] FOREIGN KEY 
	(
		[AchievementID]
	) REFERENCES [Achievement] (
		[AchievementID]
	)
GO



/****** 对象: 表 [dbo].[Copyright]    脚本日期: 2019/4/28 20:43:55 ******/
ALTER TABLE [Copyright] ADD 
	CONSTRAINT [FK_COPYRIGH_INHERITAN_ACHIEVEM] FOREIGN KEY 
	(
		[AchievementID]
	) REFERENCES [Achievement] (
		[AchievementID]
	)
GO




/****** 对象: 表 [dbo].[InnovativeProject]    脚本日期: 2019/4/28 20:43:55 ******/
ALTER TABLE [InnovativeProject] ADD 
	CONSTRAINT [FK_INNOVATI_INHERITAN_ACHIEVEM] FOREIGN KEY 
	(
		[AchievementID]
	) REFERENCES [Achievement] (
		[AchievementID]
	)
GO


/****** 对象: 表 [dbo].[Others]    脚本日期: 2019/4/28 20:43:55 ******/
ALTER TABLE [Others] ADD 
	CONSTRAINT [FK_OTHERS_INHERITAN_ACHIEVEM] FOREIGN KEY 
	(
		[AchievementID]
	) REFERENCES [Achievement] (
		[AchievementID]
	)
GO


/****** 对象: 表 [dbo].[Patent]    脚本日期: 2019/4/28 20:43:55 ******/
ALTER TABLE [Patent] ADD 
	CONSTRAINT [FK_PATENT_INHERITAN_ACHIEVEM] FOREIGN KEY 
	(
		[AchievementID]
	) REFERENCES [Achievement] (
		[AchievementID]
	)
GO


/****** 对象: 表 [dbo].[RecreationSport]    脚本日期: 2019/4/28 20:43:55 ******/
ALTER TABLE [RecreationSport] ADD 
	CONSTRAINT [FK_RECREATI_INHERITAN_ACHIEVEM] FOREIGN KEY 
	(
		[AchievementID]
	) REFERENCES [Achievement] (
		[AchievementID]
	)
GO


/****** 对象: 表 [dbo].[ResearchProject]    脚本日期: 2019/4/28 20:43:55 ******/
ALTER TABLE [ResearchProject] ADD 
	CONSTRAINT [FK_RESEARCH_INHERITAN_ACHIEVEM] FOREIGN KEY 
	(
		[AchievementID]
	) REFERENCES [Achievement] (
		[AchievementID]
	)
GO


/****** 对象: 表 [dbo].[Roles]    脚本日期: 2019/4/28 20:43:55 ******/
ALTER TABLE [Roles] ADD 
	CONSTRAINT [FK_ROLES_APPLICATI_APPLICAT] FOREIGN KEY 
	(
		[ApplicationID]
	) REFERENCES [Applications] (
		[ApplicationID]
	)
GO


/****** 对象: 表 [dbo].[Rules]    脚本日期: 2019/4/28 20:43:55 ******/
ALTER TABLE [Rules] ADD 
	CONSTRAINT [FK_RULES_RULE_SUBR_RULES] FOREIGN KEY 
	(
		[ParentRuleID]
	) REFERENCES [Rules] (
		[RuleID]
	)
GO




/****** 对象: 表 [dbo].[SocialWorkProject]    脚本日期: 2019/4/28 20:43:55 ******/
ALTER TABLE [SocialWorkProject] ADD 
	CONSTRAINT [FK_SOCIALWO_INHERITAN_ACHIEVEM] FOREIGN KEY 
	(
		[AchievementID]
	) REFERENCES [Achievement] (
		[AchievementID]
	)
GO


/****** 对象: 表 [dbo].[Student]    脚本日期: 2019/4/28 20:43:55 ******/
ALTER TABLE [Student] ADD 
	CONSTRAINT [FK_STUDENT_BRANCHES__BRANCHES] FOREIGN KEY 
	(
		[BranchId]
	) REFERENCES [Branches] (
		[BranchId]
	),
	CONSTRAINT [FK_STUDENT_USERS_STU_USERS] FOREIGN KEY 
	(
		[UserId]
	) REFERENCES [Users] (
		[UserId]
	)
GO


/****** 对象: 表 [dbo].[StudentsAchievements]    脚本日期: 2019/4/28 20:43:55 ******/
ALTER TABLE [StudentsAchievements] ADD 
	CONSTRAINT [FK_STUDENTS_ACHIEVEME_ACHIEVEM] FOREIGN KEY 
	(
		[AchievementID]
	) REFERENCES [Achievement] (
		[AchievementID]
	),
	CONSTRAINT [FK_STUDENTS_STUDENT_A_STUDENT] FOREIGN KEY 
	(
		[Sno]
	) REFERENCES [Student] (
		[Sno]
	)
GO




/****** 对象: 表 [dbo].[Thesis]    脚本日期: 2019/4/28 20:43:55 ******/
ALTER TABLE [Thesis] ADD 
	CONSTRAINT [FK_THESIS_INHERITAN_ACHIEVEM] FOREIGN KEY 
	(
		[AchievementID]
	) REFERENCES [Achievement] (
		[AchievementID]
	)
GO



/****** 对象: 表 [dbo].[UsersInRoles]    脚本日期: 2019/4/28 20:43:55 ******/
ALTER TABLE [UsersInRoles] ADD 
	CONSTRAINT [FK_USERSINR_ROLES_USE_ROLES] FOREIGN KEY 
	(
		[RoleId]
	) REFERENCES [Roles] (
		[RoleId]
	),
	CONSTRAINT [FK_USERSINR_USERS_ROL_USERS] FOREIGN KEY 
	(
		[UserId]
	) REFERENCES [Users] (
		[UserId]
	)
GO
































































