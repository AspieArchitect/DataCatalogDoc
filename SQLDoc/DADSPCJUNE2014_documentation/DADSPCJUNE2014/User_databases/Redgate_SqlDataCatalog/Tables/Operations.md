#### 

[Project](../../../../readme.md) > [DADSPCJUNE2014](../../../readme.md) > [User databases](../../readme.md) > [Redgate_SqlDataCatalog](../readme.md) > [Tables](Tables.md) > dbo.Operations

# ![Tables](../../../../Images/Table32.png) [dbo].[Operations]

---

## <a name="#description"></a>MS_Description

TBD

## <a name="#columns"></a>Columns

| Key | Name | Data Type | Max Length (Bytes) | Nullability | Default | Description |
|---|---|---|---|---|---|---|
| [![Cluster Primary Key PK_Operations: Id](../../../../Images/pkcluster.png)](#indexes) | Id | bigint | 8 | NOT NULL |  | _The clustered primary key that uniquely identifies the dbo.Operations record._ |
|  | StartDateUtc | datetime2 | 8 | NULL allowed |  | _The date/time at which the operation commenced.  The difference between StartDateUtc and EndDateUtc gives the duration of the operation._ |
|  | EndDateUtc | datetime2 | 8 | NULL allowed |  | _The date/time at which the operation completed.  The difference between StartDateUtc and EndDateUtc gives the duration of the operation._ |
|  | IsError | bit | 1 | NULL allowed |  | _TRUE indicates that the operation resulted in an error_ |
|  | ErrorMessage | nvarchar(max) | max | NULL allowed |  | _Any error message detected by the data catalog for this operation will appear  in this column._ |
|  | CreatedDateUtc | datetime2 | 8 | NOT NULL | ('0001-01-01T00:00:00.0000000') | _The date/time at which the operation was created._ |
|  | Status | int | 4 | NOT NULL | ((0)) | _TBD_ |


---

## <a name="#usedby"></a>Used By

* [[dbo].[Snapshots]](Snapshots.md)


---

###### Author:  david.poole

###### Copyright 2019 - All Rights Reserved

###### Created: 10 May 2020 16:47:57

