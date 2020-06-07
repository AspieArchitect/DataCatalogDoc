#### 

[Project](../../../../readme.md) > [DADSPCJUNE2014](../../../readme.md) > [User databases](../../readme.md) > [Redgate_SqlDataCatalog](../readme.md) > [Tables](Tables.md) > dbo.InstanceTags

# ![Tables](../../../../Images/Table32.png) [dbo].[InstanceTags]

---

## <a name="#description"></a>MS_Description

Associates a tag from the dbo.Tags table with a DB server instance as held in the dbo.Instances table.  A tag is a label that exists within a category.  For example a tag category might be "Environment" and the tags within that category might be Development, Production, Test or UAT.

## <a name="#columns"></a>Columns

| Key | Name | Data Type | Max Length (Bytes) | Nullability | Description |
|---|---|---|---|---|---|
| [![Cluster Primary Key PK_InstanceTags: InstanceId\TagId](../../../../Images/pkcluster.png)](#indexes)[![Foreign Keys FK_InstanceTags_Instances_InstanceId: [dbo].[Instances].InstanceId](../../../../Images/fk.png)](#foreignkeys) | InstanceId | bigint | 8 | NOT NULL | _Join to Id column in the dbo.Instances table.  This lists the SQL Server instances registered in the Redgate Data Catalog_ |
| [![Cluster Primary Key PK_InstanceTags: InstanceId\TagId](../../../../Images/pkcluster.png)](#indexes)[![Indexes IX_InstanceTags_TagId](../../../../Images/Index.png)](#indexes)[![Foreign Keys FK_InstanceTags_Tags_TagId: [dbo].[Tags].TagId](../../../../Images/fk.png)](#foreignkeys) | TagId | bigint | 8 | NOT NULL | _Join to Id column in the dbo.Tags table._ |
|  | AnnotatedAtUtc | datetime2 | 8 | NOT NULL | _The timestamp for when a tag was associated with an object such as an instance, column or a free text attribute_ |


---

## <a name="#uses"></a>Uses

* [[dbo].[Instances]](Instances.md)
* [[dbo].[Tags]](Tags.md)


---

###### Author:  david.poole

###### Copyright 2019 - All Rights Reserved

###### Created: 10 May 2020 16:47:57

