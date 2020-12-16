#### 

[Project](../../../../readme.md) > [DADSPCJUNE2014](../../../readme.md) > [User databases](../../readme.md) > [Redgate_SqlDataCatalog](../readme.md) > [Tables](Tables.md) > MetaData.DataDictionary_Columns

# ![Tables](../../../../Images/Table32.png) [MetaData].[DataDictionary_Columns]

---

## <a name="#description"></a>MS_Description

Holds descriptions for columns within the tables or views.  This is to provide a means of allowing a low privileged role the means to maintain such descriptions as the sp_addextendedproperty and sp_updateextendedproperty both require ddl_admin or db_owner privileges.

## <a name="#columns"></a>Columns

| Key | Name | Data Type | Max Length (Bytes) | Nullability | Default | Description |
|---|---|---|---|---|---|---|
| [![Cluster Primary Key PK_DataDictionary_Columns: SchemaName\ObjectName\ColumnName](../../../../Images/pkcluster.png)](#indexes)[![Foreign Keys FK_DataDictionary_Columns: [MetaData].[DataDictionary_Objects].SchemaName\ObjectName](../../../../Images/fk.png)](#foreignkeys) | SchemaName | [sys].[sysname] | 256 | NOT NULL |  | _The schema name in which the object containing the column resides_ |
| [![Cluster Primary Key PK_DataDictionary_Columns: SchemaName\ObjectName\ColumnName](../../../../Images/pkcluster.png)](#indexes)[![Foreign Keys FK_DataDictionary_Columns: [MetaData].[DataDictionary_Objects].SchemaName\ObjectName](../../../../Images/fk.png)](#foreignkeys) | ObjectName | [sys].[sysname] | 256 | NOT NULL |  | _The name of the table or view_ |
|  | ObjectType | varchar(50) | 50 | NOT NULL |  | _* TABLE
		* VIEW_ |
| [![Cluster Primary Key PK_DataDictionary_Columns: SchemaName\ObjectName\ColumnName](../../../../Images/pkcluster.png)](#indexes) | ColumnName | [sys].[sysname] | 256 | NOT NULL |  | _The name of the column within the table or view_ |
|  | ColumnDescription | varchar(7000) | 7000 | NOT NULL | ('') | _User friendly text describing the use and any relevant detail about the column within the table or view_ |


---

## <a name="#uses"></a>Uses

* [[MetaData].[DataDictionary_Objects]](DataDictionary_Objects.md)
* [MetaData](../Security/Schemas/MetaData.md)


---

## <a name="#usedby"></a>Used By

* [[MetaData].[ApplyDataDictionary]](../Programmability/Stored_Procedures/ApplyDataDictionary.md)
* [[MetaData].[HarvestExistingDescriptions]](../Programmability/Stored_Procedures/HarvestExistingDescriptions.md)
* [[MetaData].[PopulateDataDictionary]](../Programmability/Stored_Procedures/PopulateDataDictionary.md)
* [[MetaData].[SetDefaultDescriptions]](../Programmability/Stored_Procedures/SetDefaultDescriptions.md)
* [[MetaData].[TestDataDictionaryColumns]](../Programmability/Stored_Procedures/TestDataDictionaryColumns.md)
* [[MetaData].[UpdateDataDictionaryColumn]](../Programmability/Stored_Procedures/UpdateDataDictionaryColumn.md)


---

###### Author:  david.poole

###### Copyright 2019 - All Rights Reserved

###### Created: 29 November 2020 18:21:54

