# Assignment No 1
---

## 1. What is SQL?
    A. SQL stands for Structured Query Language. It is a domain-specific programming language used for managing and manipulating relational databases. SQL allows users to interact with databases by defining and
    executing queries to perform various operations like inserting, updating, and retrieving data.
---

## 2. Explain several parts of SQL.
    A. Several key components and parts of SQL are:
    i> Tables:
    A table is a fundamental component of a relational database. It represents a collection of related data entries organized into rows and columns. Each row in a table is known as a record, and each column
    represents a field or attribute of the data.
    ii> Queries: 
    SQL allows you to retrieve specific data from one or more tables using queries.
    iii> Data Manipulation Language (DML):
    SQL includes commands that enable users to manipulate data within tables. Common DML commands are INSERT (to add new rows), UPDATE (to modify existing rows), and DELETE (to remove rows).
    iv> Data Definition Language (DDL): 
    DDL commands are used to define and manage the database structure and schema. This includes creating and altering database objects such as tables, views, and indexes. Common DDL commands include CREATE, ALTER,
    and DROP.
    v> Constraints: 
    Constraints are rules applied to columns in a table to enforce data integrity. A common constraint is PRIMARY KEY (uniquely identifies each record in a table).
    vi> Joins: 
    SQL allows you to combine data from multiple tables using joins. Joins retrieve related data based on matching values in specified columns.
    vii> Aggregation: 
    SQL supports various aggregate functions like SUM, COUNT, AVG, MIN, and MAX. These functions allow you to perform calculations on groups of data and return summarized results.
    viii> Subqueries: 
    Subqueries are queries nested within another query. They allow you to use the result of one query as a condition or filter in another query, providing powerful and flexible data retrieval capabilities.
    ix> Views: 
    Views are virtual tables derived from the result of a query. They enable users to simplify complex queries by encapsulating them into a reusable view, essentially acting as predefined queries.
    x> Transactions: 
    Transactions allow you to group one or more SQL statements into a single unit of work. They ensure that all statements within a transaction are either executed together (commit) or completely undone (rollback) 
    if an error occurs, maintaining data consistency and integrity.
---

## 3. Difference between varchar (n) & varchar2 (n).
    A. In SQL, both VARCHAR(n) and VARCHAR2(n) are used to define character data types that can store variable-length strings of up to 'n' characters.
    VARCHAR(n) is used in databases like PostgreSQL and MySQL, and the 'n' specifies the maximum length of the string in characters however it suffers from some limitations like storage overhead, slower sorting and
    not natively supporting unicode characters.
    To Address this, VARCHAR(2) was introduced specific to Oracle Database and is used in a similar way, with the 'n' representing the maximum length of the string in characters.
---

## 4. Difference between Desc <table name> & select * from <table name>.
    A. DESC <table name>:
    The DESC command is used to describe the structure of a table in the database. It provides information about the columns and their data types, as well as any constraints applied to the table.
    SELECT * FROM <table name>:
    The SELECT statement is used to retrieve data from a table in the database. It allows you to retrieve one or more rows and columns from the table based on specified conditions or filters.
    The * in SELECT * is a wildcard that represents all columns in the table. So, SELECT * FROM <table name> will retrieve all the rows and all the columns from the specified table.
    This command is commonly used to fetch all the data from a table when you want to see the entire content of the table.
    
