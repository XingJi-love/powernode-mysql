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
5yrs 10months 11days 15hrs 20mins 36secs 800ns

Startup Time: 26ms 175µs 600ns

~> mysql -uroot -p
Enter password: ****
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 67
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

mysql> use powernode;
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
4 rows in set (0.00 sec)

mysql> select length('你好123');
+-------------------+
| length('你好123') |
+-------------------+
|                 7 |
+-------------------+
1 row in set (0.00 sec)

mysql> select char_length('你好123');
+------------------------+
| char_length('你好123') |
+------------------------+
|                      5 |
+------------------------+
1 row in set (0.00 sec)

mysql> select concat('abc','def','xyz');
+---------------------------+
| concat('abc','def','xyz') |
+---------------------------+
| abcdefxyz                 |
+---------------------------+
1 row in set (0.00 sec)

mysql> select ename,sal from emp where sal > 3000 ||
 sal < 900;
+-------+---------+
| ename | sal     |
+-------+---------+
| SMITH |  800.00 |
| KING  | 5000.00 |
+-------+---------+
2 rows in set, 1 warning (0.00 sec)
       ^C
mysql> select ename,sal from emp where sal > 3000 || sal < 900;
+-------+---------+
| ename | sal     |
+-------+---------+
| SMITH |  800.00 |
| KING  | 5000.00 |
+-------+---------+
2 rows in set, 1 warning (0.00 sec)

mysql> select concat(trim('    abc    '), 'def');
+------------------------------------+
| concat(trim('    abc    '), 'def') |
+------------------------------------+
| abcdef                             |
+------------------------------------+
1 row in set (0.00 sec)

mysql> select trim(leading '0' from '000111000');
+------------------------------------+
| trim(leading '0' from '000111000') |
+------------------------------------+
| 111000                             |
+------------------------------------+
1 row in set (0.00 sec)

mysql> select trim(trailing '0' from '000111000');
+-------------------------------------+
| trim(trailing '0' from '000111000') |
+-------------------------------------+
| 000111                              |
+-------------------------------------+
1 row in set (0.00 sec)

mysql> select rand();
+--------------------+
| rand()             |
+--------------------+
| 0.4465609550909707 |
+--------------------+
1 row in set (0.00 sec)

mysql> select rand();
+--------------------+
| rand()             |
+--------------------+
| 0.3695505944728391 |
+--------------------+
1 row in set (0.00 sec)

mysql> select rand(2);
+--------------------+
| rand(2)            |
+--------------------+
| 0.6555866465490187 |
+--------------------+
1 row in set (0.00 sec)

mysql> select rand(2);
+--------------------+
| rand(2)            |
+--------------------+
| 0.6555866465490187 |
+--------------------+
1 row in set (0.00 sec)

mysql> select rand(5);
+---------------------+
| rand(5)             |
+---------------------+
| 0.40613597483014313 |
+---------------------+
1 row in set (0.00 sec)

mysql> select rand(5);
+---------------------+
| rand(5)             |
+---------------------+
| 0.40613597483014313 |
+---------------------+
1 row in set (0.00 sec)

mysql> select round(9.754);
+--------------+
| round(9.754) |
+--------------+
|           10 |
+--------------+
1 row in set (0.00 sec)

mysql> select round(9.454);
+--------------+
| round(9.454) |
+--------------+
|            9 |
+--------------+
1 row in set (0.00 sec)

mysql> select round(9.454,1);
+----------------+
| round(9.454,1) |
+----------------+
|            9.5 |
+----------------+
1 row in set (0.00 sec)

mysql> select round(9.454,0);
+----------------+
| round(9.454,0) |
+----------------+
|              9 |
+----------------+
1 row in set (0.00 sec)

mysql> truncate(9.999,2)
    -> truncate(9.999,2)^C
mysql> truncate(9.999,2);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '(9.999,2)' at line 1
mysql> select truncate(9.999,2);
+-------------------+
| truncate(9.999,2) |
+-------------------+
|              9.99 |
+-------------------+
1 row in set (0.00 sec)

mysql> select ceil(5.3);
+-----------+
| ceil(5.3) |
+-----------+
|         6 |
+-----------+
1 row in set (0.00 sec)

mysql> select floor(5.3);
+------------+
| floor(5.3) |
+------------+
|          5 |
+------------+
1 row in set (0.00 sec)

mysql> select null + 1;
+----------+
| null + 1 |
+----------+
|     NULL |
+----------+
1 row in set (0.01 sec)

mysql> select null * 10;
+-----------+
| null * 10 |
+-----------+
|      NULL |
+-----------+
1 row in set (0.00 sec)

mysql> select null * 0;
+----------+
| null * 0 |
+----------+
|     NULL |
+----------+
1 row in set (0.00 sec)

