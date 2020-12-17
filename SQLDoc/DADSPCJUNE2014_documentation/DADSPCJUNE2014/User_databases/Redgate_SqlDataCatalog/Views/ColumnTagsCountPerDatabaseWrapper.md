#### 

[Project](../../../../readme.md) > [DADSPCJUNE2014](../../../readme.md) > [User databases](../../readme.md) > [Redgate_SqlDataCatalog](../readme.md) > [Views](Views.md) > dbo.ColumnTagsCountPerDatabaseWrapper

# ![Views](../../../../Images/View32.png) [dbo].[ColumnTagsCountPerDatabaseWrapper]

---

## <a name="#description"></a>MS_Description

Provides a count by tag name within the tag category within the database with in the DB server instance

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Collation | Latin1_General_CI_AS |
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
| CategoryId | bigint | 8 | _A tag category is a grouping entity to which a number of tags can be associated. Joins to the dbo.TagCategories table._ |
| TagName | nvarchar(100) | 200 | _The name of the tag within the category applied to columns._ |
| Count | bigint | 8 | _The number of columns to which the tag has been applied._ |


---

## <a name="#sqlscript"></a>SQL Script

```sql

CREATE VIEW [dbo].[ColumnTagsCountPerDatabaseWrapper]
AS
SELECT  InstanceId
      , DatabaseId
      , CategoryId
      , TagName
      , Count
  FROM ColumnTagsCountPerDatabase
  WITH (NOEXPAND)

GO
EXEC sp_addextendedproperty N'MS_Description', 'Provides a count by tag name within the tag category within the database with in the DB server instance', 'SCHEMA', N'dbo', 'VIEW', N'ColumnTagsCountPerDatabaseWrapper', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'A tag category is a grouping entity to which a number of tags can be associated. Joins to the dbo.TagCategories table.', 'SCHEMA', N'dbo', 'VIEW', N'ColumnTagsCountPerDatabaseWrapper', 'COLUMN', N'CategoryId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The number of columns to which the tag has been applied.', 'SCHEMA', N'dbo', 'VIEW', N'ColumnTagsCountPerDatabaseWrapper', 'COLUMN', N'Count'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Identifies the database within the instance. Joins to dbo.Databases', 'SCHEMA', N'dbo', 'VIEW', N'ColumnTagsCountPerDatabaseWrapper', 'COLUMN', N'DatabaseId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Identifies the database server, cluster or availability group listener to which the database belongs.  Joins to dbo.Instances', 'SCHEMA', N'dbo', 'VIEW', N'ColumnTagsCountPerDatabaseWrapper', 'COLUMN', N'InstanceId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the tag within the category applied to columns.', 'SCHEMA', N'dbo', 'VIEW', N'ColumnTagsCountPerDatabaseWrapper', 'COLUMN', N'TagName'
GO

```


---

## <a name="#uses"></a>Uses

* [[dbo].[ColumnTagsCountPerDatabase]](ColumnTagsCountPerDatabase.md)


---

###### Author:  david.poole

###### Copyright 2019 - All Rights Reserved

###### Created: 29 November 2020 18:21:54

