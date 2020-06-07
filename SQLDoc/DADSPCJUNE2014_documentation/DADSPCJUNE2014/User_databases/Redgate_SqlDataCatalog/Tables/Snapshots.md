#### 

[Project](../../../../readme.md) > [DADSPCJUNE2014](../../../readme.md) > [User databases](../../readme.md) > [Redgate_SqlDataCatalog](../readme.md) > [Tables](Tables.md) > dbo.Snapshots

# ![Tables](../../../../Images/Table32.png) [dbo].[Snapshots]

---

## <a name="#description"></a>MS_Description

Snapshots of the estate are taken weekly on a Sunday.

## <a name="#columns"></a>Columns

| Key | Name | Data Type | Max Length (Bytes) | Nullability | Default | Description |
|---|---|---|---|---|---|---|
| [![Cluster Primary Key PK_Snapshots: Id](../../../../Images/pkcluster.png)](#indexes) | Id | bigint | 8 | NOT NULL |  | _The clustered primary key that uniquely identifies the dbo.Snapshots record._ |
|  | Discriminator | nvarchar(max) | max | NOT NULL |  | _The name of the type of snapshot being performed.
* EstateSnapshotEfEntity
* InstanceSnapshotEfEntity_ |
|  | InstanceId | bigint | 8 | NULL allowed |  | _Join to dbo.Intances that identifies the SQL Server Instance or Availability Group Listener to which the InstanceSnapshotEfEntity snapshot refers._ |
|  | InstanceName | nvarchar(max) | max | NULL allowed |  | _The name of the SQL Server Instance or Availability Group Listener at the time the InstanceSnapshotEfEntity snapshot occurred._ |
| [![Indexes IX_Snapshots_SnapshotDataSha256Hash](../../../../Images/Index.png)](#indexes)[![Foreign Keys FK_Snapshots_SnapshotData_SnapshotDataSha256Hash: [dbo].[SnapshotData].SnapshotDataSha256Hash](../../../../Images/fk.png)](#foreignkeys) | SnapshotDataSha256Hash | nvarchar(48) | 96 | NULL allowed |  | _Join to Sha256Hash column in the dbo.SnapshotData table._ |
| [![Indexes IX_Snapshots_EstateSnapshotId](../../../../Images/Index.png)](#indexes)[![Foreign Keys FK_Snapshots_Snapshots_EstateSnapshotId: [dbo].[Snapshots].EstateSnapshotId](../../../../Images/fk.png)](#foreignkeys) | EstateSnapshotId | bigint | 8 | NULL allowed |  | _Joins back to the EstateSnapshotId column in this table._ |
| [![Indexes IX_Snapshots_OperationId](../../../../Images/Index.png)](#indexes)[![Foreign Keys FK_Snapshots_Operations_OperationId: [dbo].[Operations].OperationId](../../../../Images/fk.png)](#foreignkeys) | OperationId | bigint | 8 | NOT NULL | (CONVERT([bigint],(0))) | _Join to Id column in the dbo.Operations table._ |


---

## <a name="#uses"></a>Uses

* [[dbo].[Operations]](Operations.md)
* [[dbo].[SnapshotData]](SnapshotData.md)


---

###### Author:  david.poole

###### Copyright 2019 - All Rights Reserved

###### Created: 10 May 2020 16:47:57

