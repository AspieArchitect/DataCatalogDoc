IF OBJECT_ID('MetaData.HarvestExistingDescriptions') IS NOT NULL
BEGIN
    DROP PROCEDURE MetaData.HarvestExistingDescriptions;
    RAISERROR('PROC DROPPED: MetaData.HarvestExistingDescriptions', 10, 1) WITH NOWAIT;
END;
GO

CREATE PROC MetaData.HarvestExistingDescriptions
AS
SET NOCOUNT ON

UPDATE DEST
SET DEST.ObjectDescription = SRC.ObjectDescription
FROM MetaData.ExistingObjectDescriptions AS SRC
	INNER JOIN MetaData.DataDictionary_Objects AS DEST
	ON DEST.SchemaName = SRC.SchemaName
	AND DEST.ObjectName = SRC.ObjectName
WHERE DEST.ObjectDescription=''

RAISERROR('%d Object Descriptions harvested',10,1,@@ROWCOUNT) WITH NOWAIT

UPDATE DEST
SET DEST.ColumnDescription = SRC.ColumnDescription
FROM MetaData.ExistingColumnDescriptions AS SRC
	INNER JOIN MetaData.DataDictionary_Columns AS DEST
	ON DEST.SchemaName = SRC.SchemaName
	AND DEST.ObjectName = SRC.ObjectName
	AND DEST.ColumnName = SRC.ColumnName
WHERE DEST.ColumnDescription=''

RAISERROR('%d Column Descriptions harvested',10,1,@@ROWCOUNT) WITH NOWAIT

GO
IF @@ERROR=0
    RAISERROR('PROC CREATED: MetaData.HarvestExistingDescriptions', 10, 1) WITH NOWAIT;

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Grabs any existing MS_DESCRIPTION values and applies them to MetaData.DataDictionary_Objects or MetaData.DataDictionary_Columns as appropriate' , @level0type=N'SCHEMA',@level0name=N'MetaData', @level1type=N'PROCEDURE',@level1name=N'HarvestExistingDescriptions'
GO

