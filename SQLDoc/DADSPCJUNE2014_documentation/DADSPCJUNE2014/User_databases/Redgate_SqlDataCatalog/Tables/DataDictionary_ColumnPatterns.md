#### 

[Project](../../../../readme.md) > [DADSPCJUNE2014](../../../readme.md) > [User databases](../../readme.md) > [Redgate_SqlDataCatalog](../readme.md) > [Tables](Tables.md) > MetaData.DataDictionary_ColumnPatterns

# ![Tables](../../../../Images/Table32.png) [MetaData].[DataDictionary_ColumnPatterns]

---

## <a name="#description"></a>MS_Description

Provides a broad wild card specification for retrieving a group of columns.  For example %DateKey.
		Designed to be used with MetaData.DataDictionary_ColumnDefaults to provide more descriptions for different instances of %DateKey columns.

## <a name="#columns"></a>Columns

| Key | Name | Data Type | Max Length (Bytes) | Nullability | Description |
|---|---|---|---|---|---|
| [![Cluster Primary Key PK_DataDictionary_ColumnPatterns: ColumnPatternId](../../../../Images/pkcluster.png)](#indexes) | ColumnPatternId | int | 4 | NOT NULL | _The clustered primary key that uniquely identifies the MetaData.DataDictionary_ColumnPatterns record._ |
| [![Indexes UQ_DataDictionary_ColumnPatterns](../../../../Images/Index.png)](#indexes)[![Check Constraints CK_DataDictionary_ColumnPattern : ([ColumnPattern] like '%!%%' escape '!')](../../../../Images/c-constraint.png)](#checkconstraints) | ColumnPattern | [sys].[sysname] | 256 | NOT NULL | _A broad specification for column retrieval such as %DateKey_ |


---

## <a name="#checkconstraints"></a>Check Constraints

| Name | On Column | Constraint |
|---|---|---|
| CK_DataDictionary_ColumnPattern | ColumnPattern | ([ColumnPattern] like '%!%%' escape '!') |


---

## <a name="#uses"></a>Uses

* [MetaData](../Security/Schemas/MetaData.md)


---

## <a name="#usedby"></a>Used By

* [[MetaData].[DataDictionary_ColumnDefaults]](DataDictionary_ColumnDefaults.md)
* [[MetaData].[DataDictionary_ColumnDefaultDescriptions]](../Views/DataDictionary_ColumnDefaultDescriptions.md)


---

###### Author:  david.poole

###### Copyright 2019 - All Rights Reserved

###### Created: 29 November 2020 18:21:54

