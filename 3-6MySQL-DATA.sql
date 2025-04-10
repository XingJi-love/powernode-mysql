C:\Users\LenovoHZB>mysql -uroot -p
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
5 rows in set (0.04 sec)

mysql> use powernode;
Database changed
mysql> select ename,sal from emp where sal > 3000;
+-------+---------+
| ename | sal     |
+-------+---------+
| KING  | 5000.00 |
+-------+---------+
1 row in set (0.01 sec)

mysql> select ename,sal from emp where sal >= 3000;
+-------+---------+
| ename | sal     |
+-------+---------+
| SCOTT | 3000.00 |
| KING  | 5000.00 |
| FORD  | 3000.00 |
+-------+---------+
3 rows in set (0.00 sec)

mysql> select ename,sal from emp where sal < 3000;
+--------+---------+
| ename  | sal     |
+--------+---------+
| SMITH  |  800.00 |
| ALLEN  | 1600.00 |
| WARD   | 1250.00 |
| JONES  | 2975.00 |
| MARTIN | 1250.00 |
| BLAKE  | 2850.00 |
| CLARK  | 2450.00 |
| TURNER | 1500.00 |
| ADAMS  | 1100.00 |
| JAMES  |  950.00 |
| MILLER | 1300.00 |
+--------+---------+
11 rows in set (0.00 sec)

mysql> select ename,sal from emp where sal <= 3000;
+--------+---------+
| ename  | sal     |
+--------+---------+
| SMITH  |  800.00 |
| ALLEN  | 1600.00 |
| WARD   | 1250.00 |
| JONES  | 2975.00 |
| MARTIN | 1250.00 |
| BLAKE  | 2850.00 |
| CLARK  | 2450.00 |
| SCOTT  | 3000.00 |
| TURNER | 1500.00 |
| ADAMS  | 1100.00 |
| JAMES  |  950.00 |
| FORD   | 3000.00 |
| MILLER | 1300.00 |
+--------+---------+
13 rows in set (0.00 sec)

mysql> select ename,sal from emp where sal >=3000 and sal <
=5000;
+-------+---------+
| ename | sal     |
+-------+---------+
| SCOTT | 3000.00 |
| KING  | 5000.00 |
| FORD  | 3000.00 |
+-------+---------+
3 rows in set (0.00 sec)

mysql> select ename,sal from emp where sal >=3000 && sal <=
5000;
+-------+---------+
| ename | sal     |
+-------+---------+
| SCOTT | 3000.00 |
| KING  | 5000.00 |
| FORD  | 3000.00 |
+-------+---------+
3 rows in set, 1 warning (0.00 sec)

mysql> select losal,hisal from salgrade where grade >= 2 an
d grade <= 4;
+-------+-------+
| losal | hisal |
+-------+-------+
|  1201 |  1400 |
|  1401 |  2000 |
|  2001 |  3000 |
+-------+-------+
3 rows in set (0.01 sec)

mysql> select ename,job from emp where job = 'MANAGER' or j
ob = 'SALESMAN';
+--------+----------+
| ename  | job      |
+--------+----------+
| ALLEN  | SALESMAN |
| WARD   | SALESMAN |
| JONES  | MANAGER  |
| MARTIN | SALESMAN |
| BLAKE  | MANAGER  |
| CLARK  | MANAGER  |
| TURNER | SALESMAN |
+--------+----------+
7 rows in set (0.00 sec)

mysql> select ename,job from emp where job = 'MANAGER' and job = 'SALESMAN';
Empty set (0.00 sec)

