IF OBJECT_ID('MetaData.PopulateDataDictionary') IS NOT NULL
	BEGIN
		DROP PROC MetaData.PopulateDataDictionary
		RAISERROR('PROC DROPPED: MetaData.PopulateDataDictionary',10,1) WITH NOWAIT
	END
GO

CREATE PROC MetaData.PopulateDataDictionary
AS 
    SET NOCOUNT ON
    DECLARE @ObjectCount INT,
        @ColumnCount INT
    INSERT  INTO MetaData.DataDictionary_Objects ( SchemaName, ObjectName,ObjectType )
            SELECT  SRC.TABLE_SCHEMA,
                    TABLE_NAME,
					REPLACE(SRC.TABLE_TYPE,'BASE ','') AS ObjectType
            FROM    INFORMATION_SCHEMA.TABLES AS SRC
                    LEFT JOIN MetaData.DataDictionary_Objects AS DEST
                        ON SRC.table_Schema = DEST.SchemaName
                           AND SRC.table_name = DEST.ObjectName
            WHERE   DEST.SchemaName IS NULL
                    AND SRC.table_Type IN( 'BASE TABLE','VIEW')
                    AND OBJECTPROPERTY(OBJECT_ID(QUOTENAME(SRC.TABLE_SCHEMA)
                                                 + '.'
                                                 + QUOTENAME(SRC.TABLE_NAME)),
                                       'IsMSShipped') = 0
    SET @ObjectCount = @@ROWCOUNT
    INSERT  INTO MetaData.DataDictionary_Columns
            (
              SchemaName,
              ObjectName,
			  ObjectType,
              ColumnName
            )
            SELECT  C.TABLE_SCHEMA,
                    C.TABLE_NAME,
					T.ObjectType,
                    C.COLUMN_NAME
            FROM    INFORMATION_SCHEMA.COLUMNS AS C
                    INNER JOIN MetaData.DataDictionary_Objects AS T
                        ON C.TABLE_SCHEMA = T.SchemaName
                           AND C.TABLE_NAME = T.ObjectName
                    LEFT JOIN MetaData.DataDictionary_Columns AS F
                        ON C.TABLE_SCHEMA = F.SchemaName
                           AND C.TABLE_NAME = F.ObjectName
                           AND C.COLUMN_NAME = F.ColumnName
            WHERE   F.SchemaName IS NULL
                    AND OBJECTPROPERTY(OBJECT_ID(QUOTENAME(C.TABLE_SCHEMA)
                                                 + '.'
                                                 + QUOTENAME(C.TABLE_NAME)),
                                       'IsMSShipped') = 0
    SET @ColumnCount = @@ROWCOUNT
    RAISERROR ( 'DATA DICTIONARY: %i tables & %i fields added', 10, 1,
        @ObjectCount, @ColumnCount ) WITH NOWAIT
GO

RAISERROR('PROC CREATED: MetaData.PopulateDataDictionary',10,1) WITH NOWAIT

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Reads the INFORMATION_SCHEMA views to populate the two tables
* MetaData.DataDictionary_Objects 
* MetaData.DataDictionary_Columns
These will have blank description until the two scavenge stored procedures are executed.' , @level0type=N'SCHEMA',@level0name=N'MetaData', @level1type=N'PROCEDURE',@level1name=N'PopulateDataDictionary'
GO
