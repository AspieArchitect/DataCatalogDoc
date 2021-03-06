#### 

[Project](../../../../readme.md) > [DADSPCJUNE2014](../../../readme.md) > [User databases](../../readme.md) > [Redgate_SqlDataCatalog](../readme.md) > [Tables](Tables.md) > dbo.InstanceScans

# ![Tables](../../../../Images/Table32.png) [dbo].[InstanceScans]

---

## <a name="#description"></a>MS_Description

A log of when the instances were scanned to detect new objects and attributes. Â This is particularly useful for demonstrating to external auditors the recency of information in the catalogue.

## <a name="#columns"></a>Columns

| Key | Name | Data Type | Max Length (Bytes) | Nullability | Description |
|---|---|---|---|---|---|
| [![Cluster Primary Key PK_InstanceScans: Id](../../../../Images/pkcluster.png)](#indexes) | Id | bigint | 8 | NOT NULL | _Primary surrogate key for the scan._ |
| [![Indexes IX_InstanceScans_InstanceId](../../../../Images/Index.png)](#indexes)[![Foreign Keys FK_InstanceScans_Instances_InstanceId: [dbo].[Instances].InstanceId](../../../../Images/fk.png)](#foreignkeys) | InstanceId | bigint | 8 | NOT NULL | _Join to Id column in the dbo.Instances table._ |
|  | ScanStartDateUtc | datetime2 | 8 | NULL allowed | _When the scan started. Â ScannedDateUtc - ScanStartDateUtc = scan duration_ |
|  | ScannedDateUtc | datetime2 | 8 | NULL allowed | _When the scan completed. Â ScannedDateUtc - ScanStartDateUtc = scan duration_ |
|  | IsError | bit | 1 | NULL allowed | _Whether the scan encountered an error_ |
|  | ErrorMessage | nvarchar(max) | max | NULL allowed | _Friendly description of the error._ |


---

## <a name="#uses"></a>Uses

* [[dbo].[Instances]](Instances.md)


---

###### Author:  david.poole

###### Copyright 2019 - All Rights Reserved

###### Created: 19 December 2020 20:53:30

