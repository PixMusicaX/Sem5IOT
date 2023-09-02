### You might need to shift to OracleSQL now 😿

If you get an error for a code like
```sql
SELECT SQRT(25) AS square_root FROM DUAL;
```
then try executing
```sql
SELECT SQRT(25) AS "square_root" FROM DUAL;
```