mysql> select * from emp where deptno = 20 or deptno = 30;
+-------+--------+----------+------+------------+---------+---------+--------+
| EMPNO | ENAME  | JOB      | MGR  | HIREDATE   | SAL     | COMM    | DEPTNO |
+-------+--------+----------+------+------------+---------+---------+--------+
|  7369 | SMITH  | CLERK    | 7902 | 1980-12-17 |  800.00 |    NULL |     20 |
|  7499 | ALLEN  | SALESMAN | 7698 | 1981-02-20 | 1600.00 |  300.00 |     30 |
|  7521 | WARD   | SALESMAN | 7698 | 1981-02-22 | 1250.00 |  500.00 |     30 |
|  7566 | JONES  | MANAGER  | 7839 | 1981-04-02 | 2975.00 |    NULL |     20 |
|  7654 | MARTIN | SALESMAN | 7698 | 1981-09-28 | 1250.00 | 1400.00 |     30 |
|  7698 | BLAKE  | MANAGER  | 7839 | 1981-05-01 | 2850.00 |    NULL |     30 |
|  7788 | SCOTT  | ANALYST  | 7566 | 1987-04-19 | 3000.00 |    NULL |     20 |
|  7844 | TURNER | SALESMAN | 7698 | 1981-09-08 | 1500.00 |    0.00 |     30 |
|  7876 | ADAMS  | CLERK    | 7788 | 1987-05-23 | 1100.00 |    NULL |     20 |
|  7900 | JAMES  | CLERK    | 7698 | 1981-12-03 |  950.00 |    NULL |     30 |
|  7902 | FORD   | ANALYST  | 7566 | 1981-12-03 | 3000.00 |
    NULL |     20 |
+-------+--------+----------+------+------------+---------+---------+--------+
11 rows in set (0.01 sec)

mysql> select * from emp where deptno = 20 or deptno = 30;
+-------+--------+----------+------+------------+---------+---------+--------+
| EMPNO | ENAME  | JOB      | MGR  | HIREDATE   | SAL     | COMM    | DEPTNO |
+-------+--------+----------+------+------------+---------+---------+--------+
|  7369 | SMITH  | CLERK    | 7902 | 1980-12-17 |  800.00 |    NULL |     20 |
|  7499 | ALLEN  | SALESMAN | 7698 | 1981-02-20 | 1600.00 |  300.00 |     30 |
|  7521 | WARD   | SALESMAN | 7698 | 1981-02-22 | 1250.00 |  500.00 |     30 |
|  7566 | JONES  | MANAGER  | 7839 | 1981-04-02 | 2975.00 |    NULL |     20 |
|  7654 | MARTIN | SALESMAN | 7698 | 1981-09-28 | 1250.00 | 1400.00 |     30 |
|  7698 | BLAKE  | MANAGER  | 7839 | 1981-05-01 | 2850.00 |    NULL |     30 |
|  7788 | SCOTT  | ANALYST  | 7566 | 1987-04-19 | 3000.00 |    NULL |     20 |
|  7844 | TURNER | SALESMAN | 7698 | 1981-09-08 | 1500.00 |    0.00 |     30 |
|  7876 | ADAMS  | CLERK    | 7788 | 1987-05-23 | 1100.00 |    NULL |     20 |
|  7900 | JAMES  | CLERK    | 7698 | 1981-12-03 |  950.00 |    NULL |     30 |
|  7902 | FORD   | ANALYST  | 7566 | 1981-12-03 | 3000.00 |    NULL |     20 |
+-------+--------+----------+------+------------+---------+---------+--------+
11 rows in set (0.00 sec)

mysql> select ename,sal,deptno from emp where sal < 1500 and deptno = 20 or deptno = 30;
+--------+---------+--------+
| ename  | sal     | deptno |
+--------+---------+--------+
| SMITH  |  800.00 |     20 |
| ALLEN  | 1600.00 |     30 |
| WARD   | 1250.00 |     30 |
| MARTIN | 1250.00 |     30 |
| BLAKE  | 2850.00 |     30 |
| TURNER | 1500.00 |     30 |
| ADAMS  | 1100.00 |     20 |
| JAMES  |  950.00 |     30 |
+--------+---------+--------+
8 rows in set (0.00 sec)

