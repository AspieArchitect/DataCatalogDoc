#### 

[Project](../../../../index.md) > [DADSPCJUNE2014](../../../index.md) > [User databases](../../index.md) > [Redgate_SqlDataCatalog](../index.md) > [Tables](Tables.md) > dbo.InstanceScans

# ![Tables](../../../../Images/Table32.png) [dbo].[InstanceScans]

---

## <a name="#description"></a>MS_Description

A log of when the instances were scanned to detect new objects and attributes.  This is particularly useful for demonstrating to external auditors the recency of information in the catalogue.

## <a name="#columns"></a>Columns

| Key | Name | Data Type | Max Length (Bytes) | Nullability | Description |
|---|---|---|---|---|---|
| [![Cluster Primary Key PK_InstanceScans: Id](../../../../Images/pkcluster.png)](#indexes) | Id | bigint | 8 | NOT NULL | _Primary surrogate key for the scan._ |
| [![Indexes IX_InstanceScans_InstanceId](../../../../Images/Index.png)](#indexes)[![Foreign Keys FK_InstanceScans_Instances_InstanceId: [dbo].[Instances].InstanceId](../../../../Images/fk.png)](#foreignkeys) | InstanceId | bigint | 8 | NOT NULL | _Join to Id column in the dbo.Instances table.  This describes Lists the SQL Server instances registered in the Redgate Data Catalog_ |
|  | ScanStartDateUtc | datetime2 | 8 | NULL allowed | _When the scan started.  ScannedDateUtc - ScanStartDateUtc = scan duration_ |
|  | ScannedDateUtc | datetime2 | 8 | NULL allowed | _When the scan completed.  ScannedDateUtc - ScanStartDateUtc = scan duration_ |
|  | IsError | bit | 1 | NULL allowed | _Whether the scan encountered an error_ |
|  | ErrorMessage | nvarchar(max) | max | NULL allowed | _Friendly description of the error._ |


---

## <a name="#uses"></a>Uses

* [[dbo].[Instances]](Instances.md)


---

###### Author:  david.poole

###### Copyright 2019 - All Rights Reserved

###### Created: 19 April 2020 16:29:41

