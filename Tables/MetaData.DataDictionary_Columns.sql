DECLARE 
	@SchemaName SYSNAME='MetaData',
	@TableName SYSNAME = 'DataDictionary_Columns'
IF OBJECT_ID(@SchemaName + '.'+@TableName) IS NULL
	BEGIN
		CREATE TABLE MetaData.DataDictionary_Columns(
			SchemaName sysname NOT NULL,
			ObjectName sysname NOT NULL,
			ObjectType varchar(50) NOT NULL,
			ColumnName sysname NOT NULL,
			ColumnDescription varchar(7000) NOT NULL
				CONSTRAINT DEF_DataDictionary_ColumnDescription  DEFAULT (''),
			 CONSTRAINT PK_DataDictionary_Columns PRIMARY KEY CLUSTERED 
				(
					SchemaName ASC,
					ObjectName ASC,
					ColumnName ASC
				)
		)

		EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The schema name in which the object containing the column resides' , @level0type=N'SCHEMA',@level0name=N'MetaData', @level1type=N'TABLE',@level1name=@TableName, @level2type=N'COLUMN',@level2name=N'SchemaName'
		EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The name of the table or view' , @level0type=N'SCHEMA',@level0name=N'MetaData', @level1type=N'TABLE',@level1name=@TableName, @level2type=N'COLUMN',@level2name=N'ObjectName'
		EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'* TABLE
		* VIEW' , @level0type=N'SCHEMA',@level0name=N'MetaData', @level1type=N'TABLE',@level1name=@TableName, @level2type=N'COLUMN',@level2name=N'ObjectType'
		EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The name of the column within the table or view' , @level0type=N'SCHEMA',@level0name=N'MetaData', @level1type=N'TABLE',@level1name=@TableName, @level2type=N'COLUMN',@level2name=N'ColumnName'
		EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'User friendly text describing the use and any relevant detail about the column within the table or view' , @level0type=N'SCHEMA',@level0name=N'MetaData', @level1type=N'TABLE',@level1name=@TableName, @level2type=N'COLUMN',@level2name=N'ColumnDescription'
		EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Holds descriptions for columns within the tables or views.  This is to provide a means of allowing a low privileged role the means to maintain such descriptions as the sp_addextendedproperty and sp_updateextendedproperty both require ddl_admin or db_owner privileges.' , @level0type=N'SCHEMA',@level0name=N'MetaData', @level1type=N'TABLE',@level1name=@TableName

		RAISERROR('TABLE CREATED: %s',10,1,@TableName)
	END
ELSE
	BEGIN
		RAISERROR('ALREADY EXITS: TABLE: %s',10,1,@TableName)
END
GO