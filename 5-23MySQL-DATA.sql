PowerShell 7.5.1
Loading personal and system profiles took 649ms.
 mysql -uroot -p
Enter password: ****
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 8
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

mysql> 第一步: 找出每个部门的平均工资 \c
mysql> select deptno,avg(sal) as avgsal from emp group by deptno;
+--------+-------------+
| deptno | avgsal      |
+--------+-------------+
|     20 | 2175.000000 |
|     30 | 1566.666667 |
|     10 | 2916.666667 |
+--------+-------------+
3 rows in set (0.01 sec)

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

mysql> 第二步：将以上查询结果当做临时表t，t表和salgrade表进行连接查询。条件：t.avgsal between s.losal and s.hisal \c
mysql> select t.*,s.grade from (select deptno, avg(sal) avgsal from emp group by deptno) t join salgrade s on t.avgsal between s.losal and s.hisal;
+--------+-------------+-------+
| deptno | avgsal      | grade |
+--------+-------------+-------+
|     20 | 2175.000000 |     4 |
|     30 | 1566.666667 |     3 |
|     10 | 2916.666667 |     4 |
+--------+-------------+-------+
3 rows in set (0.01 sec)

mysql> select e.ename,(select d.dname from dept d where e.deptno=d.deptno) as dname from emp e;
+--------+------------+
| ename  | dname      |
+--------+------------+
| SMITH  | RESEARCH   |
| ALLEN  | SALES      |
| WARD   | SALES      |
| JONES  | RESEARCH   |
| MARTIN | SALES      |
| BLAKE  | SALES      |
| CLARK  | ACCOUNTING |
| SCOTT  | RESEARCH   |
| KING   | ACCOUNTING |
| TURNER | SALES      |
| ADAMS  | RESEARCH   |
| JAMES  | SALES      |
| FORD   | RESEARCH   |
| MILLER | ACCOUNTING |
+--------+------------+
14 rows in set (0.01 sec)

mysql> drop table if exists t_customer;
Query OK, 0 rows affected, 1 warning (0.01 sec)

mysql> drop table if exists t_order;
Query OK, 0 rows affected, 1 warning (0.00 sec)

mysql>
mysql> create table t_customer(
    ->   customer_id int,
    ->   customer_name varchar(32)
    -> );
Query OK, 0 rows affected (0.03 sec)

mysql>
mysql> create table t_order(
    ->   order_id int,
    ->   order_price decimal(5,1),
    ->   customer_id int
    -> );
Query OK, 0 rows affected (0.03 sec)

mysql>
mysql> insert into t_customer(customer_id,customer_name) values(1,'zhangsan');
Query OK, 1 row affected (0.01 sec)

mysql> insert into t_customer(customer_id,customer_name) values(2,'lisi');
Query OK, 1 row affected (0.01 sec)

mysql> insert into t_customer(customer_id,customer_name) values(3,'wangwu');
Query OK, 1 row affected (0.01 sec)

mysql>
mysql> insert into t_order(order_id, order_price, customer_id) values(10, 1000.0, 1);
Query OK, 1 row affected (0.01 sec)

mysql> insert into t_order(order_id, order_price, customer_id) values(20, 2000.0, 1);
Query OK, 1 row affected (0.01 sec)

mysql> insert into t_order(order_id, order_price, customer_id) values(30, 3000.0, 2);
Query OK, 1 row affected (0.01 sec)

mysql> insert into t_order(order_id, order_price, customer_id) values(40, 4000.0, 2);
Query OK, 1 row affected (0.01 sec)

mysql>
mysql> commit;
Query OK, 0 rows affected (0.00 sec)

mysql> select * from t_customer;
+-------------+---------------+
| customer_id | customer_name |
+-------------+---------------+
|           1 | zhangsan      |
|           2 | lisi          |
|           3 | wangwu        |
+-------------+---------------+
3 rows in set (0.00 sec)

mysql> select * from t_order;
+----------+-------------+-------------+
| order_id | order_price | customer_id |
+----------+-------------+-------------+
|       10 |      1000.0 |           1 |
|       20 |      2000.0 |           1 |
|       30 |      3000.0 |           2 |
|       40 |      4000.0 |           2 |
+----------+-------------+-------------+
4 rows in set (0.00 sec)

mysql> select distinct customer_id from t_order;
+-------------+
| customer_id |
+-------------+
|           1 |
|           2 |
+-------------+
2 rows in set (0.00 sec)

mysql> select * from t_customer where customer_id in(select distinct customer_id from t_order);
+-------------+---------------+
| customer_id | customer_name |
+-------------+---------------+
|           1 | zhangsan      |
|           2 | lisi          |
+-------------+---------------+
2 rows in set (0.00 sec)

mysql> select * from t_customer;
+-------------+---------------+
| customer_id | customer_name |
+-------------+---------------+
|           1 | zhangsan      |
|           2 | lisi          |
|           3 | wangwu        |
+-------------+---------------+
3 rows in set (0.00 sec)

mysql> select * from t_order;
+----------+-------------+-------------+
| order_id | order_price | customer_id |
+----------+-------------+-------------+
|       10 |      1000.0 |           1 |
|       20 |      2000.0 |           1 |
|       30 |      3000.0 |           2 |
|       40 |      4000.0 |           2 |
+----------+-------------+-------------+
4 rows in set (0.00 sec)

mysql> select * from t_customer c where exists(select * from t_order o where o.customer_id=c.customer_id);
+-------------+---------------+
| customer_id | customer_name |
+-------------+---------------+
|           1 | zhangsan      |
|           2 | lisi          |
+-------------+---------------+
2 rows in set (0.00 sec)

mysql>
mysql> select * from t_customer c where not exists(select * from t_order o where o.customer_id=c.customer_id);
+-------------+---------------+
| customer_id | customer_name |
+-------------+---------------+
|           3 | wangwu        |
+-------------+---------------+
1 row in set (0.00 sec)