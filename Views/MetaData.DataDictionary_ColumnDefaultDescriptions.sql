IF OBJECT_ID('MetaData.DataDictionary_ColumnDefaultDescriptions') IS NOT NULL
BEGIN
    DROP VIEW MetaData.DataDictionary_ColumnDefaultDescriptions;
    RAISERROR('DROPPED VIEW: %s', 10, 1, 'MetaData.DataDictionary_ColumnDefaultDescriptions');
END;
GO

CREATE VIEW MetaData.DataDictionary_ColumnDefaultDescriptions
AS
SELECT OBJECT_SCHEMA_NAME(O.object_id) AS SchemaName,
       O.name AS ObjectName,
       REPLACE(O.type_desc, 'USER_', '') AS ObjectType,
       C.name AS ColumnName,
       REPLACE(CD.ColumnDescription, '{schema.table}', OBJECT_SCHEMA_NAME(O.object_id) + '.' + O.name) AS ColumnDescription
FROM sys.columns AS C
    INNER JOIN sys.objects AS O
        ON C.object_id = O.object_id
    INNER JOIN MetaData.DataDictionary_ColumnPatterns AS CP
        ON C.name LIKE CP.ColumnPattern
    INNER JOIN MetaData.DataDictionary_ColumnDefaults AS CD
        ON C.name = CD.ColumnName
WHERE O.type IN ( 'U', 'V' );
GO
RAISERROR('VIEW CREATED: %s', 10, 1, 'MetaData.DataDictionary_ColumnDefaultDescriptions');
GO
DECLARE @SchemaName sysname = 'MetaData',
        @ViewName sysname = 'DataDictionary_ColumnDefaultDescriptions';
EXEC sys.sp_addextendedproperty @name = N'MS_Description',
                                @value = N'The name of the schema in which the table or view containing the column resides',
                                @level0type = N'SCHEMA',
                                @level0name = @SchemaName,
                                @level1type = N'VIEW',
                                @level1name = @ViewName,
                                @level2type = N'COLUMN',
                                @level2name = N'SchemaName';
EXEC sys.sp_addextendedproperty @name = N'MS_Description',
                                @value = N'The name of the table or view',
                                @level0type = N'SCHEMA',
                                @level0name = @SchemaName,
                                @level1type = N'VIEW',
                                @level1name = @ViewName,
                                @level2type = N'COLUMN',
                                @level2name = N'ObjectName';
EXEC sys.sp_addextendedproperty @name = N'MS_Description',
                                @value = N'* TABLE
* VIEW',
                                @level0type = N'SCHEMA',
                                @level0name = @SchemaName,
                                @level1type = N'VIEW',
                                @level1name = @ViewName,
                                @level2type = N'COLUMN',
                                @level2name = N'ObjectType';
EXEC sys.sp_addextendedproperty @name = N'MS_Description',
                                @value = N'The name of the column for which a description will be provided',
                                @level0type = N'SCHEMA',
                                @level0name = @SchemaName,
                                @level1type = N'VIEW',
                                @level1name = @ViewName,
                                @level2type = N'COLUMN',
                                @level2name = N'ColumnName';
EXEC sys.sp_addextendedproperty @name = N'MS_Description',
                                @value = N'The user friendly description for the column',
                                @level0type = N'SCHEMA',
                                @level0name = @SchemaName,
                                @level1type = N'VIEW',
                                @level1name = @ViewName,
                                @level2type = N'COLUMN',
                                @level2name = N'ColumnDescription';
EXEC sys.sp_addextendedproperty @name = N'MS_Description',
                                @value = N'Provides default descriptions for columns based on a broad column retrieval pattern and a specific column name for items within that pattern.',
                                @level0type = N'SCHEMA',
                                @level0name = @SchemaName,
                                @level1type = N'VIEW',
                                @level1name = @ViewName;
GO


