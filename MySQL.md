# MySQL Cheat Sheet


## DDL (Data Definition Language)
<!------------------------------------------------>
```
CREATE DATABASE [database name];
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


## DML (Data Manipulation Language)
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

## DCL (Data Control Language)
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

## DQL (Data Query Language)
<!------------------------------------------------>   

```
SELECT [col 1], [col 2],... [col n]   
FROM [tab 1], [tab 2]...  
WHERE [condition]  
GROUP BY [col name(s)]  
HAVING [condition]   
ORDER BY [col name(s)]  
[OFFSET M ][LIMIT N];  
```
<table class="alt">
<tbody><tr>
<th>Parameter Name</th>
<th>Descriptions</th>
</tr>
<tr>
<td>col name or *</td>
<td>It is used to specify one or more columns to returns in the result set. The asterisk (*) returns all fields of a table.</td>
</tr>
<tr>
<td>table_name(s)</td>
<td>It is the name of tables from which we want to fetch data.</td>
</tr>
<tr>
<td>WHERE</td>
<td>It is an optional clause. It specifies the condition that returned the matched records in the result set.</td>
</tr>
<tr>
<td>GROUP BY</td>
<td>It is optional. It collects data from multiple records and grouped them by one or more columns.</td>
</tr>
<tr>
<td>HAVING</td>
<td>It is optional. It works with the GROUP BY clause and returns only those rows whose condition is TRUE.</td>
</tr>
<tr>
<td>ORDER BY</td>
<td>It is optional. It is used for sorting the records in the result set.</td>
</tr>
<tr>
<td>OFFSET</td>
<td>It is optional. It specifies to which row returns first. By default, It starts with zero.</td>
</tr>
<tr>
<td>LIMIT</td>
<td>It is optional. It is used to limit the number of returned records in the result set.</td>
</tr>
</tbody></table>

(Join Clause)
```
SELECT [tab1].[col1], [tab1].[col2], [tab2].[col1], [tab2].[col2]
FROM [tab1] INNER JOIN [tab2]
ON [tab1].[col1] = [tab2].[col1];
```

## TCL (Transaction Control Language)

In MySql, AUTO-COMMIT will be enabled automatically, so, we cannot use TCL commands while it is on. To use TCL commands, we use `START TRANSACTION;` to diable the AUTO-COMMIT temporarily untill the `COMMIT;` query or `ROLLBACK;` query are used. If they are used, we need to againg start transaction, then we can use TCL commands.

```
START TRANSACTION;
```

```
COMMIT;
```
The transaction control is more like version control, except we can control if we commit the changes to the databases server, since the transaction details are lost and the changes made will be permenant.

```
SAVEPOINT [savepoint name];
```
[name] is the savepoint, using this we can rollback to this state of database, considered that the changes are not commited.

```
ROLLBACK TO [savepoint name];
```
This rollbacks to the state where the savepoint is created. The savepoint name is optional, if it is not given, the rollback reverts to the previously commited state.

```
ROLLBACK;
```
Rollback to last commited state of database.


## Aggregate functions

<table class="alt">
<tbody><tr>
<th>Aggregate Function</th>
<th>Descriptions</th>
</tr>
<tr>
<td><a href="https://www.javatpoint.com/mysql-count">count()</a></td>
<td>It returns the number of rows, including rows with NULL values in a group.</td>
</tr>
<tr>
<td><a href="https://www.javatpoint.com/mysql-sum">sum()</a></td>
<td>It returns the total summed values (Non-NULL) in a set.</td>
</tr>
<tr>
<td><a href="https://www.javatpoint.com/mysql-average">average()</a></td>
<td>It returns the average value of an expression.</td>
</tr>
<tr>
<td><a href="https://www.javatpoint.com/mysql-min">min()</a></td>
<td>It returns the minimum (lowest) value in a set.</td>
</tr>
<tr>
<td><a href="https://www.javatpoint.com/mysql-max">max()</a></td>
<td>It returns the maximum (highest) value in a set.</td>
</tr>
<tr>
<td><a href="https://www.javatpoint.com/mysql-group_concat-function">groutp_concat()</a></td>
<td>It returns a concatenated string.</td>
</tr>
<tr>
<td><a href="https://www.javatpoint.com/mysql-first">first()</a></td>
<td>It returns the first value of an expression.</td>
</tr>
<tr>
<td><a href="https://www.javatpoint.com/mysql-last">last()</a></td>
<td>It returns the last value of an expression.</td>
</tr>
</tbody></table>
Redirecting to javatpoint for extended notes on individual aggregate function.

## conditions
```
WHERE [condition1]  # AND conditions
AND [condition2]
...  
AND [condition_n];  
```

```
WHERE [condition1]  # OR condition
OR [condition2]  
...  
OR [condition_n];  
```

```
WHERE [condition1]  # AND & OR condition
AND [condition2]  
...  
OR [condition_n];  
```
all the AND conditions and OR conditions must be seperated using round braces.
example:
SELECT * <br>
FROM students <br>  
WHERE (course_name = 'Java' AND student_name = 'Aryan')<br>  
OR (student_id < 2);  

```
WHERE [col name] LIKE [pattern]  
```
pattern is almost similar to RegExp, with escape charecters %(refers to multiple charecters), _(single charecter)
Example:
chan* can be compared to chandler, channel etc...
chan_ler can be compared to chanaler, chandler etc...

```
WHERE [col name] NOT LIKE [pattern]
```

```
WHERE [col name] IN (value1, value2, .... value_n);  
```
In condition is used to simplify multiple OR conditions used in a WHERE clause.
Example: 
WHERE age IN (18, 21, 25);
## References
https://dev.mysql.com/doc/ <br>
https://www.w3schools.com/mysql/default.asp <br>
https://www.javatpoint.com/mysql-tutorial

## Tools
https://code.visualstudio.com/ <br>
https://tableplus.com/ <br>
https://paiza.io/en/languages/mysql
