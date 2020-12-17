#### 

[Project](../../../../readme.md) > [DADSPCJUNE2014](../../../readme.md) > [User databases](../../readme.md) > [Redgate_SqlDataCatalog](../readme.md) > [Tables](Tables.md) > dbo.SuggestionRuleTags

# ![Tables](../../../../Images/Table32.png) [dbo].[SuggestionRuleTags]

---

## <a name="#description"></a>MS_Description

Describes the mapping between a Suggestion Rule (being a category within information type) and a tag within the information type and sensitivity classification tags.

## <a name="#columns"></a>Columns

| Key | Name | Data Type | Max Length (Bytes) | Nullability | Description |
|---|---|---|---|---|---|
| [![Cluster Primary Key PK_SuggestionRuleTags: RuleId\TagId](../../../../Images/pkcluster.png)](#indexes)[![Foreign Keys FK_SuggestionRuleTags_SuggestionRules_RuleId: [dbo].[SuggestionRules].RuleId](../../../../Images/fk.png)](#foreignkeys) | RuleId | bigint | 8 | NOT NULL |<p>_Join to Id column in the dbo.SuggestionRules table.</p><p>1. Networking</p><p>2. Contact Info</p><p>3. Credentials</p><p>4. Credit Cards</p><p>5. Banking</p><p>6. Financial</p><p>7. Other</p><p>8. Names</p><p>9. National ID</p><p>10. Social Security</p><p>11. Health</p><p>12. Dates of Birth_</p>|
| [![Cluster Primary Key PK_SuggestionRuleTags: RuleId\TagId](../../../../Images/pkcluster.png)](#indexes)[![Indexes IX_SuggestionRuleTags_TagId](../../../../Images/Index.png)](#indexes)[![Foreign Keys FK_SuggestionRuleTags_Tags_TagId: [dbo].[Tags].TagId](../../../../Images/fk.png)](#foreignkeys) | TagId | bigint | 8 | NOT NULL | _Join to Id column in the dbo.Tags table. A tag is a label that exists within a category.  For example a tag category might be "Environment" and the tags within that category might be Development, Production, Test or UAT._ |


---

## <a name="#uses"></a>Uses

* [[dbo].[SuggestionRules]](SuggestionRules.md)
* [[dbo].[Tags]](Tags.md)


---

###### Author:  david.poole

###### Copyright 2019 - All Rights Reserved

###### Created: 29 November 2020 18:21:54

