CREATE TABLE [dbo].[User](
	[Id] [UNIQUEIDENTIFIER] NOT NULL,
	[Username] [NVARCHAR](100) NULL,
	[Email] [NVARCHAR](512) NOT NULL,
	[FirstName] [NVARCHAR](100) NOT NULL,
	[LastName] [NVARCHAR](100) NOT NULL,
	[PhoneNumber] [NVARCHAR](100) NULL,
	[Status] [NVARCHAR](255) NOT NULL,
	[Type] [NVARCHAR](255) NULL,
	[RoleId] [INT] NULL,
	[IsActive] [BIT] NOT NULL,
	[CreatedAt] [DATETIME2](7) NOT NULL,
	[UpdatedAt] [DATETIME2](7) NOT NULL,
	[PeriodStart] DATETIME2 GENERATED ALWAYS AS ROW START HIDDEN NOT NULL DEFAULT SYSUTCDATETIME(), 
    [PeriodEnd] DATETIME2  GENERATED ALWAYS AS ROW END HIDDEN NOT NULL DEFAULT CONVERT(datetime2 (7), '9999-12-31 23:59:59.9999999'),
	PERIOD FOR SYSTEM_TIME ([PeriodStart], [PeriodEnd]),
	CONSTRAINT [PK_User_Id] PRIMARY KEY CLUSTERED
	(
		[Id] ASC
	) WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = [dbo].[UserHistory], DATA_CONSISTENCY_CHECK = ON, HISTORY_RETENTION_PERIOD = 3 MONTH))
GO

