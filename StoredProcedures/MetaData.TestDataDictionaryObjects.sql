IF OBJECT_ID('MetaData.TestDataDictionaryObjects') IS NOT NULL
BEGIN
    DROP PROCEDURE MetaData.TestDataDictionaryObjects;
    RAISERROR('PROC DROPPED: MetaData.TestDataDictionaryObjects', 10, 1) WITH NOWAIT;
END;
GO


CREATE PROC MetaData.TestDataDictionaryObjects
AS
SET NOCOUNT ON;
DECLARE @ObjectList TABLE
(
    SchemaName sysname NOT NULL,
    ObjectName sysname NOT NULL,
    ObjectType sysname NOT NULL,
    PRIMARY KEY CLUSTERED (
                              SchemaName,
                              ObjectName
                          )
);
DECLARE @RecordCount INT;
EXEC MetaData.PopulateDataDictionary; -- Ensure the MetaData.DataDictionary Objects are up-to-date.
EXEC MetaData.HarvestExistingDescriptions; -- Ensure that any existing descriptions are scavenged.

INSERT INTO @ObjectList
(
    SchemaName,
    ObjectName,
    ObjectType
)
SELECT SchemaName,
       ObjectName,
       ObjectType
FROM MetaData.DataDictionary_Objects
WHERE ObjectName NOT LIKE 'MSp%' -- ???
      AND ObjectName NOT LIKE 'sys%' -- Exclude standard system Objects.
      AND ObjectDescription = '';
SET @RecordCount = @@ROWCOUNT;
IF @RecordCount > 0
BEGIN
    PRINT '';
    PRINT 'The following recordset shows the Objects for which data dictionary descriptions are missing';
    PRINT '';
    SELECT LEFT(SchemaName, 15) AS SchemaName,
           LEFT(ObjectName, 30) AS ObjectName,
           ObjectType
    FROM @ObjectList
    UNION ALL
    SELECT '',
           '',
           ''; -- Used to force a blank line
    RAISERROR('%i Object(s) lack descriptions', 16, 1, @RecordCount) WITH NOWAIT;
END;
GO
IF @@ERROR = 0
    RAISERROR('PROC CREATED: MetaData.TestDataDictionaryObjects', 10, 1) WITH NOWAIT;

EXEC sys.sp_addextendedproperty @name = N'MS_Description',
                                @value = N'Identifies any tables or views with empty descriptions and raises an error of sufficient severity to break any continuous integration build.
The offending schemas, tables or views will be listed',
                                @level0type = N'SCHEMA',
                                @level0name = N'MetaData',
                                @level1type = N'PROCEDURE',
                                @level1name = N'TestDataDictionaryObjects';
GO
