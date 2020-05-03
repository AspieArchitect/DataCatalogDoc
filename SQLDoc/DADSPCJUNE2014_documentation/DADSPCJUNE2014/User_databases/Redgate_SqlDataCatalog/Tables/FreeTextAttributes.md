#### 

[Project](../../../../readme.md) > [DADSPCJUNE2014](../../../readme.md) > [User databases](../../readme.md) > [Redgate_SqlDataCatalog](../readme.md) > [Tables](Tables.md) > dbo.FreeTextAttributes

# ![Tables](../../../../Images/Table32.png) [dbo].[FreeTextAttributes]

---

## <a name="#description"></a>MS_Description

These are attributes that, when associated with a column (using dbo.ColumnFreeTextAttributes) allow brief notes to be recorded against that column

## <a name="#columns"></a>Columns

| Key | Name | Data Type | Max Length (Bytes) | Nullability | Description |
|---|---|---|---|---|---|
| [![Cluster Primary Key PK_FreeTextAttributes: Id](../../../../Images/pkcluster.png)](#indexes) | Id | bigint | 8 | NOT NULL | _The clustered primary key that uniquely identifies the dbo.FreeTextAttributes record._ |
|  | Name | nvarchar(100) | 200 | NOT NULL | _The short friendly name for the free text attribute_ |
|  | Description | nvarchar(2000) | 4000 | NULL allowed | _More detailed description, preferably intended usage notes for the free text attribute_ |
|  | CreatedAtUtc | datetime2 | 8 | NOT NULL | _The timestamp for when a record was created as a result of activity through the user interface_ |


---

## <a name="#usedby"></a>Used By

* [[dbo].[ColumnFreeTextAttributes]](ColumnFreeTextAttributes.md)


---

###### Author:  david.poole

###### Copyright 2019 - All Rights Reserved

###### Created: 03 May 2020 12:11:20

