DECLARE 
	@SchemaName SYSNAME='MetaData',
	@TableName SYSNAME = 'DataDictionary_StagingColumns'

IF OBJECT_ID(@SchemaName + '.'+@TableName) IS NULL
	BEGIN
		CREATE TABLE MetaData.DataDictionary_StagingColumns(
			SchemaName sysname NOT NULL,
			ObjectName sysname NOT NULL,
			ColumnName sysname NOT NULL,
			ColumnDescription VARCHAR(7000) NOT NULL,
			CONSTRAINT PK_DataDictionary_StagingColumns PRIMARY KEY CLUSTERED 
				(
					SchemaName ASC,
					ObjectName ASC,
					ColumnName ASC
			)
		)
		EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The schema name in which the object containing the column resides' , @level0type=N'SCHEMA',@level0name=N'MetaData', @level1type=N'TABLE',@level1name=@TableName, @level2type=N'COLUMN',@level2name=N'SchemaName'
		EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The table name in which the column resides' , @level0type=N'SCHEMA',@level0name=N'MetaData', @level1type=N'TABLE',@level1name=@TableName, @level2type=N'COLUMN',@level2name=N'ObjectName'
		EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The column name for which a description has been assembled' , @level0type=N'SCHEMA',@level0name=N'MetaData', @level1type=N'TABLE',@level1name=@TableName, @level2type=N'COLUMN',@level2name=N'ColumnName'
		EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The assembled description that is a list of DISTINCT values from the column.
		WARNING: There is no guarantee as to the order of this list.' , @level0type=N'SCHEMA',@level0name=N'MetaData', @level1type=N'TABLE',@level1name=@TableName, @level2type=N'COLUMN',@level2name=N'ColumnDescription'
		EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Holds the column descriptions assembled from the distinct values within the column for that specific table' , @level0type=N'SCHEMA',@level0name=N'MetaData', @level1type=N'TABLE',@level1name=@TableName

		RAISERROR('TABLE CREATED: %s',10,1,@TableName)
	END
ELSE
	BEGIN
		RAISERROR('ALREADY EXITS: TABLE: %s',10,1,@TableName)
END
GO

