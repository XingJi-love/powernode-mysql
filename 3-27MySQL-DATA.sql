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
5yrs 10months 16days 16hrs 48mins 48secs 800ns

Startup Time: 32ms 480µs 700ns

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
5 rows in set (0.00 sec)

mysql> use powernode;
Database changed
mysql> show tables;0
+---------------------+
| Tables_in_powernode |
+---------------------+
| dept                |
| emp                 |
| salgrade            |
| student             |
| t_student           |
+---------------------+
5 rows in set (0.01 sec)

    -> ^C
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

mysql> select max(sal) from emp;
+----------+
| max(sal) |
+----------+
|  5000.00 |
+----------+
1 row in set (0.01 sec)

mysql> select min(sal) from emp;
+----------+
| min(sal) |
+----------+
|   800.00 |
+----------+
1 row in set (0.00 sec)

mysql> select avg(sal) from emp;
+-------------+
| avg(sal)    |
+-------------+
| 2073.214286 |
+-------------+
1 row in set (0.00 sec)

mysql> select sum(sal) from emp;
+----------+
| sum(sal) |
+----------+
| 29025.00 |
+----------+
1 row in set (0.00 sec)

mysql> select sum(comm) from emp;
+-----------+
| sum(comm) |
+-----------+
|   2200.00 |
+-----------+
1 row in set (0.00 sec)

mysql> select * from comm;
ERROR 1146 (42S02): Table 'powernode.comm' doesn't exist
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

mysql> select count(ename) from emp;
+--------------+
| count(ename) |
+--------------+
|           14 |
+--------------+
1 row in set (0.01 sec)

mysql> select count(comm) from emp;
+-------------+
| count(comm) |
+-------------+
|           4 |
+-------------+
1 row in set (0.00 sec)

mysql> select count(ename) from emp;
+--------------+
| count(ename) |
+--------------+
|           14 |
+--------------+
1 row in set (0.00 sec)

mysql> select count(*) from emp;
+----------+
| count(*) |
+----------+
|       14 |
+----------+
1 row in set (0.42 sec)

mysql> select count(1) from emp;
+----------+
| count(1) |
+----------+
|       14 |
+----------+
1 row in set (0.01 sec)

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
14 rows in set (0.00 sec)

mysql> select count(comm) from emp;
+-------------+
| count(comm) |
+-------------+
|           4 |
+-------------+
1 row in set (0.00 sec)

mysql> select count(distinct job) from emp;
+---------------------+
| count(distinct job) |
+---------------------+
|                   5 |
+---------------------+
1 row in set (0.01 sec)

mysql> select * from dept;
+--------+------------+----------+
| DEPTNO | DNAME      | LOC      |
+--------+------------+----------+
|     10 | ACCOUNTING | NEW YORK |
|     20 | RESEARCH   | DALLAS   |
|     30 | SALES      | CHICAGO  |
|     40 | OPERATIONS | BOSTON   |
+--------+------------+----------+
4 rows in set (0.03 sec)

mysql> select count(*),max(sal),min(sal),avg(sal),sum(sal) from emp;
+----------+----------+----------+-------------+----------+
| count(*) | max(sal) | min(sal) | avg(sal)    | sum(sal) |
+----------+----------+----------+-------------+----------+
|       14 |  5000.00 |   800.00 | 2073.214286 | 29025.00 |
+----------+----------+----------+-------------+----------+
1 row in set (0.01 sec)

mysql> select ename,job from emp where sal > avg(sal);
ERROR 1111 (HY000): Invalid use of group function
mysql> select job,avg(sal) from emp group by job;
+-----------+-------------+
| job       | avg(sal)    |
+-----------+-------------+
| CLERK     | 1037.500000 |
| SALESMAN  | 1400.000000 |
| MANAGER   | 2758.333333 |
| ANALYST   | 3000.000000 |
| PRESIDENT | 5000.000000 |
+-----------+-------------+
5 rows in set (0.01 sec)

