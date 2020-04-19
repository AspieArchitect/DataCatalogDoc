#### 

[Project](../../../../index.md) > [DADSPCJUNE2014](../../../index.md) > [User databases](../../index.md) > [Redgate_SqlDataCatalog](../index.md) > [Tables](Tables.md) > dbo.TagCategoryAssetTypeApplications

# ![Tables](../../../../Images/Table32.png) [dbo].[TagCategoryAssetTypeApplications]

---

## <a name="#description"></a>MS_Description

Allows a category as held in dbo.TagCategories to be mapped to an asset type as held in dbo.AssetTypes.  The asset types are as follows.
* SQL Server Instance
* Database
* Schema
* Table
* Column

## <a name="#columns"></a>Columns

| Key | Name | Data Type | Max Length (Bytes) | Nullability | Description |
|---|---|---|---|---|---|
| [![Cluster Primary Key PK_TagCategoryAssetTypeApplications: AssetTypeId\TagCategoryId](../../../../Images/pkcluster.png)](#indexes)[![Foreign Keys FK_TagCategoryAssetTypeApplications_AssetTypes_AssetTypeId: [dbo].[AssetTypes].AssetTypeId](../../../../Images/fk.png)](#foreignkeys) | AssetTypeId | bigint | 8 | NOT NULL | _Join to Id column in the dbo.AssetTypes table. This describes the type of object within the data catalog that can be categorized
* SQL Server Instance
* Database
* Schema
* Table
* Column_ |
| [![Cluster Primary Key PK_TagCategoryAssetTypeApplications: AssetTypeId\TagCategoryId](../../../../Images/pkcluster.png)](#indexes)[![Indexes IX_TagCategoryAssetTypeApplications_TagCategoryId](../../../../Images/Index.png)](#indexes)[![Foreign Keys FK_TagCategoryAssetTypeApplications_TagCategories_TagCategoryId: [dbo].[TagCategories].TagCategoryId](../../../../Images/fk.png)](#foreignkeys) | TagCategoryId | bigint | 8 | NOT NULL | _Join to Id column in the dbo.TagCategories table.  A tag category is a grouping entity to which a number of tags can be associated._ |


---

## <a name="#uses"></a>Uses

* [[dbo].[AssetTypes]](AssetTypes.md)
* [[dbo].[TagCategories]](TagCategories.md)


---

###### Author:  david.poole

###### Copyright 2019 - All Rights Reserved

###### Created: 19 April 2020 16:29:41

