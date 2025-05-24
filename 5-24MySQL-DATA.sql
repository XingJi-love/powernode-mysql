PowerShell 7.5.1
Loading personal and system profiles took 773ms.
 mysql -uroot -p
Enter password: ****
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 12
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
| studentsdb         |
| sys                |
+--------------------+
6 rows in set (0.00 sec)

mysql> use powernode;
Database changed
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

mysql> select * from deptno;
ERROR 1146 (42S02): Table 'powernode.deptno' doesn't exist
mysql> show tables;
+---------------------+
| Tables_in_powernode |
+---------------------+
| dept                |
| emp                 |
| salgrade            |
| student             |
| t_customer          |
| t_order             |
| t_student           |
+---------------------+
7 rows in set (0.00 sec)

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

mysql> select * from dept;
+--------+------------+----------+
| DEPTNO | DNAME      | LOC      |
+--------+------------+----------+
|     10 | ACCOUNTING | NEW YORK |
|     20 | RESEARCH   | DALLAS   |
|     30 | SALES      | CHICAGO  |
|     40 | OPERATIONS | BOSTON   |
+--------+------------+----------+
4 rows in set (0.00 sec)

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

mysql> select ename,sal from emp where job='MANAGER' or job='SALESMAN';
+--------+---------+
| ename  | sal     |
+--------+---------+
| ALLEN  | 1600.00 |
| WARD   | 1250.00 |
| JONES  | 2975.00 |
| MARTIN | 1250.00 |
| BLAKE  | 2850.00 |
| CLARK  | 2450.00 |
| TURNER | 1500.00 |
+--------+---------+
7 rows in set (0.00 sec)

mysql> select ename,sal from emp where job in('MANAGER','SALESMAN');
+--------+---------+
| ename  | sal     |
+--------+---------+
| ALLEN  | 1600.00 |
| WARD   | 1250.00 |
| JONES  | 2975.00 |
| MARTIN | 1250.00 |
| BLAKE  | 2850.00 |
| CLARK  | 2450.00 |
| TURNER | 1500.00 |
+--------+---------+
7 rows in set (0.00 sec)

mysql> select ename,sal from emp where job='SALESMAN';
+--------+---------+
| ename  | sal     |
+--------+---------+
| ALLEN  | 1600.00 |
| WARD   | 1250.00 |
| MARTIN | 1250.00 |
| TURNER | 1500.00 |
+--------+---------+
4 rows in set (0.00 sec)

mysql> select ename,sal from emp where job='MANAGER';
+-------+---------+
| ename | sal     |
+-------+---------+
| JONES | 2975.00 |
| BLAKE | 2850.00 |
| CLARK | 2450.00 |
+-------+---------+
3 rows in set (0.00 sec)

mysql> select ename,sal from emp where job='MANAGER'
    -> union
    -> select ename,sal from emp where job='SALESMAN';
+--------+---------+
| ename  | sal     |
+--------+---------+
| JONES  | 2975.00 |
| BLAKE  | 2850.00 |
| CLARK  | 2450.00 |
| ALLEN  | 1600.00 |
| WARD   | 1250.00 |
| MARTIN | 1250.00 |
| TURNER | 1500.00 |
+--------+---------+
7 rows in set (0.00 sec)

mysql> select ename,sal from emp where job='MANAGER'
    -> union all
    -> select ename,sal from emp where job='SALESMAN';
+--------+---------+
| ename  | sal     |
+--------+---------+
| JONES  | 2975.00 |
| BLAKE  | 2850.00 |
| CLARK  | 2450.00 |
| ALLEN  | 1600.00 |
| WARD   | 1250.00 |
| MARTIN | 1250.00 |
| TURNER | 1500.00 |
+--------+---------+
7 rows in set (0.00 sec)

mysql> select job,sal from emp;
+-----------+---------+
| job       | sal     |
+-----------+---------+
| CLERK     |  800.00 |
| SALESMAN  | 1600.00 |
| SALESMAN  | 1250.00 |
| MANAGER   | 2975.00 |
| SALESMAN  | 1250.00 |
| MANAGER   | 2850.00 |
| MANAGER   | 2450.00 |
| ANALYST   | 3000.00 |
| PRESIDENT | 5000.00 |
| SALESMAN  | 1500.00 |
| CLERK     | 1100.00 |
| CLERK     |  950.00 |
| ANALYST   | 3000.00 |
| CLERK     | 1300.00 |
+-----------+---------+
14 rows in set (0.00 sec)

mysql> select job,sal from emp
    -> union all
    -> select job,sal from emp;
