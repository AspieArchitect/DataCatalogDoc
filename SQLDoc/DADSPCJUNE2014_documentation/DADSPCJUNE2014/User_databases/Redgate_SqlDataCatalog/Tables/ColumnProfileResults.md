#### 

[Project](../../../../readme.md) > [DADSPCJUNE2014](../../../readme.md) > [User databases](../../readme.md) > [Redgate_SqlDataCatalog](../readme.md) > [Tables](Tables.md) > MetaData.ColumnProfileResults

# ![Tables](../../../../Images/Table32.png) [MetaData].[ColumnProfileResults]

---

## <a name="#description"></a>MS_Description

Contains the COUNT(DISTINCT {column name}) for the given column within the table.  This is intended to allow a list of values from the column to be used to build up the description.

## <a name="#columns"></a>Columns

| Key | Name | Data Type | Max Length (Bytes) | Nullability | Description |
|---|---|---|---|---|---|
| [![Cluster Primary Key PK_MetaData_ColumnProfileResults: SchemaName\ObjectName\ColumnName](../../../../Images/pkcluster.png)](#indexes) | SchemaName | [sys].[sysname] | 256 | NOT NULL | _The schema name in which the tablecontaining the column resides_ |
| [![Cluster Primary Key PK_MetaData_ColumnProfileResults: SchemaName\ObjectName\ColumnName](../../../../Images/pkcluster.png)](#indexes) | ObjectName | [sys].[sysname] | 256 | NOT NULL | _The name of the table_ |
| [![Cluster Primary Key PK_MetaData_ColumnProfileResults: SchemaName\ObjectName\ColumnName](../../../../Images/pkcluster.png)](#indexes) | ColumnName | [sys].[sysname] | 256 | NOT NULL | _The name of the column _ |
|  | NumberOfValues | bigint | 8 | NOT NULL | _The COUNT(DISTINCT {column name})_ |


---

## <a name="#uses"></a>Uses

* [MetaData](../Security/Schemas/MetaData.md)


---

## <a name="#usedby"></a>Used By

* [[MetaData].[RecordColumnStagingDescriptions]](../Programmability/Stored_Procedures/RecordColumnStagingDescriptions.md)


---

###### Author:  david.poole

###### Copyright 2019 - All Rights Reserved

###### Created: 03 May 2020 12:11:20

