#### 

[Project](../../../../readme.md) > [DADSPCJUNE2014](../../../readme.md) > [User databases](../../readme.md) > [Redgate_SqlDataCatalog](../readme.md) > [Tables](Tables.md) > dbo.SuggestionPatterns

# ![Tables](../../../../Images/Table32.png) [dbo].[SuggestionPatterns]

---

## <a name="#description"></a>MS_Description

A list of TSQL LIKE patterns that will be used against column names in order to associate the column with a rule

## <a name="#columns"></a>Columns

| Key | Name | Data Type | Max Length (Bytes) | Nullability | Description |
|---|---|---|---|---|---|
| [![Cluster Primary Key PK_SuggestionPatterns: Id](../../../../Images/pkcluster.png)](#indexes) | Id | bigint | 8 | NOT NULL | _The clustered primary key that uniquely identifies the dbo.SuggestionPatterns record._ |
|  | Pattern | nvarchar(max) | max | NULL allowed | _The LIKE pattern that will be applied to associate column names with a likely rule._ |
| [![Indexes IX_SuggestionPatterns_RuleId](../../../../Images/Index.png)](#indexes)[![Foreign Keys FK_SuggestionPatterns_SuggestionRules_RuleId: [dbo].[SuggestionRules].RuleId](../../../../Images/fk.png)](#foreignkeys) | RuleId | bigint | 8 | NULL allowed | _Join to Id column in the dbo.SuggestionRules table._ |


---

## <a name="#uses"></a>Uses

* [[dbo].[SuggestionRules]](SuggestionRules.md)


---

## <a name="#usedby"></a>Used By

* [[dbo].[Suggestions]](Suggestions.md)


---

###### Author:  david.poole

###### Copyright 2019 - All Rights Reserved

###### Created: 19 December 2020 20:53:30

