#### 

[Project](../../../../readme.md) > [DADSPCJUNE2014](../../../readme.md) > [User databases](../../readme.md) > [Redgate_SqlDataCatalog](../readme.md) > [Tables](Tables.md) > dbo.AuditLog

# ![Tables](../../../../Images/Table32.png) [dbo].[AuditLog]

---

## <a name="#description"></a>MS_Description

Keeps track of catalog object creation/deletion, classification changes, instance scans etc.  
For column classifications the table and column name will be captured as well as a JSON payload containing an array of tag categories applied

## <a name="#columns"></a>Columns

| Key | Name | Data Type | Max Length (Bytes) | Nullability | Default | Description |
|---|---|---|---|---|---|---|
| [![Cluster Primary Key PK_AuditLog: Id](../../../../Images/pkcluster.png)](#indexes) | Id | bigint | 8 | NOT NULL |  | _The clustered primary key that uniquely identifies the dbo.AuditLog record._ |
|  | AuditEventType | nvarchar(1024) | 2048 | NOT NULL |  | _A short name for the type of event that is audited.  Examples may include the following.
* ColumnClassificationChanged* InstanceScanRequested* TagCategoryCreation* TagCategoryDeletion* TagCreation_ |
|  | UserName | nvarchar(max) | max | NULL allowed |  | _The login username that caused the event being audited_ |
|  | TimeStamp | datetime2 | 8 | NOT NULL |  | _The date/time at which the auditable event took place_ |
|  | Name | nvarchar(max) | max | NULL allowed |  | _Where some form of Tag or TagCategory event occurs this is the name of that Tag or TagCategory_ |
|  | InstanceName | nvarchar(max) | max | NULL allowed |  | _The database instance name.  Bear in mind that this may be the name of a server, cluster or availability group listener.  This will be NULL for tag maintenance activity.  It applies to two types of event.
* ColumnClassificationChanged
* InstanceScanRequested_ |
|  | DatabaseName | nvarchar(max) | max | NULL allowed |  | _The name of the database within the server instance. This is used for ColumnClassificationChanged events._ |
|  | SchemaName | nvarchar(max) | max | NULL allowed |  | _The name of the schema. This is used for ColumnClassificationChanged events._ |
|  | TableName | nvarchar(max) | max | NULL allowed |  | _The table name. This is used for ColumnClassificationChanged events._ |
|  | ColumnName | nvarchar(max) | max | NULL allowed |  | _The column name. This is used for ColumnClassificationChanged events._ |
|  | Data | nvarchar(max) | max | NULL allowed |  | _A JSON payload describing the actual change for the ColumnClassificationChanged events._ |
|  | TokenName | nvarchar(max) | max | NULL allowed |  | _The name of the authentication token used to allow action authentication for the Data Catalog API calls._ |
|  | Version | int | 4 | NOT NULL | ((0)) | _TBD_ |


---

###### Author:  david.poole

###### Copyright 2019 - All Rights Reserved

###### Created: 29 November 2020 18:21:54

