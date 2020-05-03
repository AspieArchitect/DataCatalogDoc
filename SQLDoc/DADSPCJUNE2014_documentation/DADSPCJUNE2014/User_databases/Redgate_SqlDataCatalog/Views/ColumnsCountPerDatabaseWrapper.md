#### 

[Project](../../../../readme.md) > [DADSPCJUNE2014](../../../readme.md) > [User databases](../../readme.md) > [Redgate_SqlDataCatalog](../readme.md) > [Views](Views.md) > dbo.ColumnsCountPerDatabaseWrapper

# ![Views](../../../../Images/View32.png) [dbo].[ColumnsCountPerDatabaseWrapper]

---

## <a name="#description"></a>MS_Description

For each database within a DB Server this view provides a count of the number of columns.  This is a NOEXPAND view over the top of dbo.ColumnsCountPerDatabase

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| ANSI Nulls On | YES |
| Quoted Identifier On | YES |
| Created | 21:21:26 11 October 2019 |
| Last Modified | 21:21:26 11 October 2019 |


---

## <a name="#columns"></a>Columns

| Name | Data Type | Max Length (Bytes) | Description |
|---|---|---|---|
| InstanceId | bigint | 8 | _Identifies the database server, cluster or availability group listener to which the database belongs.  Joins to dbo.Instances_ |
| DatabaseId | bigint | 8 | _Identifies the database within the instance. Joins to dbo.Databases_ |
| ColumnCount | bigint | 8 | _The overall count of columns within the database on that instance_ |


---

## <a name="#sqlscript"></a>SQL Script

```sql

CREATE VIEW [dbo].[ColumnsCountPerDatabaseWrapper]
AS
SELECT  InstanceId
      , DatabaseId
      , ColumnCount
  FROM ColumnsCountPerDatabase
  WITH (NOEXPAND)

GO
EXEC sp_addextendedproperty N'MS_Description', 'For each database within a DB Server this view provides a count of the number of columns.  This is a NOEXPAND view over the top of dbo.ColumnsCountPerDatabase', 'SCHEMA', N'dbo', 'VIEW', N'ColumnsCountPerDatabaseWrapper', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'The overall count of columns within the database on that instance', 'SCHEMA', N'dbo', 'VIEW', N'ColumnsCountPerDatabaseWrapper', 'COLUMN', N'ColumnCount'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Identifies the database within the instance. Joins to dbo.Databases', 'SCHEMA', N'dbo', 'VIEW', N'ColumnsCountPerDatabaseWrapper', 'COLUMN', N'DatabaseId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Identifies the database server, cluster or availability group listener to which the database belongs.  Joins to dbo.Instances', 'SCHEMA', N'dbo', 'VIEW', N'ColumnsCountPerDatabaseWrapper', 'COLUMN', N'InstanceId'
GO

```


---

## <a name="#uses"></a>Uses

* [[dbo].[ColumnsCountPerDatabase]](ColumnsCountPerDatabase.md)


---

###### Author:  david.poole

###### Copyright 2019 - All Rights Reserved

###### Created: 03 May 2020 12:11:20

