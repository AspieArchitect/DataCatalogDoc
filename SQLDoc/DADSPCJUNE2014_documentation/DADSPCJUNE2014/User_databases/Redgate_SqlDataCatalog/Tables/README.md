#### 

[Project](../../../../readme.md) > [DADSPCJUNE2014](../../../readme.md) > [User databases](../../readme.md) > [Redgate_SqlDataCatalog](../readme.md) > Tables

# ![Tables](../../../../Images/Table32.png) Tables

---

## <a name="#objects"></a>Objects

| Name | Description |
|---|---|
| [dbo.__EFMigrationsHistory](__EFMigrationsHistory.md) | _Entity Framework deployment (migration history)_ |
| [dbo.AccessGroups](AccessGroups.md) |<p>_When Data Catalog permissions are turned on this is the association between a login user (or group) and one of the three access roles</p><p>1. Administrator</p><p>2. Read-Only</p><p>3. Classify Only_</p>|
| [dbo.AssetTypes](AssetTypes.md) |<p>_Describes the type of object within the data catalog that can be categorized</p><ul><li> SQL Server Instance</li><li> Database</li><li> Schema</li><li> Table</li><li> Column_</li></ul>|
| [dbo.AuditLog](AuditLog.md) |<p>_Keeps track of catalog object creation/deletion, classification changes, instance scans etc. Â</p><p>For column classifications the table and column name will be captured as well as a JSON payload containing an array of tag categories applied_</p>|
| [dbo.AuthTokens](AuthTokens.md) | _Auth Tokens are access authentication tokens to allow Powershell cmdlets to interact with the data catalog_ |
| [dbo.ColumnFreeTextAttributes](ColumnFreeTextAttributes.md) |<p>_Associates a dbo.FreeTextAttributes record with a dbo.Columns record in order to record a descriptive note against the column.</p><p>For example, a free text attribute might be created to hold brief regulatory notes. Â Those regulatory notes might be along the lines of the following.</p><ul><li>Â Can show truncated date down to year/month</li><li> Pending advice from the ICO</li><li> Do not transmit as this is a developer dumping ground and there is no guarantee that sensitive of PII data is excluded from such a column._</li></ul>|
| [dbo.Columns](Columns.md) | _A list of columns detected within a database table as held in dbo.tables. The table structure is akin to a simplified version of the SQL Server sys.columns system table_ |
| [dbo.ColumnTags](ColumnTags.md) | _Associates a dbo.Tags record with a dbo.Columns record._ |
| [dbo.Databases](Databases.md) | _A list of databases detected within each DB Server instance registered within the catalog as held in dbo.Instances_ |
| [dbo.DatabaseScanMergeAttempts](DatabaseScanMergeAttempts.md) | _Records when an attempt was made to merge the contents of a database scan into the catalogue_ |
| [dbo.DatabaseScans](DatabaseScans.md) |<p>_Records when each database within a DB server instance is scanned for updated catalog information. Â This log will record a number of useful facts</p><p>1. The start/completion time of a scan Â and thus the duration of the scan</p><p>2. Whether there were any errors identified during the scan</p><p>3. A hash value that can be used to determine if any changes were detected during the scan._</p>|
| [dbo.FreeTextAttributes](FreeTextAttributes.md) | _These are attributes that. when associated with a column (using dbo.ColumnFreeTextAttributes) allow brief notes to be recorded against that column_ |
| [dbo.InstanceAttributes](InstanceAttributes.md) | _Entity-Attribute-Value representation of properties relevant to the instance/server. Â This allows for an extensible properties and values to be associated with an instance._ |
| [dbo.Instances](Instances.md) | _Lists the SQL Server instances registered in the Redgate Data Catalog_ |
| [dbo.InstanceScans](InstanceScans.md) | _A log of when the instances were scanned to detect new objects and attributes. Â This is particularly useful for demonstrating to external auditors the recency of information in the catalogue._ |
| [dbo.InstanceTags](InstanceTags.md) | _Associates a tag from the dbo.Tags table with a DB server instance as held in the dbo.Instances table._ |
| [dbo.Operations](Operations.md) | _TBD_ |
| [dbo.Schemas](Schemas.md) | _Provides a list of schemas detected within each database_ |
| [dbo.SnapshotData](SnapshotData.md) | _TBC_ |
| [dbo.Snapshots](Snapshots.md) | _Snapshots of the estate are taken weekly on a Sunday._ |
| [dbo.SuggestionPatterns](SuggestionPatterns.md) | _A list of TSQL LIKE patterns that will be used against column names in order to associate the column with a rule_ |
| [dbo.SuggestionRules](SuggestionRules.md) |<p>_A list of rules aligned to the "Information Type" label introduced in SQL Server 2016</p><p>1. Networking</p><p>2. Contact Info</p><p>3. Credentials</p><p>4. Credit Cards</p><p>5. Banking</p><p>6. Financial</p><p>7. Other</p><p>8. Names</p><p>9. National ID</p><p>10. Social Security</p><p>11. Health</p><p>12. Dates of Birth_</p>|
| [dbo.SuggestionRuleTags](SuggestionRuleTags.md) | _Describes the mapping between a Suggestion Rule (being a category within information type) and a tag within the information type and sensitivity classification tags._ |
| [dbo.Suggestions](Suggestions.md) | _Identifies the rule and pattern associated with a column._ |
| [dbo.SuggestionScans](SuggestionScans.md) | _Maintains a log of when suggestion scans were run. Â This includes the start and finish time stamps so the duration of the scan can be determined._ |
| [dbo.Tables](Tables_0000.md) | _A list of tables detected within each schema as held within dbo.Schemas_ |
| [dbo.TagCategories](TagCategories.md) | _Nâ€™A tag category is a grouping entity to which a number of tags can be associated.See [Open taxonomy](https://documentation.red-gate.com/sql-data-catalog/taxonomy/open-taxonomy "SQL Data Catalog taxonomy documentation")_ |
| [dbo.TagCategoryAssetTypeApplications](TagCategoryAssetTypeApplications.md) |<p>_Allows a category as held in dbo.TagCategories to be mapped to an asset type as held in dbo.AssetTypes. Â The asset types are as follows.</p><ul><li> SQL Server Instance</li><li> Database</li><li> Schema</li><li> Table</li><li> Column_</li></ul>|
| [dbo.Tags](Tags.md) | _A tag is a label that exists within a category. Â For example a tag category might be "Environment" and the tags within that category might be Development, Production, Test or UAT._ |
| [MetaData.ColumnProfileCandidates](ColumnProfileCandidates.md) | _A list of columns within tables that are (N)CHAR or (N)VARCHAR Â and between 1 and 100 characters long. Â An approximate row count is provided to forewarn when profiling activity might require consideration for the load on the system being profiled._ |
| [MetaData.ColumnProfileResults](ColumnProfileResults.md) | _Contains the COUNT(DISTINCT {column name}) for the given column within the table. Â This is intended to allow a list of values from the column to be used to build up the description._ |
| [MetaData.DataDictionary_ColumnDefaults](DataDictionary_ColumnDefaults.md) |<p>_Provides the default description for columns of a specific name related back to the MetaData.DataDictionary_ColumnPatterns record. Â For example</p><ul><li> DateKey</li><li> DueDateKey</li><li> OrderDateKey</li><li> ShipDateKey_</li></ul>|
| [MetaData.DataDictionary_ColumnPatterns](DataDictionary_ColumnPatterns.md) |<p>_Provides a broad wild card specification for retrieving a group of columns. Â For example %DateKey.</p><p>Designed to be used with MetaData.DataDictionary_ColumnDefaults to provide more descriptions for different instances of %DateKey columns._</p>|
| [MetaData.DataDictionary_Columns](DataDictionary_Columns.md) | _Holds descriptions for columns within the tables or views. Â This is to provide a means of allowing a low privileged role the means to maintain such descriptions as the sp_addextendedproperty and sp_updateextendedproperty both require ddl_admin or db_owner privileges._ |
| [MetaData.DataDictionary_Objects](DataDictionary_Objects.md) | _Holds descriptions for tables and views. Â This is to provide a means of allowing a low privileged role the means to maintain such descriptions as the sp_addextendedproperty and sp_updateextendedproperty both require ddl_admin or db_owner privileges._ |
| [MetaData.DataDictionary_StagingColumns](DataDictionary_StagingColumns.md) | _Holds the column descriptions assembled from the distinct values within the column for that specific table_ |


---

###### Author:  david.poole

###### Copyright 2019 - All Rights Reserved

###### Created: 19 December 2020 20:53:30

