DECLARE 
	@SchemaName SYSNAME='MetaData',
	@ViewName SYSNAME = 'DefaultDescription_ForeignKey'
IF OBJECT_ID('MetaData.DefaultDescription_ForeignKey') IS NOT NULL
	BEGIN
		DROP VIEW MetaData.DefaultDescription_ForeignKey
		RAISERROR('DROPPED VIEW: %s',10,1,@ViewName)
	END
GO

CREATE VIEW MetaData.DefaultDescription_ForeignKey
AS
WITH SingleColumnFK AS (
SELECT constraint_object_id,parent_object_id
FROM sys.foreign_key_columns
GROUP BY constraint_object_id,parent_object_id
HAVING COUNT(*) = 1
)
SELECT 
	 OBJECT_SCHEMA_NAME(FKC.parent_object_id) AS SchemaName,
     OBJECT_NAME(FKC.parent_object_id) AS ObjectName,
       'TABLE' AS ObjectType,
       PC.name AS ColumnName,
	   CASE 
		WHEN FKC.parent_object_id = FKC.referenced_object_id
			THEN 'Joins back to the ' + PC.name + ' column in this table.'
			ELSE 'Join to '+FC.name + ' column in the ' +OBJECT_SCHEMA_NAME(FKC.referenced_object_id)+'.'+OBJECT_NAME(FKC.referenced_object_id) + ' table.'+ COALESCE(' ' + CAST(EP.value AS VARCHAR(MAX)),'')
			END AS ColumnDescription
FROM
	sys.foreign_key_columns AS FKC
	INNER JOIN SingleColumnFK AS SCFC
	ON SCFC.constraint_object_id = FKC.constraint_object_id
	AND SCFC.parent_object_id = FKC.parent_object_id

	INNER JOIN sys.columns AS FC
	ON FKC.referenced_object_id = FC.object_id
	AND FKC.referenced_column_id = FC.column_id

	INNER JOIN sys.columns AS PC
	ON FKC.parent_object_id = PC.object_id
	AND FKC.parent_column_id = PC.column_id

	LEFT JOIN sys.extended_properties AS EP
	ON FKC.referenced_object_id = EP.major_id
	AND EP.minor_id=0
	AND EP.name='TABLE_SUMMARY'
	
GO
RAISERROR('VIEW CREATED: %s',10,1,'MetaData.DefaultDescription_ForeignKey')
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The name of the schema in which the table resides containing the column that is the foreign key' , @level0type=N'SCHEMA',@level0name=N'MetaData', @level1type=N'VIEW',@level1name=N'DefaultDescription_ForeignKey', @level2type=N'COLUMN',@level2name=N'SchemaName'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The name of the table containing the single column foreign key reference' , @level0type=N'SCHEMA',@level0name=N'MetaData', @level1type=N'VIEW',@level1name=N'DefaultDescription_ForeignKey', @level2type=N'COLUMN',@level2name=N'ObjectName'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'TABLE' , @level0type=N'SCHEMA',@level0name=N'MetaData', @level1type=N'VIEW',@level1name=N'DefaultDescription_ForeignKey', @level2type=N'COLUMN',@level2name=N'ObjectType'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The name of the column participating in the foreign key relationship' , @level0type=N'SCHEMA',@level0name=N'MetaData', @level1type=N'VIEW',@level1name=N'DefaultDescription_ForeignKey', @level2type=N'COLUMN',@level2name=N'ColumnName'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A user friendly description of the join, plus any text in the TABLE_SUMMARY property of the referenced table.' , @level0type=N'SCHEMA',@level0name=N'MetaData', @level1type=N'VIEW',@level1name=N'DefaultDescription_ForeignKey', @level2type=N'COLUMN',@level2name=N'ColumnDescription'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Provides a user friendly description for a column within a table that describes the join of the foreign key.
It also concatenates the description from the referenced table if the referenced table has a TABLE_SUMMARY property.' , @level0type=N'SCHEMA',@level0name=N'MetaData', @level1type=N'VIEW',@level1name=N'DefaultDescription_ForeignKey'
GO