mysql> select deptno,max(sal) from emp group by deptno;
+--------+----------+
| deptno | max(sal) |
+--------+----------+
|     20 |  3000.00 |
|     30 |  2850.00 |
|     10 |  5000.00 |
+--------+----------+
3 rows in set (0.01 sec)

mysql> select deptno,job,avg(sal) from emp group by deptno,job;
+--------+-----------+-------------+
| deptno | job       | avg(sal)    |
+--------+-----------+-------------+
|     20 | CLERK     |  950.000000 |
|     30 | SALESMAN  | 1400.000000 |
|     20 | MANAGER   | 2975.000000 |
|     30 | MANAGER   | 2850.000000 |
|     10 | MANAGER   | 2450.000000 |
|     20 | ANALYST   | 3000.000000 |
|     10 | PRESIDENT | 5000.000000 |
|     30 | CLERK     |  950.000000 |
|     10 | CLERK     | 1300.000000 |
+--------+-----------+-------------+
9 rows in set (0.00 sec)

mysql> select ename,deptno,avg(sal) from emp group by deptno;
ERROR 1055 (42000): Expression #1 of SELECT list is not in GROUP BY clause and contains nonaggregated column 'powernode.emp.ENAME' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by
mysql> select deptno ,avg(sal) from emp where deptno<>20 group by deptno;
+--------+-------------+
| deptno | avg(sal)    |
+--------+-------------+
|     30 | 1566.666667 |
|     10 | 2916.666667 |
+--------+-------------+
2 rows in set (0.01 sec)

mysql> select deptno ,avg(sal) from emp group by deptno having deptno<>20;
+--------+-------------+
| deptno | avg(sal)    |
+--------+-------------+
|     30 | 1566.666667 |
|     10 | 2916.666667 |
+--------+-------------+
2 rows in set (0.01 sec)

mysql> select deptno,avg(sal) from emp group by deptno having avg(sal) > 2000;
+--------+-------------+
| deptno | avg(sal)    |
+--------+-------------+
|     20 | 2175.000000 |
|     10 | 2916.666667 |
+--------+-------------+
2 rows in set (0.00 sec)

mysql> select substring_index('http://www.baidu.com','.',1);
+-----------------------------------------------+
| substring_index('http://www.baidu.com','.',1) |
+-----------------------------------------------+
| http://www                                    |
+-----------------------------------------------+
1 row in set (0.01 sec)

mysql> select substring_index('http://www.baidu.com','.',2);
+-----------------------------------------------+
| substring_index('http://www.baidu.com','.',2) |
+-----------------------------------------------+
| http://www.baidu                              |
+-----------------------------------------------+
1 row in set (0.00 sec)

mysql> select group_concat(empno) from emp group by job;
+---------------------+
| group_concat(empno) |
+---------------------+
| 7788,7902           |
| 7369,7876,7900,7934 |
| 7566,7698,7782      |
| 7839                |
| 7499,7521,7654,7844 |
+---------------------+
5 rows in set (0.01 sec)

mysql> select group_concat(empno order by sal desc) from emp group by job;
+---------------------------------------+
| group_concat(empno order by sal desc) |
+---------------------------------------+
| 7902,7788                             |
| 7934,7876,7900,7369                   |
| 7566,7698,7782                        |
| 7839                                  |
| 7499,7844,7654,7521                   |
+---------------------------------------+
5 rows in set (0.00 sec)

mysql> select substring_index(group_concat(empno order by sal desc),',',2) from emp group by job;
+--------------------------------------------------------------+
| substring_index(group_concat(empno order by sal desc),',',2) |
+--------------------------------------------------------------+
| 7902,7788                                                    |
| 7934,7876                                                    |
| 7566,7698                                                    |
| 7839                                                         |
| 7499,7844                                                    |
+--------------------------------------------------------------+
5 rows in set (0.01 sec)