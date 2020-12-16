#### 

[Project](../../../../../readme.md) > [DADSPCJUNE2014](../../../../readme.md) > [User databases](../../../readme.md) > [Redgate_SqlDataCatalog](../../readme.md) > [Programmability](../readme.md) > [Stored Procedures](Stored_Procedures.md) > MetaData.PopulateDataDictionary

# ![Stored Procedures](../../../../../Images/StoredProcedure32.png) [MetaData].[PopulateDataDictionary]

---

## <a name="#description"></a>MS_Description

Reads the INFORMATION_SCHEMA views to populate the two tables
* MetaData.DataDictionary_Objects 
* MetaData.DataDictionary_Columns
These will have blank description until the two scavenge stored procedures are executed.

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| ANSI Nulls On | YES |
| Quoted Identifier On | YES |


---

## <a name="#sqlscript"></a>SQL Script

```sql

CREATE PROC [MetaData].[PopulateDataDictionary]
AS 
    SET NOCOUNT ON
    DECLARE @ObjectCount INT,
        @ColumnCount INT
    INSERT  INTO MetaData.DataDictionary_Objects ( SchemaName, ObjectName,ObjectType )
            SELECT  SRC.TABLE_SCHEMA,
                    TABLE_NAME,
					REPLACE(SRC.TABLE_TYPE,'BASE ','') AS ObjectType
            FROM    INFORMATION_SCHEMA.TABLES AS SRC
                    LEFT JOIN MetaData.DataDictionary_Objects AS DEST
                        ON SRC.table_Schema = DEST.SchemaName
                           AND SRC.table_name = DEST.ObjectName
            WHERE   DEST.SchemaName IS NULL
                    AND SRC.table_Type IN( 'BASE TABLE','VIEW')
                    AND OBJECTPROPERTY(OBJECT_ID(QUOTENAME(SRC.TABLE_SCHEMA)
                                                 + '.'
                                                 + QUOTENAME(SRC.TABLE_NAME)),
                                       'IsMSShipped') = 0
    SET @ObjectCount = @@ROWCOUNT
    INSERT  INTO MetaData.DataDictionary_Columns
            (
              SchemaName,
              ObjectName,
			  ObjectType,
              ColumnName
            )
            SELECT  C.TABLE_SCHEMA,
                    C.TABLE_NAME,
					T.ObjectType,
                    C.COLUMN_NAME
            FROM    INFORMATION_SCHEMA.COLUMNS AS C
                    INNER JOIN MetaData.DataDictionary_Objects AS T
                        ON C.TABLE_SCHEMA = T.SchemaName
                           AND C.TABLE_NAME = T.ObjectName
                    LEFT JOIN MetaData.DataDictionary_Columns AS F
                        ON C.TABLE_SCHEMA = F.SchemaName
                           AND C.TABLE_NAME = F.ObjectName
                           AND C.COLUMN_NAME = F.ColumnName
            WHERE   F.SchemaName IS NULL
                    AND OBJECTPROPERTY(OBJECT_ID(QUOTENAME(C.TABLE_SCHEMA)
                                                 + '.'
                                                 + QUOTENAME(C.TABLE_NAME)),
                                       'IsMSShipped') = 0
    SET @ColumnCount = @@ROWCOUNT
    RAISERROR ( 'DATA DICTIONARY: %i tables & %i fields added', 10, 1,
        @ObjectCount, @ColumnCount ) WITH NOWAIT
GO
EXEC sp_addextendedproperty N'MS_Description', N'Reads the INFORMATION_SCHEMA views to populate the two tables
* MetaData.DataDictionary_Objects 
* MetaData.DataDictionary_Columns
These will have blank description until the two scavenge stored procedures are executed.', 'SCHEMA', N'MetaData', 'PROCEDURE', N'PopulateDataDictionary', NULL, NULL
GO

```


---

## <a name="#uses"></a>Uses

* [[MetaData].[DataDictionary_Columns]](../../Tables/DataDictionary_Columns.md)
* [[MetaData].[DataDictionary_Objects]](../../Tables/DataDictionary_Objects.md)
* [MetaData](../../Security/Schemas/MetaData.md)


---

## <a name="#usedby"></a>Used By

* [[MetaData].[SetDefaultDescriptions]](SetDefaultDescriptions.md)
* [[MetaData].[TestDataDictionaryColumns]](TestDataDictionaryColumns.md)
* [[MetaData].[TestDataDictionaryObjects]](TestDataDictionaryObjects.md)


---

###### Author:  david.poole

###### Copyright 2019 - All Rights Reserved

###### Created: 29 November 2020 18:21:54

