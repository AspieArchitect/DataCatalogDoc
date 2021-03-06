IF OBJECT_ID('MetaData.UpdateDataDictionaryObject') IS NOT NULL
BEGIN
    DROP PROCEDURE MetaData.UpdateDataDictionaryObject;
    RAISERROR('PROC DROPPED: MetaData.UpdateDataDictionaryObject', 10, 1) WITH NOWAIT;
END;
GO

CREATE PROC MetaData.UpdateDataDictionaryObject
    @SchemaName sysname = N'dbo',
    @ObjectName sysname, 
    @ObjectDescription VARCHAR(7000) = '' 
AS 
    SET NOCOUNT ON
    UPDATE  MetaData.DataDictionary_Objects
    SET     ObjectDescription = ISNULL(@ObjectDescription, '')
    WHERE   SchemaName = @SchemaName
            AND ObjectName = @ObjectName
    RETURN @@ROWCOUNT
GO
IF @@ERROR=0
    RAISERROR('PROC CREATED: MetaData.UpdateDataDictionaryObject', 10, 1) WITH NOWAIT;


EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Sets the description of a table or view' , @level0type=N'SCHEMA',@level0name=N'MetaData', @level1type=N'PROCEDURE',@level1name=N'UpdateDataDictionaryObject'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The name of the schema in which the table or view resides' , @level0type=N'SCHEMA',@level0name=N'MetaData', @level1type=N'PROCEDURE',@level1name=N'UpdateDataDictionaryObject', @level2type=N'PARAMETER',@level2name=N'@SchemaName'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The name of the table or view for which a description will be created.' , @level0type=N'SCHEMA',@level0name=N'MetaData', @level1type=N'PROCEDURE',@level1name=N'UpdateDataDictionaryObject', @level2type=N'PARAMETER',@level2name=N'@ObjectName'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The user friendly description of the table or view' , @level0type=N'SCHEMA',@level0name=N'MetaData', @level1type=N'PROCEDURE',@level1name=N'UpdateDataDictionaryObject', @level2type=N'PARAMETER',@level2name=N'@ObjectDescription'
GO
