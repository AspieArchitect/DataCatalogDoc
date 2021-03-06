IF OBJECT_ID('MetaData.TestDataDictionaryColumns') IS NOT NULL
BEGIN
    DROP PROCEDURE MetaData.TestDataDictionaryColumns;
    RAISERROR('PROC DROPPED: MetaData.TestDataDictionaryColumns', 10, 1) WITH NOWAIT;
END;
GO
CREATE PROC MetaData.TestDataDictionaryColumns
AS 
    SET NOCOUNT ON
    DECLARE @RecordCount INT
    DECLARE @ColumnList TABLE
        (
          SchemaName sysname NOT NULL,
          ObjectName SYSNAME NOT NULL,
		  ObjectType SYSNAME NOT NULL,
          ColumnName sysname NOT NULL,
          PRIMARY KEY CLUSTERED ( SchemaName, ObjectName, ColumnName )
        )
    EXEC MetaData.PopulateDataDictionary -- Ensure the MetaData.DataDictionary tables are up-to-date.
	EXEC MetaData.HarvestExistingDescriptions -- Ensure that any existing descriptions are applied
    INSERT  INTO @ColumnList
            (
              SchemaName,
              ObjectName,
			  ObjectType,
              ColumnName
            )
            SELECT  SchemaName,
                    ObjectName,
					ObjectType,
                    ColumnName
            FROM    MetaData.DataDictionary_Columns
            WHERE   ObjectName NOT LIKE 'MSp%' -- ???
                    AND ObjectName NOT LIKE 'sys%' -- Exclude standard system tables.
                    AND ColumnDescription = ''
    SET @RecordCount = @@ROWCOUNT
    IF @RecordCount > 0 
        BEGIN
            PRINT ''
            PRINT 'The following recordset shows the tables/Columns for which data dictionary descriptions are missing'
            PRINT ''
            SELECT  LEFT(SchemaName, 15) AS SchemaName,
                    LEFT(ObjectName, 30) AS ObjectName,
					LEFT(ObjectType, 30) AS ObjectType,
                    LEFT(ColumnName, 30) AS ColumnName
            FROM    @ColumnList
            UNION ALL
            SELECT  '',
                    '',
                    '',
                    '' -- Used to force a blank line
            RAISERROR ( '%i Column(s) lack descriptions', 16, 1, @RecordCount )
                WITH NOWAIT
        END
GO
IF @@ERROR= 0
	    RAISERROR('PROC CREATED: MetaData.TestDataDictionaryColumns', 10, 1) WITH NOWAIT;


EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identifies any columns with empty descriptions and raises an error of sufficient severity to break any continuous integration build.
The offending schemas, objects and columns will be listed.' , @level0type=N'SCHEMA',@level0name=N'MetaData', @level1type=N'PROCEDURE',@level1name=N'TestDataDictionaryColumns'
GO
