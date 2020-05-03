#### 

[Project](../../../../readme.md) > [DADSPCJUNE2014](../../../readme.md) > [User databases](../../readme.md) > [Redgate_SqlDataCatalog](../readme.md) > [Views](Views.md) > MetaData.ExistingColumnDescriptions

# ![Views](../../../../Images/View32.png) [MetaData].[ExistingColumnDescriptions]

---

## <a name="#description"></a>MS_Description

The contents of any existing MS_DESCRIPTION properties for column in the table or view.  This is used to scavenge any existing comments into the MetaData.DataDictionary_Columns table.

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
| ObjectName | [sys].[sysname] | Latin1_General_CI_AS | 256 | _The table or view name in which the column resides_ |
| ObjectType | nvarchar(4000) | Latin1_General_CI_AS_KS_WS | 8000 | _* TABLE
* VIEW_ |
| ColumnName | [sys].[sysname] | Latin1_General_CI_AS | 256 | _The name of the column for which the value of the MS_DESCRIPTION will be scavenged_ |
| ColumnDescription | varchar(max) | Latin1_General_CI_AS | max | _The value of the MS_DESCRIPTION property for the column._ |


---

## <a name="#sqlscript"></a>SQL Script

```sql

CREATE VIEW [MetaData].[ExistingColumnDescriptions]
AS
SELECT OBJECT_SCHEMA_NAME(O.object_id) AS SchemaName,
       O.name AS ObjectName,
       REPLACE(O.type_desc, 'USER_', '') AS ObjectType,
       C.name AS ColumnName,
       CAST(EP.value AS VARCHAR(MAX)) AS ColumnDescription
FROM sys.extended_properties AS EP
    INNER JOIN sys.objects AS O
        ON EP.major_id = O.object_id
    INNER JOIN sys.columns AS C
        ON EP.major_id = C.object_id
           AND EP.minor_id = C.column_id
WHERE EP.name = 'MS_DESCRIPTION'
      AND EP.class = 1
      AND EP.minor_id > 0
      AND O.type IN ( 'U', 'V' );
GO
EXEC sp_addextendedproperty N'MS_Description', 'The contents of any existing MS_DESCRIPTION properties for column in the table or view.  This is used to scavenge any existing comments into the MetaData.DataDictionary_Columns table.', 'SCHEMA', N'MetaData', 'VIEW', N'ExistingColumnDescriptions', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', 'The value of the MS_DESCRIPTION property for the column.', 'SCHEMA', N'MetaData', 'VIEW', N'ExistingColumnDescriptions', 'COLUMN', N'ColumnDescription'
GO
EXEC sp_addextendedproperty N'MS_Description', 'The name of the column for which the value of the MS_DESCRIPTION will be scavenged', 'SCHEMA', N'MetaData', 'VIEW', N'ExistingColumnDescriptions', 'COLUMN', N'ColumnName'
GO
EXEC sp_addextendedproperty N'MS_Description', 'The table or view name in which the column resides', 'SCHEMA', N'MetaData', 'VIEW', N'ExistingColumnDescriptions', 'COLUMN', N'ObjectName'
GO
EXEC sp_addextendedproperty N'MS_Description', '* TABLE
* VIEW', 'SCHEMA', N'MetaData', 'VIEW', N'ExistingColumnDescriptions', 'COLUMN', N'ObjectType'
GO
EXEC sp_addextendedproperty N'MS_Description', 'The name of the schema in which the table or view containing the column resides', 'SCHEMA', N'MetaData', 'VIEW', N'ExistingColumnDescriptions', 'COLUMN', N'SchemaName'
GO

```


---

## <a name="#uses"></a>Uses

* [MetaData](../Security/Schemas/MetaData.md)


---

## <a name="#usedby"></a>Used By

* [[MetaData].[HarvestExistingDescriptions]](../Programmability/Stored_Procedures/HarvestExistingDescriptions.md)


---

###### Author:  david.poole

###### Copyright 2019 - All Rights Reserved

###### Created: 03 May 2020 12:11:20

