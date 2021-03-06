IF OBJECT_ID('MetaData.ExistingObjectDescriptions') IS NOT NULL
BEGIN
    DROP VIEW MetaData.ExistingObjectDescriptions;
    RAISERROR('DROPPED VIEW: %s', 10, 1, 'MetaData.ExistingObjectDescriptions');
END;
GO
CREATE VIEW MetaData.ExistingObjectDescriptions
AS
SELECT OBJECT_SCHEMA_NAME(O.object_id) AS SchemaName,
       O.name AS ObjectName,
       REPLACE(O.type_desc, 'USER_', '') AS ObjectType,
       CAST(EP.value AS VARCHAR(MAX)) AS ObjectDescription
FROM sys.extended_properties AS EP
    INNER JOIN sys.objects AS O
        ON EP.major_id = O.object_id
WHERE EP.name = 'MS_DESCRIPTION'
      AND EP.class = 1
      AND EP.minor_id = 0
      AND O.type IN ( 'U', 'V' );
GO
RAISERROR('VIEW CREATED: %s', 10, 1, 'MetaData.ExistingObjectDescriptions');

DECLARE @SchemaName sysname = 'MetaData',
        @ViewName sysname = 'ExistingObjectDescriptions';
EXEC sys.sp_addextendedproperty @name = N'MS_Description',
                                @value = N'The name of the schema in which the table or view containing the column resides.',
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
                                @value = N'The contents of the MS_DESCRIPTION property for the table or view.',
                                @level0type = N'SCHEMA',
                                @level0name = @SchemaName,
                                @level1type = N'VIEW',
                                @level1name = @ViewName,
                                @level2type = N'COLUMN',
                                @level2name = N'ObjectDescription';
EXEC sys.sp_addextendedproperty @name = N'MS_Description',
                                @value = N'The contents of any existing MS_DESCRIPTION properties for table and views.  This is used to scavenge any existing comments into the MetaData.DataDictionary_Objects table.',
                                @level0type = N'SCHEMA',
                                @level0name = @SchemaName,
                                @level1type = N'VIEW',
                                @level1name = @ViewName;
GO