+-----------+---------+
| job       | sal     |
+-----------+---------+
| CLERK     |  800.00 |
| SALESMAN  | 1600.00 |
| SALESMAN  | 1250.00 |
| MANAGER   | 2975.00 |
| SALESMAN  | 1250.00 |
| MANAGER   | 2850.00 |
| MANAGER   | 2450.00 |
| ANALYST   | 3000.00 |
| PRESIDENT | 5000.00 |
| SALESMAN  | 1500.00 |
| CLERK     | 1100.00 |
| CLERK     |  950.00 |
| ANALYST   | 3000.00 |
| CLERK     | 1300.00 |
| CLERK     |  800.00 |
| SALESMAN  | 1600.00 |
| SALESMAN  | 1250.00 |
| MANAGER   | 2975.00 |
| SALESMAN  | 1250.00 |
| MANAGER   | 2850.00 |
| MANAGER   | 2450.00 |
| ANALYST   | 3000.00 |
| PRESIDENT | 5000.00 |
| SALESMAN  | 1500.00 |
| CLERK     | 1100.00 |
| CLERK     |  950.00 |
| ANALYST   | 3000.00 |
| CLERK     | 1300.00 |
+-----------+---------+
28 rows in set (0.00 sec)

mysql> select job,sal from emp
    -> union
    -> select job,sal from emp;
+-----------+---------+
| job       | sal     |
+-----------+---------+
| CLERK     |  800.00 |
| SALESMAN  | 1600.00 |
| SALESMAN  | 1250.00 |
| MANAGER   | 2975.00 |
| MANAGER   | 2850.00 |
| MANAGER   | 2450.00 |
| ANALYST   | 3000.00 |
| PRESIDENT | 5000.00 |
| SALESMAN  | 1500.00 |
| CLERK     | 1100.00 |
| CLERK     |  950.00 |
| CLERK     | 1300.00 |
+-----------+---------+
12 rows in set (0.00 sec)

mysql> select * from emp limit 0,3
    -> select * from emp limit^Z^C
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

mysql> select * from emp limit 0,3;
+-------+-------+----------+------+------------+---------+--------+--------+
| EMPNO | ENAME | JOB      | MGR  | HIREDATE   | SAL     | COMM   | DEPTNO |
+-------+-------+----------+------+------------+---------+--------+--------+
|  7369 | SMITH | CLERK    | 7902 | 1980-12-17 |  800.00 |   NULL |     20 |
|  7499 | ALLEN | SALESMAN | 7698 | 1981-02-20 | 1600.00 | 300.00 |     30 |
|  7521 | WARD  | SALESMAN | 7698 | 1981-02-22 | 1250.00 | 500.00 |     30 |
+-------+-------+----------+------+------------+---------+--------+--------+
3 rows in set (0.00 sec)

mysql> select * from emp limit 3;
+-------+-------+----------+------+------------+---------+--------+--------+
| EMPNO | ENAME | JOB      | MGR  | HIREDATE   | SAL     | COMM   | DEPTNO |
+-------+-------+----------+------+------------+---------+--------+--------+
|  7369 | SMITH | CLERK    | 7902 | 1980-12-17 |  800.00 |   NULL |     20 |
|  7499 | ALLEN | SALESMAN | 7698 | 1981-02-20 | 1600.00 | 300.00 |     30 |
|  7521 | WARD  | SALESMAN | 7698 | 1981-02-22 | 1250.00 | 500.00 |     30 |
+-------+-------+----------+------+------------+---------+--------+--------+
3 rows in set (0.00 sec)

mysql> select * from emp limit 5;
+-------+--------+----------+------+------------+---------+---------+--------+
| EMPNO | ENAME  | JOB      | MGR  | HIREDATE   | SAL     | COMM    | DEPTNO |
+-------+--------+----------+------+------------+---------+---------+--------+
|  7369 | SMITH  | CLERK    | 7902 | 1980-12-17 |  800.00 |    NULL |     20 |
|  7499 | ALLEN  | SALESMAN | 7698 | 1981-02-20 | 1600.00 |  300.00 |     30 |
|  7521 | WARD   | SALESMAN | 7698 | 1981-02-22 | 1250.00 |  500.00 |     30 |
|  7566 | JONES  | MANAGER  | 7839 | 1981-04-02 | 2975.00 |    NULL |     20 |
|  7654 | MARTIN | SALESMAN | 7698 | 1981-09-28 | 1250.00 | 1400.00 |     30 |
+-------+--------+----------+------+------------+---------+---------+--------+
5 rows in set (0.00 sec)

mysql> select * from emp order by desc limit 5;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'desc limit 5' at line 1
mysql> select * from emp order by desc limit 5;^C
mysql> select ename,sal from emp order by desc limit 5;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'desc limit 5' at line 1
mysql> select ename,sal from emp order by sal desc limit 5;
+-------+---------+
| ename | sal     |
+-------+---------+
| KING  | 5000.00 |
| SCOTT | 3000.00 |
| FORD  | 3000.00 |
| JONES | 2975.00 |
| BLAKE | 2850.00 |
+-------+---------+
5 rows in set (0.00 sec)

mysql> select * from emp limit 0,5;
+-------+--------+----------+------+------------+---------+---------+--------+
| EMPNO | ENAME  | JOB      | MGR  | HIREDATE   | SAL     | COMM    | DEPTNO |
+-------+--------+----------+------+------------+---------+---------+--------+
|  7369 | SMITH  | CLERK    | 7902 | 1980-12-17 |  800.00 |    NULL |     20 |
|  7499 | ALLEN  | SALESMAN | 7698 | 1981-02-20 | 1600.00 |  300.00 |     30 |
|  7521 | WARD   | SALESMAN | 7698 | 1981-02-22 | 1250.00 |  500.00 |     30 |
|  7566 | JONES  | MANAGER  | 7839 | 1981-04-02 | 2975.00 |    NULL |     20 |
|  7654 | MARTIN | SALESMAN | 7698 | 1981-09-28 | 1250.00 | 1400.00 |     30 |
+-------+--------+----------+------+------------+---------+---------+--------+
5 rows in set (0.00 sec)

