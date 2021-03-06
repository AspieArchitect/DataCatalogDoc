IF OBJECT_ID('MetaData.ExistingColumnDescriptions') IS NOT NULL
BEGIN
    DROP VIEW MetaData.ExistingColumnDescriptions;
    RAISERROR('DROPPED VIEW: %s', 10, 1, 'MetaData.ExistingColumnDescriptions');
END;
GO

CREATE VIEW MetaData.ExistingColumnDescriptions
AS
SELECT OBJECT_SCHEMA_NAME(O.object_id) AS SchemaName,
       O.name AS ObjectName,
       REPLACE(O.type_desc, 'USER_', '') AS ObjectType,
       C.name AS ColumnName,
       CAST(EP.value AS VARCHAR(MAX)) AS ColumnDescription
FROM sys.extended_properties AS EP
    INNER JOIN sys.objects AS O
        ON EP.major_id = O.object_id
    INNER JOIN sys.columns AS C
        ON EP.major_id = C.object_id
           AND EP.minor_id = C.column_id
WHERE EP.name = 'MS_DESCRIPTION'
      AND EP.class = 1
      AND EP.minor_id > 0
      AND O.type IN ( 'U', 'V' );
GO
RAISERROR('VIEW CREATED: %s', 10, 1, 'MetaData.ExistingColumnDescriptions');

DECLARE @SchemaName sysname = 'MetaData',
        @ViewName sysname = 'ExistingColumnDescriptions';

EXEC sys.sp_addextendedproperty @name = N'MS_Description',
                                @value = N'The name of the schema in which the table or view containing the column resides',
                                @level0type = N'SCHEMA',
                                @level0name =@SchemaName,
                                @level1type = N'VIEW',
                                @level1name = @ViewName,
                                @level2type = N'COLUMN',
                                @level2name = N'SchemaName';
EXEC sys.sp_addextendedproperty @name = N'MS_Description',
                                @value = N'The table or view name in which the column resides',
                                @level0type = N'SCHEMA',
                                @level0name =@SchemaName,
                                @level1type = N'VIEW',
                                @level1name = @ViewName,
                                @level2type = N'COLUMN',
                                @level2name = N'ObjectName';
EXEC sys.sp_addextendedproperty @name = N'MS_Description',
                                @value = N'* TABLE
* VIEW',
                                @level0type = N'SCHEMA',
                                @level0name =@SchemaName,
                                @level1type = N'VIEW',
                                @level1name = @ViewName,
                                @level2type = N'COLUMN',
                                @level2name = N'ObjectType';
EXEC sys.sp_addextendedproperty @name = N'MS_Description',
                                @value = N'The name of the column for which the value of the MS_DESCRIPTION will be scavenged',
                                @level0type = N'SCHEMA',
                                @level0name =@SchemaName,
                                @level1type = N'VIEW',
                                @level1name = @ViewName,
                                @level2type = N'COLUMN',
                                @level2name = N'ColumnName';
EXEC sys.sp_addextendedproperty @name = N'MS_Description',
                                @value = N'The value of the MS_DESCRIPTION property for the column.',
                                @level0type = N'SCHEMA',
                                @level0name =@SchemaName,
                                @level1type = N'VIEW',
                                @level1name = @ViewName,
                                @level2type = N'COLUMN',
                                @level2name = N'ColumnDescription';
EXEC sys.sp_addextendedproperty @name = N'MS_Description',
                                @value = N'The contents of any existing MS_DESCRIPTION properties for column in the table or view.  This is used to scavenge any existing comments into the MetaData.DataDictionary_Columns table.',
                                @level0type = N'SCHEMA',
                                @level0name =@SchemaName,
                                @level1type = N'VIEW',
                                @level1name = @ViewName;
GO


