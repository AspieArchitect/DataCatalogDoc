#### 

[Project](../../../../../readme.md) > [DADSPCJUNE2014](../../../../readme.md) > [User databases](../../../readme.md) > [Redgate_SqlDataCatalog](../../readme.md) > [Programmability](../readme.md) > [Stored Procedures](Stored_Procedures.md) > MetaData.SetDefaultDescriptions

# ![Stored Procedures](../../../../../Images/StoredProcedure32.png) [MetaData].[SetDefaultDescriptions]

---

## <a name="#description"></a>MS_Description

Populates MetaData.DataDictionary_Objects and MetaData.DataDictionary_columns tables and then applies the generated descriptions

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| ANSI Nulls On | YES |
| Quoted Identifier On | YES |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE PROC [MetaData].[SetDefaultDescriptions]
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
EXEC sp_addextendedproperty N'MS_Description', N'Populates MetaData.DataDictionary_Objects and MetaData.DataDictionary_columns tables and then applies the generated descriptions', 'SCHEMA', N'MetaData', 'PROCEDURE', N'SetDefaultDescriptions', NULL, NULL
GO

```


---

## <a name="#uses"></a>Uses

* [[MetaData].[DataDictionary_Columns]](../../Tables/DataDictionary_Columns.md)
* [[MetaData].[DataDictionary_StagingColumns]](../../Tables/DataDictionary_StagingColumns.md)
* [[MetaData].[DefaultColumnAndFKDescriptions]](../../Views/DefaultColumnAndFKDescriptions.md)
* [[MetaData].[DefaultDescription_PrimaryKey]](../../Views/DefaultDescription_PrimaryKey.md)
* [[MetaData].[PopulateDataDictionary]](PopulateDataDictionary.md)
* [MetaData](../../Security/Schemas/MetaData.md)


---

###### Author:  david.poole

###### Copyright 2019 - All Rights Reserved

###### Created: 10 May 2020 16:47:57

