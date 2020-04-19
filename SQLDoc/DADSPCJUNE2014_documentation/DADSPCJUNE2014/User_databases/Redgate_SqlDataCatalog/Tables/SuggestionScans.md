#### 

[Project](../../../../index.md) > [DADSPCJUNE2014](../../../index.md) > [User databases](../../index.md) > [Redgate_SqlDataCatalog](../index.md) > [Tables](Tables.md) > dbo.SuggestionScans

# ![Tables](../../../../Images/Table32.png) [dbo].[SuggestionScans]

---

## <a name="#description"></a>MS_Description

Maintains a log of when suggestion scans were run.  This includes the start and finish time stamps so the duration of the scan can be determined.

## <a name="#columns"></a>Columns

| Key | Name | Data Type | Max Length (Bytes) | Nullability | Description |
|---|---|---|---|---|---|
| [![Cluster Primary Key PK_SuggestionScans: Id](../../../../Images/pkcluster.png)](#indexes) | Id | bigint | 8 | NOT NULL | _The clustered primary key that uniquely identifies the dbo.SuggestionScans record._ |
|  | ScanStartDateUtc | datetime2 | 8 | NOT NULL | _Indicates when a scan started. The difference between ScanFinishDateUtc and ScanStartDateUtc will give you the duration of a scan._ |
|  | ScanFinishDateUtc | datetime2 | 8 | NULL allowed | _Indicates when a scan completed. The difference between ScanFinishDateUtc and ScanStartDateUtc will give you the duration of a scan._ |
|  | Status | nvarchar(1024) | 2048 | NOT NULL | _TBD_ |


---

###### Author:  david.poole

###### Copyright 2019 - All Rights Reserved

###### Created: 19 April 2020 16:29:41

