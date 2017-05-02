CREATE TABLE [dbo].[Infrastructure]
(
  [InfrastructureId] INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
  [InfrastructureName] NVARCHAR (200) NOT NULL,
  [CreatedAt] TIMESTAMP NOT NULL,
  [UserId] INT NOT NULL,
  CONSTRAINT  infrastructure_name UNIQUE (InfrastructureName, UserId), 
  CONSTRAINT [FK_Infrastructure_User] FOREIGN KEY ([UserId]) REFERENCES [User]([UserId]) ON DELETE CASCADE ON UPDATE CASCADE,
)
