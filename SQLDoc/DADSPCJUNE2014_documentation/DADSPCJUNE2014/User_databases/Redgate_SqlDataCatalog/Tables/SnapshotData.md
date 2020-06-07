#### 

[Project](../../../../readme.md) > [DADSPCJUNE2014](../../../readme.md) > [User databases](../../readme.md) > [Redgate_SqlDataCatalog](../readme.md) > [Tables](Tables.md) > dbo.SnapshotData

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

###### Created: 10 May 2020 16:47:57