mysql> select ename,(sal + comm) * 12 as yearsal fro
m emp;
+--------+----------+
| ename  | yearsal  |
+--------+----------+
| SMITH  |     NULL |
| ALLEN  | 22800.00 |
| WARD   | 21000.00 |
| JONES  |     NULL |
| MARTIN | 31800.00 |
| BLAKE  |     NULL |
| CLARK  |     NULL |
| SCOTT  |     NULL |
| KING   |     NULL |
| TURNER | 18000.00 |
| ADAMS  |     NULL |
| JAMES  |     NULL |
| FORD   |     NULL |
| MILLER |     NULL |
+--------+----------+
14 rows in set (0.00 sec)

mysql> select ename,(sal + comm) * 12 as yearsal from emp;
+--------+----------+
| ename  | yearsal  |
+--------+----------+
| SMITH  |     NULL |
| ALLEN  | 22800.00 |
| WARD   | 21000.00 |
| JONES  |     NULL |
| MARTIN | 31800.00 |
| BLAKE  |     NULL |
| CLARK  |     NULL |
| SCOTT  |     NULL |
| KING   |     NULL |
| TURNER | 18000.00 |
| ADAMS  |     NULL |
| JAMES  |     NULL |
| FORD   |     NULL |
| MILLER |     NULL |
+--------+----------+
14 rows in set (0.00 sec)

mysql> select ename,(sal + ifnull(comm, 0)) * 12 as
yearsal from emp;
+--------+----------+
| ename  | yearsal  |
+--------+----------+
| SMITH  |  9600.00 |
| ALLEN  | 22800.00 |
| WARD   | 21000.00 |
| JONES  | 35700.00 |
| MARTIN | 31800.00 |
| BLAKE  | 34200.00 |
| CLARK  | 29400.00 |
| SCOTT  | 36000.00 |
| KING   | 60000.00 |
| TURNER | 18000.00 |
| ADAMS  | 13200.00 |
| JAMES  | 11400.00 |
| FORD   | 36000.00 |
| MILLER | 15600.00 |
+--------+----------+
14 rows in set (0.00 sec)

mysql> select ename,(sal + ifnull(comm, 0)) * 12 as yearsal from emp;
+--------+----------+
| ename  | yearsal  |
+--------+----------+
| SMITH  |  9600.00 |
| ALLEN  | 22800.00 |
| WARD   | 21000.00 |
| JONES  | 35700.00 |
| MARTIN | 31800.00 |
| BLAKE  | 34200.00 |
| CLARK  | 29400.00 |
| SCOTT  | 36000.00 |
| KING   | 60000.00 |
| TURNER | 18000.00 |
| ADAMS  | 13200.00 |
| JAMES  | 11400.00 |
| FORD   | 36000.00 |
| MILLER | 15600.00 |
+--------+----------+
14 rows in set (0.00 sec)

mysql> select now();
+---------------------+
| now()               |
+---------------------+
| 2025-03-22 17:55:54 |
+---------------------+
1 row in set (0.00 sec)

mysql> select sysdata();
ERROR 1305 (42000): FUNCTION powernode.sysdata does not exist
mysql> select sysdate();
+---------------------+
| sysdate()           |
+---------------------+
| 2025-03-22 17:56:27 |
+---------------------+
1 row in set (0.00 sec)

mysql> select sysdata();
ERROR 1305 (42000): FUNCTION powernode.sysdata does not exist
mysql> select now();
+---------------------+
| now()               |
+---------------------+
| 2025-03-22 17:56:34 |
+---------------------+
1 row in set (0.00 sec)

mysql> select sysdate();
+---------------------+
| sysdate()           |
+---------------------+
| 2025-03-22 17:56:38 |
+---------------------+
1 row in set (0.00 sec)

mysql> select now(), sleep(2), sysdate();
+---------------------+----------+---------------------+
| now()               | sleep(2) | sysdate()           |
+---------------------+----------+---------------------+
| 2025-03-22 17:57:14 |        0 | 2025-03-22 17:57:16 |
+---------------------+----------+---------------------+
1 row in set (2.00 sec)

mysql> select curdate();
+------------+
| curdate()  |
+------------+
| 2025-03-22 |
+------------+
1 row in set (0.00 sec)

mysql> select current();
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '()' at line 1
mysql> select curdate();
+------------+
| curdate()  |
+------------+
| 2025-03-22 |
+------------+
1 row in set (0.00 sec)

mysql> select current_date();
+----------------+
| current_date() |
+----------------+
| 2025-03-22     |
+----------------+
1 row in set (0.00 sec)

mysql> select current_date;
+--------------+
| current_date |
+--------------+
| 2025-03-22   |
+--------------+
1 row in set (0.00 sec)

