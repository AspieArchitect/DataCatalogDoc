#### 

[Project](../../../../../readme.md) > [DADSPCJUNE2014](../../../../readme.md) > [User databases](../../../readme.md) > [Redgate_SqlDataCatalog](../../readme.md) > [Programmability](../readme.md) > [Stored Procedures](Stored_Procedures.md) > MetaData.TestDataDictionaryColumns

# ![Stored Procedures](../../../../../Images/StoredProcedure32.png) [MetaData].[TestDataDictionaryColumns]

---

## <a name="#description"></a>MS_Description

Identifies any columns with empty descriptions and raises an error of sufficient severity to break any continuous integration build.
The offending schemas, objects and columns will be listed.

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| ANSI Nulls On | YES |
| Quoted Identifier On | YES |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE PROC [MetaData].[TestDataDictionaryColumns]
AS 
    SET NOCOUNT ON
    DECLARE @RecordCount INT
    DECLARE @ColumnList TABLE
        (
          SchemaName sysname NOT NULL,
          ObjectName SYSNAME NOT NULL,
		  ObjectType SYSNAME NOT NULL,
          ColumnName sysname NOT NULL,
          PRIMARY KEY CLUSTERED ( SchemaName, ObjectName, ColumnName )
        )
    EXEC MetaData.PopulateDataDictionary -- Ensure the MetaData.DataDictionary tables are up-to-date.
	EXEC MetaData.HarvestExistingDescriptions -- Ensure that any existing descriptions are applied
    INSERT  INTO @ColumnList
            (
              SchemaName,
              ObjectName,
			  ObjectType,
              ColumnName
            )
            SELECT  SchemaName,
                    ObjectName,
					ObjectType,
                    ColumnName
            FROM    MetaData.DataDictionary_Columns
            WHERE   ObjectName NOT LIKE 'MSp%' -- ???
                    AND ObjectName NOT LIKE 'sys%' -- Exclude standard system tables.
                    AND ColumnDescription = ''
    SET @RecordCount = @@ROWCOUNT
    IF @RecordCount > 0 
        BEGIN
            PRINT ''
            PRINT 'The following recordset shows the tables/Columns for which data dictionary descriptions are missing'
            PRINT ''
            SELECT  LEFT(SchemaName, 15) AS SchemaName,
                    LEFT(ObjectName, 30) AS ObjectName,
					LEFT(ObjectType, 30) AS ObjectType,
                    LEFT(ColumnName, 30) AS ColumnName
            FROM    @ColumnList
            UNION ALL
            SELECT  '',
                    '',
                    '',
                    '' -- Used to force a blank line
            RAISERROR ( '%i Column(s) lack descriptions', 16, 1, @RecordCount )
                WITH NOWAIT
        END
GO
EXEC sp_addextendedproperty N'MS_Description', N'Identifies any columns with empty descriptions and raises an error of sufficient severity to break any continuous integration build.
The offending schemas, objects and columns will be listed.', 'SCHEMA', N'MetaData', 'PROCEDURE', N'TestDataDictionaryColumns', NULL, NULL
GO

```


---

## <a name="#uses"></a>Uses

* [[MetaData].[DataDictionary_Columns]](../../Tables/DataDictionary_Columns.md)
* [[MetaData].[HarvestExistingDescriptions]](HarvestExistingDescriptions.md)
* [[MetaData].[PopulateDataDictionary]](PopulateDataDictionary.md)
* [MetaData](../../Security/Schemas/MetaData.md)


---

###### Author:  david.poole

###### Copyright 2019 - All Rights Reserved

###### Created: 10 May 2020 16:47:57

