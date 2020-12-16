#### 

[Project](../../../../readme.md) > [DADSPCJUNE2014](../../../readme.md) > [User databases](../../readme.md) > [Redgate_SqlDataCatalog](../readme.md) > [Tables](Tables.md) > dbo.TagCategories

# ![Tables](../../../../Images/Table32.png) [dbo].[TagCategories]

---

## <a name="#description"></a>MS_Description

A tag category is a grouping entity to which a number of tags can be associated.

## <a name="#columns"></a>Columns

| Key | Name | Data Type | Max Length (Bytes) | Nullability | Default | Description |
|---|---|---|---|---|---|---|
| [![Cluster Primary Key PK_TagCategories: Id](../../../../Images/pkcluster.png)](#indexes) | Id | bigint | 8 | NOT NULL |  | _The surrogate and primary key_ |
| [![Indexes IX_TagCategories_Name](../../../../Images/Index.png)](#indexes) | Name | nvarchar(100) | 200 | NOT NULL |  | _Simple label for the category.  Examples of which might be as follows.
* Applicable Regulation* Classification Scope* Environment* HIPAA Identifier* Information Type* Owner* Primary Jurisdiction* Retention Policy* Sensitivity* Treatment Intent_ |
|  | CreatedAtUtc | datetime2 | 8 | NOT NULL |  | _The timestamp for when a record was created as a result of activity through the user interface_ |
|  | Description | nvarchar(2000) | 4000 | NULL allowed |  | _Detailed description of the category_ |
|  | IsMultiValued | bit | 1 | NOT NULL | ((0)) | _When TRUE any combination of tags within the category may be attached to an attribute_ |


---

## <a name="#extendedproperties"></a>Extended Properties

| Name | Level 2 Type | Level 2 Name | Value |
|---|---|---|---|
| MS_DESCRIPTION |  |  | A tag category is a grouping entity to which a number of tags can be associated. |
| MS_DESCRIPTION | COLUMN | IsMultiValued | When TRUE any combination of tags within the category may be attached to an attribute |


---

## <a name="#usedby"></a>Used By

* [[dbo].[TagCategoryAssetTypeApplications]](TagCategoryAssetTypeApplications.md)
* [[dbo].[Tags]](Tags.md)
* [[dbo].[ColumnTagsCountPerDatabase]](../Views/ColumnTagsCountPerDatabase.md)


---

###### Author:  david.poole

###### Copyright 2019 - All Rights Reserved

###### Created: 29 November 2020 18:21:54

