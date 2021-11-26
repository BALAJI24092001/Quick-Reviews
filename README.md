# MySQL Cheat Sheet

## DCL
<!------------------------------------------------>
```
GRANT [privileges] ON [object] TO [user@host];
```
<u>[privileges]</u> - specifies access rights, like create, delete, update etc... Multiple privileges can be assigned given they are seperated by commas. <br>
<u>[object]</u> - The level on which the access rights are granted, like, on global level it is denoted by \*.\*, a database, a table etc.. eg: 'GRANT CREATE, UPDATE, INSERT ON studentdb.* TO balaji@localhost'. For assigning admistrative privileges use object as studentdb database. <br>
<u>[user@host]</u> - user is mysql use and host is the server host. usually root@localhost.

```
GRANT PROXY ON [user] TO [user];
```
It enables one user to be a proxy for other users. eg: 'GRANT PROXY ON root TO balaji@localhost'

```
SHOW GRANTS FOR [user@host];
```

```
REVOKE [privileges] ON [object] FROM [user.host];
```
eg: 'REVOKE INSERT(col1, col2), SELECT(col1), UPDATE(col2) ON student.user TO balaji@localhost' student is database, user is a table. To revoke all grants use 'REVOKE ALL, GRANT OPTION FROM balaji@localhost'

```
REVOKE PROXY ON [user] FROM [user];
```

## DDL
<!------------------------------------------------>
```
CREATE DATABASE [database name];`
```

```
SHOW CREATE DATABASE [database name];
```
We can review the newly created database using this query, that returns the database name, character set, and collation of the database.

```
SHOW DATABASES LIKE [pattern];
OR,  
SHOW DATABASES WHERE [expression];
```
<u>[expression]</u> - [Regular expression](https://www.javatpoint.com/mysql-regular-expressions)

```
SHOW DATABASES;
``` 

```
SELECT DATABASE();
```
To know on which database we are working on.

```
USE [database];
```
Using this query we can start working on our database, provided the user have required privileges. <br>
```
DROP DATABASE [database];'
```
We can also do this by replacing DATABASE with SCHEMA, since mysql understands both are same.

```
CREATE TABLE [table name]( 
[column definition] [constraints],
[column definition] [constraints],
[column definition] [constraints],
[table constraints]
);
```
<u>[column definition]</u> - The column/ attribute name with it's data type.  <br>
<u>[constraints]</u>     - constraints applied on attributes like, NOT NULL, UNIQUE, and AUTO_INCREMENT etc... <br>
<u>[table constraints]</u> - It specifies the table constraints such as PRIMARY KEY, UNIQUE KEY, FOREIGN KEY, CHECK, etc.

```
SHOW TABLES;
```

```
DESCRIBE [table name];
```
To see information or structure of a table. The database must be selected using the USE query or the database must be given.

```
DROP TABLE [table name];
```
To drop a table while working on that database

```
DROP TABLE [schema name].[table name];
```

```
TRUNCATE TABLE [table name];
```
removes the complete data without removing its structure

```
ALTER TABLE [table name]  
ADD [col definition] [constraints];  
```
Add a column to the table

```
ALTER TABLE table_name  
 ADD [col def] [constraints]  
 [ FIRST | AFTER column_name ],  
ADD [col def] [constraints] 
[ FIRST | AFTER column_name ],  
  ...  
;  
```
Add multiple columns to the table

```
ALTER TABLE [table name]  
MODIFY [col definition] [constraints]  
[ FIRST | AFTER column_name ];  
```
modify a column constraints, cannot change name of column. Possible to change position of column.

```
ALTER TABLE [table name]  
DROP COLUMN [col name];  
```

```
ALTER TABLE [table name]  
CHANGE COLUMN [old name] [new name]   
[col definition]  
[ FIRST | AFTER column_name ];
```
To rename the column and modify it's constraints.

```
ALTER TABLE [table name]
RENAME TO [new table name];
```

```
RENAME [old table name] TO [new table name];
```
provided the database is in use.


## DML
<!------------------------------------------------>
```
INSERT INTO [table_name] ( field1, field2,...fieldN )    
VALUES    
( value1, value2,...valueN ); # inserting single record
```
The fields are only necessary when we want to enter the data in different hierarchy.
  
```
INSERT INTO [table_name] VALUES
( value1, value2,...valueN )
( value1, value2,...valueN )
...........  
( value1, value2,...valueN ); # inserting multiple records
```
if the fields are not mentioned all the values in the tuples. Inserting data format is YYYY-MM-DD as a string.

```
UPDATE [table_name]     
SET [column_name1] = [new-value1],   
    [column_name2] = [new-value2], 
    ...    
    [WHERE Clause]  
```

```
DELETE FROM [table_name] WHERE [condition];
```

```
DELETE FROM [table_name]  
WHERE [condition]   
ORDER BY [colm1], [colm2], ...  
LIMIT [row_count];  
```
order by will sort the records and the limit clause restrict by only deleting first row_count number of rows only form the table.

```
DELETE [tab 1] [tab 2] FROM [tab 1]   
INNER JOIN [tab2]      
ON [tab 1].[PRIMARY KEY] = [tab 2].[FORIEGN KEY]      
WHERE [tab 1].[PRIMARY KEY] = 102;  
```
## References
https://dev.mysql.com/doc/ <br>
https://www.w3schools.com/mysql/default.asp <br>
https://www.javatpoint.com/mysql-tutorial

## Tools
https://code.visualstudio.com/ <br>
https://tableplus.com/ <br>
https://paiza.io/en/languages/mysql

