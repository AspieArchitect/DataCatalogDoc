#### 

[Project](../../../../../readme.md) > [DADSPCJUNE2014](../../../../readme.md) > [User databases](../../../readme.md) > [Redgate_SqlDataCatalog](../../readme.md) > [Programmability](../readme.md) > [Stored Procedures](Stored_Procedures.md) > MetaData.HarvestExistingDescriptions

# ![Stored Procedures](../../../../../Images/StoredProcedure32.png) [MetaData].[HarvestExistingDescriptions]

---

## <a name="#description"></a>MS_Description

Grabs any existing MS_DESCRIPTION values and applies them to MetaData.DataDictionary_Objects or MetaData.DataDictionary_Columns as appropriate

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| ANSI Nulls On | YES |
| Quoted Identifier On | YES |


---

## <a name="#sqlscript"></a>SQL Script

```sql

CREATE PROC [MetaData].[HarvestExistingDescriptions]
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
EXEC sp_addextendedproperty N'MS_Description', N'Grabs any existing MS_DESCRIPTION values and applies them to MetaData.DataDictionary_Objects or MetaData.DataDictionary_Columns as appropriate', 'SCHEMA', N'MetaData', 'PROCEDURE', N'HarvestExistingDescriptions', NULL, NULL
GO

```


---

## <a name="#uses"></a>Uses

* [[MetaData].[DataDictionary_Columns]](../../Tables/DataDictionary_Columns.md)
* [[MetaData].[DataDictionary_Objects]](../../Tables/DataDictionary_Objects.md)
* [[MetaData].[ExistingColumnDescriptions]](../../Views/ExistingColumnDescriptions.md)
* [[MetaData].[ExistingObjectDescriptions]](../../Views/ExistingObjectDescriptions.md)
* [MetaData](../../Security/Schemas/MetaData.md)


---

## <a name="#usedby"></a>Used By

* [[MetaData].[TestDataDictionaryColumns]](TestDataDictionaryColumns.md)
* [[MetaData].[TestDataDictionaryObjects]](TestDataDictionaryObjects.md)


---

###### Author:  david.poole

###### Copyright 2019 - All Rights Reserved

###### Created: 10 May 2020 16:47:57

