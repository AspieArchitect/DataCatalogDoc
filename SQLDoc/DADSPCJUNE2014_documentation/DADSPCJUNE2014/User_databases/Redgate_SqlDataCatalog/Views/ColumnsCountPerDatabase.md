#### 

[Project](../../../../readme.md) > [DADSPCJUNE2014](../../../readme.md) > [User databases](../../readme.md) > [Redgate_SqlDataCatalog](../readme.md) > [Views](Views.md) > dbo.ColumnsCountPerDatabase

# ![Views](../../../../Images/View32.png) [dbo].[ColumnsCountPerDatabase]

---

## <a name="#description"></a>MS_Description

For each database within a DB Server this view provides a count of the number of columns.

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| ANSI Nulls On | YES |
| Quoted Identifier On | YES |
| Schema Bound | YES |
| Created | 21:21:26 11 October 2019 |
| Last Modified | 21:21:26 11 October 2019 |


---

## <a name="#columns"></a>Columns

| Key | Name | Data Type | Max Length (Bytes) | Description |
|---|---|---|---|---|
| [![Cluster Key IX_ColumnsCountPerDatabase: InstanceId\DatabaseId](../../../../Images/cluster.png)](#indexes) | InstanceId | bigint | 8 | _Identifies the database server, cluster or availability group listener to which the database belongs.  Joins to dbo.Instances_ |
| [![Cluster Key IX_ColumnsCountPerDatabase: InstanceId\DatabaseId](../../../../Images/cluster.png)](#indexes) | DatabaseId | bigint | 8 | _Identifies the database within the instance. Joins to dbo.Databases_ |
|  | ColumnCount | bigint | 8 | _The overall count of columns within the database on that instance_ |


---

## <a name="#indexes"></a>Indexes

| Key | Name | Key Columns | Unique |
|---|---|---|---|
| [![Cluster Key IX_ColumnsCountPerDatabase: InstanceId\DatabaseId](../../../../Images/cluster.png)](#indexes) | IX_ColumnsCountPerDatabase | InstanceId, DatabaseId | YES |


---

## <a name="#sqlscript"></a>SQL Script

```sql


CREATE VIEW [dbo].[ColumnsCountPerDatabase]
WITH SCHEMABINDING
AS
SELECT i.Id         AS InstanceId
     , d.Id         AS DatabaseId
     , COUNT_BIG(*) AS ColumnCount
FROM dbo.Columns             AS c
    INNER JOIN dbo.Tables    AS t  ON c.TableId = t.Id
    INNER JOIN dbo.Schemas   AS s  ON t.SchemaId = s.Id
    INNER JOIN dbo.Databases AS d  ON s.DatabaseId = d.Id
    INNER JOIN dbo.Instances AS i  ON d.InstanceId = i.Id
WHERE d.Archived = 0
GROUP BY i.Id, d.Id

GO
CREATE UNIQUE CLUSTERED INDEX [IX_ColumnsCountPerDatabase] ON [dbo].[ColumnsCountPerDatabase] ([InstanceId], [DatabaseId]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_Description', 'For each database within a DB Server this view provides a count of the number of columns.', 'SCHEMA', N'dbo', 'VIEW', N'ColumnsCountPerDatabase', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'The overall count of columns within the database on that instance', 'SCHEMA', N'dbo', 'VIEW', N'ColumnsCountPerDatabase', 'COLUMN', N'ColumnCount'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Identifies the database within the instance. Joins to dbo.Databases', 'SCHEMA', N'dbo', 'VIEW', N'ColumnsCountPerDatabase', 'COLUMN', N'DatabaseId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Identifies the database server, cluster or availability group listener to which the database belongs.  Joins to dbo.Instances', 'SCHEMA', N'dbo', 'VIEW', N'ColumnsCountPerDatabase', 'COLUMN', N'InstanceId'
GO

```


---

## <a name="#uses"></a>Uses

* [[dbo].[Columns]](../Tables/Columns.md)
* [[dbo].[Databases]](../Tables/Databases.md)
* [[dbo].[Instances]](../Tables/Instances.md)
* [[dbo].[Schemas]](../Tables/Schemas.md)
* [[dbo].[Tables]](../Tables/Tables_0000.md)


---

## <a name="#usedby"></a>Used By

* [[dbo].[ColumnsCountPerDatabaseWrapper]](ColumnsCountPerDatabaseWrapper.md)


---

###### Author:  david.poole

###### Copyright 2019 - All Rights Reserved

###### Created: 03 May 2020 12:11:20

