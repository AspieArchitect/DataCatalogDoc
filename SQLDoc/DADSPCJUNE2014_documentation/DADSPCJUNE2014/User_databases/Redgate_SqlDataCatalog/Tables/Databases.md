#### 

[Project](../../../../readme.md) > [DADSPCJUNE2014](../../../readme.md) > [User databases](../../readme.md) > [Redgate_SqlDataCatalog](../readme.md) > [Tables](Tables.md) > dbo.Databases

# ![Tables](../../../../Images/Table32.png) [dbo].[Databases]

---

## <a name="#description"></a>MS_Description

A list of databases detected within each DB Server instance registered within the catalog as held in dbo.Instances

## <a name="#columns"></a>Columns

| Key | Name | Data Type | Max Length (Bytes) | Nullability | Default | Description |
|---|---|---|---|---|---|---|
| [![Indexes IX_Databases_InstanceId_Name](../../../../Images/Index.png)](#indexes) | Name | nvarchar(128) | 256 | NOT NULL |  | _The name of the database within the instance._ |
| [![Indexes IX_Databases_InstanceId_Name](../../../../Images/Index.png)](#indexes)[![Foreign Keys FK_Databases_Instances_InstanceId: [dbo].[Instances].InstanceId](../../../../Images/fk.png)](#foreignkeys) | InstanceId | bigint | 8 | NOT NULL |  | _Join to Id column in the dbo.Instances table._ |
|  | DetectedAtUtc | datetime2 | 8 | NOT NULL |  | _The timestamp for when a scan activity identified the information to generate the record_ |
|  | Archived | bit | 1 | NOT NULL | ((0)) | _TBD_ |
| [![Cluster Primary Key PK_Databases: Id](../../../../Images/pkcluster.png)](#indexes) | Id | bigint | 8 | NOT NULL | (CONVERT([bigint],(0))) | _The clustered primary key that uniquely identifies the dbo.Databases record._ |


---

## <a name="#uses"></a>Uses

* [[dbo].[Instances]](Instances.md)


---

## <a name="#usedby"></a>Used By

* [[dbo].[DatabaseScans]](DatabaseScans.md)
* [[dbo].[Schemas]](Schemas.md)
* [[dbo].[ColumnsCountPerDatabase]](../Views/ColumnsCountPerDatabase.md)
* [[dbo].[ColumnTagsCountPerDatabase]](../Views/ColumnTagsCountPerDatabase.md)


---

###### Author:  david.poole

###### Copyright 2019 - All Rights Reserved

###### Created: 29 November 2020 18:21:54

