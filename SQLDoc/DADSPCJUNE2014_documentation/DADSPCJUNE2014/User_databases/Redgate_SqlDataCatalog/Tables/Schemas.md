#### 

[Project](../../../../readme.md) > [DADSPCJUNE2014](../../../readme.md) > [User databases](../../readme.md) > [Redgate_SqlDataCatalog](../readme.md) > [Tables](Tables.md) > dbo.Schemas

# ![Tables](../../../../Images/Table32.png) [dbo].[Schemas]

---

## <a name="#description"></a>MS_Description

A named container for database objects, which allows you to group objects into separate namespaces.

## <a name="#columns"></a>Columns

| Key | Name | Data Type | Max Length (Bytes) | Nullability | Default | Description |
|---|---|---|---|---|---|---|
| [![Indexes IX_Schemas_DatabaseId_Name](../../../../Images/Index.png)](#indexes) | Name | nvarchar(128) | 256 | NOT NULL |  | _The name of the schema within the database_ |
|  | DetectedAtUtc | datetime2 | 8 | NOT NULL |  | _The timestamp for when a scan activity identified the information to generate the record_ |
| [![Cluster Primary Key PK_Schemas: Id](../../../../Images/pkcluster.png)](#indexes) | Id | bigint | 8 | NOT NULL | (CONVERT([bigint],(0))) | _The clustered primary key that uniquely identifies the dbo.Schemas record._ |
| [![Indexes IX_Schemas_DatabaseId_Name](../../../../Images/Index.png)](#indexes)[![Foreign Keys FK_Schemas_Databases_DatabaseId: [dbo].[Databases].DatabaseId](../../../../Images/fk.png)](#foreignkeys) | DatabaseId | bigint | 8 | NOT NULL |  | _Join to Id column in the dbo.Databases table.  This holds a list of databases detected within each DB Server instance registered within the catalog as held in dbo.Instances_ |


---

## <a name="#uses"></a>Uses

* [[dbo].[Databases]](Databases.md)


---

## <a name="#usedby"></a>Used By

* [[dbo].[Tables]](Tables_0000.md)
* [[dbo].[ColumnsCountPerDatabase]](../Views/ColumnsCountPerDatabase.md)
* [[dbo].[ColumnTagsCountPerDatabase]](../Views/ColumnTagsCountPerDatabase.md)


---

###### Author:  david.poole

###### Copyright 2019 - All Rights Reserved

###### Created: 03 May 2020 12:11:20

