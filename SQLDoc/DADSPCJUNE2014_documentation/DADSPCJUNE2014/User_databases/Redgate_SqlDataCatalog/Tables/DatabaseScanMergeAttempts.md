#### 

[Project](../../../../readme.md) > [DADSPCJUNE2014](../../../readme.md) > [User databases](../../readme.md) > [Redgate_SqlDataCatalog](../readme.md) > [Tables](Tables.md) > dbo.DatabaseScanMergeAttempts

# ![Tables](../../../../Images/Table32.png) [dbo].[DatabaseScanMergeAttempts]

---

## <a name="#description"></a>MS_Description

Records when an attempt was made to merge the contents of a database scan into the catalogue

## <a name="#columns"></a>Columns

| Key | Name | Data Type | Max Length (Bytes) | Nullability | Description |
|---|---|---|---|---|---|
| [![Cluster Primary Key PK_DatabaseScanMergeAttempts: Id](../../../../Images/pkcluster.png)](#indexes) | Id | bigint | 8 | NOT NULL | _The clustered primary key that uniquely identifies the dbo.DatabaseScanMergeAttempts record._ |
| [![Indexes IX_DatabaseScanMergeAttempts_DatabaseScanId](../../../../Images/Index.png)](#indexes)[![Foreign Keys FK_DatabaseScanMergeAttempts_DatabaseScans_DatabaseScanId: [dbo].[DatabaseScans].DatabaseScanId](../../../../Images/fk.png)](#foreignkeys) | DatabaseScanId | bigint | 8 | NOT NULL | _Join to Id column in the dbo.DatabaseScans table._ |
|  | StartedAtUtc | datetime2 | 8 | NOT NULL | _The timestamp for when the process of merging of results for a database scan with the catalog was innitiated_ |
|  | CompletedAtUtc | datetime2 | 8 | NULL allowed | _The timestamp for when the process of merging of results for a database scan with the catalog was completed.  The difference between the CompletedAtUtc and StartedAtUtc reveals the execution time for the merge process._ |
|  | ErrorMessage | nvarchar(max) | max | NULL allowed | _TBD_ |


---

## <a name="#uses"></a>Uses

* [[dbo].[DatabaseScans]](DatabaseScans.md)


---

###### Author:  david.poole

###### Copyright 2019 - All Rights Reserved

###### Created: 03 May 2020 12:11:20

