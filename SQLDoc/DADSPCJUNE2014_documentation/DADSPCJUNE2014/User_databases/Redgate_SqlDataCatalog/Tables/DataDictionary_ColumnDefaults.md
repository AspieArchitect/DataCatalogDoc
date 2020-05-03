#### 

[Project](../../../../readme.md) > [DADSPCJUNE2014](../../../readme.md) > [User databases](../../readme.md) > [Redgate_SqlDataCatalog](../readme.md) > [Tables](Tables.md) > MetaData.DataDictionary_ColumnDefaults

# ![Tables](../../../../Images/Table32.png) [MetaData].[DataDictionary_ColumnDefaults]

---

## <a name="#description"></a>MS_Description

Provides the default description for columns of a specific name related back to the MetaData.DataDictionary_ColumnPatterns record.  For example
		* DateKey
		* DueDateKey
		* OrderDateKey
		* ShipDateKey

## <a name="#columns"></a>Columns

| Key | Name | Data Type | Max Length (Bytes) | Nullability | Default | Description |
|---|---|---|---|---|---|---|
| [![Cluster Primary Key PK_DataDictionary_ColumnDefaults: ColumnName](../../../../Images/pkcluster.png)](#indexes) | ColumnName | [sys].[sysname] | 256 | NOT NULL |  | _The name of the column (and natural key) for which a default description will be attached._ |
| [![Foreign Keys FK_DataDictinary_ColumnDefaults_ColumnPattern: [MetaData].[DataDictionary_ColumnPatterns].ColumnPatternId](../../../../Images/fk.png)](#foreignkeys) | ColumnPatternId | int | 4 | NOT NULL |  | _Join to ColumnPatternId column in the MetaData.DataDictionary_ColumnPatterns table._ |
|  | ColumnDescription | varchar(7000) | 7000 | NOT NULL | ('') | _The user friendly description of the column that will be used for all columns that share this name._ |


---

## <a name="#uses"></a>Uses

* [[MetaData].[DataDictionary_ColumnPatterns]](DataDictionary_ColumnPatterns.md)
* [MetaData](../Security/Schemas/MetaData.md)


---

## <a name="#usedby"></a>Used By

* [[MetaData].[DataDictionary_ColumnDefaultDescriptions]](../Views/DataDictionary_ColumnDefaultDescriptions.md)


---

###### Author:  david.poole

###### Copyright 2019 - All Rights Reserved

###### Created: 03 May 2020 12:11:20

