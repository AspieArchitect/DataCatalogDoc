#### 

[Project](../../../../readme.md) > [DADSPCJUNE2014](../../../readme.md) > [User databases](../../readme.md) > [Redgate_SqlDataCatalog](../readme.md) > [Tables](Tables.md) > dbo.Suggestions

# ![Tables](../../../../Images/Table32.png) [dbo].[Suggestions]

---

## <a name="#description"></a>MS_Description

Identifies the rule and pattern associated with a column.

## <a name="#columns"></a>Columns

| Key | Name | Data Type | Max Length (Bytes) | Nullability | Description |
|---|---|---|---|---|---|
| [![Cluster Primary Key PK_Suggestions: ColumnId](../../../../Images/pkcluster.png)](#indexes)[![Foreign Keys FK_Suggestions_Columns_ColumnId: [dbo].[Columns].ColumnId](../../../../Images/fk.png)](#foreignkeys) | ColumnId | bigint | 8 | NOT NULL | _Join to Id column in the dbo.Columns table._ |
| [![Indexes IX_Suggestions_SuggestionRuleId](../../../../Images/Index.png)](#indexes)[![Foreign Keys FK_Suggestions_SuggestionRules_SuggestionRuleId: [dbo].[SuggestionRules].SuggestionRuleId](../../../../Images/fk.png)](#foreignkeys) | SuggestionRuleId | bigint | 8 | NOT NULL | _Join to Id column in the dbo.SuggestionRules table._ |
| [![Indexes IX_Suggestions_SuggestionPatternId](../../../../Images/Index.png)](#indexes)[![Foreign Keys FK_Suggestions_SuggestionPatterns_SuggestionPatternId: [dbo].[SuggestionPatterns].SuggestionPatternId](../../../../Images/fk.png)](#foreignkeys) | SuggestionPatternId | bigint | 8 | NOT NULL | _Join to Id column in the dbo.SuggestionPatterns table._ |


---

## <a name="#uses"></a>Uses

* [[dbo].[Columns]](Columns.md)
* [[dbo].[SuggestionPatterns]](SuggestionPatterns.md)
* [[dbo].[SuggestionRules]](SuggestionRules.md)


---

###### Author:  david.poole

###### Copyright 2019 - All Rights Reserved

###### Created: 03 May 2020 12:11:20

