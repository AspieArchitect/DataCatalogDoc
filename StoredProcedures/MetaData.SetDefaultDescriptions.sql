IF OBJECT_ID('MetaData.SetDefaultDescriptions') IS NOT NULL
BEGIN
    DROP PROCEDURE MetaData.SetDefaultDescriptions;
    RAISERROR('PROC DROPPED: MetaData.SetDefaultDescriptions', 10, 1) WITH NOWAIT;
END;
GO
CREATE PROC MetaData.SetDefaultDescriptions
AS
SET NOCOUNT ON

EXEC MetaData.PopulateDataDictionary

UPDATE MetaData.DataDictionary_Columns
SET ColumnDescription=LTRIM(RTRIM(ColumnDescription))

UPDATE DEST
SET DEST.ColumnDescription = LTRIM(RTRIM(SRC.ColumnDescription))
FROM  MetaData.DataDictionary_Columns AS DEST
	INNER JOIN MetaData.DefaultDescription_PrimaryKey AS SRC
	ON SRC.SchemaName = DEST.SchemaName
	AND SRC.ObjectName = DEST.ObjectName
	AND SRC.ColumnName = DEST.ColumnName
WHERE DEST.ColumnDescription = ''

UPDATE DEST
SET DEST.ColumnDescription = LTRIM(RTRIM(SRC.ColumnDescription))
FROM  MetaData.DataDictionary_Columns AS DEST
	INNER JOIN MetaData.DefaultColumnAndFKDescriptions AS SRC
	ON SRC.SchemaName = DEST.SchemaName
	AND SRC.ObjectName = DEST.ObjectName
	AND SRC.ColumnName = DEST.ColumnName
WHERE DEST.ColumnDescription = ''

UPDATE DEST
SET DEST.ColumnDescription = LTRIM(RTRIM(SRC.ColumnDescription))
FROM  MetaData.DataDictionary_Columns AS DEST
	INNER JOIN MetaData.DataDictionary_StagingColumns AS SRC
	ON SRC.SchemaName = DEST.SchemaName
	AND SRC.ObjectName = DEST.ObjectName
	AND SRC.ColumnName = DEST.ColumnName
WHERE DEST.ColumnDescription = ''
GO
IF @@ERROR= 0
	    RAISERROR('PROC CREATED: MetaData.SetDefaultDescriptions', 10, 1) WITH NOWAIT;

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Populates MetaData.DataDictionary_Objects and MetaData.DataDictionary_columns tables and then applies the generated descriptions' , @level0type=N'SCHEMA',@level0name=N'MetaData', @level1type=N'PROCEDURE',@level1name=N'SetDefaultDescriptions'
GO
