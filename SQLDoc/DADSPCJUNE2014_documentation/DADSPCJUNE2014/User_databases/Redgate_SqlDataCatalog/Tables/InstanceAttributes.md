#### 

[Project](../../../../index.md) > [DADSPCJUNE2014](../../../index.md) > [User databases](../../index.md) > [Redgate_SqlDataCatalog](../index.md) > [Tables](Tables.md) > dbo.InstanceAttributes

# ![Tables](../../../../Images/Table32.png) [dbo].[InstanceAttributes]

---

## <a name="#description"></a>MS_Description

Entity-Attribute-Value representation of properties relevant to the instance/server.  This allows for an extensible properties and values to be associated with an instance.

## <a name="#columns"></a>Columns

| Key | Name | Data Type | Max Length (Bytes) | Nullability | Description |
|---|---|---|---|---|---|
| [![Cluster Primary Key PK_InstanceAttributes: InstanceId\Key](../../../../Images/pkcluster.png)](#indexes)[![Foreign Keys FK_InstanceAttributes_Instances_InstanceId: [dbo].[Instances].InstanceId](../../../../Images/fk.png)](#foreignkeys) | InstanceId | bigint | 8 | NOT NULL | _Join to Id column in the dbo.Instances table._ |
| [![Cluster Primary Key PK_InstanceAttributes: InstanceId\Key](../../../../Images/pkcluster.png)](#indexes) | Key | nvarchar(400) | 800 | NOT NULL | _The name of the property attached to the server/instance
* Edition_ |
|  | Value | nvarchar(max) | max | NOT NULL | _The value of the property attached to the server/instance
* Developer Edition (64 bit)_ |


---

## <a name="#uses"></a>Uses

* [[dbo].[Instances]](Instances.md)


---

###### Author:  david.poole

###### Copyright 2019 - All Rights Reserved

###### Created: 19 April 2020 16:29:41

