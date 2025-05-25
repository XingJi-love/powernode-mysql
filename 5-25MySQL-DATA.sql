PowerShell 7.5.1
Loading personal and system profiles took 741ms.
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
6 rows in set (0.04 sec)

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
| t_customer          |
| t_order             |
| t_stu               |
| t_student1          |
| t_user              |
+---------------------+
9 rows in set (0.01 sec)

mysql> drop table t_user;
Query OK, 0 rows affected (0.03 sec)

mysql> create table t_user(
    ->   id int primary key,
    ->   name varchar(32)
    -> );\
Query OK, 0 rows affected (0.03 sec)

mysql> insert into t_user(id,name) values(1,'abc');
Query OK, 1 row affected (0.01 sec)

mysql> insert into t_user(id,name) values(2,'xyz');
Query OK, 1 row affected (0.01 sec)

mysql> select * from t_user;
+----+------+
| id | name |
+----+------+
|  1 | abc  |
|  2 | xyz  |
+----+------+
2 rows in set (0.00 sec)

mysql> insert into t_user(name) values('test');
ERROR 1364 (HY000): Field 'id' doesn't have a default value
mysql> insert into t_user(id,name) values(2,'test');
ERROR 1062 (23000): Duplicate entry '2' for key 't_user.PRIMARY'
mysql> insert into t_user(id,name) values(3,'test');
Query OK, 1 row affected (0.01 sec)

mysql> select * from t_user;
+----+------+
| id | name |
+----+------+
|  1 | abc  |
|  2 | xyz  |
|  3 | test |
+----+------+
3 rows in set (0.00 sec)

mysql> drop table t_user;
Query OK, 0 rows affected (0.02 sec)

mysql> create table t_user(
    ->   id int,
    ->   name varchar(32),
    ->   primary key(id)
    -> );
Query OK, 0 rows affected (0.03 sec)

mysql> insert into t_user(id,name) values(3,'test');
Query OK, 1 row affected (0.01 sec)

mysql> select * from t_user;
+----+------+
| id | name |
+----+------+
|  3 | test |
+----+------+
1 row in set (0.00 sec)

mysql> insert into t_user(id,name) values(3,'test');
ERROR 1062 (23000): Duplicate entry '3' for key 't_user.PRIMARY'
mysql> drop table t_user;
Query OK, 0 rows affected (0.02 sec)

mysql> create table t_user(
    ->   id int,
    ->   name varchar(32),
    ->   email varchar(255),
    ->   primary ley(id,name)
    -> );
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'ley(id,name)
)' at line 5
mysql> create table t_user(
    ->   id int,
    ->   name varchar(32),
    ->   email varchar(255),
    ->   primary key(id,name)
    -> );
Query OK, 0 rows affected (0.03 sec)

mysql> insert into t_user(
    -> ^C
mysql> insert into t_user(id,name,email) values(1,'zhangsan','abc@123.com');
Query OK, 1 row affected (0.01 sec)
       insert into t_user(id,name,email) values(2,'zhangsan','abc@123.com');
Query OK, 1 row affected (0.01 sec)

mysql> insert into t_user(id,name,email) values(2,'lisi','abc@123.com');
Query OK, 1 row affected (0.01 sec)

mysql> select * from t_user;
+----+----------+-------------+
| id | name     | email       |
+----+----------+-------------+
|  1 | zhangsan | abc@123.com |
|  2 | lisi     | abc@123.com |
|  2 | zhangsan | abc@123.com |
+----+----------+-------------+
3 rows in set (0.00 sec)

mysql> insert into t_user(id,name,email) values(2,'lisi','abc@123.com');
ERROR 1062 (23000): Duplicate entry '2-lisi' for key 't_user.PRIMARY'
mysql> create table t_vip(
    ->   id int primary key auto_increment,
    ->   name varchar(255)
    -> );
Query OK, 0 rows affected (0.03 sec)

mysql> insert into t_vip(name) values('zhangsan');
Query OK, 1 row affected (0.01 sec)

mysql> insert into t_vip(name) values('zhangsan');
Query OK, 1 row affected (0.01 sec)

mysql> insert into t_vip(name) values('zhangsan');
Query OK, 1 row affected (0.01 sec)

mysql> insert into t_vip(name) values('zhangsan');
Query OK, 1 row affected (0.01 sec)

mysql> insert into t_vip(name) values('zhangsan');
Query OK, 1 row affected (0.01 sec)

mysql> insert into t_vip(name) values('zhangsan');
Query OK, 1 row affected (0.01 sec)

mysql> select * from t_vip;
+----+----------+
| id | name     |
+----+----------+
|  1 | zhangsan |
|  2 | zhangsan |
|  3 | zhangsan |
|  4 | zhangsan |
|  5 | zhangsan |
|  6 | zhangsan |
+----+----------+
6 rows in set (0.00 sec)

mysql> create table t_school(
    ->   sno int primary key,
    ->   sname varchar(255)
    -> );
Query OK, 0 rows affected (0.03 sec)

mysql> insert into t_school(sno,sname) values(1,'北京二中');
Query OK, 1 row affected (0.01 sec)

mysql> insert into t_school(sno,sname) values(2,'南开大学附属中学');
Query OK, 1 row affected (0.01 sec)

mysql> select * from t_school;
+-----+------------------+
| sno | sname            |
+-----+------------------+
|   1 | 北京二中         |
|   2 | 南开大学附属中学 |
+-----+------------------+
2 rows in set (0.00 sec)

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
| t_school            |
| t_stu               |
| t_student1          |
| t_user              |
| t_vip               |
+---------------------+
11 rows in set (0.00 sec)

mysql> create table t_student(
    ->   id int primary key auto_increment,
    ->   name varchar(255),
    ->   age int,
    ->   school_no int,
    ->   constraint t_student_school_no_fk foreign key(school_no) references t_school(sno)
    -> );
Query OK, 0 rows affected (0.04 sec)

mysql> desc t_student;
+-----------+--------------+------+-----+---------+----------------+
| Field     | Type         | Null | Key | Default | Extra          |
+-----------+--------------+------+-----+---------+----------------+
| id        | int          | NO   | PRI | NULL    | auto_increment |
| name      | varchar(255) | YES  |     | NULL    |                |
| age       | int          | YES  |     | NULL    |                |
| school_no | int          | YES  | MUL | NULL    |                |
+-----------+--------------+------+-----+---------+----------------+
4 rows in set (0.01 sec)

mysql> insert into t_student(name,age,school_no) values('jack',20,1);
Query OK, 1 row affected (0.01 sec)

mysql> insert into t_student(name,age,school_no) values('lucy',21,1);
Query OK, 1 row affected (0.01 sec)

mysql> insert into t_student(name,age,school_no) values('zhangsan',22,2);
Query OK, 1 row affected (0.01 sec)

mysql> insert into t_student(name,age,school_no) values('wangwu',20,2);
Query OK, 1 row affected (0.01 sec)

mysql> select * from t_student;
+----+----------+------+-----------+
| id | name     | age  | school_no |
+----+----------+------+-----------+
|  1 | jack     |   20 |         1 |
|  2 | lucy     |   21 |         1 |
|  3 | zhangsan |   22 |         2 |
|  4 | wangwu   |   20 |         2 |
+----+----------+------+-----------+
4 rows in set (0.00 sec)

mysql> insert into t_student(name,age,school_no) values('wangwu',20,3);
ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`powernode`.`t_student`, CONSTRAINT `t_student_school_no_fk` FOREIGN KEY (`school_no`) REFERENCES `t_school` (`sno`))
mysql> select * from t_school;
+-----+------------------+
| sno | sname            |
+-----+------------------+
|   1 | 北京二中         |
|   2 | 南开大学附属中学 |
+-----+------------------+
2 rows in set (0.00 sec)

