IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name='MetaData')
	BEGIN
	    EXEC sp_executesql N'CREATE SCHEMA MetaData';
		EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Used to hold the objects used to populate object descriptions' , @level0type=N'SCHEMA',@level0name=N'MetaData'
		RAISERROR('SCHEMA CREATED: MetaData',10,1)WITH NOWAIT
	END
ELSE
	BEGIN
		EXEC sys.sp_updateextendedproperty @name=N'MS_Description', @value=N'Used to hold the objects used to populate object descriptions' , @level0type=N'SCHEMA',@level0name=N'MetaData'
		RAISERROR('SCHEMA ALREADY EXISTS: MetaData',10,1)WITH NOWAIT
	END
GO
