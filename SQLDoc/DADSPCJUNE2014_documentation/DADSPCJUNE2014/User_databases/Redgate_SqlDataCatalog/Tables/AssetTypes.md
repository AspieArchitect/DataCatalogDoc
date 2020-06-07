#### 

[Project](../../../../readme.md) > [DADSPCJUNE2014](../../../readme.md) > [User databases](../../readme.md) > [Redgate_SqlDataCatalog](../readme.md) > [Tables](Tables.md) > dbo.AssetTypes

# ![Tables](../../../../Images/Table32.png) [dbo].[AssetTypes]

---

## <a name="#description"></a>MS_Description

Describes the type of object within the data catalog that can be categorized
* SQL Server Instance
* Database
* Schema
* Table
* Column

## <a name="#columns"></a>Columns

| Key | Name | Data Type | Max Length (Bytes) | Nullability | Description |
|---|---|---|---|---|---|
| [![Cluster Primary Key PK_AssetTypes: Id](../../../../Images/pkcluster.png)](#indexes) | Id | bigint | 8 | NOT NULL | _The clustered primary key that uniquely identifies the dbo.AssetTypes record._ |
| [![Indexes IX_AssetTypes_Name](../../../../Images/Index.png)](#indexes) | Name | nvarchar(50) | 100 | NOT NULL | _* SQL Server Instance
* Database
* Schema
* Table
* Column_ |
|  | Description | nvarchar(200) | 400 | NOT NULL | _Describes each Data Catalog asset type in terms that are useful to a person who is data savvy, but not necessarily and IT person._ |


---

## <a name="#usedby"></a>Used By

* [[dbo].[TagCategoryAssetTypeApplications]](TagCategoryAssetTypeApplications.md)


---

###### Author:  david.poole

###### Copyright 2019 - All Rights Reserved

###### Created: 10 May 2020 16:47:57

