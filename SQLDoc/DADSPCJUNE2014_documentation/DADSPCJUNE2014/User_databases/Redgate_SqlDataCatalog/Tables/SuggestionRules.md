#### 

[Project](../../../../readme.md) > [DADSPCJUNE2014](../../../readme.md) > [User databases](../../readme.md) > [Redgate_SqlDataCatalog](../readme.md) > [Tables](Tables.md) > dbo.SuggestionRules

# ![Tables](../../../../Images/Table32.png) [dbo].[SuggestionRules]

---

## <a name="#description"></a>MS_Description

A list of rules aligned to the "Information Type" label introduced in SQL Server 2016
1. Networking
2. Contact Info
3. Credentials
4. Credit Cards
5. Banking
6. Financial
7. Other
8. Names
9. National ID
10. Social Security
11. Health
12. Dates of Birth

## <a name="#columns"></a>Columns

| Key | Name | Data Type | Max Length (Bytes) | Nullability | Description |
|---|---|---|---|---|---|
| [![Cluster Primary Key PK_SuggestionRules: Id](../../../../Images/pkcluster.png)](#indexes) | Id | bigint | 8 | NOT NULL | _The clustered primary key that uniquely identifies the dbo.SuggestionRules record._ |
|  | Name | nvarchar(max) | max | NULL allowed | _The name of the information type associated with the suggestion rule set_ |


---

## <a name="#usedby"></a>Used By

* [[dbo].[SuggestionPatterns]](SuggestionPatterns.md)
* [[dbo].[SuggestionRuleTags]](SuggestionRuleTags.md)
* [[dbo].[Suggestions]](Suggestions.md)


---

###### Author:  david.poole

###### Copyright 2019 - All Rights Reserved

###### Created: 10 May 2020 16:47:57

