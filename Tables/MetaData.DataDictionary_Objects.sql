DECLARE 
	@SchemaName SYSNAME='MetaData',
	@TableName SYSNAME = 'DataDictionary_Objects'
IF OBJECT_ID(@SchemaName + '.'+@TableName) IS NULL
	BEGIN
		CREATE TABLE MetaData.DataDictionary_Objects(
			SchemaName sysname NOT NULL,
			ObjectName sysname NOT NULL,
			ObjectType VARCHAR(50) NOT NULL,
			ObjectDescription VARCHAR(7000) NOT NULL
				CONSTRAINT DEF_DataDictionary_ObjectDescription  DEFAULT (''),
			CONSTRAINT PK_DataDictionary_Objects PRIMARY KEY CLUSTERED 
				(SchemaName ASC,ObjectName ASC)
		)

		EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The schema name in which the object resides' , @level0type=N'SCHEMA',@level0name=N'MetaData', @level1type=N'TABLE',@level1name=@TableName, @level2type=N'COLUMN',@level2name=N'SchemaName'
		EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The object name where the object is a table or view' , @level0type=N'SCHEMA',@level0name=N'MetaData', @level1type=N'TABLE',@level1name=@TableName, @level2type=N'COLUMN',@level2name=N'ObjectName'
		EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'* TABLE
		* VIEW' , @level0type=N'SCHEMA',@level0name=N'MetaData', @level1type=N'TABLE',@level1name=@TableName, @level2type=N'COLUMN',@level2name=N'ObjectType'
		EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'User friendly text describing the use and any relevant detail about the table or view' , @level0type=N'SCHEMA',@level0name=N'MetaData', @level1type=N'TABLE',@level1name=@TableName, @level2type=N'COLUMN',@level2name=N'ObjectDescription'
		EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Holds descriptions for tables and views.  This is to provide a means of allowing a low privileged role the means to maintain such descriptions as the sp_addextendedproperty and sp_updateextendedproperty both require ddl_admin or db_owner privileges.' , @level0type=N'SCHEMA',@level0name=N'MetaData', @level1type=N'TABLE',@level1name=@TableName

		RAISERROR('TABLE CREATED: %s',10,1,@TableName)
	END
ELSE
	BEGIN
		RAISERROR('ALREADY EXITS: TABLE: %s',10,1,@TableName)
END
GO
