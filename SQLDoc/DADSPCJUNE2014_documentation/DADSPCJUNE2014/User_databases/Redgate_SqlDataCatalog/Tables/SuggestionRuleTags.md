#### 

[Project](../../../../index.md) > [DADSPCJUNE2014](../../../index.md) > [User databases](../../index.md) > [Redgate_SqlDataCatalog](../index.md) > [Tables](Tables.md) > dbo.SuggestionRuleTags

# ![Tables](../../../../Images/Table32.png) [dbo].[SuggestionRuleTags]

---

## <a name="#description"></a>MS_Description

Describes the mapping between a Suggestion Rule (being a category within information type) and a tag within the information type and sensitivity classification tags.

## <a name="#columns"></a>Columns

| Key | Name | Data Type | Max Length (Bytes) | Nullability | Description |
|---|---|---|---|---|---|
| [![Cluster Primary Key PK_SuggestionRuleTags: RuleId\TagId](../../../../Images/pkcluster.png)](#indexes)[![Foreign Keys FK_SuggestionRuleTags_SuggestionRules_RuleId: [dbo].[SuggestionRules].RuleId](../../../../Images/fk.png)](#foreignkeys) | RuleId | bigint | 8 | NOT NULL | _Join to Id column in the dbo.SuggestionRules table.
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
12. Dates of Birth_ |
| [![Cluster Primary Key PK_SuggestionRuleTags: RuleId\TagId](../../../../Images/pkcluster.png)](#indexes)[![Indexes IX_SuggestionRuleTags_TagId](../../../../Images/Index.png)](#indexes)[![Foreign Keys FK_SuggestionRuleTags_Tags_TagId: [dbo].[Tags].TagId](../../../../Images/fk.png)](#foreignkeys) | TagId | bigint | 8 | NOT NULL | _Join to Id column in the dbo.Tags table. A tag is a label that exists within a category.  For example a tag category might be "Environment" and the tags within that category might be Development, Production, Test or UAT._ |


---

## <a name="#uses"></a>Uses

* [[dbo].[SuggestionRules]](SuggestionRules.md)
* [[dbo].[Tags]](Tags.md)


---

###### Author:  david.poole

###### Copyright 2019 - All Rights Reserved

###### Created: 19 April 2020 16:29:41

