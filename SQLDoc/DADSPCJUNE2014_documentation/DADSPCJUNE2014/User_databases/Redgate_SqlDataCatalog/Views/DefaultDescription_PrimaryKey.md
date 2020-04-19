#### 

[Project](../../../../index.md) > [DADSPCJUNE2014](../../../index.md) > [User databases](../../index.md) > [Redgate_SqlDataCatalog](../index.md) > [Views](Views.md) > MetaData.DefaultDescription_PrimaryKey

# ![Views](../../../../Images/View32.png) [MetaData].[DefaultDescription_PrimaryKey]

---

## <a name="#description"></a>MS_Description

Provides a default description for a single column primary key

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| ANSI Nulls On | YES |
| Quoted Identifier On | YES |
| Created | 17:04:13 13 April 2020 |
| Last Modified | 17:04:13 13 April 2020 |


---

## <a name="#columns"></a>Columns

| Name | Data Type | Collation | Max Length (Bytes) | Description |
|---|---|---|---|---|
| SchemaName | nvarchar(128) | Latin1_General_CI_AS | 256 | _The name of the schema in which the table resides containing the column that is the primary key_ |
| ObjectName | nvarchar(128) | Latin1_General_CI_AS | 256 | _The name of the table_ |
| ObjectType | varchar(5) | Latin1_General_CI_AS | 5 | _TABLE_ |
| ColumnName | [sys].[sysname] | Latin1_General_CI_AS | 256 | _The name of the column which is the single column primary key_ |
| ColumnDescription | nvarchar(371) | Latin1_General_CI_AS_KS_WS | 742 | _The boiler plate description of the column which is the single column primary key_ |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE VIEW [MetaData].[DefaultDescription_PrimaryKey]
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
EXEC sp_addextendedproperty N'MS_Description', 'Provides a default description for a single column primary key', 'SCHEMA', N'MetaData', 'VIEW', N'DefaultDescription_PrimaryKey', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', 'The boiler plate description of the column which is the single column primary key', 'SCHEMA', N'MetaData', 'VIEW', N'DefaultDescription_PrimaryKey', 'COLUMN', N'ColumnDescription'
GO
EXEC sp_addextendedproperty N'MS_Description', 'The name of the column which is the single column primary key', 'SCHEMA', N'MetaData', 'VIEW', N'DefaultDescription_PrimaryKey', 'COLUMN', N'ColumnName'
GO
EXEC sp_addextendedproperty N'MS_Description', 'The name of the table', 'SCHEMA', N'MetaData', 'VIEW', N'DefaultDescription_PrimaryKey', 'COLUMN', N'ObjectName'
GO
EXEC sp_addextendedproperty N'MS_Description', 'TABLE', 'SCHEMA', N'MetaData', 'VIEW', N'DefaultDescription_PrimaryKey', 'COLUMN', N'ObjectType'
GO
EXEC sp_addextendedproperty N'MS_Description', 'The name of the schema in which the table resides containing the column that is the primary key', 'SCHEMA', N'MetaData', 'VIEW', N'DefaultDescription_PrimaryKey', 'COLUMN', N'SchemaName'
GO

```


---

## <a name="#uses"></a>Uses

* [MetaData](../Security/Schemas/MetaData.md)


---

## <a name="#usedby"></a>Used By

* [[MetaData].[SetDefaultDescriptions]](../Programmability/Stored_Procedures/SetDefaultDescriptions.md)


---

###### Author:  david.poole

###### Copyright 2019 - All Rights Reserved

###### Created: 19 April 2020 16:29:41

