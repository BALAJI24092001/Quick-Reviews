-- PL/SQL

/* It's a procedure language extension for SQL and Oracle relational database.

# Basic syntax
*/
DECLARE
	a number; -- <declaration section>
BEGIN
	a := a + 1; -- <executable command(s)>
EXCEPTION
	-- <exception handling> # add exception for a/0 at end
END;


-- example: Print first 5 even numbers; 
	
DECLARE
	i number;
	j number :=2;
BEGIN
	i:=1;
	loop -- decision controls added later
	dbms_output.put_line(2*i);
	i:= i + 1;
	exit when i > 5;
	end loop;
	dbms_output.put_line("val of j is: " || j);
END;	
/*
Variables declared inside the declare block are global variables, and the variables in the declare block that we can define inside the BEGIN block are local variables.

PLSQL variable attributes: 
When you declare a PL/SQL variable to hold the column values, it must be of correct data types and precision, otherwise error will occur on execution. A % sign servers as the attribute indicator. This method of declaring variables has an advantage as the user is not concerned with writing and maintaining code.

> %TYPE:
The %TYPE attribute is used to declare variables according to the already declared variable or database column. It is used when you are declaring an individual variable, not a record. 
example: SALARY EMP.SAL%TYPE;

> %ROWTYPE:
The %ROWTYPE attribute is used to declare a record type that represents a row in a table. The record can store an entire row or some specific data selected from the table. A column in a row and corresponding fields in a record have the same name and data types.
example: */
	EMPLOYEE EMP.%ROWTYPE;
	EMPLOYEE.SAL := 10000;
	EMPLOYEE.ENAME := "BALAJI";	
/*
PL/SQL constants:
[constant name] CONSTANT [datatype] := [value];
A constant value cannot be updated throughout the program.

PL/SQL data types:
* Numeric		5, 6, 10 etc..
* Charecter		'a', 'b', ';' etc..
* String		"BALAJI"
* Boolean		TRUE, FALSE
* Date and Time		'06-12-2021', '06-12-2021 23:42:01'
*/

-- IF - THEN:

IF (a>5) -- [condition]
THEN
dbms_output.put_line("a value is: " || a); -- [statement] // It is executed whe the condition is true
END IF;


-- IF-THEN-ELSE:
IF (a>5) -- [codition]
THEN
dbms_output.put_line("'a' mul 2 is: "|| a*2) -- [statement]
ELSE 
dbms_output.put_line("'a' mul 3 is: "|| a*3) -- [statement]
END IF;



-- # Procedures


