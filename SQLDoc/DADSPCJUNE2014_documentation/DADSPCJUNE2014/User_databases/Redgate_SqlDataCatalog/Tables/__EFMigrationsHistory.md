#### 

[Project](../../../../index.md) > [DADSPCJUNE2014](../../../index.md) > [User databases](../../index.md) > [Redgate_SqlDataCatalog](../index.md) > [Tables](Tables.md) > dbo.__EFMigrationsHistory

# ![Tables](../../../../Images/Table32.png) [dbo].[__EFMigrationsHistory]

---

## <a name="#description"></a>MS_Description

Entity Framework deployment (migration history)

## <a name="#columns"></a>Columns

| Key | Name | Data Type | Max Length (Bytes) | Nullability | Description |
|---|---|---|---|---|---|
| [![Cluster Primary Key PK___EFMigrationsHistory: MigrationId](../../../../Images/pkcluster.png)](#indexes) | MigrationId | nvarchar(150) | 300 | NOT NULL | _The key is a unique description of the deployment prefixed by a timestamp in the format yyyymmddhhnnss_ |
|  | ProductVersion | nvarchar(32) | 64 | NOT NULL | _The overall release description_ |


---

###### Author:  david.poole

###### Copyright 2019 - All Rights Reserved

###### Created: 19 April 2020 16:29:41

