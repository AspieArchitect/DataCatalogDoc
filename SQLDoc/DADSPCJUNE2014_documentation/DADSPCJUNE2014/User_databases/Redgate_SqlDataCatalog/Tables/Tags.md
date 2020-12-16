#### 

[Project](../../../../readme.md) > [DADSPCJUNE2014](../../../readme.md) > [User databases](../../readme.md) > [Redgate_SqlDataCatalog](../readme.md) > [Tables](Tables.md) > dbo.Tags

# ![Tables](../../../../Images/Table32.png) [dbo].[Tags]

---

## <a name="#description"></a>MS_Description

A tag is a label that exists within a category.  For example a tag category might be "Environment" and the tags within that category might be Development, Production, Test or UAT.

## <a name="#columns"></a>Columns

| Key | Name | Data Type | Max Length (Bytes) | Nullability | Description |
|---|---|---|---|---|---|
| [![Cluster Primary Key PK_Tags: Id](../../../../Images/pkcluster.png)](#indexes) | Id | bigint | 8 | NOT NULL | _Primary and surrogate key for the tag_ |
| [![Indexes IX_Tags_CategoryId_Name](../../../../Images/Index.png)](#indexes) | Name | nvarchar(100) | 200 | NOT NULL | _The tag is a label that can be attached to an object._ |
| [![Indexes IX_Tags_CategoryId_Name](../../../../Images/Index.png)](#indexes)[![Foreign Keys FK_Tags_TagCategories_CategoryId: [dbo].[TagCategories].CategoryId](../../../../Images/fk.png)](#foreignkeys) | CategoryId | bigint | 8 | NOT NULL | _Join to Id column in the dbo.TagCategories table. A tag category is a grouping entity to which a number of tags can be associated._ |
|  | CreatedAtUtc | datetime2 | 8 | NOT NULL | _The timestamp for when a record was created as a result of activity through the user interface_ |
|  | Description | nvarchar(2000) | 4000 | NULL allowed | _Detailed description of what the label represents_ |


---

## <a name="#uses"></a>Uses

* [[dbo].[TagCategories]](TagCategories.md)


---

## <a name="#usedby"></a>Used By

* [[dbo].[ColumnTags]](ColumnTags.md)
* [[dbo].[InstanceTags]](InstanceTags.md)
* [[dbo].[SuggestionRuleTags]](SuggestionRuleTags.md)
* [[dbo].[ColumnTagsCountPerDatabase]](../Views/ColumnTagsCountPerDatabase.md)


---

###### Author:  david.poole

###### Copyright 2019 - All Rights Reserved

###### Created: 29 November 2020 18:21:54

