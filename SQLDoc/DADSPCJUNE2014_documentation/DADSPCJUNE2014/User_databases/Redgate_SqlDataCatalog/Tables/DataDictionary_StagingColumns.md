#### 

[Project](../../../../index.md) > [DADSPCJUNE2014](../../../index.md) > [User databases](../../index.md) > [Redgate_SqlDataCatalog](../index.md) > [Tables](Tables.md) > MetaData.DataDictionary_StagingColumns

# ![Tables](../../../../Images/Table32.png) [MetaData].[DataDictionary_StagingColumns]

---

## <a name="#description"></a>MS_Description

Holds the column descriptions assembled from the distinct values within the column for that specific table

## <a name="#columns"></a>Columns

| Key | Name | Data Type | Max Length (Bytes) | Nullability | Description |
|---|---|---|---|---|---|
| [![Cluster Primary Key PK_DataDictionary_StagingColumns: SchemaName\ObjectName\ColumnName](../../../../Images/pkcluster.png)](#indexes) | SchemaName | [sys].[sysname] | 256 | NOT NULL | _The schema name in which the object containing the column resides_ |
| [![Cluster Primary Key PK_DataDictionary_StagingColumns: SchemaName\ObjectName\ColumnName](../../../../Images/pkcluster.png)](#indexes) | ObjectName | [sys].[sysname] | 256 | NOT NULL | _The table name in which the column resides_ |
| [![Cluster Primary Key PK_DataDictionary_StagingColumns: SchemaName\ObjectName\ColumnName](../../../../Images/pkcluster.png)](#indexes) | ColumnName | [sys].[sysname] | 256 | NOT NULL | _The column name for which a description has been assembled_ |
|  | ColumnDescription | varchar(7000) | 7000 | NOT NULL | _The assembled description that is a list of DISTINCT values from the column.<br />WARNING: There is no guarantee as to the order of this list._ |


---

## <a name="#uses"></a>Uses

* [MetaData](../Security/Schemas/MetaData.md)


---

## <a name="#usedby"></a>Used By

* [[MetaData].[RecordColumnStagingDescriptions]](../Programmability/Stored_Procedures/RecordColumnStagingDescriptions.md)
* [[MetaData].[SetDefaultDescriptions]](../Programmability/Stored_Procedures/SetDefaultDescriptions.md)


---

###### Author:  david.poole

###### Copyright 2019 - All Rights Reserved

###### Created: 19 April 2020 16:29:41
