#### 

[Project](../../../../readme.md) > [DADSPCJUNE2014](../../../readme.md) > [User databases](../../readme.md) > [Redgate_SqlDataCatalog](../readme.md) > [Tables](Tables.md) > dbo.Columns

# ![Tables](../../../../Images/Table32.png) [dbo].[Columns]

---

## <a name="#description"></a>MS_Description

A list of columns detected within a database table as held in dbo.tables. The table structure is akin to a simplified version of the SQL Server sys.columns system table

## <a name="#columns"></a>Columns

| Key | Name | Data Type | Max Length (Bytes) | Nullability | Default | Description |
|---|---|---|---|---|---|---|
| [![Indexes IX_Columns_TableId_Name](../../../../Images/Index.png)](#indexes) | Name | nvarchar(128) | 256 | NOT NULL |  | _The name of the column as it appears in the table within the database_ |
| [![Indexes IX_Columns_TableId_Name](../../../../Images/Index.png)](#indexes)[![Foreign Keys FK_Columns_Tables_TableId: [dbo].[Tables].TableId](../../../../Images/fk.png)](#foreignkeys) | TableId | bigint | 8 | NOT NULL |  | _Join to Id column in the dbo.Tables table.  Tables are database objects that contain all the data in a database.In tables, data is logically organized in a row - and - column format similar to a spreadsheet.  These are grouped into schemas as listed in the dbo.Schemas table_ |
| [![Cluster Primary Key PK_Columns: Id](../../../../Images/pkcluster.png)](#indexes) | Id | bigint | 8 | NOT NULL | (CONVERT([bigint],(0))) | _The clustered primary key that uniquely identifies the dbo.Columns record._ |
|  | DetectedAtUtc | datetime2 | 8 | NOT NULL |  | _The timestamp for when a scan activity identified the information to generate the record_ |
|  | DataType_Name | nvarchar(128) | 256 | NOT NULL |  | _The data type name is the SQL data type used when designing the tables.  These can be SQL Standard types, SQL Server proprietary types or custom types._ |
|  | Description | nvarchar(1024) | 2048 | NULL allowed |  | _The column description as harvested from the MS_DESCRIPTION extended property attached to the column in the original database._ |
|  | Constraints_IsCompositeKey | bit | 1 | NOT NULL | ((0)) | _Flag to indicate whether the column within the table participates in a composite key._ |
|  | Constraints_IsForeignKey | bit | 1 | NOT NULL | ((0)) | _Flag to indicate whether or not the column within the table participates in a foreign key_ |
|  | Constraints_IsIdentity | bit | 1 | NOT NULL | ((0)) | _Flat to indicate whether or not the column is an IDENTITY property._ |
|  | Constraints_IsPrimaryKey | bit | 1 | NOT NULL | ((0)) | _Flag to indicate whether or not the column participates in a primary key constraint._ |
|  | DataType_MaxLength | bigint | 8 | NOT NULL |  | _The storage length for the column within the database.  For example the "Description" column within this table shows as 2048  even though the data type is NVARCHAR(1024)_ |
|  | DataType_Precision | tinyint | 1 | NOT NULL | ((0)) | _For numeric types this will be the number of digits used._ |
|  | DataType_Scale | tinyint | 1 | NOT NULL | ((0)) | _For numeric types this will be the number of digits to the right of the decimal point._ |


---

## <a name="#uses"></a>Uses

* [[dbo].[Tables]](Tables_0000.md)


---

## <a name="#usedby"></a>Used By

* [[dbo].[ColumnFreeTextAttributes]](ColumnFreeTextAttributes.md)
* [[dbo].[ColumnTags]](ColumnTags.md)
* [[dbo].[Suggestions]](Suggestions.md)
* [[dbo].[ColumnsCountPerDatabase]](../Views/ColumnsCountPerDatabase.md)
* [[dbo].[ColumnTagsCountPerDatabase]](../Views/ColumnTagsCountPerDatabase.md)


---

###### Author:  david.poole

###### Copyright 2019 - All Rights Reserved

###### Created: 29 November 2020 18:21:54