mysql> select ename,sal,deptno from emp where sal < 1500 and (deptno = 20 or deptno = 30);
+--------+---------+--------+
| ename  | sal     | deptno |
+--------+---------+--------+
| SMITH  |  800.00 |     20 |
| WARD   | 1250.00 |     30 |
| MARTIN | 1250.00 |     30 |
| ADAMS  | 1100.00 |     20 |
| JAMES  |  950.00 |     30 |
+--------+---------+--------+
5 rows in set (0.00 sec)

mysql> select ename,sal,job from emp where sal < 1500 and (job = 'CLERK' or job = 'SALESMAN');
+--------+---------+----------+
| ename  | sal     | job      |
+--------+---------+----------+
| SMITH  |  800.00 | CLERK    |
| WARD   | 1250.00 | SALESMAN |
| MARTIN | 1250.00 | SALESMAN |
| ADAMS  | 1100.00 | CLERK    |
| JAMES  |  950.00 | CLERK    |
| MILLER | 1300.00 | CLERK    |
+--------+---------+----------+
6 rows in set (0.00 sec)

mysql> select ename,sal from emp where sal between 1600 and 3000;
+-------+---------+
| ename | sal     |
+-------+---------+
| ALLEN | 1600.00 |
| JONES | 2975.00 |
| BLAKE | 2850.00 |
| CLARK | 2450.00 |
| SCOTT | 3000.00 |
| FORD  | 3000.00 |
+-------+---------+
6 rows in set (0.00 sec)

mysql> select ename,sal from emp where sal between 3000 and 1600;
Empty set (0.00 sec)

mysql> select * from emp where hiredate between '1982-01-23' and '1987-04-19';
+-------+--------+---------+------+------------+---------+------+--------+
| EMPNO | ENAME  | JOB     | MGR  | HIREDATE   | SAL     | COMM | DEPTNO |
+-------+--------+---------+------+------------+---------+------+--------+
|  7788 | SCOTT  | ANALYST | 7566 | 1987-04-19 | 3000.00 | NULL |     20 |
|  7934 | MILLER | CLERK   | 7782 | 1982-01-23 | 1300.00 | NULL |     10 |
+-------+--------+---------+------+------------+---------+------+--------+
2 rows in set (0.00 sec)

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

mysql> select * from emp where hiredate between '1982-01-23' and '1987-04-19';
+-------+--------+---------+------+------------+---------+------+--------+
| EMPNO | ENAME  | JOB     | MGR  | HIREDATE   | SAL     | COMM | DEPTNO |
+-------+--------+---------+------+------------+---------+------+--------+
|  7788 | SCOTT  | ANALYST | 7566 | 1987-04-19 | 3000.00 | NULL |     20 |
|  7934 | MILLER | CLERK   | 7782 | 1982-01-23 | 1300.00 | NULL |     10 |
+-------+--------+---------+------+------------+---------+------+--------+
2 rows in set (0.00 sec)

mysql>
mysql> select ename,sal,comm from emp where comm is null;
+--------+---------+------+
| ename  | sal     | comm |
+--------+---------+------+
| SMITH  |  800.00 | NULL |
| JONES  | 2975.00 | NULL |
| BLAKE  | 2850.00 | NULL |
| CLARK  | 2450.00 | NULL |
| SCOTT  | 3000.00 | NULL |
| KING   | 5000.00 | NULL |
| ADAMS  | 1100.00 | NULL |
| JAMES  |  950.00 | NULL |
| FORD   | 3000.00 | NULL |
| MILLER | 1300.00 | NULL |
+--------+---------+------+
10 rows in set (0.01 sec)

mysql> select ename,sal,comm from emp where comm = null;
Empty set (0.00 sec)

mysql> select ename,sal,comm from emp where comm is not null;
+--------+---------+---------+
| ename  | sal     | comm    |
+--------+---------+---------+
| ALLEN  | 1600.00 |  300.00 |
| WARD   | 1250.00 |  500.00 |
| MARTIN | 1250.00 | 1400.00 |
| TURNER | 1500.00 |    0.00 |
+--------+---------+---------+
4 rows in set (0.01 sec)

