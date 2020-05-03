#### 

[Project](../../../../readme.md) > [DADSPCJUNE2014](../../../readme.md) > [User databases](../../readme.md) > [Redgate_SqlDataCatalog](../readme.md) > [Views](Views.md) > dbo.ColumnTagsCountPerDatabase

# ![Views](../../../../Images/View32.png) [dbo].[ColumnTagsCountPerDatabase]

---

## <a name="#description"></a>MS_Description

Provides a count by tag name within the tag category within the database with in the DB server instance

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Collation | Latin1_General_CI_AS |
| ANSI Nulls On | YES |
| Quoted Identifier On | YES |
| Schema Bound | YES |
| Created | 21:21:26 11 October 2019 |
| Last Modified | 21:21:26 11 October 2019 |


---

## <a name="#columns"></a>Columns

| Key | Name | Data Type | Max Length (Bytes) | Description |
|---|---|---|---|---|
| [![Cluster Key IX_ColumnTagsCountPerDatabase: InstanceId\CategoryId\DatabaseId\TagName](../../../../Images/cluster.png)](#indexes) | InstanceId | bigint | 8 | _Identifies the database server, cluster or availability group listener to which the database belongs.  Joins to dbo.Instances_ |
| [![Cluster Key IX_ColumnTagsCountPerDatabase: InstanceId\CategoryId\DatabaseId\TagName](../../../../Images/cluster.png)](#indexes) | DatabaseId | bigint | 8 | _Identifies the database within the instance. Joins to dbo.Databases_ |
| [![Cluster Key IX_ColumnTagsCountPerDatabase: InstanceId\CategoryId\DatabaseId\TagName](../../../../Images/cluster.png)](#indexes) | CategoryId | bigint | 8 | _A tag category is a grouping entity to which a number of tags can be associated. Joins to the dbo.TagCategories table._ |
| [![Cluster Key IX_ColumnTagsCountPerDatabase: InstanceId\CategoryId\DatabaseId\TagName](../../../../Images/cluster.png)](#indexes) | TagName | nvarchar(100) | 200 | _The name of the tag within the category applied to columns._ |
|  | Count | bigint | 8 | _The number of columns to which the tag has been applied._ |


---

## <a name="#indexes"></a>Indexes

| Key | Name | Key Columns | Unique |
|---|---|---|---|
| [![Cluster Key IX_ColumnTagsCountPerDatabase: InstanceId\CategoryId\DatabaseId\TagName](../../../../Images/cluster.png)](#indexes) | IX_ColumnTagsCountPerDatabase | InstanceId, CategoryId, DatabaseId, TagName | YES |


---

## <a name="#sqlscript"></a>SQL Script

```sql


CREATE VIEW [dbo].[ColumnTagsCountPerDatabase]
WITH SCHEMABINDING
AS
SELECT i.Id         AS InstanceId
     , d.Id         AS DatabaseId
     , cat.Id       AS CategoryId
     , tag.Name     AS TagName
     , COUNT_BIG(*) AS Count
FROM dbo.ColumnTags              AS ct
    INNER JOIN dbo.Tags          AS tag  ON ct.TagId = tag.Id
    INNER JOIN dbo.TagCategories AS cat  ON tag.CategoryId = cat.Id
    INNER JOIN dbo.Columns       AS c    ON ct.ColumnId = c.Id
    INNER JOIN dbo.Tables        AS t    ON c.TableId = t.Id
    INNER JOIN dbo.Schemas       AS s    ON t.SchemaId = s.Id
    INNER JOIN dbo.Databases     AS d    ON s.DatabaseId = d.Id
    INNER JOIN dbo.Instances     AS i    ON d.InstanceId = i.Id
WHERE Archived = 0
GROUP BY i.Id
       , cat.Id
       , d.Id
       , tag.Name

GO
CREATE UNIQUE CLUSTERED INDEX [IX_ColumnTagsCountPerDatabase] ON [dbo].[ColumnTagsCountPerDatabase] ([InstanceId], [CategoryId], [DatabaseId], [TagName]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_Description', 'Provides a count by tag name within the tag category within the database with in the DB server instance', 'SCHEMA', N'dbo', 'VIEW', N'ColumnTagsCountPerDatabase', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'A tag category is a grouping entity to which a number of tags can be associated. Joins to the dbo.TagCategories table.', 'SCHEMA', N'dbo', 'VIEW', N'ColumnTagsCountPerDatabase', 'COLUMN', N'CategoryId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The number of columns to which the tag has been applied.', 'SCHEMA', N'dbo', 'VIEW', N'ColumnTagsCountPerDatabase', 'COLUMN', N'Count'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Identifies the database within the instance. Joins to dbo.Databases', 'SCHEMA', N'dbo', 'VIEW', N'ColumnTagsCountPerDatabase', 'COLUMN', N'DatabaseId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Identifies the database server, cluster or availability group listener to which the database belongs.  Joins to dbo.Instances', 'SCHEMA', N'dbo', 'VIEW', N'ColumnTagsCountPerDatabase', 'COLUMN', N'InstanceId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the tag within the category applied to columns.', 'SCHEMA', N'dbo', 'VIEW', N'ColumnTagsCountPerDatabase', 'COLUMN', N'TagName'
GO

```


---

## <a name="#uses"></a>Uses

* [[dbo].[Columns]](../Tables/Columns.md)
* [[dbo].[ColumnTags]](../Tables/ColumnTags.md)
* [[dbo].[Databases]](../Tables/Databases.md)
* [[dbo].[Instances]](../Tables/Instances.md)
* [[dbo].[Schemas]](../Tables/Schemas.md)
* [[dbo].[Tables]](../Tables/Tables_0000.md)
* [[dbo].[TagCategories]](../Tables/TagCategories.md)
* [[dbo].[Tags]](../Tables/Tags.md)


---

## <a name="#usedby"></a>Used By

* [[dbo].[ColumnTagsCountPerDatabaseWrapper]](ColumnTagsCountPerDatabaseWrapper.md)


---

###### Author:  david.poole

###### Copyright 2019 - All Rights Reserved

###### Created: 03 May 2020 12:11:20

