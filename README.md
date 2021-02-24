# Data Catalog and Data Documentor

The purpose of this repository is to record the eventual code used to build two www.sqlservercentral.com articles
 1. [Oiling the gears for the data dictionary](https://www.sqlservercentral.com/articles/oiling-the-gears-for-the-data-dictionary) published in April 2014
 1. [Re-oiling the gears for the data dictionary](https://www.sqlservercentral.com/articles/re-oiling-the-gears-for-the-data-dictionary-or-catalog) published in January 2020

 Please review the [Light Weight Decision Register](DecisionRegister/README.md)

 ## Problem addressed by the two articles
 
 SQL Server supports a method of annotating objects with metadata.  SQL Server does this by using what it calls "Extended Properties". These "Extended Properties" exist within a hierarchy and can be anything the DBA wishes to use.

 To summarise the problem succinctly, for the purposes of tagging database objects with descriptions the extended properties suffer the following weaknesses
  * Three stored procs to do something that could be done with a single more intuitive command.
     * [sp_addextendedproperty](https://docs.microsoft.com/en-us/sql/relational-databases/system-stored-procedures/sp-addextendedproperty-transact-sql?view=sql-server-ver15)
     * [sp_updateextendedproperty](https://docs.microsoft.com/en-us/sql/relational-databases/system-stored-procedures/sp-updateextendedproperty-transact-sql?view=sql-server-ver15)
     * [sp_dropextendedproperty](https://docs.microsoft.com/en-us/sql/relational-databases/system-stored-procedures/sp-dropextendedproperty-transact-sql?view=sql-server-ver15)

 * Too much complexity in the parameters for the stored procs
 * Requires elevated privileges to opperate (ddl_admin, db_owner or above)
 * Change in hierarchy between SQL2000 and SQL2005.  As of 2020 more people use SQL2000 and its predecessors than you might believe.
 
 Competing platforms such as RedShift, Postgres, Vertica, BigQuery and others tend to support a far simpler syntax
 ```sql
 COMMENT ON {object type} {object name} IS 'User friendly description to inform and educate'; 
 ```

## A (not THE) solution to the problem
### Oiling the gears for the data dictonary
Described a method that involved putting the objects descriptions into a simple table identifying the object and the description.

* Complexity of Extended Property stored procedures abstracted from the user
* Maintaining descriptions could be constrained to a database role explicitly for the maintenance of descriptions
* Any existing MS_DESCRIPTION extended properties could be scavenged into the tables
* Descriptions held in the tables could be applied en masse simply by executing a stored procedure.

### Re-Oiling the gears for the data dictonary
Took the concepts of the orginal article and extended them
* All objects for maintaining descriptions moved to an explicit schema called MetaData
* New objects defined to allow the following
    * Default descriptions for commonly used column names to be applied
    * Descriptions derived from structural metadata such as primary and foreign keys
    * Descriptions of tables holding  a small number of reference values to include a list of those values

There will be a third article that takes descriptions from objects underpinning views and uses them on the view columns themselves.

## Additional material
By way of a demonstration this repository also provides descriptions for the database underpinning the [Redgate Data Catalog](https://www.red-gate.com/products/dba/sql-data-catalog/).

Please bear in mind the following points on the descriptions
* They are not supplied or endorsed by Redgate software
* They may not be accurate or complete, they are my notes
* They have been produced by observing the [Redgate Data Catalog](https://www.red-gate.com/products/dba/sql-data-catalog/)
* The descriptions have been used to demonstrate [Redgate SQLDoc](https://www.red-gate.com/products/sql-development/sql-doc/)

The reason for attempting to document the [Redgate Data Catalog](https://www.red-gate.com/products/dba/sql-data-catalog/) is to allow the repository of the catalog to be used by Business Intelligence specialists to build reports reflecting the specific needs a business may have for the information held in a data catalogue.

