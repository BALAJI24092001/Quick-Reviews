# MySQL Cheat Sheet <b><hr></b>

## DCL <hr>
`GRANT [privileges] ON [object] TO [user@host]`<br>
<b>[privileges]</b> - specifies access rights, like create, delete, update etc... Multiple privileges can be assigned given they are seperated by commas. <br>
<b>[object]</b> - The level on which the access rights are granted, like, on global level it is denoted by \*.\*, a database, a table etc.. eg: 'GRANT CREATE, UPDATE, INSERT ON studentdb.* TO balaji@localhost'. For assigning admistrative privileges use object as studentdb database. <br>
<b>[user@host]</b> - user is mysql use and host is the server host. usually root@localhost.

`GRANT PROXY ON [user] TO [user]`<br>
It enables one user to be a proxy for other users. eg: 'GRANT PROXY ON root TO balaji@localhost'

`SHOW GRANTS FOR [user@host]`

`REVOKE [privileges] ON [object] FROM [user.host]`
eg: 'REVOKE INSERT(col1, col2), SELECT(col1), UPDATE(col2) ON student.user TO balaji@localhost' student is database, user is a table. To revoke all grants use 'REVOKE ALL, GRANT OPTION FROM balaji@localhost'

`REVOKE PROXY ON [user] FROM [user]`

## DDL <hr>
`CREATE DATABASE [database name]`
`SHOW CREATE DATABASE [database name]`
We can review the newly created database using this query, that returns the database name, character set, and collation of the database. <br>
`SHOW DATABASES`
`USE [database]`
Using this query we can start working on our database, provided the user have required privileges. <br>
`DROP DATABASE [database]`
We can also do this by replacing DATABASE with SCHEMA, since mysql understands both are same.

```
CREATE TABLE [table name]( 
[column definition] [constraints],
[column definition] [constraints],
[column definition] [constraints],
[table constraints]
);
```
<b>[column definition]</b> - The column/ attribute name with it's data type.   
<b>[table constraints]</b> - It specifies the table constraints such as PRIMARY KEY, UNIQUE KEY, FOREIGN KEY, CHECK, etc.

`SHOW TABLES`
`DESCRIBE [table name]`
To see information or structure of a table. The database must be selected using the USE query or the database must be given.

## References
https://dev.mysql.com/doc/ <br>
https://www.w3schools.com/mysql/default.asp <br>
https://www.javatpoint.com/mysql-tutorial

## Tools
https://code.visualstudio.com/ <br>
https://tableplus.com/ <br>
https://paiza.io/en/languages/mysql

