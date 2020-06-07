#### 

[Project](../../../../../readme.md) > [DADSPCJUNE2014](../../../../readme.md) > [User databases](../../../readme.md) > [Redgate_SqlDataCatalog](../../readme.md) > [Programmability](../readme.md) > [Stored Procedures](Stored_Procedures.md) > MetaData.RecordColumnStagingDescriptions

# ![Stored Procedures](../../../../../Images/StoredProcedure32.png) [MetaData].[RecordColumnStagingDescriptions]

---

## <a name="#description"></a>MS_Description

Extracts a DISTINCT list of values for each column in MetaData.ColumnProfileResults where there are fewer than 13 entries

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| ANSI Nulls On | YES |
| Quoted Identifier On | YES |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE PROC [MetaData].[RecordColumnStagingDescriptions]
AS
SET NOCOUNT ON;
TRUNCATE TABLE MetaData.DataDictionary_StagingColumns

DECLARE @SQLCommandList TABLE
(
    SQLCommand VARCHAR(2000) NOT NULL
);
DECLARE @SQLCommand VARCHAR(2000) = '';

INSERT INTO @SQLCommandList
(
    SQLCommand
)
SELECT 'INSERT INTO MetaData.DataDictionary_StagingColumns SELECT ''' + SchemaName + ''' AS SchemaName,''' + ObjectName
       + ''' AS ObjectName,''' + ColumnName + ''' AS ColumnName,REPLACE(STUFF((SELECT DISTINCT CHAR(13) + CHAR(10) + CHAR(42) + CHAR(160) + ' 
	   + QUOTENAME(ColumnName)
	   + ' FROM '
	   + QUOTENAME(SchemaName) + '.' + QUOTENAME(ObjectName)
	   + ' WHERE ' + QUOTENAME(ColumnName) + ' IS NOT NULL FOR XML PATH(''''), TYPE).value(''.'',''NVARCHAR(MAX)''),1,2,''''),CHAR(39),CHAR(39)+CHAR(39));'
	   AS SQLCommand
FROM MetaData.ColumnProfileResults
WHERE  NumberOfValues<=12;

WHILE @SQLCommand IS NOT NULL
BEGIN
    SELECT @SQLCommand = MIN(SQLCommand)
    FROM @SQLCommandList
    WHERE SQLCommand > @SQLCommand;

    IF @SQLCommand IS NOT NULL
    BEGIN
        EXEC (@SQLCommand);
        PRINT @SQLCommand;
    END;
END;
GO
EXEC sp_addextendedproperty N'MS_Description', N'Extracts a DISTINCT list of values for each column in MetaData.ColumnProfileResults where there are fewer than 13 entries', 'SCHEMA', N'MetaData', 'PROCEDURE', N'RecordColumnStagingDescriptions', NULL, NULL
GO

```


---

## <a name="#uses"></a>Uses

* [[MetaData].[ColumnProfileResults]](../../Tables/ColumnProfileResults.md)
* [[MetaData].[DataDictionary_StagingColumns]](../../Tables/DataDictionary_StagingColumns.md)
* [MetaData](../../Security/Schemas/MetaData.md)


---

###### Author:  david.poole

###### Copyright 2019 - All Rights Reserved

###### Created: 10 May 2020 16:47:57

