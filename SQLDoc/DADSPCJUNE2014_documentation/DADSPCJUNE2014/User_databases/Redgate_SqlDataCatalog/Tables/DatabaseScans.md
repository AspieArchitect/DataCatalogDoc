#### 

[Project](../../../../readme.md) > [DADSPCJUNE2014](../../../readme.md) > [User databases](../../readme.md) > [Redgate_SqlDataCatalog](../readme.md) > [Tables](Tables.md) > dbo.DatabaseScans

# ![Tables](../../../../Images/Table32.png) [dbo].[DatabaseScans]

---

## <a name="#description"></a>MS_Description

Records when each database within a DB server instance is scanned for updated catalog information.  This log will record a number of useful facts
1. The start/completion time of a scan  and thus the duration of the scan
2. Whether there were any errors identified during the scan
3. A hash value that can be used to determine if any changes were detected during the scan.

## <a name="#columns"></a>Columns

| Key | Name | Data Type | Max Length (Bytes) | Nullability | Description |
|---|---|---|---|---|---|
| [![Cluster Primary Key PK_DatabaseScans: Id](../../../../Images/pkcluster.png)](#indexes) | Id | bigint | 8 | NOT NULL | _The clustered primary key that uniquely identifies the dbo.DatabaseScans record._ |
| [![Indexes IX_DatabaseScans_DatabaseId](../../../../Images/Index.png)](#indexes)[![Foreign Keys FK_DatabaseScans_Databases_DatabaseId: [dbo].[Databases].DatabaseId](../../../../Images/fk.png)](#foreignkeys) | DatabaseId | bigint | 8 | NOT NULL | _Join to Id column in the dbo.Databases table.  This holds a list of databases detected within each DB Server instance registered within the catalog as held in dbo.Instances_ |
|  | ScannedDateUtc | datetime2 | 8 | NULL allowed | _The date/time at which the scan ended.  The difference between ScanStartDateUtc and ScannedDateUtc gives the duration of the scan._ |
|  | ScanStartDateUtc | datetime2 | 8 | NULL allowed | _The date/time at which a database scan was initiated.  The difference between ScanStartDateUtc and ScannedDateUtc gives the duration of the scan._ |
|  | IsError | bit | 1 | NULL allowed | _Set to TRUE when an error occurred as part of the scan_ |
|  | ErrorMessage | nvarchar(max) | max | NULL allowed | _When IsError is set to TRUE this will capture any error message detected by the Data Catalog_ |
|  | ScanResultHash | varbinary(max) | max | NULL allowed | _A value that indicates whether a difference between different scans of the same database was detected._ |


---

## <a name="#uses"></a>Uses

* [[dbo].[Databases]](Databases.md)


---

## <a name="#usedby"></a>Used By

* [[dbo].[DatabaseScanMergeAttempts]](DatabaseScanMergeAttempts.md)


---

###### Author:  david.poole

###### Copyright 2019 - All Rights Reserved

###### Created: 10 May 2020 16:47:57

