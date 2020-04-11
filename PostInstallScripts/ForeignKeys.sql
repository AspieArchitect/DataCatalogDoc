IF NOT EXISTS(SELECT * FROM sys.foreign_keys WHERE name='FK_DataDictinary_ColumnDefaults_ColumnPattern')
	BEGIN
		IF (SELECT COUNT(*) FROM sys.objects AS O WHERE O.object_id IN (OBJECT_ID('MetaData.DataDictionary_ColumnDefaults'),OBJECT_ID('MetaData.DataDictionary_ColumnPatterns'))) = 2
			BEGIN
			   ALTER TABLE MetaData.DataDictionary_ColumnDefaults 
			   ADD  CONSTRAINT FK_DataDictinary_ColumnDefaults_ColumnPattern 
					FOREIGN KEY(ColumnPatternId)
					REFERENCES MetaData.DataDictionary_ColumnPatterns (ColumnPatternId) 
				RAISERROR('FOREIGN KEY CREATED: FK_DataDictinary_ColumnDefaults_ColumnPattern',10,1)
			END
		ELSE
			BEGIN
				RAISERROR('MISSING OBJECT: Check DataDictionary_ColumnDefaults OR DataDictionary_ColumnPatterns in the MetaData schema',16,1) WITH NOWAIT
			END
	END
ELSE
	BEGIN
		RAISERROR('ALREADY EXISTS FOREIGN KEY : FK_DataDictinary_ColumnDefaults_ColumnPattern',10,1)
	END
GO
IF NOT EXISTS(SELECT * FROM sys.foreign_keys WHERE name='FK_DataDictionary_Columns')
	BEGIN
		IF (SELECT COUNT(*) FROM sys.objects AS O WHERE O.object_id IN (OBJECT_ID('MetaData.DataDictionary_Columns'),OBJECT_ID('MetaData.DataDictionary_Objects'))) = 2
			BEGIN
			   ALTER TABLE MetaData.DataDictionary_Columns 
			   ADD  CONSTRAINT FK_DataDictionary_Columns
					FOREIGN KEY(SchemaName, ObjectName)
					REFERENCES MetaData.DataDictionary_Objects (SchemaName, ObjectName) 
				RAISERROR('FOREIGN KEY CREATED: FK_DataDictionary_Columns_Objects',10,1)
			END
		ELSE
			BEGIN
				RAISERROR('MISSING OBJECT: Check DataDictionary_Columns OR DataDictionary_Objects in the MetaData schema',16,1) WITH NOWAIT
			END
	END
ELSE
	BEGIN
		RAISERROR('ALREADY EXISTS FOREIGN KEY : FK_DataDictionary_Columns_Objects',10,1)
	END
GO


