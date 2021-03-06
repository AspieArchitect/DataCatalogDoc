DECLARE 
	@SchemaName SYSNAME='MetaData',
	@ViewName SYSNAME = 'DefaultDescription_PrimaryKey'
IF OBJECT_ID('MetaData.DefaultDescription_PrimaryKey') IS NOT NULL
	BEGIN
		DROP VIEW MetaData.DefaultDescription_PrimaryKey
		RAISERROR('DROPPED VIEW: %s',10,1,@ViewName)
	END
GO
CREATE VIEW MetaData.DefaultDescription_PrimaryKey
AS
WITH SingleColumnPK AS (
	SELECT I.object_id,
			I.index_id,
			MAX(LOWER(i.type_desc)) AS IndexType,
			MAX(IC.column_id) AS column_id
	FROM sys.indexes AS I
		INNER JOIN sys.index_columns AS IC
			ON IC.object_id = I.object_id
			AND IC.index_id = I.index_id
	WHERE I.is_primary_key = 1
	GROUP BY I.object_id,
				I.index_id
	HAVING COUNT(*) = 1
)
SELECT OBJECT_SCHEMA_NAME(C.object_id) AS SchemaName,
	OBJECT_NAME(C.object_id) AS ObjectName,
	'TABLE' AS ObjectType,
	C.name AS ColumnName,
	'The '+ SCPK.IndexType +' primary key that uniquely identifies the ' + OBJECT_SCHEMA_NAME(C.object_id)+'.'+OBJECT_NAME(C.object_id)+' record.' AS ColumnDescription
FROM sys.columns AS C
	INNER JOIN SingleColumnPK SCPK
	ON SCPK.object_id = C.object_id
	AND SCPK.column_id = C.column_id;
GO
RAISERROR('VIEW CREATED: %s',10,1,'MetaData.DefaultDescription_PrimaryKey')

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The name of the schema in which the table resides containing the column that is the primary key' , @level0type=N'SCHEMA',@level0name=N'MetaData', @level1type=N'VIEW',@level1name=N'DefaultDescription_PrimaryKey', @level2type=N'COLUMN',@level2name=N'SchemaName'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The name of the table' , @level0type=N'SCHEMA',@level0name=N'MetaData', @level1type=N'VIEW',@level1name=N'DefaultDescription_PrimaryKey', @level2type=N'COLUMN',@level2name=N'ObjectName'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'TABLE' , @level0type=N'SCHEMA',@level0name=N'MetaData', @level1type=N'VIEW',@level1name=N'DefaultDescription_PrimaryKey', @level2type=N'COLUMN',@level2name=N'ObjectType'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The name of the column which is the single column primary key' , @level0type=N'SCHEMA',@level0name=N'MetaData', @level1type=N'VIEW',@level1name=N'DefaultDescription_PrimaryKey', @level2type=N'COLUMN',@level2name=N'ColumnName'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The boiler plate description of the column which is the single column primary key' , @level0type=N'SCHEMA',@level0name=N'MetaData', @level1type=N'VIEW',@level1name=N'DefaultDescription_PrimaryKey', @level2type=N'COLUMN',@level2name=N'ColumnDescription'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Provides a default description for a single column primary key' , @level0type=N'SCHEMA',@level0name=N'MetaData', @level1type=N'VIEW',@level1name=N'DefaultDescription_PrimaryKey'

GO


