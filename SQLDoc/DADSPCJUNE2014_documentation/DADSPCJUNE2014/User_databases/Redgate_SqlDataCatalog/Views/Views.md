#### 

[Project](../../../../readme.md) > [DADSPCJUNE2014](../../../readme.md) > [User databases](../../readme.md) > [Redgate_SqlDataCatalog](../readme.md) > Views

# ![Views](../../../../Images/View32.png) Views

---

## <a name="#objects"></a>Objects

| Name | Description |
|---|---|
| [dbo.ColumnsCountPerDatabase](ColumnsCountPerDatabase.md) | _For each database within a DB Server this view provides a count of the number of columns._ |
| [dbo.ColumnsCountPerDatabaseWrapper](ColumnsCountPerDatabaseWrapper.md) | _For each database within a DB Server this view provides a count of the number of columns.  This is a NOEXPAND view over the top of dbo.ColumnsCountPerDatabase_ |
| [dbo.ColumnTagsCountPerDatabase](ColumnTagsCountPerDatabase.md) | _Provides a count by tag name within the tag category within the database with in the DB server instance_ |
| [dbo.ColumnTagsCountPerDatabaseWrapper](ColumnTagsCountPerDatabaseWrapper.md) | _Provides a count by tag name within the tag category within the database with in the DB server instance_ |
| [MetaData.DataDictionary_ColumnDefaultDescriptions](DataDictionary_ColumnDefaultDescriptions.md) | _Provides default descriptions for columns based on a broad column retrieval pattern and a specific column name for items within that pattern._ |
| [MetaData.DefaultColumnAndFKDescriptions](DefaultColumnAndFKDescriptions.md) |<p>_Provides a column description based on the concatenation of three properties</p><ul><li> Default column description</li><li> Foreign key join</li><li> TABLE_SUMMARY property from the referenced object._</li></ul>|
| [MetaData.DefaultDescription_ForeignKey](DefaultDescription_ForeignKey.md) |<p>_Provides a user friendly description for a column within a table that describes the join of the foreign key.</p><p>It also concatenates the description from the referenced table if the referenced table has a TABLE_SUMMARY property._</p>|
| [MetaData.DefaultDescription_PrimaryKey](DefaultDescription_PrimaryKey.md) | _Provides a default description for a single column primary key_ |
| [MetaData.ExistingColumnDescriptions](ExistingColumnDescriptions.md) | _The contents of any existing MS_DESCRIPTION properties for column in the table or view.  This is used to scavenge any existing comments into the MetaData.DataDictionary_Columns table._ |
| [MetaData.ExistingObjectDescriptions](ExistingObjectDescriptions.md) | _The contents of any existing MS_DESCRIPTION properties for table and views.  This is used to scavenge any existing comments into the MetaData.DataDictionary_Objects table._ |


---

###### Author:  david.poole

###### Copyright 2019 - All Rights Reserved

###### Created: 29 November 2020 18:21:54

