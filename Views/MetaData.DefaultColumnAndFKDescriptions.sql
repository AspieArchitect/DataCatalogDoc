IF OBJECT_ID('MetaData.DefaultColumnAndFKDescriptions') IS NOT NULL
BEGIN
    DROP VIEW MetaData.DefaultColumnAndFKDescriptions;
    RAISERROR('DROPPED VIEW: %s', 10, 1, 'MetaData.DefaultColumnAndFKDescriptions');
END;
GO
CREATE VIEW MetaData.DefaultColumnAndFKDescriptions
AS
SELECT COALESCE(CDD.SchemaName, DFK.SchemaName) AS SchemaName,
       COALESCE(CDD.ObjectName, DFK.ObjectName) AS ObjectName,
       COALESCE(CDD.ColumnName, DFK.ColumnName) AS ColumnName,
       COALESCE(CDD.ColumnDescription, '') + COALESCE(' ' + DFK.ColumnDescription, '') AS ColumnDescription
FROM MetaData.DataDictionary_ColumnDefaultDescriptions AS CDD
    FULL OUTER JOIN MetaData.DefaultDescription_ForeignKey AS DFK
        ON DFK.SchemaName = CDD.SchemaName
           AND DFK.ObjectName = CDD.ObjectName
           AND DFK.ColumnName = CDD.ColumnName;
GO
RAISERROR('VIEW CREATED: %s', 10, 1, 'MetaData.DefaultColumnAndFKDescriptions');
GO

DECLARE @SchemaName sysname = 'MetaData',
        @ViewName sysname = 'DefaultColumnAndFKDescriptions';
EXEC sys.sp_addextendedproperty @name = N'MS_Description',
                                @value = N'The name of the schema in which the table containing the column resides',
                                @level0type = N'SCHEMA',
                                @level0name = @SchemaName,
                                @level1type = N'VIEW',
                                @level1name = @ViewName,
                                @level2type = N'COLUMN',
                                @level2name = N'SchemaName';
EXEC sys.sp_addextendedproperty @name = N'MS_Description',
                                @value = N'The name of the table containing the column',
                                @level0type = N'SCHEMA',
                                @level0name = @SchemaName,
                                @level1type = N'VIEW',
                                @level1name = @ViewName,
                                @level2type = N'COLUMN',
                                @level2name = N'ObjectName';
EXEC sys.sp_addextendedproperty @name = N'MS_Description',
                                @value = N'The column name for which a full description is generated',
                                @level0type = N'SCHEMA',
                                @level0name = @SchemaName,
                                @level1type = N'VIEW',
                                @level1name = @ViewName,
                                @level2type = N'COLUMN',
                                @level2name = N'ColumnName';
EXEC sys.sp_addextendedproperty @name = N'MS_Description',
                                @value = N'The concatenation of three properties
* Default column description
* Foreign key join
* TABLE_SUMMARY property from the referenced object.',
                                @level0type = N'SCHEMA',
                                @level0name = @SchemaName,
                                @level1type = N'VIEW',
                                @level1name = @ViewName,
                                @level2type = N'COLUMN',
                                @level2name = N'ColumnDescription';
EXEC sys.sp_addextendedproperty @name = N'MS_Description',
                                @value = N'Provides a column description based on the concatenation of three properties
* Default column description
* Foreign key join
* TABLE_SUMMARY property from the referenced object.',
                                @level0type = N'SCHEMA',
                                @level0name = @SchemaName,
                                @level1type = N'VIEW',
                                @level1name = @ViewName;
GO


