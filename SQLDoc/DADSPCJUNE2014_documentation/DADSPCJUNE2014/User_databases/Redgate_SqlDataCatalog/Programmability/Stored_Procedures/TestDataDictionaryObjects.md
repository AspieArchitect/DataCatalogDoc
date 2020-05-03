#### 

[Project](../../../../../readme.md) > [DADSPCJUNE2014](../../../../readme.md) > [User databases](../../../readme.md) > [Redgate_SqlDataCatalog](../../readme.md) > [Programmability](../readme.md) > [Stored Procedures](Stored_Procedures.md) > MetaData.TestDataDictionaryObjects

# ![Stored Procedures](../../../../../Images/StoredProcedure32.png) [MetaData].[TestDataDictionaryObjects]

---

## <a name="#description"></a>MS_Description

Identifies any tables or views with empty descriptions and raises an error of sufficient severity to break any continuous integration build.
The offending schemas, tables or views will be listed

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| ANSI Nulls On | YES |
| Quoted Identifier On | YES |


---

## <a name="#sqlscript"></a>SQL Script

```sql


CREATE PROC [MetaData].[TestDataDictionaryObjects]
AS
SET NOCOUNT ON;
DECLARE @ObjectList TABLE
(
    SchemaName sysname NOT NULL,
    ObjectName sysname NOT NULL,
    ObjectType sysname NOT NULL,
    PRIMARY KEY CLUSTERED (
                              SchemaName,
                              ObjectName
                          )
);
DECLARE @RecordCount INT;
EXEC MetaData.PopulateDataDictionary; -- Ensure the MetaData.DataDictionary Objects are up-to-date.
EXEC MetaData.HarvestExistingDescriptions; -- Ensure that any existing descriptions are scavenged.

INSERT INTO @ObjectList
(
    SchemaName,
    ObjectName,
    ObjectType
)
SELECT SchemaName,
       ObjectName,
       ObjectType
FROM MetaData.DataDictionary_Objects
WHERE ObjectName NOT LIKE 'MSp%' -- ???
      AND ObjectName NOT LIKE 'sys%' -- Exclude standard system Objects.
      AND ObjectDescription = '';
SET @RecordCount = @@ROWCOUNT;
IF @RecordCount > 0
BEGIN
    PRINT '';
    PRINT 'The following recordset shows the Objects for which data dictionary descriptions are missing';
    PRINT '';
    SELECT LEFT(SchemaName, 15) AS SchemaName,
           LEFT(ObjectName, 30) AS ObjectName,
           ObjectType
    FROM @ObjectList
    UNION ALL
    SELECT '',
           '',
           ''; -- Used to force a blank line
    RAISERROR('%i Object(s) lack descriptions', 16, 1, @RecordCount) WITH NOWAIT;
END;
GO
EXEC sp_addextendedproperty N'MS_Description', N'Identifies any tables or views with empty descriptions and raises an error of sufficient severity to break any continuous integration build.
The offending schemas, tables or views will be listed', 'SCHEMA', N'MetaData', 'PROCEDURE', N'TestDataDictionaryObjects', NULL, NULL
GO

```


---

## <a name="#uses"></a>Uses

* [[MetaData].[DataDictionary_Objects]](../../Tables/DataDictionary_Objects.md)
* [[MetaData].[HarvestExistingDescriptions]](HarvestExistingDescriptions.md)
* [[MetaData].[PopulateDataDictionary]](PopulateDataDictionary.md)
* [MetaData](../../Security/Schemas/MetaData.md)


---

###### Author:  david.poole

###### Copyright 2019 - All Rights Reserved

###### Created: 03 May 2020 12:11:20

