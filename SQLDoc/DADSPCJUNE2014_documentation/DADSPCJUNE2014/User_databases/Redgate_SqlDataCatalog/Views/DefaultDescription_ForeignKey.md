#### 

[Project](../../../../readme.md) > [DADSPCJUNE2014](../../../readme.md) > [User databases](../../readme.md) > [Redgate_SqlDataCatalog](../readme.md) > [Views](Views.md) > MetaData.DefaultDescription_ForeignKey

# ![Views](../../../../Images/View32.png) [MetaData].[DefaultDescription_ForeignKey]

---

## <a name="#description"></a>MS_Description

Provides a user friendly description for a column within a table that describes the join of the foreign key.
It also concatenates the description from the referenced table if the referenced table has a TABLE_SUMMARY property.

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Collation | Latin1_General_CI_AS |
| ANSI Nulls On | YES |
| Quoted Identifier On | YES |
| Created | 17:04:13 13 April 2020 |
| Last Modified | 17:04:13 13 April 2020 |


---

## <a name="#columns"></a>Columns

| Name | Data Type | Max Length (Bytes) | Description |
|---|---|---|---|
| SchemaName | nvarchar(128) | 256 | _The name of the schema in which the table resides containing the column that is the foreign key_ |
| ObjectName | nvarchar(128) | 256 | _The name of the table containing the single column foreign key reference_ |
| ObjectType | varchar(5) | 5 | _TABLE_ |
| ColumnName | [sys].[sysname] | 256 | _The name of the column participating in the foreign key relationship_ |
| ColumnDescription | nvarchar(max) | max | _A user friendly description of the join, plus any text in the TABLE_SUMMARY property of the referenced table._ |


---

## <a name="#sqlscript"></a>SQL Script

```sql

CREATE VIEW [MetaData].[DefaultDescription_ForeignKey]
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
EXEC sp_addextendedproperty N'MS_Description', 'Provides a user friendly description for a column within a table that describes the join of the foreign key.
It also concatenates the description from the referenced table if the referenced table has a TABLE_SUMMARY property.', 'SCHEMA', N'MetaData', 'VIEW', N'DefaultDescription_ForeignKey', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', 'A user friendly description of the join, plus any text in the TABLE_SUMMARY property of the referenced table.', 'SCHEMA', N'MetaData', 'VIEW', N'DefaultDescription_ForeignKey', 'COLUMN', N'ColumnDescription'
GO
EXEC sp_addextendedproperty N'MS_Description', 'The name of the column participating in the foreign key relationship', 'SCHEMA', N'MetaData', 'VIEW', N'DefaultDescription_ForeignKey', 'COLUMN', N'ColumnName'
GO
EXEC sp_addextendedproperty N'MS_Description', 'The name of the table containing the single column foreign key reference', 'SCHEMA', N'MetaData', 'VIEW', N'DefaultDescription_ForeignKey', 'COLUMN', N'ObjectName'
GO
EXEC sp_addextendedproperty N'MS_Description', 'TABLE', 'SCHEMA', N'MetaData', 'VIEW', N'DefaultDescription_ForeignKey', 'COLUMN', N'ObjectType'
GO
EXEC sp_addextendedproperty N'MS_Description', 'The name of the schema in which the table resides containing the column that is the foreign key', 'SCHEMA', N'MetaData', 'VIEW', N'DefaultDescription_ForeignKey', 'COLUMN', N'SchemaName'
GO

```


---

## <a name="#uses"></a>Uses

* [MetaData](../Security/Schemas/MetaData.md)


---

## <a name="#usedby"></a>Used By

* [[MetaData].[DefaultColumnAndFKDescriptions]](DefaultColumnAndFKDescriptions.md)


---

###### Author:  david.poole

###### Copyright 2019 - All Rights Reserved

###### Created: 29 November 2020 18:21:54

