#### 

[Project](../../../../readme.md) > [DADSPCJUNE2014](../../../readme.md) > [User databases](../../readme.md) > [Redgate_SqlDataCatalog](../readme.md) > [Tables](Tables.md) > dbo.ColumnFreeTextAttributes

# ![Tables](../../../../Images/Table32.png) [dbo].[ColumnFreeTextAttributes]

---

## <a name="#description"></a>MS_Description

Associates a dbo.FreeTextAttributes record with a dbo.Columns record in order to record a descriptive note against the column.
For example, a free text attribute might be created to hold brief regulatory notes.  Those regulatory notes might be along the lines of the following.
* Can show truncated date down to year/month
* Pending advice from the ICO
* Do not transmit as this is a developer dumping ground and there is no guarantee that sensitive of PII data is excluded from such a column.

## <a name="#columns"></a>Columns

| Key | Name | Data Type | Max Length (Bytes) | Nullability | Description |
|---|---|---|---|---|---|
| [![Cluster Primary Key PK_ColumnFreeTextAttributes: ColumnId\FreeTextAttributeId](../../../../Images/pkcluster.png)](#indexes)[![Foreign Keys FK_ColumnFreeTextAttributes_Columns_ColumnId: [dbo].[Columns].ColumnId](../../../../Images/fk.png)](#foreignkeys) | ColumnId | bigint | 8 | NOT NULL | _Join to Id column in the dbo.Columns table._ |
| [![Cluster Primary Key PK_ColumnFreeTextAttributes: ColumnId\FreeTextAttributeId](../../../../Images/pkcluster.png)](#indexes)[![Indexes IX_ColumnFreeTextAttributes_FreeTextAttributeId](../../../../Images/Index.png)](#indexes)[![Foreign Keys FK_ColumnFreeTextAttributes_FreeTextAttributes_FreeTextAttributeId: [dbo].[FreeTextAttributes].FreeTextAttributeId](../../../../Images/fk.png)](#foreignkeys) | FreeTextAttributeId | bigint | 8 | NOT NULL | _Join to Id column in the dbo.FreeTextAttributes table._ |
|  | FreeText | nvarchar(max) | max | NOT NULL | _Descriptive notes associated with the column.  For example a free text attribute for regulatory notes may contain clarifications as to when an attribute may or may not be used such as being used to record special categories of information under GDPR._ |
|  | AnnotatedAtUtc | datetime2 | 8 | NOT NULL | _The timestamp for when a tag was associated with an object such as an instance, column or a free text attribute_ |


---

## <a name="#uses"></a>Uses

* [[dbo].[Columns]](Columns.md)
* [[dbo].[FreeTextAttributes]](FreeTextAttributes.md)


---

###### Author:  david.poole

###### Copyright 2019 - All Rights Reserved

###### Created: 29 November 2020 18:21:54