mysql> select curtime();
+-----------+
| curtime() |
+-----------+
| 18:16:27  |
+-----------+
1 row in set (0.01 sec)

mysql> select current_time();
+----------------+
| current_time() |
+----------------+
| 18:16:52       |
+----------------+
1 row in set (0.00 sec)

mysql> select current_time;
+--------------+
| current_time |
+--------------+
| 18:16:57     |
+--------------+
1 row in set (0.00 sec)

mysql> select year(now());
+-------------+
| year(now()) |
+-------------+
|        2025 |
+-------------+
1 row in set (0.00 sec)

mysql> select month(now());
+--------------+
| month(now()) |
+--------------+
|            3 |
+--------------+
1 row in set (0.01 sec)

mysql> select day(now());
+------------+
| day(now()) |
+------------+
|         22 |
+------------+
1 row in set (0.01 sec)

mysql> select hour(now());
+-------------+
| hour(now()) |
+-------------+
|          18 |
+-------------+
1 row in set (0.00 sec)

mysql> select minute(now());
+---------------+
| minute(now()) |
+---------------+
|            20 |
+---------------+
1 row in set (0.00 sec)

mysql> select second(now());
+---------------+
| second(now()) |
+---------------+
|            44 |
+---------------+
1 row in set (0.00 sec)

mysql> select date(now());
+-------------+
| date(now()) |
+-------------+
| 2025-03-22  |
+-------------+
1 row in set (0.00 sec)

mysql> select time(now());
+-------------+
| time(now()) |
+-------------+
| 18:28:01    |
+-------------+
1 row in set (0.00 sec)

mysql> select date_add('2025-3-22', interval 3 day);
+---------------------------------------+
| date_add('2025-3-22', interval 3 day) |
+---------------------------------------+
| 2025-03-25                            |
+---------------------------------------+
1 row in set (0.00 sec)

mysql> select date_add('2025-3-22', interval 3 month);
+-----------------------------------------+
| date_add('2025-3-22', interval 3 month) |
+-----------------------------------------+
| 2025-06-22                              |
+-----------------------------------------+
1 row in set (0.00 sec)

mysql> select date_add('2025-3-22 19:16:16', interval -1 microsecond)
    -> select date_add('2025-3-22 19:16:16', interval -1 microsecond)^C
mysql> select date_add('2025-3-22 19:16:16', interval -1 microsecond);
+---------------------------------------------------------+
| date_add('2025-3-22 19:16:16', interval -1 microsecond) |
+---------------------------------------------------------+
| 2025-03-22 19:16:15.999999                              |
+---------------------------------------------------------+
1 row in set (0.00 sec)

mysql> select date_sub('2025-3-22 19:16:16', interval 1 microsecond);
+--------------------------------------------------------+
| date_sub('2025-3-22 19:16:16', interval 1 microsecond) |
+--------------------------------------------------------+
| 2025-03-22 19:16:15.999999                             |
+--------------------------------------------------------+
1 row in set (0.00 sec)

mysql> select date_add('2025-3-22 19:16:16', interval '3,2' day_hour);
+---------------------------------------------------------+
| date_add('2025-3-22 19:16:16', interval '3,2' day_hour) |
+---------------------------------------------------------+
| 2025-03-25 21:16:16                                     |
+---------------------------------------------------------+
1 row in set (0.00 sec)

mysql> select date_format(now(), '%Y-%m-%d %H:%i:%s');
+-----------------------------------------+
| date_format(now(), '%Y-%m-%d %H:%i:%s') |
+-----------------------------------------+
| 2025-03-22 19:36:58                     |
+-----------------------------------------+
1 row in set (0.00 sec)

mysql> select now();
+---------------------+
| now()               |
+---------------------+
| 2025-03-22 19:41:19 |
+---------------------+
1 row in set (0.00 sec)

mysql> drop table if exists t_student;
Query OK, 0 rows affected, 1 warning (0.02 sec)

mysql> create table t_student(
    ->   name varchar(255),
    ->   birth date
    -> );
Query OK, 0 rows affected (0.09 sec)

mysql> show tables;
+---------------------+
| Tables_in_powernode |
+---------------------+
| dept                |
| emp                 |
| salgrade            |
| student             |
| t_student           |
+---------------------+
5 rows in set (0.00 sec)

mysql> desc t_student;
+-------+--------------+------+-----+---------+-------+
| Field | Type         | Null | Key | Default | Extra |
+-------+--------------+------+-----+---------+-------+
| name  | varchar(255) | YES  |     | NULL    |       |
| birth | date         | YES  |     | NULL    |       |
+-------+--------------+------+-----+---------+-------+
2 rows in set (0.01 sec)