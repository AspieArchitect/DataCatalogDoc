#### 

[Project](../../../../readme.md) > [DADSPCJUNE2014](../../../readme.md) > [User databases](../../readme.md) > [Redgate_SqlDataCatalog](../readme.md) > [Views](Views.md) > MetaData.ExistingObjectDescriptions

# ![Views](../../../../Images/View32.png) [MetaData].[ExistingObjectDescriptions]

---

## <a name="#description"></a>MS_Description

The contents of any existing MS_DESCRIPTION properties for table and views.  This is used to scavenge any existing comments into the MetaData.DataDictionary_Objects table.

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
| SchemaName | nvarchar(128) | Latin1_General_CI_AS | 256 | _The name of the schema in which the table or view containing the column resides._ |
| ObjectName | [sys].[sysname] | Latin1_General_CI_AS | 256 | _The name of the table or view_ |
| ObjectType | nvarchar(4000) | Latin1_General_CI_AS_KS_WS | 8000 | _* TABLE
* VIEW_ |
| ObjectDescription | varchar(max) | Latin1_General_CI_AS | max | _The contents of the MS_DESCRIPTION property for the table or view._ |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE VIEW [MetaData].[ExistingObjectDescriptions]
AS
SELECT OBJECT_SCHEMA_NAME(O.object_id) AS SchemaName,
       O.name AS ObjectName,
       REPLACE(O.type_desc, 'USER_', '') AS ObjectType,
       CAST(EP.value AS VARCHAR(MAX)) AS ObjectDescription
FROM sys.extended_properties AS EP
    INNER JOIN sys.objects AS O
        ON EP.major_id = O.object_id
WHERE EP.name = 'MS_DESCRIPTION'
      AND EP.class = 1
      AND EP.minor_id = 0
      AND O.type IN ( 'U', 'V' );
GO
EXEC sp_addextendedproperty N'MS_Description', 'The contents of any existing MS_DESCRIPTION properties for table and views.  This is used to scavenge any existing comments into the MetaData.DataDictionary_Objects table.', 'SCHEMA', N'MetaData', 'VIEW', N'ExistingObjectDescriptions', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', 'The contents of the MS_DESCRIPTION property for the table or view.', 'SCHEMA', N'MetaData', 'VIEW', N'ExistingObjectDescriptions', 'COLUMN', N'ObjectDescription'
GO
EXEC sp_addextendedproperty N'MS_Description', 'The name of the table or view', 'SCHEMA', N'MetaData', 'VIEW', N'ExistingObjectDescriptions', 'COLUMN', N'ObjectName'
GO
EXEC sp_addextendedproperty N'MS_Description', '* TABLE
* VIEW', 'SCHEMA', N'MetaData', 'VIEW', N'ExistingObjectDescriptions', 'COLUMN', N'ObjectType'
GO
EXEC sp_addextendedproperty N'MS_Description', 'The name of the schema in which the table or view containing the column resides.', 'SCHEMA', N'MetaData', 'VIEW', N'ExistingObjectDescriptions', 'COLUMN', N'SchemaName'
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

