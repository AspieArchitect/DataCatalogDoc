IF OBJECT_ID('MetaData.RecordColumnStagingDescriptions') IS NOT NULL
BEGIN
    DROP PROCEDURE MetaData.RecordColumnStagingDescriptions;
    RAISERROR('PROC DROPPED: MetaData.RecordColumnStagingDescriptions', 10, 1) WITH NOWAIT;
END;
GO
CREATE PROC MetaData.RecordColumnStagingDescriptions
AS
SET NOCOUNT ON;
TRUNCATE TABLE MetaData.DataDictionary_StagingColumns

DECLARE @SQLCommandList TABLE
(
    SQLCommand VARCHAR(2000) NOT NULL
);
DECLARE @SQLCommand VARCHAR(2000) = '';

INSERT INTO @SQLCommandList
(
    SQLCommand
)
SELECT 'INSERT INTO MetaData.DataDictionary_StagingColumns SELECT ''' + SchemaName + ''' AS SchemaName,''' + ObjectName
       + ''' AS ObjectName,''' + ColumnName + ''' AS ColumnName,REPLACE(STUFF((SELECT DISTINCT CHAR(13) + CHAR(10) + CHAR(42) + CHAR(160) + ' 
	   + QUOTENAME(ColumnName)
	   + ' FROM '
	   + QUOTENAME(SchemaName) + '.' + QUOTENAME(ObjectName)
	   + ' WHERE ' + QUOTENAME(ColumnName) + ' IS NOT NULL FOR XML PATH(''''), TYPE).value(''.'',''NVARCHAR(MAX)''),1,2,''''),CHAR(39),CHAR(39)+CHAR(39));'
	   AS SQLCommand
FROM MetaData.ColumnProfileResults
WHERE  NumberOfValues<=12;

WHILE @SQLCommand IS NOT NULL
BEGIN
    SELECT @SQLCommand = MIN(SQLCommand)
    FROM @SQLCommandList
    WHERE SQLCommand > @SQLCommand;

    IF @SQLCommand IS NOT NULL
    BEGIN
        EXEC (@SQLCommand);
        PRINT @SQLCommand;
    END;
END;
GO
IF @@ERROR= 0
	    RAISERROR('PROC CREATED: MetaData.RecordColumnStagingDescriptions', 10, 1) WITH NOWAIT;


EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Extracts a DISTINCT list of values for each column in MetaData.ColumnProfileResults where there are fewer than 13 entries' , @level0type=N'SCHEMA',@level0name=N'MetaData', @level1type=N'PROCEDURE',@level1name=N'RecordColumnStagingDescriptions'
GO
