#### 

[Project](../../../../../index.md) > [DADSPCJUNE2014](../../../../index.md) > [User databases](../../../index.md) > [Redgate_SqlDataCatalog](../../index.md) > [Programmability](../index.md) > [Stored Procedures](Stored_Procedures.md) > MetaData.UpdateDataDictionaryObject

# ![Stored Procedures](../../../../../Images/StoredProcedure32.png) [MetaData].[UpdateDataDictionaryObject]

---

## <a name="#description"></a>MS_Description

Sets the description of a table or view

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| ANSI Nulls On | YES |
| Quoted Identifier On | YES |


---

## <a name="#parameters"></a>Parameters

| Name | Data Type | Max Length (Bytes) | Description |
|---|---|---|---|
| @SchemaName | sysname | 256 | _The name of the schema in which the table or view resides_ |
| @ObjectName | sysname | 256 | _The name of the table or view for which a description will be created._ |
| @ObjectDescription | varchar(7000) | 7000 | _The user friendly description of the table or view_ |


---

## <a name="#sqlscript"></a>SQL Script

```sql

CREATE PROC [MetaData].[UpdateDataDictionaryObject]
    @SchemaName sysname = N'dbo',
    @ObjectName sysname, 
    @ObjectDescription VARCHAR(7000) = '' 
AS 
    SET NOCOUNT ON
    UPDATE  MetaData.DataDictionary_Objects
    SET     ObjectDescription = ISNULL(@ObjectDescription, '')
    WHERE   SchemaName = @SchemaName
            AND ObjectName = @ObjectName
    RETURN @@ROWCOUNT
GO
EXEC sp_addextendedproperty N'MS_Description', N'Sets the description of a table or view', 'SCHEMA', N'MetaData', 'PROCEDURE', N'UpdateDataDictionaryObject', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'The user friendly description of the table or view', 'SCHEMA', N'MetaData', 'PROCEDURE', N'UpdateDataDictionaryObject', 'PARAMETER', N'@ObjectDescription'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the table or view for which a description will be created.', 'SCHEMA', N'MetaData', 'PROCEDURE', N'UpdateDataDictionaryObject', 'PARAMETER', N'@ObjectName'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the schema in which the table or view resides', 'SCHEMA', N'MetaData', 'PROCEDURE', N'UpdateDataDictionaryObject', 'PARAMETER', N'@SchemaName'
GO

```


---

## <a name="#uses"></a>Uses

* [[MetaData].[DataDictionary_Objects]](../../Tables/DataDictionary_Objects.md)
* [MetaData](../../Security/Schemas/MetaData.md)


---

###### Author:  david.poole

###### Copyright 2019 - All Rights Reserved

###### Created: 19 April 2020 16:29:41

