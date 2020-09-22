echo off
sqlcmd -E -S DESKTOP-6CAGR1L\SQLEXPRESS -i .\Change_Bill_Number.sql
set /p delExit=Press the ENTER key to exit...: