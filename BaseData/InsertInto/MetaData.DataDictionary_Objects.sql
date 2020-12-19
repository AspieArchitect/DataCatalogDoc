SET NUMERIC_ROUNDABORT OFF
GO
SET ANSI_PADDING, ANSI_WARNINGS, CONCAT_NULL_YIELDS_NULL, ARITHABORT, QUOTED_IDENTIFIER, ANSI_NULLS, NOCOUNT ON
GO
SET DATEFORMAT YMD
GO
SET XACT_ABORT ON
GO
SET TRANSACTION ISOLATION LEVEL Serializable
GO
BEGIN TRANSACTION


PRINT(N'Add 47 rows to [MetaData].[DataDictionary_Objects]')
INSERT INTO [MetaData].[DataDictionary_Objects] ([SchemaName], [ObjectName], [ObjectType], [ObjectDescription]) VALUES (N'dbo', N'__EFMigrationsHistory', 'TABLE', 'Entity Framework deployment (migration history)')
INSERT INTO [MetaData].[DataDictionary_Objects] ([SchemaName], [ObjectName], [ObjectType], [ObjectDescription]) VALUES (N'dbo', N'AccessGroups', 'TABLE', 'When Data Catalog permissions are turned on this is the association between a login user (or group) and one of the three access roles
1. Administrator
2. Read-Only
3. Classify Only')
INSERT INTO [MetaData].[DataDictionary_Objects] ([SchemaName], [ObjectName], [ObjectType], [ObjectDescription]) VALUES (N'dbo', N'AssetTypes', 'TABLE', 'Describes the type of object within the data catalog that can be categorized
* SQL Server Instance
* Database
* Schema
* Table
* Column')
INSERT INTO [MetaData].[DataDictionary_Objects] ([SchemaName], [ObjectName], [ObjectType], [ObjectDescription]) VALUES (N'dbo', N'AuditLog', 'TABLE', 'Keeps track of catalog object creation/deletion, classification changes, instance scans etc.  
For column classifications the table and column name will be captured as well as a JSON payload containing an array of tag categories applied')
INSERT INTO [MetaData].[DataDictionary_Objects] ([SchemaName], [ObjectName], [ObjectType], [ObjectDescription]) VALUES (N'dbo', N'AuthTokens', 'TABLE', 'Auth Tokens are access authentication tokens to allow Powershell cmdlets to interact with the data catalog')
INSERT INTO [MetaData].[DataDictionary_Objects] ([SchemaName], [ObjectName], [ObjectType], [ObjectDescription]) VALUES (N'dbo', N'ColumnFreeTextAttributes', 'TABLE', 'Associates a dbo.FreeTextAttributes record with a dbo.Columns record in order to record a descriptive note against the column.
For example, a free text attribute might be created to hold brief regulatory notes.  Those regulatory notes might be along the lines of the following.
* Can show truncated date down to year/month
* Pending advice from the ICO
* Do not transmit as this is a developer dumping ground and there is no guarantee that sensitive of PII data is excluded from such a column.')
INSERT INTO [MetaData].[DataDictionary_Objects] ([SchemaName], [ObjectName], [ObjectType], [ObjectDescription]) VALUES (N'dbo', N'Columns', 'TABLE', 'A list of columns detected within a database table as held in dbo.tables. The table structure is akin to a simplified version of the SQL Server sys.columns system table')
INSERT INTO [MetaData].[DataDictionary_Objects] ([SchemaName], [ObjectName], [ObjectType], [ObjectDescription]) VALUES (N'dbo', N'ColumnsCountPerDatabase', 'VIEW', 'For each database within a DB Server this view provides a count of the number of columns.')
INSERT INTO [MetaData].[DataDictionary_Objects] ([SchemaName], [ObjectName], [ObjectType], [ObjectDescription]) VALUES (N'dbo', N'ColumnsCountPerDatabaseWrapper', 'VIEW', 'For each database within a DB Server this view provides a count of the number of columns.  This is a NOEXPAND view over the top of dbo.ColumnsCountPerDatabase')
INSERT INTO [MetaData].[DataDictionary_Objects] ([SchemaName], [ObjectName], [ObjectType], [ObjectDescription]) VALUES (N'dbo', N'ColumnTags', 'TABLE', 'Associates a dbo.Tags record with a dbo.Columns record.')
INSERT INTO [MetaData].[DataDictionary_Objects] ([SchemaName], [ObjectName], [ObjectType], [ObjectDescription]) VALUES (N'dbo', N'ColumnTagsCountPerDatabase', 'VIEW', 'Provides a count by tag name within the tag category within the database with in the DB server instance')
INSERT INTO [MetaData].[DataDictionary_Objects] ([SchemaName], [ObjectName], [ObjectType], [ObjectDescription]) VALUES (N'dbo', N'ColumnTagsCountPerDatabaseWrapper', 'VIEW', 'Provides a count by tag name within the tag category within the database with in the DB server instance')
INSERT INTO [MetaData].[DataDictionary_Objects] ([SchemaName], [ObjectName], [ObjectType], [ObjectDescription]) VALUES (N'dbo', N'Databases', 'TABLE', 'A list of databases detected within each DB Server instance registered within the catalog as held in dbo.Instances')
INSERT INTO [MetaData].[DataDictionary_Objects] ([SchemaName], [ObjectName], [ObjectType], [ObjectDescription]) VALUES (N'dbo', N'DatabaseScanMergeAttempts', 'TABLE', 'Records when an attempt was made to merge the contents of a database scan into the catalogue')
INSERT INTO [MetaData].[DataDictionary_Objects] ([SchemaName], [ObjectName], [ObjectType], [ObjectDescription]) VALUES (N'dbo', N'DatabaseScans', 'TABLE', 'Records when each database within a DB server instance is scanned for updated catalog information.  This log will record a number of useful facts
1. The start/completion time of a scan  and thus the duration of the scan
2. Whether there were any errors identified during the scan
3. A hash value that can be used to determine if any changes were detected during the scan.')
INSERT INTO [MetaData].[DataDictionary_Objects] ([SchemaName], [ObjectName], [ObjectType], [ObjectDescription]) VALUES (N'dbo', N'FreeTextAttributes', 'TABLE', 'These are attributes that. when associated with a column (using dbo.ColumnFreeTextAttributes) allow brief notes to be recorded against that column')
INSERT INTO [MetaData].[DataDictionary_Objects] ([SchemaName], [ObjectName], [ObjectType], [ObjectDescription]) VALUES (N'dbo', N'InstanceAttributes', 'TABLE', 'Entity-Attribute-Value representation of properties relevant to the instance/server.  This allows for an extensible properties and values to be associated with an instance.')
INSERT INTO [MetaData].[DataDictionary_Objects] ([SchemaName], [ObjectName], [ObjectType], [ObjectDescription]) VALUES (N'dbo', N'Instances', 'TABLE', 'Lists the SQL Server instances registered in the Redgate Data Catalog')
INSERT INTO [MetaData].[DataDictionary_Objects] ([SchemaName], [ObjectName], [ObjectType], [ObjectDescription]) VALUES (N'dbo', N'InstanceScans', 'TABLE', 'A log of when the instances were scanned to detect new objects and attributes.  This is particularly useful for demonstrating to external auditors the recency of information in the catalogue.')
INSERT INTO [MetaData].[DataDictionary_Objects] ([SchemaName], [ObjectName], [ObjectType], [ObjectDescription]) VALUES (N'dbo', N'InstanceTags', 'TABLE', 'Associates a tag from the dbo.Tags table with a DB server instance as held in the dbo.Instances table.')
INSERT INTO [MetaData].[DataDictionary_Objects] ([SchemaName], [ObjectName], [ObjectType], [ObjectDescription]) VALUES (N'dbo', N'Operations', 'TABLE', 'TBD')
INSERT INTO [MetaData].[DataDictionary_Objects] ([SchemaName], [ObjectName], [ObjectType], [ObjectDescription]) VALUES (N'dbo', N'Schemas', 'TABLE', 'Provides a list of schemas detected within each database')
INSERT INTO [MetaData].[DataDictionary_Objects] ([SchemaName], [ObjectName], [ObjectType], [ObjectDescription]) VALUES (N'dbo', N'SnapshotData', 'TABLE', 'TBC')
INSERT INTO [MetaData].[DataDictionary_Objects] ([SchemaName], [ObjectName], [ObjectType], [ObjectDescription]) VALUES (N'dbo', N'Snapshots', 'TABLE', 'Snapshots of the estate are taken weekly on a Sunday.')
INSERT INTO [MetaData].[DataDictionary_Objects] ([SchemaName], [ObjectName], [ObjectType], [ObjectDescription]) VALUES (N'dbo', N'SuggestionPatterns', 'TABLE', 'A list of TSQL LIKE patterns that will be used against column names in order to associate the column with a rule')
INSERT INTO [MetaData].[DataDictionary_Objects] ([SchemaName], [ObjectName], [ObjectType], [ObjectDescription]) VALUES (N'dbo', N'SuggestionRules', 'TABLE', 'A list of rules aligned to the "Information Type" label introduced in SQL Server 2016
1. Networking
2. Contact Info
3. Credentials
4. Credit Cards
5. Banking
6. Financial
7. Other
8. Names
9. National ID
10. Social Security
11. Health
12. Dates of Birth')
INSERT INTO [MetaData].[DataDictionary_Objects] ([SchemaName], [ObjectName], [ObjectType], [ObjectDescription]) VALUES (N'dbo', N'SuggestionRuleTags', 'TABLE', 'Describes the mapping between a Suggestion Rule (being a category within information type) and a tag within the information type and sensitivity classification tags.')
INSERT INTO [MetaData].[DataDictionary_Objects] ([SchemaName], [ObjectName], [ObjectType], [ObjectDescription]) VALUES (N'dbo', N'Suggestions', 'TABLE', 'Identifies the rule and pattern associated with a column.')
INSERT INTO [MetaData].[DataDictionary_Objects] ([SchemaName], [ObjectName], [ObjectType], [ObjectDescription]) VALUES (N'dbo', N'SuggestionScans', 'TABLE', 'Maintains a log of when suggestion scans were run.  This includes the start and finish time stamps so the duration of the scan can be determined.')
INSERT INTO [MetaData].[DataDictionary_Objects] ([SchemaName], [ObjectName], [ObjectType], [ObjectDescription]) VALUES (N'dbo', N'sysdiagrams', 'TABLE', '')
INSERT INTO [MetaData].[DataDictionary_Objects] ([SchemaName], [ObjectName], [ObjectType], [ObjectDescription]) VALUES (N'dbo', N'Tables', 'TABLE', 'A list of tables detected within each schema as held within dbo.Schemas')
INSERT INTO [MetaData].[DataDictionary_Objects] ([SchemaName], [ObjectName], [ObjectType], [ObjectDescription]) VALUES (N'dbo', N'TagCategories', 'TABLE', 'A tag category is a grouping entity to which a number of tags can be associated.See [Open taxonomy](https://documentation.red-gate.com/sql-data-catalog/taxonomy/open-taxonomy "SQL Data Catalog taxonomy documentation")')
INSERT INTO [MetaData].[DataDictionary_Objects] ([SchemaName], [ObjectName], [ObjectType], [ObjectDescription]) VALUES (N'dbo', N'TagCategoryAssetTypeApplications', 'TABLE', 'Allows a category as held in dbo.TagCategories to be mapped to an asset type as held in dbo.AssetTypes.  The asset types are as follows.
* SQL Server Instance
* Database
* Schema
* Table
* Column')
INSERT INTO [MetaData].[DataDictionary_Objects] ([SchemaName], [ObjectName], [ObjectType], [ObjectDescription]) VALUES (N'dbo', N'Tags', 'TABLE', 'A tag is a label that exists within a category.  For example a tag category might be "Environment" and the tags within that category might be Development, Production, Test or UAT.')
INSERT INTO [MetaData].[DataDictionary_Objects] ([SchemaName], [ObjectName], [ObjectType], [ObjectDescription]) VALUES (N'MetaData', N'ColumnProfileCandidates', 'TABLE', 'A list of columns within tables that are (N)CHAR or (N)VARCHAR  and between 1 and 100 characters long.  An approximate row count is provided to forewarn when profiling activity might require consideration for the load on the system being profiled.')
INSERT INTO [MetaData].[DataDictionary_Objects] ([SchemaName], [ObjectName], [ObjectType], [ObjectDescription]) VALUES (N'MetaData', N'ColumnProfileResults', 'TABLE', 'Contains the COUNT(DISTINCT {column name}) for the given column within the table.  This is intended to allow a list of values from the column to be used to build up the description.')
INSERT INTO [MetaData].[DataDictionary_Objects] ([SchemaName], [ObjectName], [ObjectType], [ObjectDescription]) VALUES (N'MetaData', N'DataDictionary_ColumnDefaultDescriptions', 'VIEW', 'Provides default descriptions for columns based on a broad column retrieval pattern and a specific column name for items within that pattern.')
INSERT INTO [MetaData].[DataDictionary_Objects] ([SchemaName], [ObjectName], [ObjectType], [ObjectDescription]) VALUES (N'MetaData', N'DataDictionary_ColumnDefaults', 'TABLE', 'Provides the default description for columns of a specific name related back to the MetaData.DataDictionary_ColumnPatterns record.  For example
		* DateKey
		* DueDateKey
		* OrderDateKey
		* ShipDateKey')
INSERT INTO [MetaData].[DataDictionary_Objects] ([SchemaName], [ObjectName], [ObjectType], [ObjectDescription]) VALUES (N'MetaData', N'DataDictionary_ColumnPatterns', 'TABLE', 'Provides a broad wild card specification for retrieving a group of columns.  For example %DateKey.
		Designed to be used with MetaData.DataDictionary_ColumnDefaults to provide more descriptions for different instances of %DateKey columns.')
INSERT INTO [MetaData].[DataDictionary_Objects] ([SchemaName], [ObjectName], [ObjectType], [ObjectDescription]) VALUES (N'MetaData', N'DataDictionary_Columns', 'TABLE', 'Holds descriptions for columns within the tables or views.  This is to provide a means of allowing a low privileged role the means to maintain such descriptions as the sp_addextendedproperty and sp_updateextendedproperty both require ddl_admin or db_owner privileges.')
INSERT INTO [MetaData].[DataDictionary_Objects] ([SchemaName], [ObjectName], [ObjectType], [ObjectDescription]) VALUES (N'MetaData', N'DataDictionary_Objects', 'TABLE', 'Holds descriptions for tables and views.  This is to provide a means of allowing a low privileged role the means to maintain such descriptions as the sp_addextendedproperty and sp_updateextendedproperty both require ddl_admin or db_owner privileges.')
INSERT INTO [MetaData].[DataDictionary_Objects] ([SchemaName], [ObjectName], [ObjectType], [ObjectDescription]) VALUES (N'MetaData', N'DataDictionary_StagingColumns', 'TABLE', 'Holds the column descriptions assembled from the distinct values within the column for that specific table')
INSERT INTO [MetaData].[DataDictionary_Objects] ([SchemaName], [ObjectName], [ObjectType], [ObjectDescription]) VALUES (N'MetaData', N'DefaultColumnAndFKDescriptions', 'VIEW', 'Provides a column description based on the concatenation of three properties
* Default column description
* Foreign key join
* TABLE_SUMMARY property from the referenced object.')
INSERT INTO [MetaData].[DataDictionary_Objects] ([SchemaName], [ObjectName], [ObjectType], [ObjectDescription]) VALUES (N'MetaData', N'DefaultDescription_ForeignKey', 'VIEW', 'Provides a user friendly description for a column within a table that describes the join of the foreign key.
It also concatenates the description from the referenced table if the referenced table has a TABLE_SUMMARY property.')
INSERT INTO [MetaData].[DataDictionary_Objects] ([SchemaName], [ObjectName], [ObjectType], [ObjectDescription]) VALUES (N'MetaData', N'DefaultDescription_PrimaryKey', 'VIEW', 'Provides a default description for a single column primary key')
INSERT INTO [MetaData].[DataDictionary_Objects] ([SchemaName], [ObjectName], [ObjectType], [ObjectDescription]) VALUES (N'MetaData', N'ExistingColumnDescriptions', 'VIEW', 'The contents of any existing MS_DESCRIPTION properties for column in the table or view.  This is used to scavenge any existing comments into the MetaData.DataDictionary_Columns table.')
INSERT INTO [MetaData].[DataDictionary_Objects] ([SchemaName], [ObjectName], [ObjectType], [ObjectDescription]) VALUES (N'MetaData', N'ExistingObjectDescriptions', 'VIEW', 'The contents of any existing MS_DESCRIPTION properties for table and views.  This is used to scavenge any existing comments into the MetaData.DataDictionary_Objects table.')

COMMIT TRANSACTION
GO
