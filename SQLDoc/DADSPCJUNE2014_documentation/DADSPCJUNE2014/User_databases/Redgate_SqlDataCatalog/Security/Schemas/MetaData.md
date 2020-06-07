#### 

[Project](../../../../../readme.md) > [DADSPCJUNE2014](../../../../readme.md) > [User databases](../../../readme.md) > [Redgate_SqlDataCatalog](../../readme.md) > [Security](../readme.md) > [Schemas](Schemas.md) > MetaData

# ![Schemas](../../../../../Images/Schema32.png) MetaData

---

## <a name="#description"></a>MS_Description

Used to hold the objects used to populate object descriptions

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Owner | [dbo](../Users/dbo.md) |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE SCHEMA [MetaData]
AUTHORIZATION [dbo]
GO
EXEC sp_addextendedproperty N'MS_Description', N'Used to hold the objects used to populate object descriptions', 'SCHEMA', N'MetaData', NULL, NULL, NULL, NULL
GO

```


---

## <a name="#usedby"></a>Used By

* [[MetaData].[ColumnProfileCandidates]](../../Tables/ColumnProfileCandidates.md)
* [[MetaData].[ColumnProfileResults]](../../Tables/ColumnProfileResults.md)
* [[MetaData].[DataDictionary_ColumnDefaults]](../../Tables/DataDictionary_ColumnDefaults.md)
* [[MetaData].[DataDictionary_ColumnPatterns]](../../Tables/DataDictionary_ColumnPatterns.md)
* [[MetaData].[DataDictionary_Columns]](../../Tables/DataDictionary_Columns.md)
* [[MetaData].[DataDictionary_Objects]](../../Tables/DataDictionary_Objects.md)
* [[MetaData].[DataDictionary_StagingColumns]](../../Tables/DataDictionary_StagingColumns.md)
* [[MetaData].[DataDictionary_ColumnDefaultDescriptions]](../../Views/DataDictionary_ColumnDefaultDescriptions.md)
* [[MetaData].[DefaultColumnAndFKDescriptions]](../../Views/DefaultColumnAndFKDescriptions.md)
* [[MetaData].[DefaultDescription_ForeignKey]](../../Views/DefaultDescription_ForeignKey.md)
* [[MetaData].[DefaultDescription_PrimaryKey]](../../Views/DefaultDescription_PrimaryKey.md)
* [[MetaData].[ExistingColumnDescriptions]](../../Views/ExistingColumnDescriptions.md)
* [[MetaData].[ExistingObjectDescriptions]](../../Views/ExistingObjectDescriptions.md)
* [[MetaData].[ApplyDataDictionary]](../../Programmability/Stored_Procedures/ApplyDataDictionary.md)
* [[MetaData].[HarvestExistingDescriptions]](../../Programmability/Stored_Procedures/HarvestExistingDescriptions.md)
* [[MetaData].[PopulateColumnProfileCandidates]](../../Programmability/Stored_Procedures/PopulateColumnProfileCandidates.md)
* [[MetaData].[PopulateDataDictionary]](../../Programmability/Stored_Procedures/PopulateDataDictionary.md)
* [[MetaData].[RecordColumnStagingDescriptions]](../../Programmability/Stored_Procedures/RecordColumnStagingDescriptions.md)
* [[MetaData].[SetDefaultDescriptions]](../../Programmability/Stored_Procedures/SetDefaultDescriptions.md)
* [[MetaData].[TestDataDictionaryColumns]](../../Programmability/Stored_Procedures/TestDataDictionaryColumns.md)
* [[MetaData].[TestDataDictionaryObjects]](../../Programmability/Stored_Procedures/TestDataDictionaryObjects.md)
* [[MetaData].[UpdateDataDictionaryColumn]](../../Programmability/Stored_Procedures/UpdateDataDictionaryColumn.md)
* [[MetaData].[UpdateDataDictionaryObject]](../../Programmability/Stored_Procedures/UpdateDataDictionaryObject.md)


---

###### Author:  david.poole

###### Copyright 2019 - All Rights Reserved

###### Created: 10 May 2020 16:47:57

