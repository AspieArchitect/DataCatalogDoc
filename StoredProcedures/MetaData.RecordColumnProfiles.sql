IF OBJECT_ID('MetaData.RecordColumnProfiles') IS NOT NULL
BEGIN
    DROP PROCEDURE MetaData.RecordColumnProfiles;
    RAISERROR('PROC DROPPED: MetaData.RecordColumnProfiles', 10, 1) WITH NOWAIT;
END;
GO
CREATE PROC MetaData.RecordColumnProfiles
AS 
SET NOCOUNT ON
TRUNCATE TABLE MetaData.ColumnProfileResults;

DECLARE @SQLCommandList TABLE (SQLCommand VARCHAR(2000) NOT NULL)
DECLARE @SQLCommand VARCHAR(2000)=''

INSERT INTO @SQLCommandList(SQLCommand)
SELECT 'INSERT INTO MetaData.ColumnProfileResults SELECT '''
	+ SchemaName
	+ ''' AS SchemaName,'''
	+ ObjectName
	+ ''' AS ObjectName,'''
	+ ColumnName
	+ ''' AS ColumnName,COUNT(DISTINCT ' 
	+ QUOTENAME(ColumnName) + ') AS Occurrences FROM '
    + QUOTENAME(SchemaName) 
	+ '.' 
	+ QUOTENAME(ObjectName) AS SQLCommand
FROM MetaData.ColumnProfileCandidates
WHERE IncludeForProfiling = 1

WHILE @SQLCommand IS NOT NULL
	BEGIN
	    SELECT @SQLCommand=MIN(SQLCommand)
		FROM @SQLCommandList
		WHERE SQLCommand>@SQLCommand

		IF @SQLCommand IS NOT NULL
			BEGIN
				EXEC (@SQLCommand)
				PRINT @SQLCommand
			END
	END
GO
IF @@ERROR= 0
	    RAISERROR('PROC CREATED: MetaData.RecordColumnProfiles', 10, 1) WITH NOWAIT;

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Populates MetaData.DataDictionary_Objects and MetaData.DataDictionary_columns tables and then applies the generated descriptions' , @level0type=N'SCHEMA',@level0name=N'MetaData', @level1type=N'PROCEDURE',@level1name=N'SetDefaultDescriptions'
GO
