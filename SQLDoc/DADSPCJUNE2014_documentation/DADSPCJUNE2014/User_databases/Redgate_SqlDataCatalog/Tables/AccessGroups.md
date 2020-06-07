#### 

[Project](../../../../readme.md) > [DADSPCJUNE2014](../../../readme.md) > [User databases](../../readme.md) > [Redgate_SqlDataCatalog](../readme.md) > [Tables](Tables.md) > dbo.AccessGroups

# ![Tables](../../../../Images/Table32.png) [dbo].[AccessGroups]

---

## <a name="#description"></a>MS_Description

When Data Catalog permissions are turned on this is the association between a login user (or group) and one of the three access roles
1. Administrator
2. Read-Only
3. Classify Only

## <a name="#columns"></a>Columns

| Key | Name | Data Type | Max Length (Bytes) | Nullability | Default | Description |
|---|---|---|---|---|---|---|
|  | AccessLevel | bigint | 8 | NOT NULL |  | _Number indicating the access level assigned to the SID.
1. Administrator
2. Read-Only
3. Classify Only_ |
| [![Cluster Primary Key PK_AccessGroups: Sid](../../../../Images/pkcluster.png)](#indexes) | Sid | nvarchar(400) | 800 | NOT NULL |  | _The clustered primary key that uniquely identifies the dbo.AccessGroups record._ |
|  | DisplayName | nvarchar(max) | max | NOT NULL | (N'') | _The user name of the SID_ |


---

###### Author:  david.poole

###### Copyright 2019 - All Rights Reserved

###### Created: 10 May 2020 16:47:57

