#### 

[Project](../../../../../index.md) > [DADSPCJUNE2014](../../../../index.md) > [User databases](../../../index.md) > [Redgate_SqlDataCatalog](../../index.md) > [Programmability](../index.md) > [Stored Procedures](Stored_Procedures.md) > MetaData.UpdateDataDictionaryColumn

# ![Stored Procedures](../../../../../Images/StoredProcedure32.png) [MetaData].[UpdateDataDictionaryColumn]

---

## <a name="#description"></a>MS_Description

Sets the description of a column within a table or view

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| ANSI Nulls On | YES |
| Quoted Identifier On | YES |


---

## <a name="#parameters"></a>Parameters

| Name | Data Type | Max Length (Bytes) | Description |
|---|---|---|---|
| @SchemaName | sysname | 256 | _The name of the schema in which the table or view holding the column resided_ |
| @ObjectName | sysname | 256 | _The name of the table or view holding the column_ |
| @ColumnName | sysname | 256 | _The name of the column for which a description is to be applied_ |
| @ColumnDescription | varchar(7000) | 7000 | _The user friendly description for the column_ |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE PROC [MetaData].[UpdateDataDictionaryColumn]
    @SchemaName sysname = N'dbo',
    @ObjectName sysname, 
    @ColumnName sysname, 
    @ColumnDescription VARCHAR(7000) = '' 
AS 
    SET NOCOUNT ON
    UPDATE  MetaData.DataDictionary_Columns
    SET     ColumnDescription = ISNULL(@ColumnDescription, '')
    WHERE   SchemaName = @SchemaName
            AND ObjectName = @ObjectName
            AND ColumnName = @ColumnName
    RETURN @@ROWCOUNT
GO
EXEC sp_addextendedproperty N'MS_Description', N'Sets the description of a column within a table or view', 'SCHEMA', N'MetaData', 'PROCEDURE', N'UpdateDataDictionaryColumn', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'The user friendly description for the column', 'SCHEMA', N'MetaData', 'PROCEDURE', N'UpdateDataDictionaryColumn', 'PARAMETER', N'@ColumnDescription'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the column for which a description is to be applied', 'SCHEMA', N'MetaData', 'PROCEDURE', N'UpdateDataDictionaryColumn', 'PARAMETER', N'@ColumnName'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the table or view holding the column', 'SCHEMA', N'MetaData', 'PROCEDURE', N'UpdateDataDictionaryColumn', 'PARAMETER', N'@ObjectName'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the schema in which the table or view holding the column resided', 'SCHEMA', N'MetaData', 'PROCEDURE', N'UpdateDataDictionaryColumn', 'PARAMETER', N'@SchemaName'
GO

```


---

## <a name="#uses"></a>Uses

* [[MetaData].[DataDictionary_Columns]](../../Tables/DataDictionary_Columns.md)
* [MetaData](../../Security/Schemas/MetaData.md)


---

###### Author:  david.poole

###### Copyright 2019 - All Rights Reserved

###### Created: 19 April 2020 16:29:41

