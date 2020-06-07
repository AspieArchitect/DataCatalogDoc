#### 

[Project](../../../../readme.md) > [DADSPCJUNE2014](../../../readme.md) > [User databases](../../readme.md) > [Redgate_SqlDataCatalog](../readme.md) > [Tables](Tables.md) > dbo.AuthTokens

# ![Tables](../../../../Images/Table32.png) [dbo].[AuthTokens]

---

## <a name="#description"></a>MS_Description

Auth Tokens are access authentication tokens to allow Powershell cmdlets to interact with the data catalog.
This table should be protected to prevent abuse.

## <a name="#columns"></a>Columns

| Key | Name | Data Type | Max Length (Bytes) | Nullability | Description |
|---|---|---|---|---|---|
| [![Cluster Primary Key PK_AuthTokens: Id](../../../../Images/pkcluster.png)](#indexes) | Id | bigint | 8 | NOT NULL | _The clustered primary key that uniquely identifies the dbo.AuthTokens record._ |
| [![Indexes IX_AuthTokens_Name](../../../../Images/Index.png)](#indexes) | Name | nvarchar(100) | 200 | NOT NULL | _The name of the authentication token_ |
|  | HashSalt | nvarchar(max) | max | NOT NULL | _The salt value used to encrypt the token_ |
|  | HashedToken | varbinary(max) | max | NOT NULL | _The encrypted token value_ |
|  | Username | nvarchar(100) | 200 | NOT NULL | _The user name to whom the authentication token belongs._ |
|  | CreatedAtUtc | datetime2 | 8 | NOT NULL | _The timestamp for when a record was created as a result of activity through the user interface_ |


---

###### Author:  david.poole

###### Copyright 2019 - All Rights Reserved

###### Created: 10 May 2020 16:47:57

