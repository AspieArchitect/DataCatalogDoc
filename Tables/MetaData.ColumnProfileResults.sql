DECLARE 
	@SchemaName SYSNAME='MetaData',
	@TableName SYSNAME = 'ColumnProfileResults'
IF OBJECT_ID(@SchemaName + '.'+@TableName) IS NULL
	BEGIN
        CREATE TABLE MetaData.ColumnProfileResults(
            SchemaName sysname NOT NULL,
            ObjectName sysname NOT NULL,
            ColumnName sysname NOT NULL,
            NumberOfValues BIGINT NOT NULL,
        CONSTRAINT PK_MetaData_ColumnProfileResults PRIMARY KEY CLUSTERED 
            (
                SchemaName ASC,
                ObjectName ASC,
                ColumnName ASC
            )
        )

        EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The schema name in which the tablecontaining the column resides' , @level0type=N'SCHEMA',@level0name=N'MetaData', @level1type=N'TABLE',@level1name=@TableName, @level2type=N'COLUMN',@level2name=N'SchemaName'
        EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The name of the table' , @level0type=N'SCHEMA',@level0name=N'MetaData', @level1type=N'TABLE',@level1name=@TableName, @level2type=N'COLUMN',@level2name=N'ObjectName'
        EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The name of the column ' , @level0type=N'SCHEMA',@level0name=N'MetaData', @level1type=N'TABLE',@level1name=@TableName, @level2type=N'COLUMN',@level2name=N'ColumnName'
        EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The COUNT(DISTINCT {column name})' , @level0type=N'SCHEMA',@level0name=N'MetaData', @level1type=N'TABLE',@level1name=@TableName, @level2type=N'COLUMN',@level2name=N'NumberOfValues'
        EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Contains the COUNT(DISTINCT {column name}) for the given column within the table.  This is intended to allow a list of values from the column to be used to build up the description.' , @level0type=N'SCHEMA',@level0name=N'MetaData', @level1type=N'TABLE',@level1name=N'ColumnProfileResults'
		
		RAISERROR('TABLE CREATED: %s',10,1,@TableName)
	END
ELSE
	BEGIN
		RAISERROR('ALREADY EXITS: TABLE: %s',10,1,@TableName)
END
GO


