#### 

[Project](../../../../readme.md) > [DADSPCJUNE2014](../../../readme.md) > [User databases](../../readme.md) > [Redgate_SqlDataCatalog](../readme.md) > [Tables](Tables.md) > dbo.ColumnTags

# ![Tables](../../../../Images/Table32.png) [dbo].[ColumnTags]

---

## <a name="#description"></a>MS_Description

Associates a dbo.Tags record with a dbo.Columns record.

## <a name="#columns"></a>Columns

| Key | Name | Data Type | Max Length (Bytes) | Nullability | Description |
|---|---|---|---|---|---|
| [![Cluster Primary Key PK_ColumnTags: ColumnId\TagId](../../../../Images/pkcluster.png)](#indexes)[![Foreign Keys FK_ColumnTags_Columns_ColumnId: [dbo].[Columns].ColumnId](../../../../Images/fk.png)](#foreignkeys) | ColumnId | bigint | 8 | NOT NULL | _Join to Id column in the dbo.Columns table._ |
| [![Cluster Primary Key PK_ColumnTags: ColumnId\TagId](../../../../Images/pkcluster.png)](#indexes)[![Indexes IX_ColumnTags_TagId](../../../../Images/Index.png)](#indexes)[![Foreign Keys FK_ColumnTags_Tags_TagId: [dbo].[Tags].TagId](../../../../Images/fk.png)](#foreignkeys) | TagId | bigint | 8 | NOT NULL | _Join to Id column in the dbo.Tags table._ |
|  | AnnotatedAtUtc | datetime2 | 8 | NOT NULL | _The timestamp for when a tag was associated with an object such as an instance, column or a free text attribute_ |


---

## <a name="#uses"></a>Uses

* [[dbo].[Columns]](Columns.md)
* [[dbo].[Tags]](Tags.md)


---

## <a name="#usedby"></a>Used By

* [[dbo].[ColumnTagsCountPerDatabase]](../Views/ColumnTagsCountPerDatabase.md)


---

###### Author:  david.poole

###### Copyright 2019 - All Rights Reserved

###### Created: 03 May 2020 12:11:20

