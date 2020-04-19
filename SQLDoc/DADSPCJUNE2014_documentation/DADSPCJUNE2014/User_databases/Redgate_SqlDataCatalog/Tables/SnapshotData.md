#### 

[Project](../../../../index.md) > [DADSPCJUNE2014](../../../index.md) > [User databases](../../index.md) > [Redgate_SqlDataCatalog](../index.md) > [Tables](Tables.md) > dbo.SnapshotData

# ![Tables](../../../../Images/Table32.png) [dbo].[SnapshotData]

---

## <a name="#description"></a>MS_Description

TBC

## <a name="#columns"></a>Columns

| Key | Name | Data Type | Max Length (Bytes) | Nullability | Description |
|---|---|---|---|---|---|
| [![Cluster Primary Key PK_SnapshotData: Sha256Hash](../../../../Images/pkcluster.png)](#indexes) | Sha256Hash | nvarchar(48) | 96 | NOT NULL | _The clustered primary key that uniquely identifies the dbo.SnapshotData record._ |
|  | Data | varbinary(max) | max | NOT NULL | _TBD_ |


---

## <a name="#usedby"></a>Used By

* [[dbo].[Snapshots]](Snapshots.md)


---

###### Author:  david.poole

###### Copyright 2019 - All Rights Reserved

###### Created: 19 April 2020 16:29:41

