# gvrdc-project


## Download SQL Server - Lightweight

https://go.microsoft.com/fwlink/?linkid=866658



## Download SAP for Visual Studio

https://mega.nz/file/6x0R1DpA#voN7ueVaSveiBnO7U4HuIdr0INOyVNtccJDvjJCzTOM



## Download SAP for without Visual Studio

https://mega.nz/file/zhc2XApL#184RFpGSxknVkzuqGwMTky0dN0tP1gQ9EC7G6ra5Za4



## If require to download Transact-SQL utility

Documentation

https://docs.microsoft.com/en-us/sql/tools/sqlcmd-utility?view=sql-server-ver15



## To create database run below command in cmd.

> sqlcmd -E -S "<ComputerName>\<InstanceName>" -i "<File path of .sql file>"

Documentation

> https://docs.microsoft.com/en-us/sql/relational-databases/databases/create-a-database?view=sql-server-ver15


## Or you can run batch file "CreateDatabase.bat"



## To create database using command line.

Documentation

https://docs.microsoft.com/en-us/sql/t-sql/lesson-1-creating-database-objects?view=sql-server-ver15


## Steps for Create Database using cmd.

1) Open cmd and type below command
> sqlcmd -S <computer name>\SQLEXPRESS -E

2) show Database
> SELECT NAME FROM SYS.DATABASES
> GO

3) Drop database
> DROP DATABASE <database_name>
> GO

4) Show all tables
> USE YourDBName
> GO 
> SELECT *
> FROM sys.Tables
> GO
