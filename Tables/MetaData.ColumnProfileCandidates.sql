USE gettingstarted
GO

DECLARE 
	@SchemaName SYSNAME='MetaData',
	@TableName SYSNAME = 'ColumnProfileCandidates'
IF OBJECT_ID(@SchemaName + '.'+@TableName) IS NULL
	BEGIN
		CREATE TABLE MetaData.ColumnProfileCandidates(
			SchemaName sysname NOT NULL,
			ObjectName sysname NOT NULL,
			ColumnName sysname NOT NULL,
			ApproximateRows BIGINT NOT NULL,
			IncludeForProfiling BIT NOT NULL
				CONSTRAINT DEF_ColumnProfileCandidates_IncludeForProfiling  DEFAULT ((1)),
		 CONSTRAINT PK_MetaData_ColumnProfileCandidates PRIMARY KEY CLUSTERED (SchemaName,ObjectName,ColumnName)
		)

		EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The schema name in which the object containing the column resides' , @level0type=N'SCHEMA',@level0name=N'MetaData', @level1type=N'TABLE',@level1name=@TableName, @level2type=N'COLUMN',@level2name=N'SchemaName'
		EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The table name' , @level0type=N'SCHEMA',@level0name=N'MetaData', @level1type=N'TABLE',@level1name=@TableName, @level2type=N'COLUMN',@level2name=N'ObjectName'
		EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The name of the column within the table' , @level0type=N'SCHEMA',@level0name=N'MetaData', @level1type=N'TABLE',@level1name=@TableName, @level2type=N'COLUMN',@level2name=N'ColumnName'
		EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The approximate row count as extracted from sysindexes.rows' , @level0type=N'SCHEMA',@level0name=N'MetaData', @level1type=N'TABLE',@level1name=@TableName, @level2type=N'COLUMN',@level2name=N'ApproximateRows'
		EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0 = Exclude from profiling 1 = Include for profiling' , @level0type=N'SCHEMA',@level0name=N'MetaData', @level1type=N'TABLE',@level1name=@TableName, @level2type=N'COLUMN',@level2name=N'IncludeForProfiling'
		EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A list of columns within tables that are (N)CHAR or (N)VARCHAR  and between 1 and 100 characters long.  An approximate row count is provided to forewarn when profiling activity might require consideration for the load on the system being profiled.' , @level0type=N'SCHEMA',@level0name=N'MetaData', @level1type=N'TABLE',@level1name=@TableName
		
		RAISERROR('TABLE CREATED: %s',10,1,@TableName)
	END
ELSE
	BEGIN
		RAISERROR('ALREADY EXITS: TABLE: %s',10,1,@TableName)
END
GO


