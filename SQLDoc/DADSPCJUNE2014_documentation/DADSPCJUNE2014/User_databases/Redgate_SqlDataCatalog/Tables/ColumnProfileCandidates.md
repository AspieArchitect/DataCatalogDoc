#### 

[Project](../../../../index.md) > [DADSPCJUNE2014](../../../index.md) > [User databases](../../index.md) > [Redgate_SqlDataCatalog](../index.md) > [Tables](Tables.md) > MetaData.ColumnProfileCandidates

# ![Tables](../../../../Images/Table32.png) [MetaData].[ColumnProfileCandidates]

---

## <a name="#description"></a>MS_Description

A list of columns within tables that are (N)CHAR or (N)VARCHAR  and between 1 and 100 characters long.  An approximate row count is provided to forewarn when profiling activity might require consideration for the load on the system being profiled.

## <a name="#columns"></a>Columns

| Key | Name | Data Type | Max Length (Bytes) | Nullability | Default | Description |
|---|---|---|---|---|---|---|
| [![Cluster Primary Key PK_MetaData_ColumnProfileCandidates: SchemaName\ObjectName\ColumnName](../../../../Images/pkcluster.png)](#indexes) | SchemaName | [sys].[sysname] | 256 | NOT NULL |  | _The schema name in which the object containing the column resides_ |
| [![Cluster Primary Key PK_MetaData_ColumnProfileCandidates: SchemaName\ObjectName\ColumnName](../../../../Images/pkcluster.png)](#indexes) | ObjectName | [sys].[sysname] | 256 | NOT NULL |  | _The table name_ |
| [![Cluster Primary Key PK_MetaData_ColumnProfileCandidates: SchemaName\ObjectName\ColumnName](../../../../Images/pkcluster.png)](#indexes) | ColumnName | [sys].[sysname] | 256 | NOT NULL |  | _The name of the column within the table_ |
|  | ApproximateRows | bigint | 8 | NOT NULL |  | _The approximate row count as extracted from sysindexes.rows_ |
|  | IncludeForProfiling | bit | 1 | NOT NULL | ((1)) | _0 = Exclude from profiling 1 = Include for profiling_ |


---

## <a name="#uses"></a>Uses

* [MetaData](../Security/Schemas/MetaData.md)


---

## <a name="#usedby"></a>Used By

* [[MetaData].[PopulateColumnProfileCandidates]](../Programmability/Stored_Procedures/PopulateColumnProfileCandidates.md)


---

###### Author:  david.poole

###### Copyright 2019 - All Rights Reserved

###### Created: 19 April 2020 16:29:41

