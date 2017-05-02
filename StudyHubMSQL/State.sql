CREATE TABLE [dbo].[State]
(
	[StateId] INT NOT NULL PRIMARY KEY identity(1,1),
	[StateName] NVARCHAR (255) NOT NULL,
	[CountryId] INT NOT null, 
    CONSTRAINT [FK_State_Country] FOREIGN KEY ([CountryId]) REFERENCES [Country]([CountryId]) ON DELETE CASCADE ON UPDATE CASCADE
)
