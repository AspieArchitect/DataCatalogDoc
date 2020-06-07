#### 

[Project](../../../../../readme.md) > [DADSPCJUNE2014](../../../../readme.md) > [User databases](../../../readme.md) > [Redgate_SqlDataCatalog](../../readme.md) > [Programmability](../readme.md) > [Stored Procedures](Stored_Procedures.md) > MetaData.PopulateColumnProfileCandidates

# ![Stored Procedures](../../../../../Images/StoredProcedure32.png) [MetaData].[PopulateColumnProfileCandidates]

---

## <a name="#description"></a>MS_Description

Grabs any (N)CHAR or (N)VARCHAR columns from dimension tables that are between 1 and 100 characters long.  The results are inserted into MetaData.ColumnProfileCandidates if the schema.table.column do not already exist in the table

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| ANSI Nulls On | YES |
| Quoted Identifier On | YES |


---

## <a name="#sqlscript"></a>SQL Script

```sql

CREATE PROC [MetaData].[PopulateColumnProfileCandidates]
AS
SET NOCOUNT ON

INSERT INTO MetaData.ColumnProfileCandidates(
    SchemaName,
    ObjectName,
    ColumnName,
    ApproximateRows
)
SELECT 
    SRC.SchemaName,
    SRC.ObjectName,
    SRC.ColumnName,
    SRC.ApproximateRows
FROM (
    SELECT 
        OBJECT_SCHEMA_NAME(O.object_id) AS SchemaName,
        O.name AS ObjectName,
        C.name AS ColumnName,
        COALESCE(I.rows, 0) AS ApproximateRows
    FROM sys.columns AS C
        INNER JOIN sys.types AS T
        ON T.user_type_id = C.user_type_id
        INNER JOIN sys.objects AS O
        ON O.object_id = C.object_id
        LEFT JOIN sysindexes AS I
        ON O.object_id = I.id
        AND I.indid IN ( 0, 1 )
    WHERE T.name LIKE '%char%'
         AND O.type = 'U'
         AND O.name LIKE 'Dim%'
         AND C.max_length BETWEEN 1 AND 100
         AND C.name NOT LIKE '%Key'
) AS SRC
    LEFT JOIN MetaData.ColumnProfileCandidates AS DEST
    ON DEST.SchemaName = SRC.SchemaName
    AND DEST.ObjectName = SRC.ObjectName
    AND DEST.ColumnName = SRC.ColumnName
WHERE DEST.SchemaName IS NULL

RAISERROR ('PROFILE CANDIDATES INSERTED: %d records',10,1,@@ROWCOUNT) WITH NOWAIT;
GO
EXEC sp_addextendedproperty N'MS_Description', N'Grabs any (N)CHAR or (N)VARCHAR columns from dimension tables that are between 1 and 100 characters long.  The results are inserted into MetaData.ColumnProfileCandidates if the schema.table.column do not already exist in the table', 'SCHEMA', N'MetaData', 'PROCEDURE', N'PopulateColumnProfileCandidates', NULL, NULL
GO

```


---

## <a name="#uses"></a>Uses

* [[MetaData].[ColumnProfileCandidates]](../../Tables/ColumnProfileCandidates.md)
* [MetaData](../../Security/Schemas/MetaData.md)


---

###### Author:  david.poole

###### Copyright 2019 - All Rights Reserved

###### Created: 10 May 2020 16:47:57

