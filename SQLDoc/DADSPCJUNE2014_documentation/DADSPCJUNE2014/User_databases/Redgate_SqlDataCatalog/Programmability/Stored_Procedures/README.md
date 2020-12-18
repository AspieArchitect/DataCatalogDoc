#### 

[Project](../../../../../readme.md) > [DADSPCJUNE2014](../../../../readme.md) > [User databases](../../../readme.md) > [Redgate_SqlDataCatalog](../../readme.md) > [Programmability](../readme.md) > Stored Procedures

# ![Stored Procedures](../../../../../Images/StoredProcedure32.png) Stored Procedures

---

## <a name="#objects"></a>Objects

| Name | Description |
|---|---|
| [MetaData.ApplyDataDictionary](ApplyDataDictionary.md) | _Takes the non-blank descriptions from MetaData.DataDictionary_Objects and MetaData.DataDictionary_Columns and writes them to the MS_DESCRIPTION extended property for the tables, views and their columns_ |
| [MetaData.HarvestExistingDescriptions](HarvestExistingDescriptions.md) | _Grabs any existing MS_DESCRIPTION values and applies them to MetaData.DataDictionary_Objects or MetaData.DataDictionary_Columns as appropriate_ |
| [MetaData.PopulateColumnProfileCandidates](PopulateColumnProfileCandidates.md) | _Grabs any (N)CHAR or (N)VARCHAR columns from dimension tables that are between 1 and 100 characters long.  The results are inserted into MetaData.ColumnProfileCandidates if the schema.table.column do not already exist in the table_ |
| [MetaData.PopulateDataDictionary](PopulateDataDictionary.md) |<p>_Reads the INFORMATION_SCHEMA views to populate the two tables</p><ul><li> MetaData.DataDictionary_Objects</li><li> MetaData.DataDictionary_Columns</li></ul><p>These will have blank description until the two scavenge stored procedures are executed._</p>|
| [MetaData.RecordColumnStagingDescriptions](RecordColumnStagingDescriptions.md) | _Extracts a DISTINCT list of values for each column in MetaData.ColumnProfileResults where there are fewer than 13 entries_ |
| [MetaData.SetDefaultDescriptions](SetDefaultDescriptions.md) | _Populates MetaData.DataDictionary_Objects and MetaData.DataDictionary_columns tables and then applies the generated descriptions_ |
| [MetaData.TestDataDictionaryColumns](TestDataDictionaryColumns.md) |<p>_Identifies any columns with empty descriptions and raises an error of sufficient severity to break any continuous integration build.</p><p>The offending schemas, objects and columns will be listed._</p>|
| [MetaData.TestDataDictionaryObjects](TestDataDictionaryObjects.md) |<p>_Identifies any tables or views with empty descriptions and raises an error of sufficient severity to break any continuous integration build.</p><p>The offending schemas, tables or views will be listed_</p>|
| [MetaData.UpdateDataDictionaryColumn](UpdateDataDictionaryColumn.md) | _Sets the description of a column within a table or view_ |
| [MetaData.UpdateDataDictionaryObject](UpdateDataDictionaryObject.md) | _Sets the description of a table or view_ |


---

###### Author:  david.poole

###### Copyright 2019 - All Rights Reserved

###### Created: 29 November 2020 18:21:54

