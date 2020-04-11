:setvar MainDBServer "localhost"
:setvar MainDB "GettingStarted"
:setvar InstallationDirectory "C:\Users\david.poole\Documents\Visual Studio 2013\Projects\DataCatalogDoc"
:connect $(MainDBServer)
GO
USE $(MainDB)
GO
-- Set up the MetaData schema
:r $(InstallationDirectory)/Schemas/MetaData.sql

-- Set up the MetaData tables taking into account the dependencies
:r $(InstallationDirectory)/Tables/MetaData.DataDictionary_Objects.sql
:r $(InstallationDirectory)/Tables/MetaData.DataDictionary_Columns.sql
:r $(InstallationDirectory)/Tables/MetaData.ColumnProfileCandidates.sql
:r $(InstallationDirectory)/Tables/MetaData.DataDictionary_StagingColumns.sql
:r $(InstallationDirectory)/Tables/MetaData.ColumnProfileResults.sql
:r $(InstallationDirectory)/Tables/MetaData.DataDictionary_ColumnPatterns.sql
:r $(InstallationDirectory)/Tables/MetaData.DataDictionary_ColumnDefaults.sql

-- Set up the Views taking into account the dependencies
:r $(InstallationDirectory)/Views/MetaData.ExistingObjectDescriptions.sql
:r $(InstallationDirectory)/Views/MetaData.ExistingColumnDescriptions.sql
:r $(InstallationDirectory)/Views/MetaData.DefaultDescription_PrimaryKey.sql
:r $(InstallationDirectory)/Views/MetaData.DefaultDescription_ForeignKey.sql
:r $(InstallationDirectory)/Views/MetaData.DataDictionary_ColumnDefaultDescriptions.sql
:r $(InstallationDirectory)/Views/MetaData.DefaultColumnAndFKDescriptions.sql

-- Foreign Keys
:r $(InstallationDirectory)/PostInstallScripts/ForeignKeys.sql
