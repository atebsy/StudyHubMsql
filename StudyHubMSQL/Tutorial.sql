CREATE TABLE [dbo].[Tutorial]
(
   [TutorialId] int  NOT NULL primary key identity(1,1),
   [Title] nvarchar (100) NOT NULL,
   [Description] varchar (2000) NOT NULL,
   [UserId] int NOT NULL,
   [DateCreated] timestamp NOT NULL,
   [SpecialityId] int not NULL,
   [ImagePreviewLink] nvarchar (200) NULL, 
    CONSTRAINT [FK_Tutorial_User] FOREIGN KEY ([UserId]) REFERENCES [User]([UserId]) ON DELETE CASCADE ON UPDATE CASCADE, 
    CONSTRAINT [FK_Tutorial_Speciality] FOREIGN KEY ([SpecialityId]) REFERENCES [Speciality]([SpecialityId]) ON DELETE CASCADE ON UPDATE CASCADE,
)
