DECLARE 
	@SchemaName SYSNAME='MetaData',
	@TableName SYSNAME = 'DataDictionary_ColumnDefaults'

IF OBJECT_ID(@SchemaName + '.'+@TableName) IS NULL
	BEGIN
		CREATE TABLE MetaData.DataDictionary_ColumnDefaults(
			ColumnName sysname NOT NULL,
			ColumnPatternId int NOT NULL,
			ColumnDescription varchar(7000) NOT NULL
				CONSTRAINT DEF_DataDictionary_ColumnDefaultDescription  DEFAULT (''),
			CONSTRAINT PK_DataDictionary_ColumnDefaults PRIMARY KEY CLUSTERED 
			(	ColumnName ASC)
		)

		EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The name of the column (and natural key) for which a default description will be attached.' , @level0type=N'SCHEMA',@level0name=N'MetaData', @level1type=N'TABLE',@level1name=@TableName, @level2type=N'COLUMN',@level2name=N'ColumnName'
		EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Join to ColumnPatternId column in the MetaData.DataDictionary_ColumnPatterns table.  
		This identifies the broad column retrieval pattern for which this record is specific column name.' , @level0type=N'SCHEMA',@level0name=N'MetaData', @level1type=N'TABLE',@level1name=@TableName, @level2type=N'COLUMN',@level2name=N'ColumnPatternId'
		EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The user friendly description of the column that will be used for all columns that share this name.' , @level0type=N'SCHEMA',@level0name=N'MetaData', @level1type=N'TABLE',@level1name=@TableName, @level2type=N'COLUMN',@level2name=N'ColumnDescription'
		EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Provides the default description for columns of a specific name related back to the MetaData.DataDictionary_ColumnPatterns record.  For example
		* DateKey
		* DueDateKey
		* OrderDateKey
		* ShipDateKey' , @level0type=N'SCHEMA',@level0name=N'MetaData', @level1type=N'TABLE',@level1name=N'DataDictionary_ColumnDefaults'
		
		RAISERROR('TABLE CREATED: %s',10,1,@TableName)
	END
ELSE
	BEGIN
		RAISERROR('ALREADY EXITS: TABLE: %s',10,1,@TableName)
END
GO