mysql> select * from emp limit 5;
+-------+--------+----------+------+------------+---------+---------+--------+
| EMPNO | ENAME  | JOB      | MGR  | HIREDATE   | SAL     | COMM    | DEPTNO |
+-------+--------+----------+------+------------+---------+---------+--------+
|  7369 | SMITH  | CLERK    | 7902 | 1980-12-17 |  800.00 |    NULL |     20 |
|  7499 | ALLEN  | SALESMAN | 7698 | 1981-02-20 | 1600.00 |  300.00 |     30 |
|  7521 | WARD   | SALESMAN | 7698 | 1981-02-22 | 1250.00 |  500.00 |     30 |
|  7566 | JONES  | MANAGER  | 7839 | 1981-04-02 | 2975.00 |    NULL |     20 |
|  7654 | MARTIN | SALESMAN | 7698 | 1981-09-28 | 1250.00 | 1400.00 |     30 |
+-------+--------+----------+------+------------+---------+---------+--------+
5 rows in set (0.00 sec)

mysql> select ename,sal from emp order by sal desc limit 5;
+-------+---------+
| ename | sal     |
+-------+---------+
| KING  | 5000.00 |
| SCOTT | 3000.00 |
| FORD  | 3000.00 |
| JONES | 2975.00 |
| BLAKE | 2850.00 |
+-------+---------+
5 rows in set (0.00 sec)

mysql> show tables;
+---------------------+
| Tables_in_powernode |
+---------------------+
| dept                |
| emp                 |
| salgrade            |
| student             |
| t_customer          |
| t_order             |
| t_student           |
+---------------------+
7 rows in set (0.01 sec)

