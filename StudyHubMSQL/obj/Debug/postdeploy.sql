 /*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/
MERGE INTO  Country AS Target  USING ( VALUES (1, 'NIGERIA') ) AS Source (CountryId, CountryName) ON Target.CountryId = Source.CountryId 
 WHEN MATCHED THEN UPDATE SET CountryName = Source.CountryName  WHEN NOT MATCHED BY TARGET THEN INSERT (CountryName) VALUES (CountryName) WHEN NOT MATCHED BY SOURCE THEN 
DELETE;

MERGE INTO  Speciality AS Target  USING ( VALUES (1, 'Agricultural Science'),(2, 'Physics'),(3, 'Biology'),(4, 'Mathematics') ) AS Source (SpecialityId, SpecialityName) ON 
Target.SpecialityId = Source.SpecialityId WHEN MATCHED THEN UPDATE SET SpecialityName = Source.SpecialityName  WHEN NOT MATCHED BY TARGET THEN INSERT (SpecialityName)
 VALUES (SpecialityName) WHEN NOT MATCHED BY SOURCE THEN DELETE;

 MERGE INTO  [State] AS Target  USING ( VALUES (1, 'Federal Capital Territory', 1),(2, 'Ebonyi State', 1),(3, 'Ogun State', 1),(4, 'Ekiti State', 1) ) AS Source 
 (StateId, StateName, CountryId) ON Target.StateId = Source.StateId WHEN MATCHED THEN UPDATE SET StateName = Source.StateName, CountryId = Source.CountryId  
 WHEN NOT MATCHED BY TARGET THEN INSERT (StateName, CountryId) VALUES (StateName, CountryId) WHEN NOT MATCHED BY SOURCE THEN DELETE;

  MERGE INTO  [Town] AS Target  USING ( VALUES (1, 'Abuja', 1),(2, 'Abakaliki', 2),(3, 'Abeokuta', 3),(4, 'Ado-Ekiti', 4) ) AS Source 
 (TownId, TownName, StateId) ON Target.TownId = Source.TownId WHEN MATCHED THEN UPDATE SET TownName = Source.TownName, StateId = Source.StateId  
 WHEN NOT MATCHED BY TARGET THEN INSERT (TownName, StateId) VALUES (TownName, StateId) WHEN NOT MATCHED BY SOURCE THEN DELETE;
GO