ALTER TABLE dbo.[User] ADD CONSTRAINT [Uidx_User_Email] UNIQUE ([Email])
GO
ALTER TABLE dbo.[User] ADD CONSTRAINT [Uidx_User_Username] UNIQUE ([Username])
GO
ALTER TABLE dbo.[User] ADD CONSTRAINT [Uidx_User_PhoneNumber] UNIQUE ([PhoneNumber])
GO
ALTER TABLE [dbo].[User] ADD CONSTRAINT [DV_User_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[User] ADD CONSTRAINT [DV_User_CreatedDate]  DEFAULT (GETUTCDATE()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[User] ADD CONSTRAINT [DV_User_UpdatedAt]  DEFAULT (GETUTCDATE()) FOR [UpdatedAt]
GO

CREATE NONCLUSTERED INDEX [Nidx_User_Email] ON [dbo].[User]
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

/*****	Star adding description  *****/
EXEC sys.sp_addextendedproperty 
	@name=N'MS_Description',
	@value=N'Primary Key',
	@level0type=N'SCHEMA',
	@level0name=N'dbo',
	@level1type=N'TABLE',
	@level1name=N'User',
	@level2type=N'COLUMN',
	@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty 
	@name=N'MS_Description',
	@value=N'A username is a unique string of characters used to identify a user on a computer system or online service',
	@level0type=N'SCHEMA',
	@level0name=N'dbo',
	@level1type=N'TABLE',
	@level1name=N'User',
	@level2type=N'COLUMN',
	@level2name=N'Username'
GO
EXEC sys.sp_addextendedproperty 
	@name=N'MS_Description',
	@value=N'Email (also known as electronic mail) is a method of exchanging digital information between individuals or organizations via the Internet. It allows users to send and receive messages, documents, images and other attachments quickly and conveniently.',
	@level0type=N'SCHEMA',
	@level0name=N'dbo',
	@level1type=N'TABLE',
	@level1name=N'User',
	@level2type=N'COLUMN',
	@level2name=N'Email'
GO
EXEC sys.sp_addextendedproperty 
	@name=N'MS_Description',
	@value=N'FirstName in English is equivalent to the name in Vietnamese. It is the part of the name used to call or address a person, usually before the family name.',
	@level0type=N'SCHEMA',
	@level0name=N'dbo',
	@level1type=N'TABLE',
	@level1name=N'User',
	@level2type=N'COLUMN',
	@level2name=N'FirstName'
GO
EXEC sys.sp_addextendedproperty 
	@name=N'MS_Description',
	@value=N'LastName in English is equivalent to surname in Vietnamese. It is the part of the name used to indicate the clan or family to which a person belongs.',
	@level0type=N'SCHEMA',
	@level0name=N'dbo',
	@level1type=N'TABLE',
	@level1name=N'User',
	@level2type=N'COLUMN',
	@level2name=N'LastName'
GO
EXEC sys.sp_addextendedproperty 
	@name=N'MS_Description',
	@value=N'PhoneNumber (also known as phone number) is a unique series of numbers assigned to a telephone subscriber, allowing users to make and receive calls and messages on the telecommunications network. Each phone number is associated with a specific telephone line, helping to identify and connect users with each other.',
	@level0type=N'SCHEMA',
	@level0name=N'dbo',
	@level1type=N'TABLE',
	@level1name=N'User',
	@level2type=N'COLUMN',
	@level2name=N'PhoneNumber'
GO
EXEC sys.sp_addextendedproperty 
	@name=N'MS_Description',
	@value=N'Status of user',
	@level0type=N'SCHEMA',
	@level0name=N'dbo',
	@level1type=N'TABLE',
	@level1name=N'User',
	@level2type=N'COLUMN',
	@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty 
	@name=N'MS_Description',
	@value=N'Type of user',
	@level0type=N'SCHEMA',
	@level0name=N'dbo',
	@level1type=N'TABLE',
	@level1name=N'User',
	@level2type=N'COLUMN',
	@level2name=N'Type'
GO
EXEC sys.sp_addextendedproperty 
	@name=N'MS_Description',
	@value=N'RoleId of user',
	@level0type=N'SCHEMA',
	@level0name=N'dbo',
	@level1type=N'TABLE',
	@level1name=N'User',
	@level2type=N'COLUMN',
	@level2name=N'RoleId'
GO
EXEC sys.sp_addextendedproperty 
	@name=N'MS_Description',
	@value=N'The activation of User: true, false',
	@level0type=N'SCHEMA',
	@level0name=N'dbo',
	@level1type=N'TABLE',
	@level1name=N'User',
	@level2type=N'COLUMN',
	@level2name=N'IsActive'
GO
EXEC sys.sp_addextendedproperty 
	@name=N'MS_Description',
	@value=N'The date time when User is created',
	@level0type=N'SCHEMA',
	@level0name=N'dbo',
	@level1type=N'TABLE',
	@level1name=N'User',
	@level2type=N'COLUMN',
	@level2name=N'CreatedAt'
GO
EXEC sys.sp_addextendedproperty 
	@name=N'MS_Description',
	@value=N'The date time when User is updated',
	@level0type=N'SCHEMA',
	@level0name=N'dbo',
	@level1type=N'TABLE',
	@level1name=N'User',
	@level2type=N'COLUMN',
	@level2name=N'UpdatedAt'
GO
EXEC sys.sp_addextendedproperty 
	@name=N'MS_Description',
	@value=N'"PeriodStart" is a compound word in English, which can be understood as "The beginning of a period" or "The starting date of a period". It is often used to refer to the time when an event, activity or process begins to take place.',
	@level0type=N'SCHEMA',
	@level0name=N'dbo',
	@level1type=N'TABLE',
	@level1name=N'User',
	@level2type=N'COLUMN',
	@level2name=N'PeriodStart'
GO
EXEC sys.sp_addextendedproperty 
	@name=N'MS_Description',
	@value=N'"PeriodEnd" is a compound word in English, which can be understood as "The end time of a period" or "The end date of a period". It is often used to refer to the time when an event, activity or process ends or expires.',
	@level0type=N'SCHEMA',
	@level0name=N'dbo',
	@level1type=N'TABLE',
	@level1name=N'User',
	@level2type=N'COLUMN',
	@level2name=N'PeriodEnd'
GO
/*****	End adding description	*****/