mysql> select * from t_student;
+----+----------+------+-----------+
| id | name     | age  | school_no |
+----+----------+------+-----------+
|  1 | jack     |   20 |         1 |
|  2 | lucy     |   21 |         1 |
|  3 | zhangsan |   22 |         2 |
|  4 | wangwu   |   20 |         2 |
+----+----------+------+-----------+
4 rows in set (0.00 sec)

mysql> alert table t_student drop constraint t_student_school_no_fk;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'alert table t_student drop constraint t_student_school_no_fk' at line 1
mysql> alert table t_student drop constraint t_student_school_no_fk;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'alert table t_student drop constraint t_student_school_no_fk' at line 1
mysql> alter table t_student drop constraint t_student_school_no_fk;
Query OK, 0 rows affected (0.02 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table t_student add constraint t_student_school_no_fk foreign key(school_no) references t_school(sno) on delete cascade;
Query OK, 4 rows affected (0.08 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> delete from t_school where sno=1;
Query OK, 1 row affected (0.01 sec)

mysql> select * from t_school;
+-----+------------------+
| sno | sname            |
+-----+------------------+
|   2 | 南开大学附属中学 |
+-----+------------------+
1 row in set (0.00 sec)

mysql> select * from t_student;
+----+----------+------+-----------+
| id | name     | age  | school_no |
+----+----------+------+-----------+
|  3 | zhangsan |   22 |         2 |
|  4 | wangwu   |   20 |         2 |
+----+----------+------+-----------+
2 rows in set (0.00 sec)

mysql> alter table t_student drop constraint t_student_school_no_fk;
Query OK, 0 rows affected (0.01 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table t_student add constraint t_student_school_no_fk foreign key(school_no) references t_school(sno) on update cascade;
Query OK, 2 rows affected (0.08 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> updata t_school set sno=333 where sname='南开大学附属中学';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'updata t_school set sno=333 where sname='南开大学附属中学'' at line 1
mysql> update t_school set sno=333 where sname='南开大学附属中学';
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from t_school;
+-----+------------------+
| sno | sname            |
+-----+------------------+
| 333 | 南开大学附属中学 |
+-----+------------------+
1 row in set (0.00 sec)

mysql> select * from t_student;
+----+----------+------+-----------+
| id | name     | age  | school_no |
+----+----------+------+-----------+
|  3 | zhangsan |   22 |       333 |
|  4 | wangwu   |   20 |       333 |
+----+----------+------+-----------+
2 rows in set (0.00 sec)

mysql> alter table t_student drop constraint t_student_school_no_fk;
Query OK, 0 rows affected (0.01 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table t_student add constraint t_student_school_no_fk foreign key(school_no) references t_school(sno) on delete set null;
Query OK, 2 rows affected (0.08 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> delete from t_school;
Query OK, 1 row affected (0.01 sec)

mysql> select * from t_school;
Empty set (0.00 sec)

mysql> select * from t_student;
+----+----------+------+-----------+
| id | name     | age  | school_no |
+----+----------+------+-----------+
|  3 | zhangsan |   22 |      NULL |
|  4 | wangwu   |   20 |      NULL |
+----+----------+------+-----------+
2 rows in set (0.00 sec)