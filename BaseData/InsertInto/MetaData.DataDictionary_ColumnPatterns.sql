INSERT INTO MetaData.DataDictionary_ColumnPatterns
SELECT SRC.ColumnPatternId, SRC.ColumnPattern
FROM (
	SELECT 0 AS ColumnPatternId, '%AtUtc' AS ColumnPattern
) AS SRC
	LEFT JOIN MetaData.DataDictionary_ColumnPatterns AS DEST
	ON DEST.ColumnPatternId = SRC.ColumnPatternId
WHERE DEST.ColumnPatternId IS NULL;

RAISERROR('DATA INSERTED: %i row(s) into MetaData.DataDictionary_ColumnPatterns',10,1,@@ROWCOUNT) WITH NOWAIT
GO
