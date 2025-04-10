     __  ,
 .--()°'.' Welcome to Nushell,
'|, . ,'   based on the nu language,
 !_-(_\    where all data is structured!

Version: 0.101.0 (windows-x86_64)
Please join our Discord community at https://discord.gg/NtAbbGn
Our GitHub repository is at https://github.com/nushell/nushell
Our Documentation is located at https://nushell.sh
Tweet us at @nu_shell
Learn how to remove this at: https://nushell.sh/book/configuration.html#remove-welcome-message

It's been this long since Nushell's first commit:
5yrs 10months 5days 12hrs 3mins 22secs 300ns

Startup Time: 23ms 816µs 400ns

~> mysql -uroot -p
Enter password: ****
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 11
Server version: 8.0.41 MySQL Community Server - GPL

Copyright (c) 2000, 2025, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| powernode          |
| sys                |
+--------------------+
5 rows in set (0.01 sec)

mysql> use powernode
Database changed
mysql> show tables;
+---------------------+
| Tables_in_powernode |
+---------------------+
| dept                |
| emp                 |
| salgrade            |
| student             |
+---------------------+
4 rows in set (0.01 sec)

mysql> select * from emp;
+-------+--------+-----------+------+------------+---------+---------+--------+
| EMPNO | ENAME  | JOB       | MGR  | HIREDATE   | SAL     | COMM    | DEPTNO |
+-------+--------+-----------+------+------------+---------+---------+--------+
|  7369 | SMITH  | CLERK     | 7902 | 1980-12-17 |  800.00 |    NULL |     20 |
|  7499 | ALLEN  | SALESMAN  | 7698 | 1981-02-20 | 1600.00 |  300.00 |     30 |
|  7521 | WARD   | SALESMAN  | 7698 | 1981-02-22 | 1250.00 |  500.00 |     30 |
|  7566 | JONES  | MANAGER   | 7839 | 1981-04-02 | 2975.00 |    NULL |     20 |
|  7654 | MARTIN | SALESMAN  | 7698 | 1981-09-28 | 1250.00 | 1400.00 |     30 |
|  7698 | BLAKE  | MANAGER   | 7839 | 1981-05-01 | 2850.00 |    NULL |     30 |
|  7782 | CLARK  | MANAGER   | 7839 | 1981-06-09 | 2450.00 |    NULL |     10 |
|  7788 | SCOTT  | ANALYST   | 7566 | 1987-04-19 | 3000.00 |    NULL |     20 |
|  7839 | KING   | PRESIDENT | NULL | 1981-11-17 | 5000.00 |    NULL |     10 |
|  7844 | TURNER | SALESMAN  | 7698 | 1981-09-08 | 1500.00 |    0.00 |     30 |
|  7876 | ADAMS  | CLERK     | 7788 | 1987-05-23 | 1100.00 |    NULL |     20 |
|  7900 | JAMES  | CLERK     | 7698 | 1981-12-03 |  950.00 |    NULL |     30 |
|  7902 | FORD   | ANALYST   | 7566 | 1981-12-03 | 3000.00 |    NULL |     20 |
|  7934 | MILLER | CLERK     | 7782 | 1982-01-23 | 1300.00 |    NULL |     10 |
+-------+--------+-----------+------+------------+---------+---------+--------+
14 rows in set (0.01 sec)

mysql> select * from dept;
+--------+------------+----------+
| DEPTNO | DNAME      | LOC      |
+--------+------------+----------+
|     10 | ACCOUNTING | NEW YORK |
|     20 | RESEARCH   | DALLAS   |
|     30 | SALES      | CHICAGO  |
|     40 | OPERATIONS | BOSTON   |
+--------+------------+----------+
4 rows in set (0.01 sec)

mysql> select * from salgrade;
+-------+-------+-------+
| GRADE | LOSAL | HISAL |
+-------+-------+-------+
|     1 |   700 |  1200 |
|     2 |  1201 |  1400 |
|     3 |  1401 |  2000 |
|     4 |  2001 |  3000 |
|     5 |  3001 |  9999 |
+-------+-------+-------+
5 rows in set (0.00 sec)

mysql> select * from student;
+------+----------+
| id   | name     |
+------+----------+
|    1 | susan    |
|    2 | lucy     |
|    3 | jack_son |
+------+----------+
3 rows in set (0.00 sec)

mysql> select * from salgrade;
+-------+-------+-------+
| GRADE | LOSAL | HISAL |
+-------+-------+-------+
|     1 |   700 |  1200 |
|     2 |  1201 |  1400 |
|     3 |  1401 |  2000 |
|     4 |  2001 |  3000 |
|     5 |  3001 |  9999 |
+-------+-------+-------+
5 rows in set (0.00 sec)

mysql> select empno,ename,sal from emp order by sal asc;
+-------+--------+---------+
| empno | ename  | sal     |
+-------+--------+---------+
|  7369 | SMITH  |  800.00 |
|  7900 | JAMES  |  950.00 |
|  7876 | ADAMS  | 1100.00 |
|  7521 | WARD   | 1250.00 |
|  7654 | MARTIN | 1250.00 |
|  7934 | MILLER | 1300.00 |
|  7844 | TURNER | 1500.00 |
|  7499 | ALLEN  | 1600.00 |
|  7782 | CLARK  | 2450.00 |
|  7698 | BLAKE  | 2850.00 |
|  7566 | JONES  | 2975.00 |
|  7788 | SCOTT  | 3000.00 |
|  7902 | FORD   | 3000.00 |
|  7839 | KING   | 5000.00 |
+-------+--------+---------+
14 rows in set (0.00 sec)

mysql> select empno,ename,sal from emp order by sal dasc;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'dasc' at line 1
mysql> select empno,ename,sal from emp order by sal desc;
+-------+--------+---------+
| empno | ename  | sal     |
+-------+--------+---------+
|  7839 | KING   | 5000.00 |
|  7788 | SCOTT  | 3000.00 |
|  7902 | FORD   | 3000.00 |
|  7566 | JONES  | 2975.00 |
|  7698 | BLAKE  | 2850.00 |
|  7782 | CLARK  | 2450.00 |
|  7499 | ALLEN  | 1600.00 |
|  7844 | TURNER | 1500.00 |
|  7934 | MILLER | 1300.00 |
|  7521 | WARD   | 1250.00 |
|  7654 | MARTIN | 1250.00 |
|  7876 | ADAMS  | 1100.00 |
|  7900 | JAMES  |  950.00 |
|  7369 | SMITH  |  800.00 |
+-------+--------+---------+
14 rows in set (0.00 sec)

mysql> select empno,ename,sal from emp order by sal;
+-------+--------+---------+
| empno | ename  | sal     |
+-------+--------+---------+
|  7369 | SMITH  |  800.00 |
|  7900 | JAMES  |  950.00 |
|  7876 | ADAMS  | 1100.00 |
|  7521 | WARD   | 1250.00 |
|  7654 | MARTIN | 1250.00 |
|  7934 | MILLER | 1300.00 |
|  7844 | TURNER | 1500.00 |
|  7499 | ALLEN  | 1600.00 |
|  7782 | CLARK  | 2450.00 |
|  7698 | BLAKE  | 2850.00 |
|  7566 | JONES  | 2975.00 |
|  7788 | SCOTT  | 3000.00 |
|  7902 | FORD   | 3000.00 |
|  7839 | KING   | 5000.00 |
+-------+--------+---------+
14 rows in set (0.00 sec)

mysql> select empno,ename from emp order by ename;
+-------+--------+
| empno | ename  |
+-------+--------+
|  7876 | ADAMS  |
|  7499 | ALLEN  |
|  7698 | BLAKE  |
|  7782 | CLARK  |
|  7902 | FORD   |
|  7900 | JAMES  |
|  7566 | JONES  |
|  7839 | KING   |
|  7654 | MARTIN |
|  7934 | MILLER |
|  7788 | SCOTT  |
|  7369 | SMITH  |
|  7844 | TURNER |
|  7521 | WARD   |
+-------+--------+
14 rows in set (0.00 sec)


D:\Blog-vitepress-theme>mysql -h 127.0.0.1 -P 3306 -u root -p"1225" --ssl-mode=DISABLED
mysql: [Warning] Using a password on the command line interface can be insecure.
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 19
Server version: 8.0.41 MySQL Community Server - GPL

Copyright (c) 2000, 2025, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its    
affiliates. Other names may be trademarks of their respective        
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> select empno,ename,sal from emp order by sal asc, ename asc;
ERROR 1046 (3D000): No database selected
mysql> select empno,ename,sal from emp order by sal asc,ename asc; 
ERROR 1046 (3D000): No database selected
mysql> show databases;                                             
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| powernode          |
| sys                |
+--------------------+
5 rows in set (0.00 sec)

mysql> use powernode;
Database changed
mysql> select empno,ename,sal from emp order by sal asc, ename asc;
c;
+-------+--------+---------+
| empno | ename  | sal     |
+-------+--------+---------+
|  7369 | SMITH  |  800.00 |
|  7900 | JAMES  |  950.00 |
|  7876 | ADAMS  | 1100.00 |
|  7654 | MARTIN | 1250.00 |
|  7521 | WARD   | 1250.00 |
|  7934 | MILLER | 1300.00 |
|  7844 | TURNER | 1500.00 |
|  7499 | ALLEN  | 1600.00 |
|  7782 | CLARK  | 2450.00 |
|  7698 | BLAKE  | 2850.00 |
|  7566 | JONES  | 2975.00 |
|  7902 | FORD   | 3000.00 |
|  7788 | SCOTT  | 3000.00 |
|  7839 | KING   | 5000.00 |
+-------+--------+---------+
14 rows in set (0.00 sec)

mysql> select ename,sal from emp where job = 'MANAGER' order by sal asc;
+-------+---------+
| ename | sal     |
+-------+---------+
| CLARK | 2450.00 |
| BLAKE | 2850.00 |
| JONES | 2975.00 |
+-------+---------+
3 rows in set (0.00 sec)

mysql> select job from emp;
+-----------+
| job       |
+-----------+
| CLERK     |
| SALESMAN  |
| SALESMAN  |
| MANAGER   |
| SALESMAN  |
| MANAGER   |
| MANAGER   |
| ANALYST   |
| PRESIDENT |
| SALESMAN  |
| CLERK     |
| CLERK     |
| ANALYST   |
| CLERK     |
+-----------+
14 rows in set (0.00 sec)

mysql> select distinct job from emp; 
+-----------+
| job       |
+-----------+
| CLERK     |
| SALESMAN  |
| MANAGER   |
| ANALYST   |
| PRESIDENT |
+-----------+
5 rows in set (0.00 sec)
mysql> select ename, distinct job from emp;
mysql> select ename, distinct job from emp;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'distinct job from emp' at line 1
mysql> select distinct job from emp;
+-----------+
| job       |
+-----------+
| CLERK     |
| SALESMAN  |
| MANAGER   |
| ANALYST   |
| PRESIDENT |
+-----------+
5 rows in set (0.00 sec)

mysql> select distinct deptno,job from emp;
+--------+-----------+
| deptno | job       |
+--------+-----------+
|     20 | CLERK     |
|     30 | SALESMAN  |
|     20 | MANAGER   |
|     30 | MANAGER   |
|     10 | MANAGER   |
|     20 | ANALYST   |
|     10 | PRESIDENT |
|     30 | CLERK     |
|     10 | CLERK     |
+--------+-----------+
9 rows in set (0.00 sec)

mysql> select ename from emp;
+--------+
| ename  |
+--------+
| SMITH  |
| ALLEN  |
| WARD   |
| JONES  |
| MARTIN |
| BLAKE  |
| CLARK  |
| SCOTT  |
| KING   |
| TURNER |
| ADAMS  |
| JAMES  |
| FORD   |
| MILLER |
+--------+
14 rows in set (0.00 sec)

mysql> select 100;
+-----+
| 100 |
+-----+
| 100 |
+-----+
1 row in set (0.00 sec)

mysql> select 100 as ename;
+-------+
| ename |
+-------+
|   100 |
+-------+
1 row in set (0.00 sec)

mysql> select 'abc';
+-----+
| abc |
+-----+
| abc |
+-----+
1 row in set (0.00 sec)

mysql> select abc;
ERROR 1054 (42S22): Unknown column 'abc' in 'field list'
mysql> select upper(ename) as ename from emp;                                        
+--------+
| ename  |
+--------+
| SMITH  |
| ALLEN  |
| WARD   |
| JONES  |
| MARTIN |
| BLAKE  |
| CLARK  |
| SCOTT  |
| KING   |
| TURNER |
| ADAMS  |
| JAMES  |
| FORD   |
| MILLER |
+--------+
14 rows in set (0.03 sec)
