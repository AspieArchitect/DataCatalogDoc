#### 

[Project](../../../../readme.md) > [DADSPCJUNE2014](../../../readme.md) > [User databases](../../readme.md) > [Redgate_SqlDataCatalog](../readme.md) > [Tables](Tables.md) > dbo.InstanceAttributes

# ![Tables](../../../../Images/Table32.png) [dbo].[InstanceAttributes]

---

## <a name="#description"></a>MS_Description

Entity-Attribute-Value representation of properties relevant to the instance/server. Â This allows for an extensible properties and values to be associated with an instance.

## <a name="#columns"></a>Columns

| Key | Name | Data Type | Max Length (Bytes) | Nullability | Description |
|---|---|---|---|---|---|
| [![Cluster Primary Key PK_InstanceAttributes: InstanceId\Key](../../../../Images/pkcluster.png)](#indexes)[![Foreign Keys FK_InstanceAttributes_Instances_InstanceId: [dbo].[Instances].InstanceId](../../../../Images/fk.png)](#foreignkeys) | InstanceId | bigint | 8 | NOT NULL | _Join to Id column in the dbo.Instances table._ |
| [![Cluster Primary Key PK_InstanceAttributes: InstanceId\Key](../../../../Images/pkcluster.png)](#indexes) | Key | nvarchar(400) | 800 | NOT NULL |<p>_The name of the property attached to the server/instance</p><ul><li> Edition_</li></ul>|
|  | Value | nvarchar(max) | max | NOT NULL |<p>_The value of the property attached to the server/instance</p><ul><li> Developer Edition (64 bit)_</li></ul>|


---

## <a name="#uses"></a>Uses

* [[dbo].[Instances]](Instances.md)


---

###### Author:  david.poole

###### Copyright 2019 - All Rights Reserved

###### Created: 19 December 2020 20:53:30