mysql> create table t_user(
    ->  no int
    ->  no int^C
mysql> create table t_user(
    ->  no int,
    ->  name varchar(20),
    -> gender char(1) default '男'
    -> );
Query OK, 0 rows affected (0.06 sec)

mysql> desc t_user;
+--------+-------------+------+-----+---------+-------+
| Field  | Type        | Null | Key | Default | Extra |
+--------+-------------+------+-----+---------+-------+
| no     | int         | YES  |     | NULL    |       |
| name   | varchar(20) | YES  |     | NULL    |       |
| gender | char(1)     | YES  |     | 男      |       |
+--------+-------------+------+-----+---------+-------+
3 rows in set (0.01 sec)

mysql> insert into t_user(no,name,gender) values(1,'jack','男');
Query OK, 1 row affected (0.01 sec)

mysql> desc t_user;
+--------+-------------+------+-----+---------+-------+
| Field  | Type        | Null | Key | Default | Extra |
+--------+-------------+------+-----+---------+-------+
| no     | int         | YES  |     | NULL    |       |
| name   | varchar(20) | YES  |     | NULL    |       |
| gender | char(1)     | YES  |     | 男      |       |
+--------+-------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> insert into t_user(no,name,gender) values(2,'lucy','女');
Query OK, 1 row affected (0.01 sec)

mysql> desc t_user;
+--------+-------------+------+-----+---------+-------+
| Field  | Type        | Null | Key | Default | Extra |
+--------+-------------+------+-----+---------+-------+
| no     | int         | YES  |     | NULL    |       |
| name   | varchar(20) | YES  |     | NULL    |       |
| gender | char(1)     | YES  |     | 男      |       |
+--------+-------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> select * frpm t_user;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'frpm t_user' at line 1
mysql> select * from t_user;
+------+------+--------+
| no   | name | gender |
+------+------+--------+
|    1 | jack | 男     |
|    2 | lucy | 女     |
+------+------+--------+
2 rows in set (0.00 sec)

mysql> insert into t_user(no,name) values(2,'wangwu');
Query OK, 1 row affected (0.01 sec)

mysql> select * from t_user;
+------+--------+--------+
| no   | name   | gender |
+------+--------+--------+
|    1 | jack   | 男     |
|    2 | lucy   | 女     |
|    2 | wangwu | 男     |
+------+--------+--------+
3 rows in set (0.00 sec)

mysql> insert into t_user(name) values('zhangsan');
Query OK, 1 row affected (0.01 sec)

mysql> select * from t_user;
+------+----------+--------+
| no   | name     | gender |
+------+----------+--------+
|    1 | jack     | 男     |
|    2 | lucy     | 女     |
|    2 | wangwu   | 男     |
| NULL | zhangsan | 男     |
+------+----------+--------+
4 rows in set (0.00 sec)

mysql> insert into t_user(no) values(4);
Query OK, 1 row affected (0.00 sec)

mysql> select * from t_user;
+------+----------+--------+
| no   | name     | gender |
+------+----------+--------+
|    1 | jack     | 男     |
|    2 | lucy     | 女     |
|    2 | wangwu   | 男     |
| NULL | zhangsan | 男     |
|    4 | NULL     | 男     |
+------+----------+--------+
5 rows in set (0.00 sec)

mysql> drop table t_user;
Query OK, 0 rows affected (0.03 sec)

mysql> show tables;
+---------------------+
| Tables_in_powernode |
+---------------------+
| dept                |
| emp                 |
| salgrade            |
| student             |
| t_customer          |
| t_order             |
| t_student           |
+---------------------+
7 rows in set (0.00 sec)

mysql> create table t_user(
    ->   no int,
    ->   name varchar(20),
    ->   gender char(1) default '男'
    -> );
Query OK, 0 rows affected (0.04 sec)

mysql> show tables;
+---------------------+
| Tables_in_powernode |
+---------------------+
| dept                |
| emp                 |
| salgrade            |
| student             |
| t_customer          |
| t_order             |
| t_student           |
| t_user              |
+---------------------+
8 rows in set (0.00 sec)

mysql> drop table if exists t_user;
Query OK, 0 rows affected (0.02 sec)

mysql> show tables;
+---------------------+
| Tables_in_powernode |
+---------------------+
| dept                |
| emp                 |
| salgrade            |
| student             |
| t_customer          |
| t_order             |
| t_student           |
+---------------------+
7 rows in set (0.00 sec)

mysql>  create table t_student(
    ->   no bigint,
    ->   name varchar(32),
    ->   age int comment '年龄'
    -> );
ERROR 1050 (42S01): Table 't_student' already exists
mysql> select * from t_student;
+----------+------------+
| name     | birth      |
+----------+------------+
| zhangsan | 1985-10-01 |
| zhangsan | 1985-10-01 |
| zhangsan | 1985-10-01 |
| zhangsan | 1985-10-01 |
| zhangsan | 1985-10-01 |
+----------+------------+
5 rows in set (0.01 sec)

mysql> create table t_user(
    ->   no bigint,
    ->   name varchar(32),
    ->   age int comment '年龄'
    -> );
Query OK, 0 rows affected (0.04 sec)

mysql> select * from t_user;
Empty set (0.00 sec)

mysql> desc t_user;
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| no    | bigint      | YES  |     | NULL    |       |
| name  | varchar(32) | YES  |     | NULL    |       |
| age   | int         | YES  |     | NULL    |       |
+-------+-------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> show create table t_user;
+--------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Table  | Create Table                                                                                                                                                                                      |
+--------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| t_user | CREATE TABLE `t_user` (
  `no` bigint DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `age` int DEFAULT NULL COMMENT '年龄'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci |
+--------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
1 row in set (0.00 sec)

mysql> show create table t_user;
+--------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Table  | Create Table                                                                                                                                                                                      |
+--------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| t_user | CREATE TABLE `t_user` (
  `no` bigint DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `age` int DEFAULT NULL COMMENT '年龄'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci |
+--------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
1 row in set (0.00 sec)

mysql> show tables;
+---------------------+
| Tables_in_powernode |
+---------------------+
| dept                |
| emp                 |
| salgrade            |
| student             |
| t_customer          |
| t_order             |
| t_student           |
| t_user              |
+---------------------+
8 rows in set (0.01 sec)

mysql> alter table t_student rename t_student1;
Query OK, 0 rows affected (0.03 sec)

mysql> show tables;
+---------------------+
| Tables_in_powernode |
+---------------------+
| dept                |
| emp                 |
| salgrade            |
| student             |
| t_customer          |
| t_order             |
| t_student1          |
| t_user              |
+---------------------+
8 rows in set (0.00 sec)

mysql> desc t_student1;
+-------+--------------+------+-----+---------+-------+
| Field | Type         | Null | Key | Default | Extra |
+-------+--------------+------+-----+---------+-------+
| name  | varchar(255) | YES  |     | NULL    |       |
| birth | date         | YES  |     | NULL    |       |
+-------+--------------+------+-----+---------+-------+
2 rows in set (0.01 sec)

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

mysql> updata emp set ename = '史密斯', job = '办事员' where empno = 7369;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'updata emp set ename = '史密斯', job = '办事员' where empno = 7369' at line 1
mysql> updata emp set ename='史密斯', job ='办事员' where empno=7369;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'updata emp set ename='史密斯', job ='办事员' where empno=7369' at line 1
mysql> update emp set ename='史密斯', job ='办事员' where empno=7369;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from emp;
+-------+--------+-----------+------+------------+---------+---------+--------+
| EMPNO | ENAME  | JOB       | MGR  | HIREDATE   | SAL     | COMM    | DEPTNO |
+-------+--------+-----------+------+------------+---------+---------+--------+
|  7369 | 史密斯 | 办事员    | 7902 | 1980-12-17 |  800.00 |    NULL |     20 |
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

mysql> delete from t_user;
Query OK, 0 rows affected (0.00 sec)

mysql> show tables;
+---------------------+
| Tables_in_powernode |
+---------------------+
| dept                |
| emp                 |
| salgrade            |
| student             |
| t_customer          |
| t_order             |
| t_student1          |
| t_user              |
+---------------------+
8 rows in set (0.00 sec)

mysql> select * from t_user;
Empty set (0.00 sec)

mysql> select * from t_student;
ERROR 1146 (42S02): Table 'powernode.t_student' doesn't exist
mysql> select * from t_student1;
+----------+------------+
| name     | birth      |
+----------+------------+
| zhangsan | 1985-10-01 |
| zhangsan | 1985-10-01 |
| zhangsan | 1985-10-01 |
| zhangsan | 1985-10-01 |
| zhangsan | 1985-10-01 |
+----------+------------+
5 rows in set (0.00 sec)

mysql> truncate table t_studebt;
ERROR 1146 (42S02): Table 'powernode.t_studebt' doesn't exist
mysql> truncate table t_studebt1;
ERROR 1146 (42S02): Table 'powernode.t_studebt1' doesn't exist
mysql> create table t_stu(
    ->   no int,
    ->   name varchar(32) not null,
    ->   age int
    -> );
Query OK, 0 rows affected (0.05 sec)

mysql> insert into t_stu(no,name,age) values(1,'zhangsan',20);
Query OK, 1 row affected (0.01 sec)

mysql> select * from t_stu;
+------+----------+------+
| no   | name     | age  |
+------+----------+------+
|    1 | zhangsan |   20 |
+------+----------+------+
1 row in set (0.00 sec)

mysql> insert into t_stu(no,age) values(1,20);
ERROR 1364 (HY000): Field 'name' doesn't have a default value
mysql> create table t_stu(
    ->   no int,
    ->   name varchar(32),
    ->   age int,
    ->   check(age > 18)
    -> );
ERROR 1050 (42S01): Table 't_stu' already exists
mysql> desc t_stu;
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| no    | int         | YES  |     | NULL    |       |
| name  | varchar(32) | NO   |     | NULL    |       |
| age   | int         | YES  |     | NULL    |       |
+-------+-------------+------+-----+---------+-------+
3 rows in set (0.01 sec)

mysql> delete from t_stu;
Query OK, 1 row affected (0.01 sec)

mysql> desc t_stu;
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| no    | int         | YES  |     | NULL    |       |
| name  | varchar(32) | NO   |     | NULL    |       |
| age   | int         | YES  |     | NULL    |       |
+-------+-------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> delete table t_stu;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'table t_stu' at line 1
mysql> drop table t_stu;
Query OK, 0 rows affected (0.02 sec)

mysql> show tables;
+---------------------+
| Tables_in_powernode |
+---------------------+
| dept                |
| emp                 |
| salgrade            |
| student             |
| t_customer          |
| t_order             |
| t_student1          |
| t_user              |
+---------------------+
8 rows in set (0.00 sec)

mysql> create table t_stu(
    ->   no int,
    ->   name varchar(32),
    ->   age int,
    ->   check(age > 18)
    -> );
Query OK, 0 rows affected (0.04 sec)

mysql> desc t_stu;
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| no    | int         | YES  |     | NULL    |       |
| name  | varchar(32) | YES  |     | NULL    |       |
| age   | int         | YES  |     | NULL    |       |
+-------+-------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> insert into t_stu(no,name,age) values(1,'jack',20);
Query OK, 1 row affected (0.01 sec)

mysql> insert into t_stu(no,name,age) values(2,'tom',18);
ERROR 3819 (HY000): Check constraint 't_stu_chk_1' is violated.
mysql> show * from t_stu;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '* from t_stu' at line 1
mysql> select * from t_stu;
+------+------+------+
| no   | name | age  |
+------+------+------+
|    1 | jack |   20 |
+------+------+------+
1 row in set (0.00 sec)

mysql> insert into t_stu(no,name,age) values(2,'tom',19);
Query OK, 1 row affected (0.01 sec)

mysql> select * from t_stu;
+------+------+------+
| no   | name | age  |
+------+------+------+
|    1 | jack |   20 |
|    2 | tom  |   19 |
+------+------+------+
2 rows in set (0.00 sec)

mysql> drop table t_user;
Query OK, 0 rows affected (0.03 sec)

mysql> show tables;
+---------------------+
| Tables_in_powernode |
+---------------------+
| dept                |
| emp                 |
| salgrade            |
| student             |
| t_customer          |
| t_order             |
| t_stu               |
| t_student1          |
+---------------------+
8 rows in set (0.00 sec)

mysql> create table t_stu(
    ->   no int,
    ->   name varchar(32),
    ->   email varchar(255) unique # 唯一性约束
    -> );
ERROR 1050 (42S01): Table 't_stu' already exists
mysql> create table t_user(
    ->   no int,
    ->   name varchar(32),
    ->   email varchar(255) unique # 唯一性约束
    -> );
Query OK, 0 rows affected (0.04 sec)

mysql> insert into t_user(id,name,email) values(1,'jack','jack@123.com');
ERROR 1054 (42S22): Unknown column 'id' in 'field list'
mysql> drop table t_user;
Query OK, 0 rows affected (0.02 sec)

mysql> show tables;
+---------------------+
| Tables_in_powernode |
+---------------------+
| dept                |
| emp                 |
| salgrade            |
| student             |
| t_customer          |
| t_order             |
| t_stu               |
| t_student1          |
+---------------------+
8 rows in set (0.00 sec)

mysql> create table t_user(
    ->   id int,
    ->   name varchar(32),
    ->   email varchar(255) unique # 唯一性约束
    -> );
Query OK, 0 rows affected (0.05 sec)

mysql> show tables;
+---------------------+
| Tables_in_powernode |
+---------------------+
| dept                |
| emp                 |
| salgrade            |
| student             |
| t_customer          |
| t_order             |
| t_stu               |
| t_student1          |
| t_user              |
+---------------------+
9 rows in set (0.00 sec)

mysql> insert into t_user(id,name,email) values(1,'jack','jack@123.com');
Query OK, 1 row affected (0.01 sec)

mysql> insert into t_user(id,name,email) values(2,'lucy','lucy@123.com');
Query OK, 1 row affected (0.01 sec)

mysql> insert into t_user(id,name,email) values(3,'tom','lucy@123.com');
ERROR 1062 (23000): Duplicate entry 'lucy@123.com' for key 't_user.email'
mysql> select * from t_user;
+------+------+--------------+
| id   | name | email        |
+------+------+--------------+
|    1 | jack | jack@123.com |
|    2 | lucy | lucy@123.com |
+------+------+--------------+
2 rows in set (0.00 sec)

mysql> insert into t_user(id,name,email) values(2,'lucy','lucy@124.com');
Query OK, 1 row affected (0.01 sec)

mysql> select * from t_user;
+------+------+--------------+
| id   | name | email        |
+------+------+--------------+
|    1 | jack | jack@123.com |
|    2 | lucy | lucy@123.com |
|    2 | lucy | lucy@124.com |
+------+------+--------------+
3 rows in set (0.00 sec)

mysql> insert into t_user(id,name) values(10,'zhangsan');
Query OK, 1 row affected (0.01 sec)

mysql> insert into t_user(id,name) values(10,'zhangsan');
Query OK, 1 row affected (0.01 sec)

mysql> insert into t_user(id,name) values(10,'zhangsan');
Query OK, 1 row affected (0.01 sec)

mysql> insert into t_user(id,name) values(10,'zhangsan');
Query OK, 1 row affected (0.01 sec)

mysql> insert into t_user(id,name) values(10,'zhangsan');
Query OK, 1 row affected (0.01 sec)

mysql> select * from t_user;
+------+----------+--------------+
| id   | name     | email        |
+------+----------+--------------+
|    1 | jack     | jack@123.com |
|    2 | lucy     | lucy@123.com |
|    2 | lucy     | lucy@124.com |
|   10 | zhangsan | NULL         |
|   10 | zhangsan | NULL         |
|   10 | zhangsan | NULL         |
|   10 | zhangsan | NULL         |
|   10 | zhangsan | NULL         |
+------+----------+--------------+
8 rows in set (0.00 sec)

mysql> drop table t_user;
Query OK, 0 rows affected (0.02 sec)

mysql> create table t_user(
    ->   id int,
    ->   name varchar(32),
    ->   email varchar(255) unique not null
    -> );
Query OK, 0 rows affected (0.03 sec)

mysql> desc t_user;
+-------+--------------+------+-----+---------+-------+
| Field | Type         | Null | Key | Default | Extra |
+-------+--------------+------+-----+---------+-------+
| id    | int          | YES  |     | NULL    |       |
| name  | varchar(32)  | YES  |     | NULL    |       |
| email | varchar(255) | NO   | PRI | NULL    |       |
+-------+--------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> insert into t_user(id,name,email) values(1,'jack','jack@123.com');
Query OK, 1 row affected (0.01 sec)

mysql> select * from t_user;
+------+------+--------------+
| id   | name | email        |
+------+------+--------------+
|    1 | jack | jack@123.com |
+------+------+--------------+
1 row in set (0.00 sec)

mysql> insert into t_user(id,name,email) values(1,'jack','jack@123.com');
ERROR 1062 (23000): Duplicate entry 'jack@123.com' for key 't_user.email'
mysql> insert into t_user(id,name,email) values(2,'tom','jack@123.com');
ERROR 1062 (23000): Duplicate entry 'jack@123.com' for key 't_user.email'
mysql> insert into t_user(id,name) values(2,'tom');
ERROR 1364 (HY000): Field 'email' doesn't have a default value
mysql> insert into t_user(id,name,email) values(3,'tom','jack@124.com');
Query OK, 1 row affected (0.01 sec)

mysql> select * from t_user;
+------+------+--------------+
| id   | name | email        |
+------+------+--------------+
|    1 | jack | jack@123.com |
|    3 | tom  | jack@124.com |
+------+------+--------------+
2 rows in set (0.00 sec)

mysql> drop table t_user;
Query OK, 0 rows affected (0.03 sec)

mysql> create table t_user(
    ->   id int,
    ->   name varchar(32),
    ->   unique(name)
    -> );
Query OK, 0 rows affected (0.07 sec)

mysql> desc t_user;
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| id    | int         | YES  |     | NULL    |       |
| name  | varchar(32) | YES  | UNI | NULL    |       |
+-------+-------------+------+-----+---------+-------+
2 rows in set (0.00 sec)

mysql> insert into t_user(id,name) values('jack');
ERROR 1136 (21S01): Column count doesn't match value count at row 1
mysql> insert into t_user(name) values('jack');
Query OK, 1 row affected (0.01 sec)

mysql> select * from t_user;
+------+------+
| id   | name |
+------+------+
| NULL | jack |
+------+------+
1 row in set (0.00 sec)

mysql> insert into t_user(name) values('jack');
ERROR 1062 (23000): Duplicate entry 'jack' for key 't_user.name'
mysql> drop table t_user;
Query OK, 0 rows affected (0.03 sec)

mysql> create table t_stu(
    ->   no int,
    ->   name varchar(32),
    ->   email varchar(255),
    ->   unique(name,email)
    -> );
ERROR 1050 (42S01): Table 't_stu' already exists
mysql> create table t_user(
    ->   no int,
    ->   name varchar(32),
    ->   email varchar(255),
    ->   unique(name,email)
    -> );
Query OK, 0 rows affected (0.07 sec)

mysql> desc t_user;
+-------+--------------+------+-----+---------+-------+
| Field | Type         | Null | Key | Default | Extra |
+-------+--------------+------+-----+---------+-------+
| no    | int          | YES  |     | NULL    |       |
| name  | varchar(32)  | YES  | MUL | NULL    |       |
| email | varchar(255) | YES  |     | NULL    |       |
+-------+--------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> insert into t_user(id,name,email) values(1,'jack','abc@123.com');
ERROR 1054 (42S22): Unknown column 'id' in 'field list'
mysql> drop table t_user;
Query OK, 0 rows affected (0.03 sec)

mysql> create table t_user(
    ->   id int,
    ->   name varchar(32),
    ->   email varchar(255),
    ->   unique(name,email)
    -> );
Query OK, 0 rows affected (0.04 sec)

mysql> desc t_user;
+-------+--------------+------+-----+---------+-------+
| Field | Type         | Null | Key | Default | Extra |
+-------+--------------+------+-----+---------+-------+
| id    | int          | YES  |     | NULL    |       |
| name  | varchar(32)  | YES  | MUL | NULL    |       |
| email | varchar(255) | YES  |     | NULL    |       |
+-------+--------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> insert into t_user(id,name,email) values(1,'jack','abc@123.com');
Query OK, 1 row affected (0.01 sec)

mysql> insert into t_user(id,name,email) values(2,'jack','xyz@123.com');
Query OK, 1 row affected (0.01 sec)

mysql> select * from t
    -> ^C
mysql> select * from t_user;
+------+------+-------------+
| id   | name | email       |
+------+------+-------------+
|    1 | jack | abc@123.com |
|    2 | jack | xyz@123.com |
+------+------+-------------+
2 rows in set (0.00 sec)

mysql> insert into t_user(id,name,email) values(3,'jack','xyz@123.com');
ERROR 1062 (23000): Duplicate entry 'jack-xyz@123.com' for key 't_user.name'
mysql> create table t_user(
    ->   id int,
    ->   name varchar(255),
    ->   email varchar(255),
    ->   constraint t_stu_name_email_unique unique(name,email)
    -> );
ERROR 1050 (42S01): Table 't_user' already exists
mysql> drop table t_user;
Query OK, 0 rows affected (0.03 sec)

mysql> create table t_user(
    ->   id int,
    ->   name varchar(255),
    ->   email varchar(255),
    ->   constraint t_stu_name_email_unique unique(name,email)
    -> );
Query OK, 0 rows affected (0.04 sec)

mysql> show databses;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'databses' at line 1
mysql> show databses;;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'databses' at line 1
ERROR:
No query specified

mysql> show databses;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'databses' at line 1
mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| powernode          |
| studentsdb         |
| sys                |
+--------------------+
6 rows in set (0.00 sec)

mysql> use information_schema;
Database changed
mysql> show tables like '%constraint%';
+---------------------------------------------+
| Tables_in_information_schema (%CONSTRAINT%) |
+---------------------------------------------+
| CHECK_CONSTRAINTS                           |
| REFERENTIAL_CONSTRAINTS                     |
| TABLE_CONSTRAINTS                           |
| TABLE_CONSTRAINTS_EXTENSIONS                |
+---------------------------------------------+
4 rows in set (0.01 sec)

mysql> desc table_constraints;
+--------------------+-------------+------+-----+---------+-------+
| Field              | Type        | Null | Key | Default | Extra |
+--------------------+-------------+------+-----+---------+-------+
| CONSTRAINT_CATALOG | varchar(64) | YES  |     | NULL    |       |
| CONSTRAINT_SCHEMA  | varchar(64) | YES  |     | NULL    |       |
| CONSTRAINT_NAME    | varchar(64) | YES  |     | NULL    |       |
| TABLE_SCHEMA       | varchar(64) | YES  |     | NULL    |       |
| TABLE_NAME         | varchar(64) | YES  |     | NULL    |       |
| CONSTRAINT_TYPE    | varchar(11) | NO   |     |         |       |
| ENFORCED           | varchar(3)  | NO   |     |         |       |
+--------------------+-------------+------+-----+---------+-------+
7 rows in set (0.00 sec)

mysql> select constraint_name from table_constraints where table_name='t_user';
+-------------------------+
| CONSTRAINT_NAME         |
+-------------------------+
| t_stu_name_email_unique |
+-------------------------+
1 row in set (0.01 sec)

mysql> drop table t_user;
ERROR 1044 (42000): Access denied for user 'root'@'localhost' to database 'information_schema'
mysql> show tables;
+---------------------------------------+
| Tables_in_information_schema          |
+---------------------------------------+
| ADMINISTRABLE_ROLE_AUTHORIZATIONS     |
| APPLICABLE_ROLES                      |
| CHARACTER_SETS                        |
| CHECK_CONSTRAINTS                     |
| COLLATION_CHARACTER_SET_APPLICABILITY |
| COLLATIONS                            |
| COLUMN_PRIVILEGES                     |
| COLUMN_STATISTICS                     |
| COLUMNS                               |
| COLUMNS_EXTENSIONS                    |
| ENABLED_ROLES                         |
| ENGINES                               |
| EVENTS                                |
| FILES                                 |
| INNODB_BUFFER_PAGE                    |
| INNODB_BUFFER_PAGE_LRU                |
| INNODB_BUFFER_POOL_STATS              |
| INNODB_CACHED_INDEXES                 |
| INNODB_CMP                            |
| INNODB_CMP_PER_INDEX                  |
| INNODB_CMP_PER_INDEX_RESET            |
| INNODB_CMP_RESET                      |
| INNODB_CMPMEM                         |
| INNODB_CMPMEM_RESET                   |
| INNODB_COLUMNS                        |
| INNODB_DATAFILES                      |
| INNODB_FIELDS                         |
| INNODB_FOREIGN                        |
| INNODB_FOREIGN_COLS                   |
| INNODB_FT_BEING_DELETED               |
| INNODB_FT_CONFIG                      |
| INNODB_FT_DEFAULT_STOPWORD            |
| INNODB_FT_DELETED                     |
| INNODB_FT_INDEX_CACHE                 |
| INNODB_FT_INDEX_TABLE                 |
| INNODB_INDEXES                        |
| INNODB_METRICS                        |
| INNODB_SESSION_TEMP_TABLESPACES       |
| INNODB_TABLES                         |
| INNODB_TABLESPACES                    |
| INNODB_TABLESPACES_BRIEF              |
| INNODB_TABLESTATS                     |
| INNODB_TEMP_TABLE_INFO                |
| INNODB_TRX                            |
| INNODB_VIRTUAL                        |
| KEY_COLUMN_USAGE                      |
| KEYWORDS                              |
| OPTIMIZER_TRACE                       |
| PARAMETERS                            |
| PARTITIONS                            |
| PLUGINS                               |
| PROCESSLIST                           |
| PROFILING                             |
| REFERENTIAL_CONSTRAINTS               |
| RESOURCE_GROUPS                       |
| ROLE_COLUMN_GRANTS                    |
| ROLE_ROUTINE_GRANTS                   |
| ROLE_TABLE_GRANTS                     |
| ROUTINES                              |
| SCHEMA_PRIVILEGES                     |
| SCHEMATA                              |
| SCHEMATA_EXTENSIONS                   |
| ST_GEOMETRY_COLUMNS                   |
| ST_SPATIAL_REFERENCE_SYSTEMS          |
| ST_UNITS_OF_MEASURE                   |
| STATISTICS                            |
| TABLE_CONSTRAINTS                     |
| TABLE_CONSTRAINTS_EXTENSIONS          |
| TABLE_PRIVILEGES                      |
| TABLES                                |
| TABLES_EXTENSIONS                     |
| TABLESPACES                           |
| TABLESPACES_EXTENSIONS                |
| TRIGGERS                              |
| USER_ATTRIBUTES                       |
| USER_PRIVILEGES                       |
| VIEW_ROUTINE_USAGE                    |
| VIEW_TABLE_USAGE                      |
| VIEWS                                 |
+---------------------------------------+
79 rows in set (0.01 sec)

mysql> use powernode;
Database changed
mysql> create table t_user(
    ->   id int,
    ->   name varchar(32),
    ->   email varchar(255),
    ->   unique(name,email)
    -> );
ERROR 1050 (42S01): Table 't_user' already exists
mysql> drop table t_user;
Query OK, 0 rows affected (0.02 sec)

mysql> create table t_user(
    ->   id int,
    ->   name varchar(32),
    ->   email varchar(255),
    ->   unique(name,email)
    -> );
Query OK, 0 rows affected (0.04 sec)

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| powernode          |
| studentsdb         |
| sys                |
+--------------------+
6 rows in set (0.00 sec)

mysql> use information_schema;
Database changed
mysql> select constraint_name from table_constraints where table_name='t_user';
+-----------------+
| CONSTRAINT_NAME |
+-----------------+
| name            |
+-----------------+
1 row in set (0.00 sec)