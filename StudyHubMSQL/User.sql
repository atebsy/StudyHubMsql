﻿CREATE TABLE [dbo].[User]
(
  [UserId] INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
  [FirstName] NVARCHAR (255) NOT NULL,
  [LastName] NVARCHAR (255) NOT NULL,
  [Email] NVARCHAR(255) UNIQUE NOT NULL,
  [Passwor] NVARCHAR(255)  NOT NULL,
  [CreatedAt] TIMESTAMP NOT NULL,
  [UpdatedAt] DATETIME NOT NULL,
  [UserType] NVARCHAR (20) NOT NULL CHECK(UserType IN ('Tutor','Student','Tutoring Center')),
  [SeoName] NVARCHAR (250) UNIQUE  DEFAULT NULL,
  [TutorCenterName] NVARCHAR(200) NULL,
  [PhysicalAddress] NVARCHAR(250) NOT NULL,
  [CountryId] INT  NULL,
  [StateId] INT  NULL,
  [TownId] INT  NULL,
  [ProfileImageUrl] NVARCHAR (255)  NULL,
  [Degree] NVARCHAR (255) NULL,
  [GpsCoordinates] NVARCHAR (200) NULL,
  [description] NVARCHAR(500) NULL,
  [Phone] NVARCHAR (20) NULL,
  [AvailablePersonel] INT NULL, 
    CONSTRAINT [FK_User_Country] FOREIGN KEY (CountryId) REFERENCES [Country]([CountryId]) ON DELETE NO ACTION ON UPDATE NO ACTION,
	CONSTRAINT [FK_User_State] FOREIGN KEY (StateId) REFERENCES [State]([StateId]) ON DELETE NO ACTION ON UPDATE  NO ACTION,
	CONSTRAINT [FK_User_Town] FOREIGN KEY (TownId) REFERENCES [Town]([TownId]) ON DELETE NO ACTION ON UPDATE NO ACTION
)