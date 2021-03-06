IF OBJECT_ID('MetaData.UpdateDataDictionaryColumn') IS NOT NULL
BEGIN
    DROP PROCEDURE MetaData.UpdateDataDictionaryColumn;
    RAISERROR('PROC DROPPED: MetaData.UpdateDataDictionaryColumn', 10, 1) WITH NOWAIT;
END;
GO
CREATE PROC MetaData.UpdateDataDictionaryColumn
    @SchemaName sysname = N'dbo',
    @ObjectName sysname, 
    @ColumnName sysname, 
    @ColumnDescription VARCHAR(7000) = '' 
AS 
    SET NOCOUNT ON
    UPDATE  MetaData.DataDictionary_Columns
    SET     ColumnDescription = ISNULL(@ColumnDescription, '')
    WHERE   SchemaName = @SchemaName
            AND ObjectName = @ObjectName
            AND ColumnName = @ColumnName
    RETURN @@ROWCOUNT
GO
IF @@ERROR=0
    RAISERROR('PROC CREATED: MetaData.UpdateDataDictionaryColumn', 10, 1) WITH NOWAIT;

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Sets the description of a column within a table or view' , @level0type=N'SCHEMA',@level0name=N'MetaData', @level1type=N'PROCEDURE',@level1name=N'UpdateDataDictionaryColumn'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The name of the schema in which the table or view holding the column resided' , @level0type=N'SCHEMA',@level0name=N'MetaData', @level1type=N'PROCEDURE',@level1name=N'UpdateDataDictionaryColumn', @level2type=N'PARAMETER',@level2name=N'@SchemaName'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The name of the table or view holding the column' , @level0type=N'SCHEMA',@level0name=N'MetaData', @level1type=N'PROCEDURE',@level1name=N'UpdateDataDictionaryColumn', @level2type=N'PARAMETER',@level2name=N'@ObjectName'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The name of the column for which a description is to be applied' , @level0type=N'SCHEMA',@level0name=N'MetaData', @level1type=N'PROCEDURE',@level1name=N'UpdateDataDictionaryColumn', @level2type=N'PARAMETER',@level2name=N'@ColumnName'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The user friendly description for the column' , @level0type=N'SCHEMA',@level0name=N'MetaData', @level1type=N'PROCEDURE',@level1name=N'UpdateDataDictionaryColumn', @level2type=N'PARAMETER',@level2name=N'@ColumnDescription'
GO

