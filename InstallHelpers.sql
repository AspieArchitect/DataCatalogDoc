SET NOCOUNT,XACT_ABORT ON
:setvar MainDBServer "localhost"
:setvar MainDB "GettingStarted"
:setvar InstallationDirectory "C:\Users\david.poole\Documents\Visual Studio 2013\Projects\DataCatalogDoc"
:connect $(MainDBServer)
GO
USE $(MainDB)
GO
DECLARE
	@UserName SYSNAME ,
	@DeploymentTime CHAR(18),
	@DeploymentDB sysname,
	@CRLF CHAR(2)
SET	@CRLF = CHAR(13)+CHAR(10)
SET @UserName = SUSER_SNAME()+@CRLF
SET @DeploymentTime = CONVERT(CHAR(16),CURRENT_TIMESTAMP,120)+@CRLF
SET @DeploymentDB = DB_NAME()+@CRLF
PRINT '***************************************'
RAISERROR('DEPLOYMENT SERVER: %s%sDEPLOYMENT DB: %sDEPLOYMENT TIME:%sDEPLOYER: %s',10,1,@@SERVERNAME,@CRLF,@DeploymentDB,@DeploymentTime,@UserName)
PRINT 'InstallHelpers.sql in source control https://github.com/AspieArchitect/DataCatalogDoc.git'
PRINT '***************************************'
GO
:r $(InstallationDirectory)/PrePostInstallScripts/TearDownMetaData.sql

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
:r $(InstallationDirectory)/PrePostInstallScripts/ForeignKeys.sql

-- Stored Procs
:r $(InstallationDirectory)/StoredProcedures/MetaData.ApplyDataDictionary.sql
:r $(InstallationDirectory)/StoredProcedures/MetaData.PopulateDataDictionary.sql
:r $(InstallationDirectory)/StoredProcedures/MetaData.UpdateDataDictionaryObject.sql
:r $(InstallationDirectory)/StoredProcedures/MetaData.UpdateDataDictionaryColumn.sql
:r $(InstallationDirectory)/StoredProcedures/MetaData.HarvestExistingDescriptions.sql
:r $(InstallationDirectory)/StoredProcedures/MetaData.TestDataDictionaryObjects.sql
:r $(InstallationDirectory)/StoredProcedures/MetaData.TestDataDictionaryColumns.sql
:r $(InstallationDirectory)/StoredProcedures/MetaData.SetDefaultDescriptions.SQL
:r $(InstallationDirectory)/StoredProcedures/MetaData.RecordColumnStagingDescriptions.sql
:r $(InstallationDirectory)/StoredProcedures/MetaData.PopulateColumnProfileCandidates.sql

-- Data Load
:r $(InstallationDirectory)/BaseData/InsertInto/MetaData.DataDictionary_ColumnPatterns.sql
:r $(InstallationDirectory)/BaseData/InsertInto/MetaData.DataDictionary_ColumnDefaults.sql
:r $(InstallationDirectory)/BaseData/InsertInto/MetaData.DataDictionary_Objects.sql
:r $(InstallationDirectory)/BaseData/InsertInto/MetaData.DataDictionary_Columns.sql

