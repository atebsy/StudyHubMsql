CREATE TABLE [dbo].[UserSpeciality]
(
	[UserSpecialityId] INT NOT NULL PRIMARY KEY identity(1,1),
	[UserId] int,
	[SpecialityId] int not null,
	constraint user_speciality unique(UserId,SpecialityId), 
    CONSTRAINT [FK_UserSpeciality_User] FOREIGN KEY ([UserId]) REFERENCES [User]([UserId]), 
    CONSTRAINT [FK_UserSpeciality_Speciality] FOREIGN KEY ([SpecialityId]) REFERENCES [Speciality]([SpecialityId])
)
