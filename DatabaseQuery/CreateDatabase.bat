echo off
sqlcmd -E -S DESKTOP-6CAGR1L\SQLEXPRESS -i .\LabQuery_1.sql
set /p delExit=Press the ENTER key to exit...: