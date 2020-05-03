#### 

[Project](../../../../readme.md) > [DADSPCJUNE2014](../../../readme.md) > [User databases](../../readme.md) > [Redgate_SqlDataCatalog](../readme.md) > [Tables](Tables.md) > dbo.Instances

# ![Tables](../../../../Images/Table32.png) [dbo].[Instances]

---

## <a name="#description"></a>MS_Description

Lists the SQL Server instances registered in the Redgate Data Catalog

## <a name="#columns"></a>Columns

| Key | Name | Data Type | Max Length (Bytes) | Nullability | Default | Description |
|---|---|---|---|---|---|---|
| [![Cluster Primary Key PK_Instances: Id](../../../../Images/pkcluster.png)](#indexes) | Id | bigint | 8 | NOT NULL |  | _Primary key that identifies the server instance record_ |
| [![Indexes IX_Instances_Name](../../../../Images/Index.png)](#indexes) | Name | nvarchar(272) | 544 | NOT NULL |  | _The name of the instance as used by application servers and ODBC connections_ |
|  | RegisteredAtUtc | datetime2 | 8 | NOT NULL |  | _The timestamp for when a SQL Server instance was registered through the user interface_ |
|  | IsAvailabilityGroupListener | bit | 1 | NOT NULL | ((0)) | _TRUE indicates that the "instance" is a virtual network name for the SQL Server.  The availability group listener will redirect traffic to the appropriate replica in an availability group _ |
|  | UserId | nvarchar(max) | max | NULL allowed |  | _When NT Authentication is not used then this is the database login name for the instance_ |
|  | EncryptedPassword | varbinary(max) | max | NULL allowed |  | _The none encrypted hash for the password._ |
|  | DatabaseEngine | nvarchar(max) | max | NOT NULL | (N'') | _SqlServer_ |


---

## <a name="#usedby"></a>Used By

* [[dbo].[Databases]](Databases.md)
* [[dbo].[InstanceAttributes]](InstanceAttributes.md)
* [[dbo].[InstanceScans]](InstanceScans.md)
* [[dbo].[InstanceTags]](InstanceTags.md)
* [[dbo].[ColumnsCountPerDatabase]](../Views/ColumnsCountPerDatabase.md)
* [[dbo].[ColumnTagsCountPerDatabase]](../Views/ColumnTagsCountPerDatabase.md)


---

###### Author:  david.poole

###### Copyright 2019 - All Rights Reserved

###### Created: 03 May 2020 12:11:20

