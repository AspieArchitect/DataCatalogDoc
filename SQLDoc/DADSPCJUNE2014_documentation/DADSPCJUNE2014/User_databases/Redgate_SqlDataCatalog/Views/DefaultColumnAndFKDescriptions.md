#### 

[Project](../../../../readme.md) > [DADSPCJUNE2014](../../../readme.md) > [User databases](../../readme.md) > [Redgate_SqlDataCatalog](../readme.md) > [Views](Views.md) > MetaData.DefaultColumnAndFKDescriptions

# ![Views](../../../../Images/View32.png) [MetaData].[DefaultColumnAndFKDescriptions]

---

## <a name="#description"></a>MS_Description

Provides a column description based on the concatenation of three properties
* Default column description
* Foreign key join
* TABLE_SUMMARY property from the referenced object.

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
| SchemaName | nvarchar(128) | 256 | _The name of the schema in which the table containing the column resides_ |
| ObjectName | nvarchar(128) | 256 | _The name of the table containing the column_ |
| ColumnName | [sys].[sysname] | 256 | _The column name for which a full description is generated_ |
| ColumnDescription | nvarchar(max) | max | _The concatenation of three properties
* Default column description
* Foreign key join
* TABLE_SUMMARY property from the referenced object._ |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE VIEW [MetaData].[DefaultColumnAndFKDescriptions]
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
EXEC sp_addextendedproperty N'MS_Description', 'Provides a column description based on the concatenation of three properties
* Default column description
* Foreign key join
* TABLE_SUMMARY property from the referenced object.', 'SCHEMA', N'MetaData', 'VIEW', N'DefaultColumnAndFKDescriptions', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', 'The concatenation of three properties
* Default column description
* Foreign key join
* TABLE_SUMMARY property from the referenced object.', 'SCHEMA', N'MetaData', 'VIEW', N'DefaultColumnAndFKDescriptions', 'COLUMN', N'ColumnDescription'
GO
EXEC sp_addextendedproperty N'MS_Description', 'The column name for which a full description is generated', 'SCHEMA', N'MetaData', 'VIEW', N'DefaultColumnAndFKDescriptions', 'COLUMN', N'ColumnName'
GO
EXEC sp_addextendedproperty N'MS_Description', 'The name of the table containing the column', 'SCHEMA', N'MetaData', 'VIEW', N'DefaultColumnAndFKDescriptions', 'COLUMN', N'ObjectName'
GO
EXEC sp_addextendedproperty N'MS_Description', 'The name of the schema in which the table containing the column resides', 'SCHEMA', N'MetaData', 'VIEW', N'DefaultColumnAndFKDescriptions', 'COLUMN', N'SchemaName'
GO

```


---

## <a name="#uses"></a>Uses

* [[MetaData].[DataDictionary_ColumnDefaultDescriptions]](DataDictionary_ColumnDefaultDescriptions.md)
* [[MetaData].[DefaultDescription_ForeignKey]](DefaultDescription_ForeignKey.md)
* [MetaData](../Security/Schemas/MetaData.md)


---

## <a name="#usedby"></a>Used By

* [[MetaData].[SetDefaultDescriptions]](../Programmability/Stored_Procedures/SetDefaultDescriptions.md)


---

###### Author:  david.poole

###### Copyright 2019 - All Rights Reserved

###### Created: 03 May 2020 12:11:20

