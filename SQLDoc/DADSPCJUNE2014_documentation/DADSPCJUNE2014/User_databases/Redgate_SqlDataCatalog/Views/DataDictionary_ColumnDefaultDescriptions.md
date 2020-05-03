#### 

[Project](../../../../readme.md) > [DADSPCJUNE2014](../../../readme.md) > [User databases](../../readme.md) > [Redgate_SqlDataCatalog](../readme.md) > [Views](Views.md) > MetaData.DataDictionary_ColumnDefaultDescriptions

# ![Views](../../../../Images/View32.png) [MetaData].[DataDictionary_ColumnDefaultDescriptions]

---

## <a name="#description"></a>MS_Description

Provides default descriptions for columns based on a broad column retrieval pattern and a specific column name for items within that pattern.

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
| SchemaName | nvarchar(128) | Latin1_General_CI_AS | 256 | _The name of the schema in which the table or view containing the column resides_ |
| ObjectName | [sys].[sysname] | Latin1_General_CI_AS | 256 | _The name of the table or view_ |
| ObjectType | nvarchar(4000) | Latin1_General_CI_AS_KS_WS | 8000 | _* TABLE
* VIEW_ |
| ColumnName | [sys].[sysname] | Latin1_General_CI_AS | 256 | _The name of the column for which a description will be provided_ |
| ColumnDescription | nvarchar(4000) | Latin1_General_CI_AS | 8000 | _The user friendly description for the column_ |


---

## <a name="#sqlscript"></a>SQL Script

```sql

CREATE VIEW [MetaData].[DataDictionary_ColumnDefaultDescriptions]
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
EXEC sp_addextendedproperty N'MS_Description', 'Provides default descriptions for columns based on a broad column retrieval pattern and a specific column name for items within that pattern.', 'SCHEMA', N'MetaData', 'VIEW', N'DataDictionary_ColumnDefaultDescriptions', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', 'The user friendly description for the column', 'SCHEMA', N'MetaData', 'VIEW', N'DataDictionary_ColumnDefaultDescriptions', 'COLUMN', N'ColumnDescription'
GO
EXEC sp_addextendedproperty N'MS_Description', 'The name of the column for which a description will be provided', 'SCHEMA', N'MetaData', 'VIEW', N'DataDictionary_ColumnDefaultDescriptions', 'COLUMN', N'ColumnName'
GO
EXEC sp_addextendedproperty N'MS_Description', 'The name of the table or view', 'SCHEMA', N'MetaData', 'VIEW', N'DataDictionary_ColumnDefaultDescriptions', 'COLUMN', N'ObjectName'
GO
EXEC sp_addextendedproperty N'MS_Description', '* TABLE
* VIEW', 'SCHEMA', N'MetaData', 'VIEW', N'DataDictionary_ColumnDefaultDescriptions', 'COLUMN', N'ObjectType'
GO
EXEC sp_addextendedproperty N'MS_Description', 'The name of the schema in which the table or view containing the column resides', 'SCHEMA', N'MetaData', 'VIEW', N'DataDictionary_ColumnDefaultDescriptions', 'COLUMN', N'SchemaName'
GO

```


---

## <a name="#uses"></a>Uses

* [[MetaData].[DataDictionary_ColumnDefaults]](../Tables/DataDictionary_ColumnDefaults.md)
* [[MetaData].[DataDictionary_ColumnPatterns]](../Tables/DataDictionary_ColumnPatterns.md)
* [MetaData](../Security/Schemas/MetaData.md)


---

## <a name="#usedby"></a>Used By

* [[MetaData].[DefaultColumnAndFKDescriptions]](DefaultColumnAndFKDescriptions.md)


---

###### Author:  david.poole

###### Copyright 2019 - All Rights Reserved

###### Created: 03 May 2020 12:11:20

