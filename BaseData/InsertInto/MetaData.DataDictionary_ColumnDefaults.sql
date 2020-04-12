INSERT INTO MetaData.DataDictionary_ColumnDefaults
(
    ColumnName,
    ColumnPatternId,
    ColumnDescription
)
SELECT SRC.ColumnName,
       SRC.ColumnPatternId,
       SRC.ColumnDescription
FROM
(
    SELECT 'DetectedAtUtc' AS ColumnName,
           0 AS ColumnPatternId,
           'The timestamp for when a scan activity identified the information to generate the record' AS ColumnDescription
    UNION ALL
    SELECT 'CreatedAtUtc' AS ColumnName,
           0 AS ColumnPatternId,
           'The timestamp for when a record was created as a result of activity through the user interface' AS ColumnDescription
    UNION ALL
    SELECT 'RegisteredAtUtc' AS ColumnName,
           0 AS ColumnPatternId,
           'The timestamp for when a SQL Server instance was registered through the user interface' AS ColumnDescription
    UNION ALL
    SELECT 'StartedAtUtc' AS ColumnName,
           0 AS ColumnPatternId,
           'The timestamp for when the process of merging of results for a database scan with the catalog was innitiated' AS ColumnDescription
    UNION ALL
    SELECT 'CompletedAtUtc' AS ColumnName,
           0 AS ColumnPatternId,
           'The timestamp for when the process of merging of results for a database scan with the catalog was completed.  The difference between the CompletedAtUtc and StartedAtUtc reveals the execution time for the merge process.' AS ColumnDescription
    UNION ALL
    SELECT 'AnnotatedAtUtc' AS ColumnName,
           0 AS ColumnPatternId,
           'The timestamp for when a tag was associated with an object such as an instance, column or a free text attribute' AS ColumnDescription
) AS SRC
    LEFT JOIN MetaData.DataDictionary_ColumnDefaults AS DEST
        ON DEST.ColumnName = SRC.ColumnName
WHERE DEST.ColumnName IS NULL;

RAISERROR('DATA INSERTED: %i row(s) into MetaData.DataDictionary_ColumnDefaults',10,1,@@ROWCOUNT) WITH NOWAIT
GO