mysql> select ename,sal,job from emp where job =  'MANAGER' or job = 'SALESMAN';
+--------+---------+----------+
| ename  | sal     | job      |
+--------+---------+----------+
| ALLEN  | 1600.00 | SALESMAN |
| WARD   | 1250.00 | SALESMAN |
| JONES  | 2975.00 | MANAGER  |
| MARTIN | 1250.00 | SALESMAN |
| BLAKE  | 2850.00 | MANAGER  |
| CLARK  | 2450.00 | MANAGER  |
| TURNER | 1500.00 | SALESMAN |
+--------+---------+----------+
7 rows in set (0.00 sec)

mysql> select ename,sal,job from emp where job in('MANAGER', 'SALESMAN');
+--------+---------+----------+
| ename  | sal     | job      |
+--------+---------+----------+
| ALLEN  | 1600.00 | SALESMAN |
| WARD   | 1250.00 | SALESMAN |
| JONES  | 2975.00 | MANAGER  |
| MARTIN | 1250.00 | SALESMAN |
| BLAKE  | 2850.00 | MANAGER  |
| CLARK  | 2450.00 | MANAGER  |
| TURNER | 1500.00 | SALESMAN |
+--------+---------+----------+
7 rows in set (0.00 sec)

mysql> select ename,job from emp where sal in(1500, 1600, 3000);
+--------+----------+
| ename  | job      |
+--------+----------+
| ALLEN  | SALESMAN |
| SCOTT  | ANALYST  |
| TURNER | SALESMAN |
| FORD   | ANALYST  |
+--------+----------+
4 rows in set (0.00 sec)

mysql> select empno,ename from emp where deptno = 10 or deptno = 20;
+-------+--------+
| empno | ename  |
+-------+--------+
|  7369 | SMITH  |
|  7566 | JONES  |
|  7782 | CLARK  |
|  7788 | SCOTT  |
|  7839 | KING   |
|  7876 | ADAMS  |
|  7902 | FORD   |
|  7934 | MILLER |
+-------+--------+
8 rows in set (0.00 sec)

mysql> select empno,ename from emp where deptno in(10, 20);
+-------+--------+
| empno | ename  |
+-------+--------+
|  7369 | SMITH  |
|  7566 | JONES  |
|  7782 | CLARK  |
|  7788 | SCOTT  |
|  7839 | KING   |
|  7876 | ADAMS  |
|  7902 | FORD   |
|  7934 | MILLER |
+-------+--------+
8 rows in set (0.00 sec)

mysql> select ename,job from emp where job <> 'MANAGER' and job <> 'SALESMAN';
+--------+-----------+
| ename  | job       |
+--------+-----------+
| SMITH  | CLERK     |
| SCOTT  | ANALYST   |
| KING   | PRESIDENT |
| ADAMS  | CLERK     |
| JAMES  | CLERK     |
| FORD   | ANALYST   |
| MILLER | CLERK     |
+--------+-----------+
7 rows in set (0.00 sec)

mysql> select ename,job from emp where job not in('MANAGER', 'SALESMAN');
+--------+-----------+
| ename  | job       |
+--------+-----------+
| SMITH  | CLERK     |
| SCOTT  | ANALYST   |
| KING   | PRESIDENT |
| ADAMS  | CLERK     |
| JAMES  | CLERK     |
| FORD   | ANALYST   |
| MILLER | CLERK     |
+--------+-----------+
7 rows in set (0.00 sec)

mysql> select ename,sal from emp where sal not in(1600, 3000);
+--------+---------+
| ename  | sal     |
+--------+---------+
| SMITH  |  800.00 |
| WARD   | 1250.00 |
| JONES  | 2975.00 |
| MARTIN | 1250.00 |
| BLAKE  | 2850.00 |
| CLARK  | 2450.00 |
| KING   | 5000.00 |
| TURNER | 1500.00 |
| ADAMS  | 1100.00 |
| JAMES  |  950.00 |
| MILLER | 1300.00 |
+--------+---------+
11 rows in set (0.00 sec)

mysql>











