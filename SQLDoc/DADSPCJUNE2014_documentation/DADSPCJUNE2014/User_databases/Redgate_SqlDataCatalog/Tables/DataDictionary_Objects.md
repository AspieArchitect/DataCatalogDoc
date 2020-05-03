#### 

[Project](../../../../readme.md) > [DADSPCJUNE2014](../../../readme.md) > [User databases](../../readme.md) > [Redgate_SqlDataCatalog](../readme.md) > [Tables](Tables.md) > MetaData.DataDictionary_Objects

# ![Tables](../../../../Images/Table32.png) [MetaData].[DataDictionary_Objects]

---

## <a name="#description"></a>MS_Description

Holds descriptions for tables and views.  This is to provide a means of allowing a low privileged role the means to maintain such descriptions as the sp_addextendedproperty and sp_updateextendedproperty both require ddl_admin or db_owner privileges.

## <a name="#columns"></a>Columns

| Key | Name | Data Type | Max Length (Bytes) | Nullability | Default | Description |
|---|---|---|---|---|---|---|
| [![Cluster Primary Key PK_DataDictionary_Objects: SchemaName\ObjectName](../../../../Images/pkcluster.png)](#indexes) | SchemaName | [sys].[sysname] | 256 | NOT NULL |  | _The schema name in which the object resides_ |
| [![Cluster Primary Key PK_DataDictionary_Objects: SchemaName\ObjectName](../../../../Images/pkcluster.png)](#indexes) | ObjectName | [sys].[sysname] | 256 | NOT NULL |  | _The object name where the object is a table or view_ |
|  | ObjectType | varchar(50) | 50 | NOT NULL |  | _* TABLE
		* VIEW_ |
|  | ObjectDescription | varchar(7000) | 7000 | NOT NULL | ('') | _User friendly text describing the use and any relevant detail about the table or view_ |


---

## <a name="#uses"></a>Uses

* [MetaData](../Security/Schemas/MetaData.md)


---

## <a name="#usedby"></a>Used By

* [[MetaData].[DataDictionary_Columns]](DataDictionary_Columns.md)
* [[MetaData].[ApplyDataDictionary]](../Programmability/Stored_Procedures/ApplyDataDictionary.md)
* [[MetaData].[HarvestExistingDescriptions]](../Programmability/Stored_Procedures/HarvestExistingDescriptions.md)
* [[MetaData].[PopulateDataDictionary]](../Programmability/Stored_Procedures/PopulateDataDictionary.md)
* [[MetaData].[TestDataDictionaryObjects]](../Programmability/Stored_Procedures/TestDataDictionaryObjects.md)
* [[MetaData].[UpdateDataDictionaryObject]](../Programmability/Stored_Procedures/UpdateDataDictionaryObject.md)


---

###### Author:  david.poole

###### Copyright 2019 - All Rights Reserved

###### Created: 03 May 2020 12:11:20

