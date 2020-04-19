#### 

[Project](../../../../index.md) > [DADSPCJUNE2014](../../../index.md) > [User databases](../../index.md) > [Redgate_SqlDataCatalog](../index.md) > [Tables](Tables.md) > dbo.Tables

# ![Tables](../../../../Images/Table32.png) [dbo].[Tables]

---

## <a name="#description"></a>MS_Description

Tables are database objects that contain all the data in a database.In tables, data is logically organized in a row - and - column format similar to a spreadsheet.  These are grouped into schemas as listed in the dbo.Schemas table

## <a name="#columns"></a>Columns

| Key | Name | Data Type | Max Length (Bytes) | Nullability | Default | Description |
|---|---|---|---|---|---|---|
| [![Indexes IX_Tables_SchemaId_Name](../../../../Images/Index.png)](#indexes) | Name | nvarchar(128) | 256 | NOT NULL |  | _The name of the table as it appears within the database schema._ |
|  | DetectedAtUtc | datetime2 | 8 | NOT NULL |  | _The timestamp for when a scan activity identified the information to generate the record_ |
|  | RowCount | bigint | 8 | NOT NULL | (CONVERT([bigint],(0))) | _The approximate number of records within the table._ |
| [![Cluster Primary Key PK_Tables: Id](../../../../Images/pkcluster.png)](#indexes) | Id | bigint | 8 | NOT NULL | (CONVERT([bigint],(0))) | _The clustered primary key that uniquely identifies the dbo.Tables record._ |
| [![Indexes IX_Tables_SchemaId_Name](../../../../Images/Index.png)](#indexes)[![Foreign Keys FK_Tables_Schemas_SchemaId: [dbo].[Schemas].SchemaId](../../../../Images/fk.png)](#foreignkeys) | SchemaId | bigint | 8 | NOT NULL |  | _Join to Id column in the dbo.Schemas table._ |


---

## <a name="#uses"></a>Uses

* [[dbo].[Schemas]](Schemas.md)


---

## <a name="#usedby"></a>Used By

* [[dbo].[Columns]](Columns.md)
* [[dbo].[ColumnsCountPerDatabase]](../Views/ColumnsCountPerDatabase.md)
* [[dbo].[ColumnTagsCountPerDatabase]](../Views/ColumnTagsCountPerDatabase.md)


---

###### Author:  david.poole

###### Copyright 2019 - All Rights Reserved

###### Created: 19 April 2020 16:29:41

