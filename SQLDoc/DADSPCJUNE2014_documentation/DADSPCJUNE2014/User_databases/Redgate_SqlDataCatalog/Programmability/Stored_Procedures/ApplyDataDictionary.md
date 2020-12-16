#### 

[Project](../../../../../readme.md) > [DADSPCJUNE2014](../../../../readme.md) > [User databases](../../../readme.md) > [Redgate_SqlDataCatalog](../../readme.md) > [Programmability](../readme.md) > [Stored Procedures](Stored_Procedures.md) > MetaData.ApplyDataDictionary

# ![Stored Procedures](../../../../../Images/StoredProcedure32.png) [MetaData].[ApplyDataDictionary]

---

## <a name="#description"></a>MS_Description

Takes the non-blank descriptions from MetaData.DataDictionary_Objects and MetaData.DataDictionary_Columns and writes them to the MS_DESCRIPTION extended property for the tables, views and their columns

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| ANSI Nulls On | YES |
| Quoted Identifier On | YES |


---

## <a name="#sqlscript"></a>SQL Script

```sql

CREATE PROC [MetaData].[ApplyDataDictionary]
AS
SET NOCOUNT ON;
DECLARE @SQLVersion VARCHAR(30),
        @SchemaOrUser sysname;

-- Determine if pre-SQL2005 is the platform.
SET @SQLVersion = CONVERT(VARCHAR, SERVERPROPERTY('ProductVersion'));
IF CAST(LEFT(@SQLVersion, CHARINDEX('.', @SQLVersion) - 1) AS TINYINT) < 9
    SET @SchemaOrUser = 'User';
ELSE
    SET @SchemaOrUser = 'Schema';

DECLARE @SchemaName sysname,
        @ObjectName sysname,
        @ObjectType sysname,
        @ColumnName sysname,
        @ObjectDescription VARCHAR(7000);

DECLARE csr_dd CURSOR FAST_FORWARD FOR
SELECT DT.SchemaName,
       DT.ObjectName,
       DT.ObjectType,
       DT.ObjectDescription
FROM MetaData.DataDictionary_Objects AS DT
    INNER JOIN INFORMATION_SCHEMA.TABLES AS T
        ON DT.SchemaName COLLATE Latin1_General_CI_AS = T.TABLE_SCHEMA COLLATE Latin1_General_CI_AS
           AND DT.ObjectName COLLATE Latin1_General_CI_AS = T.TABLE_NAME COLLATE Latin1_General_CI_AS
WHERE DT.ObjectDescription <> '';

OPEN csr_dd;
FETCH NEXT FROM csr_dd
INTO @SchemaName,
     @ObjectName,
     @ObjectType,
     @ObjectDescription;
WHILE @@FETCH_STATUS = 0
BEGIN
    IF EXISTS
    (
        SELECT 1
        FROM::fn_listextendedproperty('MS_Description', @SchemaOrUser, @SchemaName, @ObjectType, @ObjectName, DEFAULT, DEFAULT)
    )
        EXECUTE sp_updateextendedproperty N'MS_Description',
                                          @ObjectDescription,
                                          @SchemaOrUser,
                                          @SchemaName,
                                          @ObjectType,
                                          @ObjectName,
                                          NULL,
                                          NULL;
    ELSE
        EXECUTE sp_addextendedproperty N'MS_Description',
                                       @ObjectDescription,
                                       @SchemaOrUser,
                                       @SchemaName,
                                       @ObjectType,
                                       @ObjectName,
                                       NULL,
                                       NULL;

    RAISERROR('DOCUMENTED %s: %s', 10, 1, @ObjectType, @ObjectName) WITH NOWAIT;
    FETCH NEXT FROM csr_dd
    INTO @SchemaName,
         @ObjectName,
         @ObjectType,
         @ObjectDescription;
END;
CLOSE csr_dd;
DEALLOCATE csr_dd;
DECLARE csr_ddf CURSOR FAST_FORWARD FOR
SELECT DT.SchemaName,
       DT.ObjectName,
       DT.ObjectType,
       DT.ColumnName,
       DT.ColumnDescription
FROM MetaData.DataDictionary_Columns AS DT
    INNER JOIN INFORMATION_SCHEMA.COLUMNS AS T
        ON DT.SchemaName COLLATE Latin1_General_CI_AS = T.TABLE_SCHEMA COLLATE Latin1_General_CI_AS
           AND DT.ObjectName COLLATE Latin1_General_CI_AS = T.TABLE_NAME COLLATE Latin1_General_CI_AS
           AND DT.ColumnName COLLATE Latin1_General_CI_AS = T.COLUMN_NAME COLLATE Latin1_General_CI_AS
WHERE DT.ColumnDescription <> '';
OPEN csr_ddf;
FETCH NEXT FROM csr_ddf
INTO @SchemaName,
     @ObjectName,
     @ObjectType,
     @ColumnName,
     @ObjectDescription;
WHILE @@FETCH_STATUS = 0
BEGIN
    IF EXISTS
    (
        SELECT *
        FROM::fn_listextendedproperty('MS_Description', @SchemaOrUser, @SchemaName, @ObjectType, @ObjectName, 'column', @ColumnName)
    )
        EXECUTE sp_updateextendedproperty N'MS_Description',
                                          @ObjectDescription,
                                          @SchemaOrUser,
                                          @SchemaName,
                                          @ObjectType,
                                          @ObjectName,
                                          N'column',
                                          @ColumnName;
    ELSE
        EXECUTE sp_addextendedproperty N'MS_Description',
                                       @ObjectDescription,
                                       @SchemaOrUser,
                                       @SchemaName,
                                       @ObjectType,
                                       @ObjectName,
                                       N'column',
                                       @ColumnName;
    RAISERROR('DOCUMENTED COLUMN: %s.%s', 10, 1, @ObjectName, @ColumnName) WITH NOWAIT;
    FETCH NEXT FROM csr_ddf
    INTO @SchemaName,
         @ObjectName,
         @ObjectType,
         @ColumnName,
         @ObjectDescription;
END;
CLOSE csr_ddf;
DEALLOCATE csr_ddf;
GO
EXEC sp_addextendedproperty N'MS_Description', N'Takes the non-blank descriptions from MetaData.DataDictionary_Objects and MetaData.DataDictionary_Columns and writes them to the MS_DESCRIPTION extended property for the tables, views and their columns', 'SCHEMA', N'MetaData', 'PROCEDURE', N'ApplyDataDictionary', NULL, NULL
GO

```


---

## <a name="#uses"></a>Uses

* [[MetaData].[DataDictionary_Columns]](../../Tables/DataDictionary_Columns.md)
* [[MetaData].[DataDictionary_Objects]](../../Tables/DataDictionary_Objects.md)
* [MetaData](../../Security/Schemas/MetaData.md)


---

###### Author:  david.poole

###### Copyright 2019 - All Rights Reserved

###### Created: 29 November 2020 18:21:54

