DECLARE 
	@SchemaName SYSNAME='MetaData',
	@TableName SYSNAME = 'DataDictionary_ColumnPatterns'
IF OBJECT_ID(@SchemaName + '.'+@TableName) IS NULL
	BEGIN

CREATE TABLE MetaData.DataDictionary_ColumnPatterns(
	ColumnPatternId INT NOT NULL,
	ColumnPattern sysname NOT NULL
		CONSTRAINT CK_DataDictionary_ColumnPattern CHECK  ((ColumnPattern LIKE '%!%%' ESCAPE '!' )),
	CONSTRAINT PK_DataDictionary_ColumnPatterns PRIMARY KEY CLUSTERED (ColumnPatternId),
	CONSTRAINT UQ_DataDictionary_ColumnPatterns UNIQUE NONCLUSTERED (ColumnPattern)
)

		EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The clustered primary key that uniquely identifies the MetaData.DataDictionary_ColumnPatterns record.' , @level0type=N'SCHEMA',@level0name=N'MetaData', @level1type=N'TABLE',@level1name=@TableName, @level2type=N'COLUMN',@level2name=N'ColumnPatternId'
		EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A broad specification for column retrieval such as %DateKey' , @level0type=N'SCHEMA',@level0name=N'MetaData', @level1type=N'TABLE',@level1name=@TableName, @level2type=N'COLUMN',@level2name=N'ColumnPattern'
		EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Provides a broad wild card specification for retrieving a group of columns.  For example %DateKey.
		Designed to be used with MetaData.DataDictionary_ColumnDefaults to provide more descriptions for different instances of %DateKey columns.' , @level0type=N'SCHEMA',@level0name=N'MetaData', @level1type=N'TABLE',@level1name=@TableName

		RAISERROR('TABLE CREATED: %s',10,1,@TableName)
	END
ELSE
	BEGIN
		RAISERROR('ALREADY EXITS: TABLE: %s',10,1,@TableName)
END
GO



