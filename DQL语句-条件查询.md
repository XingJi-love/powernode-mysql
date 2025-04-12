# MySQL | DQL语句-条件查询

![MySQL安装教程](./MySQL安装教程/MySQL.png)

---

通常在进行查询操作的时候，都是查询符合某些`条件的数据`，很少将表中所有数据都取出来。怎么取出表的部分数据？需要在查询语句中添加条件进行数据的过滤。常见的过滤条件如下：

| **条件**           | **说明**                           |
| ------------------ | ---------------------------------- |
| =                  | 等于                               |
| <>或!=             | 不等于                             |
| >=                 | 大于等于                           |
| <=                 | 小于等于                           |
| >                  | 大于                               |
| <                  | 小于                               |
| between...and...   | 等同于 >= and <=                   |
| is null            | 为空                               |
| is not null        | 不为空                             |
| <=>                | 安全等于（可读性差，很少使用了）。 |
| and 或 &&          | 并且                               |
| or 或 &#124;&#124; | 或者                               |
| in                 | 在指定的值当中                     |
| not in             | 不在指定的值当中                   |
| exists             |                                    |
| not exists         |                                    |
| like               | 模糊查询                           |

## 条件查询语法格式

---

```sql
select 
  ...
from
  ...
where
  过滤条件;
```

> **过滤条件放在`where子句`当中，以上语句的执行顺序是**：
    
> 第一步：先`执行from`

> 第二步：再通过`where条件过滤`

> 第三步：最后`执行select`，查询并将结果展示到控制台


## 等于、不等于

---

### 等于 =

判断`等量关系`，支持`多种数据类型`，比如：`数字、字符串、日期`等。

> 案例1：查询`月薪3000`的`员工编号及姓名`

```sql
select 
  empno,ename
from
  emp
where
  sal = 3000;

select empno,ename from emp where sal = 3000; -- 也可以写成一行
```

```sql
mysql> select empno,ename from emp where sal = 3000;
+-------+-------+
| empno | ename |
+-------+-------+
|  7788 | SCOTT |
|  7902 | FORD  |
+-------+-------+
2 rows in set (0.02 sec)

mysql> select empno,ename,sal from emp where sal = 3000;-- 判断是否查询成功
+-------+-------+---------+
| empno | ename | sal     |
+-------+-------+---------+
|  7788 | SCOTT | 3000.00 |
|  7902 | FORD  | 3000.00 |
+-------+-------+---------+
2 rows in set (0.00 sec)
```

> 案例2：查询员工`FORD的岗位及月薪`

```sql
select
	job, sal
from
	emp
where
	ename = 'FORD';

select job, sal from emp where ename = 'FORD';-- 也可以写成一行
```

```sql 
mysql> select job, sal from emp where ename = 'FORD';

+---------+---------+
| job     | sal     |
+---------+---------+
| ANALYST | 3000.00 |
+---------+---------+
1 row in set (0.01 sec)
```


> 存储在表emp中的员工姓名是`FORD`，`全部大写`，如果在查询的时候，**`写成全部小写会怎样呢`**？

```sql
select
	job, sal
from
	emp
where
	ename = 'ford';
```

```sql
mysql> select job, sal from emp where ename = 'ford';

+---------+---------+
| job     | sal     |
+---------+---------+
| ANALYST | 3000.00 |
+---------+---------+
1 row in set (0.00 sec)
```

> 通过测试发现，即使写成小写ford，也是可以查询到结果的，**不过这里需要注意的是：在`Oracle数据库`当中是`查询不到数据`的，`Oracle的语法要比MySQL`的`语法严谨`。对于SQL语句本身来说是不区分大小写的，但是对于表中真实存储的数据，大写A和小写a还是不一样的，这一点Oracle做的很好。MySQL的语法更随性。另外在`Oracle`当中，字符串是`必须使用单引号`括起来的，但在MySQL当中，字符串可以使用`单引号`，也可以使用`双引号`**，如下：

```sql
select
	job, sal
from
  emp
where
  ename = "FORD";
```

```sql
mysql> select job, sal from emp where ename = "FORD";

+---------+---------+
| job     | sal     |
+---------+---------+
| ANALYST | 3000.00 |
+---------+---------+
1 row in set (0.00 sec)
```

> 案例3：查询`岗位是MANAGER`的`员工编号及姓名`

```sql
select
  empno, ename
from
  emp
where
  job = 'MANAGER';
```

```sql
mysql> select empno,ename from emp where job = 'MANAGER';

+-------+-------+
| empno | ename |
+-------+-------+
|  7566 | JONES |
|  7698 | BLAKE |
|  7782 | CLARK |
+-------+-------+
3 rows in set (0.00 sec)
```

> `任务`：查询`工资级别`是`1的最低工资以及最高工资`

```sql
mysql> select losal,hisal from salgrade where grade = 1;

+-------+-------+
| losal | hisal |
+-------+-------+
|   700 |  1200 |
+-------+-------+
1 row in set (0.00 sec)
```

### 不等于 <> 或 !=

判断`非等量关系`，支持`字符串、数字、日期类型`等。不等号有两种写法，`第一种<>`，`第二种!=`，第二种写法和Java程序中的不等号相同，第一种写法比较诡异，不过也很好理解，比如`<>3`，表示`小于3、大于3，就是不等于3`。`你get到了吗？`

> 案例1：查询`工资不是3000`的`员工编号、姓名、薪资`

```sql
select
  empno,ename,sal
from
  emp
where
  sal <> 3000;

select empno,ename,sal from emp where sal <> 3000; -- 也可以写成一行
```

```sql 
mysql> select empno,ename,sal from emp where sal <> 3000;

+-------+--------+---------+
| empno | ename  | sal     |
+-------+--------+---------+
|  7369 | SMITH  |  800.00 |
|  7499 | ALLEN  | 1600.00 |
|  7521 | WARD   | 1250.00 |
|  7566 | JONES  | 2975.00 |
|  7654 | MARTIN | 1250.00 |
|  7698 | BLAKE  | 2850.00 |
|  7782 | CLARK  | 2450.00 |
|  7839 | KING   | 5000.00 |
|  7844 | TURNER | 1500.00 |
|  7876 | ADAMS  | 1100.00 |
|  7900 | JAMES  |  950.00 |
|  7934 | MILLER | 1300.00 |
+-------+--------+---------+
12 rows in set (0.00 sec)
```

> 案例2：查询`工作岗位不是MANAGER`的`员工姓名和岗位`

```sql
select
  ename,job
from
	emp
where
	job <> 'MANAGER';

select ename,job from emp where job <> 'MANAGER'; -- 也可以写成一行
```

```sql
mysql> select ename,job from emp where job <> 'MANAGER';

+--------+-----------+
| ename  | job       |
+--------+-----------+
| SMITH  | CLERK     |
| ALLEN  | SALESMAN  |
| WARD   | SALESMAN  |
| MARTIN | SALESMAN  |
| SCOTT  | ANALYST   |
| KING   | PRESIDENT |
| TURNER | SALESMAN  |
| ADAMS  | CLERK     |
| JAMES  | CLERK     |
| FORD   | ANALYST   |
| MILLER | CLERK     |
+--------+-----------+
11 rows in set (0.00 sec)
```

> 任务：查询`不在部门编号`为`10的部门工作的员工信息`

```sql
select
  *
from
  emp
where
  deptno <> 10;

select * from emp where deptno <> 10; -- 也可以写成一行
```

```sql
mysql> select * from emp where deptno <> 10;

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
```

## 大于、大于等于、小于、小于等于

---

### 大于 >

> 案例: 找出`薪资大于3000`的`员工姓名、薪资`

```sql
select 
  ename, sal
from
  emp
where
  sal > 3000;

select ename,sal from emp where sal > 3000; -- 也可以写成一行
```

```sql
mysql> select ename,sal from emp where sal > 3000;

+-------+---------+
| ename | sal     |
+-------+---------+
| KING  | 5000.00 |
+-------+---------+
1 row in set (0.01 sec)
```


### 大于等于 >=

> 案例: 找出`薪资大于等于3000`的`员工姓名、薪资`

```sql
select 
  ename, sal
from
  emp
where
  sal >= 3000;

select ename,sal from emp where sal >= 3000; -- 也可以写成一行
```

```sql
mysql> select ename,sal from emp where sal >= 3000;

+-------+---------+
| ename | sal     |
+-------+---------+
| SCOTT | 3000.00 |
| KING  | 5000.00 |
| FORD  | 3000.00 |
+-------+---------+
3 rows in set (0.00 sec)
```


### 小于 <

> 案例: 找出`薪资小于3000`的`员工姓名、薪资`

```sql
select 
  ename, sal
from
  emp
where
  sal < 3000;

select ename,sal from emp where sal < 3000; -- 也可以写成一行
```

```sql
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
```


### 小于等于 <=

案例：找出薪资小于等于3000的员工姓名、薪资

```sql
select 
  ename, sal
from
  emp
where
  sal <= 3000;

select ename,sal from emp where sal <= 3000; -- 也可以写成一行
```

```sql 
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
```


## and

---

> `and`表示`并且`，还有另一种写法：`&&`

> 案例: 找出薪资大于等于3000并且小于等于5000的员工姓名、薪资。

```sql
select
  ename,sal
from
  emp
where
  sal >= 3000 and sal <= 5000;

select ename,sal from emp where sal >= 3000 and sal <= 5000; -- 也可以写成一行

select ename,sal from emp where sal >= 3000 && sal <= 5000; -- 也可以写成一行
```

```sql
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
```

> `任务`：**找出`工资级别为2~4（包含2和4）`的`最低工资和最高工资`。**

```sql
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
```


## or

---

> **`or`表示`或者`，还有另一种写法：`||`**

> 案例：找出`工作岗位`是`MANAGER和SALESMAN`的`员工姓名、工作岗位`

```sql
select 
  ename, job
from
  emp
where
  job = 'MANAGER' or job = 'SALESMAN';

select ename,job from emp where job = 'MANAGER' or job = 'SALESMAN'; -- 也可以写成一行
```

```sql
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
```

> **注意：这个题目描述中有这样一句话：`MANAGER和SALESMAN`，有的同学一看到“`和`”，就直接使用“`and`”了，因为“和”对应的英文单词是“and”，如果是这样的话，就大错特错了，因为and表示并且，使用and表示工作岗位既是MANAGER又是SALESMAN的员工，这样的员工是不存在的，因为每一个员工只有一个岗位，不可能同时从事两个岗位。所以使用and是查询不到任何结果的。如下**

```sql
select 
  ename, job
from
  emp
where
  job = 'MANAGER' and job = 'SALESMAN';

select ename,job from emp where job = 'MANAGER' and job = 'SALESMAN'; -- 也可以写成一行
```

```sql
mysql> select ename,job from emp where job = 'MANAGER' and job = 'SALESMAN';

Empty set (0.00 sec)
```


> **`任务`：查询`20和30部门`的`员工信息`。**

```sql
select * from emp where deptno = 20 or deptno = 30;
```

```sql
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
```


## and和or的优先级问题

---

> **`and和or同时出现`时，`and优先级较高`，会`先执行`，如果希望`or先执行`，这个时候需要给`or条件添加小括号`。另外，以后遇到不确定的优先级时，可以通过`添加小括号`的方式来解决。对于优先级问题没必要记忆。**

> **案例：找出`薪资小于1500`，并且`部门编号`是`20或30的员工姓名、薪资、部门编号`。**

>> **先来看一下错误写法：**

```sql
select
  ename,sal,deptno
from
  emp
where
  sal < 1500 and deptno = 20 or deptno = 30;

select ename,sal,deptno from emp where sal < 1500 and deptno = 20 or deptno = 30; -- 也可以写成一行
```

```sql
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
```

> 认真解读题意得知：`薪资小于1500是一个大前提`，要找出的是薪资小于1500的，满足这个条件的前提下，`再找部门编号是20或30的`，显然以上的运行结果中出现了薪资为1600的，为什么1600的会出现呢？这是因为“`sal < 1500 and deptno = 20`”结合在一起了，“`depnto = 30`”成了一个独立的条件。`会导致部门编号为30的所有员工全部查询出来`。我们应该让“`deptno = 20 or deptno = 30`”结合在一起，

>> **正确写法如下：**

```sql
select
  ename,sal,deptno
from
  emp
where
  sal < 1500 and (deptno = 20 or deptno = 30);

select ename,sal,deptno from emp where sal < 1500 and (deptno = 20 or deptno = 30); -- 也可以写成一行
```

```sql
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
```

> `任务`：找出`薪资小于1500`的，并且`工作岗位是CLERK和SALESMAN`的`员工姓名、薪资、岗位`。
```sql
select 
  ename,sal,job
from
  emp
where
  sal < 1500 and (job = 'CLERK' or job = 'SALESMAN');

select ename,sal,job from emp where sal < 1500 and (job = 'CLERK' or job = 'SALESMAN'); -- 也可以写成一行
```

```sql
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
```


## between...and...

---

> **`between...and...`等同于 `>= and <=`**
+ 做区间判断的，包含`左右两个边界值`。

+ 它支持`数字、日期、字符串`等数据类型。

+ between...and...在使用时一定是 **`左小右大`**。**`左大右小时无法查询到数据`**。

+ between...and... 和 `>= and <=`只是在写法结构上有区别，执行原理和效率方面没有区别。

> 案例：找出`薪资在1600到3000`的`员工姓名、薪资`。

```sql
select 
  ename,sal
from
  emp
where
	sal between 1600 and 3000;

select ename,sal from emp where sal between 1600 and 3000; -- 也可以写成一行
```

```sql
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
```


>> 采用`左大右小`的方式：

```sql
select 
  ename,sal
from
  emp
where
	sal between 3000 and 1600;

select ename,sal from emp where sal between 3000 and 1600; -- 也可以写成一行
```

```sql
mysql> select ename,sal from emp where sal between 3000 and 1600;

Empty set (0.00 sec)
```
> 没有查询到任何数据，所以在使用的时候一定要注意：**左小右大**。

> `任务`：查询在`1982-01-23`到`1987-04-19`之间`入职的员工`。

```sql
select
  *
from
  emp
where
  hiredate between '1982-01-23' and '1987-04-19';

select * from emp where hiredate between '1982-01-23' and '1987-04-19'; -- 也可以写成一行
```

```sql
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
```

> **注意：以上SQL语句中`日期`需要加上`单引号`**。


## is null、is not null

---

+ **判断某个数据`是否为null`，不能使用等号，只能使用 `is null`**

+ **判断某个数据是`否不为null`，不能使用不等号，只能使用 `is not null`**

> 在`数据库`中`null不是一个值`，不能用等号和不等号衡量，`null`代表`什么也没有`，`没有数据，没有值`

### is null

> 案例1：找出`津贴为空`的`员工姓名、薪资、津贴`。

```sql
select
  ename,sal,comm
from
  emp
where
  comm is null;

select ename,sal,comm from emp where comm is null; -- 也可以写成一行
```

```sql
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
```

>> 我们使用`等号`，尝试一下：

```sql
select
  ename,sal,comm
from
  emp
where
  comm = null;

select ename,sal,comm from emp where comm = null; -- 也可以写成一行
```

```sql
mysql> select ename,sal,comm from emp where comm = null;

Empty set (0.00 sec)
```
> 查询不到任何数据，所以判断是否为空，不能用等号。


### is not null

> 案例2：找出`津贴不为空`的`员工姓名、薪资、津贴`。

```sql
select
  ename,sal,comm
from
  emp
where
  comm is not null;

select ename,sal,comm from emp where comm is not null; -- 也可以写成一行
```

```sql
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
```


## in、not in

---

### in

+ `job in('MANAGER','SALESMAN','CLERK')` 等同于 `job = 'MANAGER' or job = 'SALESMAN' or job = 'CLERK'`

+ `sal in(1600, 3000, 5000)` 等同于 `sal = 1600 or sal = 3000 or sal = 5000`
in后面有一个小括号，小括号当中有多个值，值和值之间采用`逗号隔开`

+ `sal in(1500, 5000)`，需要注意的是：这个并`不是说薪资在1500到5000之间`，in不代表区间，表示`sal是1500的`和`sal是5000的`

> 案例1：找出`工作岗位是MANAGER和SALESMAN`的`员工姓名、薪资、工作岗位`

>> **第一种：`使用or`**

```sql
select
  ename,sal,job
from
  emp
where
  job = 'MANAGER' or job = 'SALESMAN';

select ename,sal,job from emp where job =  'MANAGER' or job = 'SALESMAN'; -- 也可以写成一行
```

```sql
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
```


>> **第二种：`使用in`**

```sql
select
  ename,sal,job
from
  emp
where
  job in('MANAGER', 'SALESMAN');

select ename,sal,job from emp where job in('MANAGER', 'SALESMAN'); -- 也可以写成一行
```

```sql
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
```

> 案例2：找出`薪资是1500/1600/3000`的`员工姓名、工作岗位`

```sql
select
  ename,job
from
  emp
where
  sal in(1500, 1600, 3000);

select ename,job from emp where sal in(1500, 1600, 3000); -- 也可以写成一行
```

```sql
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
```

> `任务`：找出`部门编号是10和20`的`员工编号、姓名`。（要求使用两种方案）

>> **第一种：`使用or`**

```sql
select 
  empno,ename
from
  emp
where
  deptno = 10 or deptno = 20;

select empno,ename from emp where deptno = 10 or deptno = 20; -- 也可以写成一行
```

```sql
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
```

>> **第二种：`使用in`**

```sql
select 
  empno,ename
from
  emp
where
  deptno in(10, 20);

select empno,ename from emp where deptno in(10, 20); -- 也可以写成一行
```

```sql
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
```


### not in

+ `job not in('MANAGER','SALESMAN')`等同于 `job <> 'MANAGER' and job <> 'SALESMAN'`

+ `sal not in(1600, 5000)` 等同于 `sal <> 1600 and sal <> 5000`

> 案例：找出工作岗位`不是MANAGER和SALESMAN`的`员工姓名、工作岗位`

>> **第一种：使用`and`**

```sql
select 
  ename,job
from
  emp
where
  job <> 'MANAGER' and job <> 'SALESMAN';

select ename,job from emp where job <> 'MANAGER' and job <> 'SALESMAN'; -- 也可以写成一行
```

```sql
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
```

>> **第二种：使用`not in`**

```sql
select 
  ename,job
from
  emp
where
  job not in('MANAGER', 'SALESMAN');

select ename,job from emp where job not in('MANAGER', 'SALESMAN'); -- 也可以写成一行
```

```sql
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
```

> **`任务`：找出`薪资不是1600和3000`的`员工姓名、薪资`。**

```sql
select 
  ename,sal
from
  emp
where
  sal not in(1600, 3000);

select ename,sal from emp where sal not in(1600, 3000); -- 也可以写成一行
```

```sql
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
```


### in、not in 与 NULL

> 先来看一下emp表中的数据

```sql
select * from emp;
```

```sql
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
14 rows in set (0.04 sec)
```

> 通过表中数据观察到，有`4个员工的津贴不为NULL`，`剩下10个员工的津贴都是NULL`。

>> 写这样一条SQL语句：

```sql
select * from emp where comm in(NULL, 300);
```

```sql 
mysql> select * from emp where comm in(NULL, 300);
+-------+-------+----------+------+------------+---------+--------+--------+
| EMPNO | ENAME | JOB      | MGR  | HIREDATE   | SAL     | COMM   | DEPTNO |
+-------+-------+----------+------+------------+---------+--------+--------+
|  7499 | ALLEN | SALESMAN | 7698 | 1981-02-20 | 1600.00 | 300.00 |     30 |
+-------+-------+----------+------+------------+---------+--------+--------+
1 row in set (0.00 sec)
```

> **为什么以上执行结果`只有一条记录`呢？`分析一下`：**

>> 首先你要知道`in的执行原理`实际上是采用`=`和`or`的方式，也就是说，以上SQL语句实际上是：

```sql
select * from emp where comm = NULL or comm = 300;
```

>> 其中NULL不能用等号=进行判断，所以`comm = NULL`结果是`false`，然而中间使用的是`or`，所以comm = NULL被忽略了。所以查询结果就以上一条数据。

> 通过以上的测试得知：**`in是自动忽略NULL的`**。

> 再写这样一条SQL语句：

```sql
select * from emp where comm not in(NULL, 300);
```

```sql
mysql> select * from emp where comm not in(NULL, 300);

Empty set (0.00 sec)
```

>> 以上的执行结果奇怪了，为什么`没有查到任何数据`呢？我们分析一下：

> 首先你要知道`not in的执行原理`实际上是采用`<>和and`的方式，也就是说，以上SQL语句实际上是：

```sql
select * from emp where comm <> NULL and comm <> 300;
```

>>其中`NULL的判断`**不能**使用`<>`，所以`comm <> NULL`结果是`false`，由于后面是and，`and表示并且`，`comm <> NULL`已经是`false`了，所以a`nd右边的就没必要运算`了，`comm <> NULL and comm <> 300`的整体运算结果就是`false`。所以`查询不到任何数据`。

> 通过以上测试得知，**`not in是不会自动忽略NULL的`**，所以在使用**`not in的时候一定要提前过滤掉NULL`**。


## in和or的效率比拼

---

> 在MySQL当中，如何统计一个`SQL语句的执行时长`？

- 可以使用这个命令：show profiles;  这个命令可以查看在mysql中执行的所有SQL以及命令的耗费时长。
- show profiles; 是在mysql5.0.37之后添加的。所以要确保你的mysql版本没问题。
- 如何开启时长统计功能：set profiling = 1;
- 查看时长统计功能是否开启：show variables like '%pro%';
- 查看每条SQL的耗时：show profiles;
- 查看其中某条SQL耗时明细：show profile for query query_id;
- 查看最新一条SQL的耗时明细：show profile;
- 查看cpu，io等信息：show profile block io, cpu for query query_id; 

or的效率为O(n)，而in的效率为O(log n), 当n越大的时候效率相差越明显（**也就是说数据量越大的时候，in的效率越高**）。以下是测试过程：
第一步，创建测试表，并生成测试数据，测试数据为1000万条记录。数据库中关闭了query cache，因此数据库缓存不会对查询造成影响。具体的代码如下：

```sql
#创建测试的test表
DROP TABLE IF EXISTS test; 
CREATE TABLE test( 
    ID INT(10) NOT NULL, 
    `Name` VARCHAR(20) DEFAULT '' NOT NULL, 
    PRIMARY KEY( ID ) 
)ENGINE=INNODB DEFAULT CHARSET utf8; 

#创建生成测试数据的存储过程
DROP PROCEDURE IF EXISTS pre_test; 
DELIMITER //
CREATE PROCEDURE pre_test() 
BEGIN 
DECLARE i INT DEFAULT 0; 
SET autocommit = 0; 
WHILE i<10000000 DO 
INSERT INTO test ( ID,`Name` ) VALUES( i, CONCAT( 'Carl', i ) ); 
SET i = i+1; 
IF i%2000 = 0 THEN 
COMMIT; 
END IF; 
END WHILE; 
END; //
DELIMITER ;

#执行存储过程生成测试数据
CALL pre_test();
```

> 以上SQL看不懂没关系，先执行它，进行数据初始化准备工作。

> 第二步：分三种情况进行测试，分别是：

+ 第1种情况：in和or所在列为主键的情形。

+ 第2种情况：in和or所在列创建有索引的情形。

+ 第3种情况：in和or所在列没有索引的情形。

> 每种情况又采用不同的in和or的数量进行测试。由于测试语句的数据量有4种情况，我这里就称为A组、B组、C组、D组，其中A组为3个值，B组为150个值，C组为300个值，D组为1000个值。具体的测试语句如下：

```sql
#A组
#in和or中有3条数据的情况
SELECT * FROM test WHERE id IN (1,23,48);
SELECT * FROM test WHERE id =1 OR id=23 OR id=48;

#B组
#in和or中有150条数据的情况
SELECT * FROM test WHERE id IN (59617932,98114476,89047409,26968186,56586105,35488201,53251989,18182139,71164231,57655852,7948544,60658339,50758185,66667117,34771253,68699137,27877290,44275282,1585444,71219424,90937482,83928635,24588528,81933207,9607562,12013895,84640278,85549596,53249244,8567444,85402877,15040223,54266509,17718135,91687882,22930500,94756430,66031097,13084573,18137443,89917778,46845456,43939093,35943480,18213703,46362815,49835919,83137546,2101409,74932951,11984477,93113331,77848222,68546065,33728734,90793684,44975642,61387237,52483391,97716233,49449060,22411182,30776331,60597240,6911731,45789095,62075344,8379933,97910423,86861971,81342386,93423963,83852896,18566482,22747687,51420625,75862064,26402882,93958561,85202979,97049369,67674725,9475653,92302381,78133617,49295001,36517340,81387142,15707241,60832834,93157830,64171432,58537826,70141767,7326025,36632075,9639624,8900056,99702164,35108945,87820933,57302965,16652391,41845132,62184393,70136913,79574630,32562398,94616790,61258220,73162018,81644480,19453596,97380163,1204733,33357040,84854495,13888863,49041868,89272326,38405345,571248,6349029,70755321,79307694,60619684,92624181,73135306,23279848,95612954,55845916,6223606,43836918,37459781,67969314,99398872,7616960,37189193,50151920,62881879,12364637,33204320,27135672,28441504,47373461,87967926,30631796,20053540,18735984,83406724);
SELECT * FROM test WHERE id=59617932 OR id=98114476 OR id=89047409 OR id=26968186 OR id=56586105 OR id=35488201 OR id=53251989 OR id=18182139 OR id=71164231 OR id=57655852 OR id=7948544 OR id=60658339 OR id=50758185 OR id=66667117 OR id=34771253 OR id=68699137 OR id=27877290 OR id=44275282 OR id=1585444 OR id=71219424 OR id=90937482 OR id=83928635 OR id=24588528 OR id=81933207 OR id=9607562 OR id=12013895 OR id=84640278 OR id=85549596 OR id=53249244 OR id=8567444 OR id=85402877 OR id=15040223 OR id=54266509 OR id=17718135 OR id=91687882 OR id=22930500 OR id=94756430 OR id=66031097 OR id=13084573 OR id=18137443 OR id=89917778 OR id=46845456 OR id=43939093 OR id=35943480 OR id=18213703 OR id=46362815 OR id=49835919 OR id=83137546 OR id=2101409 OR id=74932951 OR id=11984477 OR id=93113331 OR id=77848222 OR id=68546065 OR id=33728734 OR id=90793684 OR id=44975642 OR id=61387237 OR id=52483391 OR id=97716233 OR id=49449060 OR id=22411182 OR id=30776331 OR id=60597240 OR id=6911731 OR id=45789095 OR id=62075344 OR id=8379933 OR id=97910423 OR id=86861971 OR id=81342386 OR id=93423963 OR id=83852896 OR id=18566482 OR id=22747687 OR id=51420625 OR id=75862064 OR id=26402882 OR id=93958561 OR id=85202979 OR id=97049369 OR id=67674725 OR id=9475653 OR id=92302381 OR id=78133617 OR id=49295001 OR id=36517340 OR id=81387142 OR id=15707241 OR id=60832834 OR id=93157830 OR id=64171432 OR id=58537826 OR id=70141767 OR id=7326025 OR id=36632075 OR id=9639624 OR id=8900056 OR id=99702164 OR id=35108945 OR id=87820933 OR id=57302965 OR id=16652391 OR id=41845132 OR id=62184393 OR id=70136913 OR id=79574630 OR id=32562398 OR id=94616790 OR id=61258220 OR id=73162018 OR id=81644480 OR id=19453596 OR id=97380163 OR id=1204733 OR id=33357040 OR id=84854495 OR id=13888863 OR id=49041868 OR id=89272326 OR id=38405345 OR id=571248 OR id=6349029 OR id=70755321 OR id=79307694 OR id=60619684 OR id=92624181 OR id=73135306 OR id=23279848 OR id=95612954 OR id=55845916 OR id=6223606 OR id=43836918 OR id=37459781 OR id=67969314 OR id=99398872 OR id=7616960 OR id=37189193 OR id=50151920 OR id=62881879 OR id=12364637 OR id=33204320 OR id=27135672 OR id=28441504 OR id=47373461 OR id=87967926 OR id=30631796 OR id=20053540 OR id=18735984 OR id=83406724;


#C组
#in和or中有300条数据的情况
SELECT * FROM test WHERE id IN (37092877,94859722,74276090,8763830,38727241,95732954,93414819,55070016,3591352,73857925,92290525,15210159,83905516,54934589,83004136,31442143,6060569,22209206,27649629,11464943,77822402,28714780,10058522,62252663,13751461,38997875,47320577,64507359,36137908,54297630,97411161,56542672,22017966,55190708,70072386,24300664,93413617,23621629,74772508,62774612,43001947,46161388,85563006,70177147,63960440,18001207,81734850,10635060,6551152,54877885,44426798,73950635,18713144,21690065,82153543,26048520,79954773,22411093,97307339,74193176,1413532,88006544,36062746,24043946,17132007,95958217,26112542,27303972,17247403,56778979,60928031,69369613,90584759,86234538,41726089,25315005,27568726,25091624,15307765,83130887,42726438,75872353,18991223,47819224,75457713,54659391,54889687,65229322,17124556,38376043,1989975,45973571,48597804,58632319,43388664,97010450,94745635,13217373,40472912,40220510,58319808,48228318,48936085,86281500,65466706,96815281,11751559,50188155,76649755,35315411,20360954,17739218,10918461,51429591,41447650,65170472,26810295,80912347,17157209,75851858,61150903,4408208,61200404,6655467,66863737,51549112,61951371,14368308,14663119,8762531,31765056,30560647,41048147,95526521,94929131,56881239,79014587,62705983,15892901,66151473,98846144,79336731,35949035,26250054,97536202,40575682,6965144,91059908,97939380,30854180,1965937,17193347,76584991,70467475,6559872,97386594,13939914,20379091,84906436,45989448,17337270,4949675,96963499,12561575,77153018,73213368,68283041,33977574,86290771,70381017,73095085,454900,44614195,48171334,49603342,7430998,29447060,47643508,82393912,83169846,94256496,35275444,40024984,25377535,46571333,32510994,70927802,92017916,97302502,22859741,32726786,79071601,93977472,47409421,49311618,77366144,84838598,59401507,67110877,42075938,76962007,27984930,72982484,81363683,75017478,88624177,67220235,88290070,26311443,87681081,77960250,4996033,68448074,67762279,99650583,36766422,27233152,71436659,25428777,81481679,51070397,88351803,78755075,26783938,83610840,45650662,86305644,1717314,66176062,6507047,45084786,74402982,55661367,35721238,40424913,24294239,30223531,55367671,56777532,12604154,4870493,14750488,74039611,42549918,70710424,56247316,63002053,71117605,16510883,67417211,34057637,74185092,58603491,66987830,73584171,9178319,47096502,1554825,37756804,85168245,92690138,6120773,99586029,74696745,61803307,56631845,42681796,58965644,68703695,69660559,15879062,26713059,85186928,63117471,53007808,74576547,32187857,13701205,88645881,24507258,87453800,39624977,75862710,62419627,70804059,10461373,18265782,56366177,68093007,75760763,43931574,65808002,49148775,98019987,71183123,53762434,78851856,37767085,89124453,47566746);

SELECT * FROM test WHERE id=37092877 OR id=94859722 OR id=74276090 OR id=8763830 OR id=38727241 OR id=95732954 OR id=93414819 OR id=55070016 OR id=3591352 OR id=73857925 OR id=92290525 OR id=15210159 OR id=83905516 OR id=54934589 OR id=83004136 OR id=31442143 OR id=6060569 OR id=22209206 OR id=27649629 OR id=11464943 OR id=77822402 OR id=28714780 OR id=10058522 OR id=62252663 OR id=13751461 OR id=38997875 OR id=47320577 OR id=64507359 OR id=36137908 OR id=54297630 OR id=97411161 OR id=56542672 OR id=22017966 OR id=55190708 OR id=70072386 OR id=24300664 OR id=93413617 OR id=23621629 OR id=74772508 OR id=62774612 OR id=43001947 OR id=46161388 OR id=85563006 OR id=70177147 OR id=63960440 OR id=18001207 OR id=81734850 OR id=10635060 OR id=6551152 OR id=54877885 OR id=44426798 OR id=73950635 OR id=18713144 OR id=21690065 OR id=82153543 OR id=26048520 OR id=79954773 OR id=22411093 OR id=97307339 OR id=74193176 OR id=1413532 OR id=88006544 OR id=36062746 OR id=24043946 OR id=17132007 OR id=95958217 OR id=26112542 OR id=27303972 OR id=17247403 OR id=56778979 OR id=60928031 OR id=69369613 OR id=90584759 OR id=86234538 OR id=41726089 OR id=25315005 OR id=27568726 OR id=25091624 OR id=15307765 OR id=83130887 OR id=42726438 OR id=75872353 OR id=18991223 OR id=47819224 OR id=75457713 OR id=54659391 OR id=54889687 OR id=65229322 OR id=17124556 OR id=38376043 OR id=1989975 OR id=45973571 OR id=48597804 OR id=58632319 OR id=43388664 OR id=97010450 OR id=94745635 OR id=13217373 OR id=40472912 OR id=40220510 OR id=58319808 OR id=48228318 OR id=48936085 OR id=86281500 OR id=65466706 OR id=96815281 OR id=11751559 OR id=50188155 OR id=76649755 OR id=35315411 OR id=20360954 OR id=17739218 OR id=10918461 OR id=51429591 OR id=41447650 OR id=65170472 OR id=26810295 OR id=80912347 OR id=17157209 OR id=75851858 OR id=61150903 OR id=4408208 OR id=61200404 OR id=6655467 OR id=66863737 OR id=51549112 OR id=61951371 OR id=14368308 OR id=14663119 OR id=8762531 OR id=31765056 OR id=30560647 OR id=41048147 OR id=95526521 OR id=94929131 OR id=56881239 OR id=79014587 OR id=62705983 OR id=15892901 OR id=66151473 OR id=98846144 OR id=79336731 OR id=35949035 OR id=26250054 OR id=97536202 OR id=40575682 OR id=6965144 OR id=91059908 OR id=97939380 OR id=30854180 OR id=1965937 OR id=17193347 OR id=76584991 OR id=70467475 OR id=6559872 OR id=97386594 OR id=13939914 OR id=20379091 OR id=84906436 OR id=45989448 OR id=17337270 OR id=4949675 OR id=96963499 OR id=12561575 OR id=77153018 OR id=73213368 OR id=68283041 OR id=33977574 OR id=86290771 OR id=70381017 OR id=73095085 OR id=454900 OR id=44614195 OR id=48171334 OR id=49603342 OR id=7430998 OR id=29447060 OR id=47643508 OR id=82393912 OR id=83169846 OR id=94256496 OR id=35275444 OR id=40024984 OR id=25377535 OR id=46571333 OR id=32510994 OR id=70927802 OR id=92017916 OR id=97302502 OR id=22859741 OR id=32726786 OR id=79071601 OR id=93977472 OR id=47409421 OR id=49311618 OR id=77366144 OR id=84838598 OR id=59401507 OR id=67110877 OR id=42075938 OR id=76962007 OR id=27984930 OR id=72982484 OR id=81363683 OR id=75017478 OR id=88624177 OR id=67220235 OR id=88290070 OR id=26311443 OR id=87681081 OR id=77960250 OR id=4996033 OR id=68448074 OR id=67762279 OR id=99650583 OR id=36766422 OR id=27233152 OR id=71436659 OR id=25428777 OR id=81481679 OR id=51070397 OR id=88351803 OR id=78755075 OR id=26783938 OR id=83610840 OR id=45650662 OR id=86305644 OR id=1717314 OR id=66176062 OR id=6507047 OR id=45084786 OR id=74402982 OR id=55661367 OR id=35721238 OR id=40424913 OR id=24294239 OR id=30223531 OR id=55367671 OR id=56777532 OR id=12604154 OR id=4870493 OR id=14750488 OR id=74039611 OR id=42549918 OR id=70710424 OR id=56247316 OR id=63002053 OR id=71117605 OR id=16510883 OR id=67417211 OR id=34057637 OR id=74185092 OR id=58603491 OR id=66987830 OR id=73584171 OR id=9178319 OR id=47096502 OR id=1554825 OR id=37756804 OR id=85168245 OR id=92690138 OR id=6120773 OR id=99586029 OR id=74696745 OR id=61803307 OR id=56631845 OR id=42681796 OR id=58965644 OR id=68703695 OR id=69660559 OR id=15879062 OR id=26713059 OR id=85186928 OR id=63117471 OR id=53007808 OR id=74576547 OR id=32187857 OR id=13701205 OR id=88645881 OR id=24507258 OR id=87453800 OR id=39624977 OR id=75862710 OR id=62419627 OR id=70804059 OR id=10461373 OR id=18265782 OR id=56366177 OR id=68093007 OR id=75760763 OR id=43931574 OR id=65808002 OR id=49148775 OR id=98019987 OR id=71183123 OR id=53762434 OR id=78851856 OR id=37767085 OR id=89124453 OR id=47566746;


#D组
#in和or中有1000条数据的情况
SELECT * FROM test WHERE id IN (93674701,9720356,31732184,53855095,33144472,71864888,27541768,27238726,83648428,12942332,26918445,19781953,81861032,74800064,12286132,6624397,64942581,70512799,46356598,88292448,87069909,38175756,98121997,62570414,15900806,51527968,89092372,8084203,53772848,78871524,3608561,85909562,41702172,61800503,57877634,93407278,30824340,13159046,49055339,73058078,983603,73571456,51694978,75136628,82716874,83551181,7964224,47505945,92695321,15885152,79282709,18572099,27392970,14552787,19848227,4518183,11773920,22285326,71605145,2402625,63365854,70973600,10584706,83688869,84268419,6026005,36545233,24462648,19293921,17561083,52105483,59243514,35230465,34650779,30053489,24225251,59642405,81933853,94495716,26364324,25980634,5579237,14569289,89417845,71178959,4143920,20467990,53316808,21288525,82249537,37737589,44712689,36788133,15668654,4697556,63785060,11555169,36401204,92276179,4135929,75453019,28231031,8649240,11576980,20262028,56242424,11305608,5655216,90240601,28569373,5296027,10739594,72751648,22531251,12535926,36347415,19740655,69125465,7523885,88128548,88830806,25010302,29411467,99614288,32646290,16592563,69036910,32604729,88737786,90169676,57646877,72105460,40027541,70362483,37221415,25284914,69691185,17972978,1544661,47324366,25337670,91133621,63697117,48652228,18538437,79966496,26066529,65334307,8305141,86289387,20178085,88836090,74948034,14101728,7837868,83548120,65602502,83129211,24785681,65000269,49140174,62636621,31096695,52276400,28546681,83631937,57100225,42531528,28326396,38641032,93055463,20525612,66073509,35154065,29007664,12600294,76829494,73917074,67226149,12478806,39842542,70312958,82792046,49668650,46280815,96555182,22966062,83158116,87566530,66277804,7944142,90649884,64342810,9881875,14833854,82959569,50523207,48788762,3801076,14677723,63080506,96215352,36302231,35067168,11695282,19447382,66401373,40822285,41406321,48630216,78955925,57194625,52097877,16169037,44834346,2593695,29948466,41842778,50510473,39669493,64590865,26160800,94882286,2703212,41243905,89363549,82819429,25565895,86836890,58385785,55898457,99305620,43332680,98223672,4494624,25408421,28054121,48197701,90633404,25825550,90631154,24867226,61846156,38911183,67826056,10676975,57116645,474292,82387517,56211477,46555785,49282428,99468990,81172472,26720330,38692582,96073680,88412290,28829489,1816508,75321051,81650509,23175973,42008725,60743468,52532114,731909,77811415,86804961,29675484,33584929,180367,93687804,41093066,5987495,27291494,78229979,63194139,34357776,9992084,22643334,22407822,69740170,29581361,50036776,88768091,82537322,83709895,55361776,90616169,44595355,9468440,54552233,73496954,46104486,92947715,38522993,88515232,57725249,48507967,25309486,91597013,85635814,69579638,68775627,57556546,77900275,95965693,9601780,5448068,54075952,64335883,80114875,14793294,21016639,1959922,93176996,7893733,51407895,45849129,33857790,30096194,78021982,66555961,15842998,77678123,56648395,8171848,80152264,78616680,80098122,22882409,77242219,3124519,60865422,43164198,43256621,73261157,12541949,49780175,23167183,10509251,41809106,25655902,6752559,39850293,50992519,40061483,84526968,93056718,53267125,53914467,39404926,83672449,21484465,34147538,13437853,74079093,50400032,85705998,7557614,10300505,79264856,65669946,23899714,53506926,36081544,11113765,65755643,5826515,60392667,55562374,98132987,80904530,92663352,7283593,3709276,52078745,84847057,34235334,63889320,70036669,58603533,27394053,54766781,50920854,80202681,67618417,82912294,20150728,20042189,86403320,38738266,58393070,50887299,12170654,16212895,37361223,13677457,19503506,20213757,84240441,39618969,26401150,47937678,55871130,79189571,5717133,12444503,95283334,14827147,22008485,56345882,43237192,56980197,68699371,46407250,72120555,70694039,46438829,17774982,36484024,138767,89563532,54847019,7815592,44909604,50479084,17462504,96594465,58317102,92426225,91894699,4501659,43315607,9442814,19705166,87751308,95588126,92372510,20281564,19251355,10321183,34573093,19074704,84678191,24383998,27670253,50223562,34091936,99304371,32477827,54273037,86525073,73253547,33316827,6724062,76707318,78171148,44729510,16697684,68966388,57448392,51380186,35344477,98153122,51825492,27202774,26901641,37527637,88241695,15100257,30418000,21821200,95511035,9289513,83870196,54628801,39402988,88345504,84232433,13925255,70816934,6822742,14400466,430652,87397095,89773413,10883914,89939310,39597573,49356789,62857680,93292662,55644642,81922551,94304087,63705961,137763,22392805,65195561,39498904,22576234,59467794,46389072,66341462,44602153,18204976,45366397,3880945,98231882,27999162,38209350,10599910,77139550,35114264,57109708,93064441,34801782,24938667,84955486,53018874,37969943,64372852,69596670,21288762,12774121,97588451,23575359,10954061,50363988,56263940,61520763,85096643,36250068,19807406,20984386,24520668,44631794,62587890,44963362,7663521,78505677,98442373,90280978,14494324,16069861,11397153,87726305,26133866,42024935,93393929,72575268,76384597,42272046,81658814,40811718,86054463,35997739,51075676,62839927,68179261,19292480,10464999,6342696,75842285,28671096,30029838,19617648,94667632,75855376,83477767,456684,81197213,1961395,79590898,470693,64786459,90138714,30486571,75566704,64467558,21380112,17742907,7733647,92017,64615799,72272722,66873854,77198963,35594848,42694993,12431322,2247181,11020746,42416726,19127785,95444937,36842133,4203521,48149533,45322440,59710953,38250773,31370132,26889920,45927952,55298246,31197238,44744953,35531670,38850041,29759177,76433451,33696500,2823716,68574340,68889919,35744793,64772909,41562277,72606631,54617176,76086087,61060196,1593669,4666059,44201567,97015910,51039786,47534369,36899420,95163693,34278055,24361819,93200909,29991418,63172824,53644148,61454424,44726508,64910883,31088636,14005026,83267869,28497493,12406441,34686539,70646963,7687253,23115957,64556990,49701688,76843379,22370877,11199132,15492661,72101877,47154152,54969058,96696025,33567129,95788960,13301506,38695877,52992551,37817234,82136809,28111091,84977065,93404791,56350318,27576451,84170153,37381626,22432144,35119973,23922989,98961080,14336913,49612713,47410677,41559348,64216475,75502736,16203656,81726720,64541981,82181762,95869963,1086041,76856852,99484886,47292021,99746735,79082859,67416188,46391963,58631281,80994168,9464550,5851058,16534935,63307701,91875109,18716507,15870646,6003995,836024,35610568,39574140,76244639,83403189,51252728,6516065,94907007,81605606,40398075,40258386,6692981,50852074,2869416,97682971,44427361,9608914,58464559,81806036,20047387,66264452,58063775,54179837,48463792,17877188,31718426,64192249,35574859,3671766,88905164,78137697,46929619,21063327,83078770,93293821,41618319,3832324,91310612,79854291,68734227,8826717,80881657,95208907,7079422,30037415,5494004,44809486,97620027,35689182,13120783,26108678,1537176,16538727,50841024,36515680,82635278,11112660,16276555,72997511,93487848,88201238,53997085,15198916,61214583,78412499,3585265,1402827,56445518,47661453,25615629,58263458,62155263,46608555,15822703,82285214,76021596,84571697,45999350,40074628,8219220,5429523,74024203,22354037,17605466,60436920,52777032,65801717,43656316,10424270,48035786,29493228,83897372,62101275,84793857,56894828,70636689,72497148,67388694,68146510,64298548,97117498,25553211,54226533,90395845,24172623,91712292,98280822,54042497,25032894,6833135,39011254,9837753,63507766,26747954,45941264,99955245,80051546,78510759,71322333,92407609,95809491,18999217,23430377,11861293,42583098,24163209,11358738,3237302,3176665,87151132,2789150,63905882,59864282,3673596,19570439,22883042,72375525,51614404,47526636,98443133,99140135,33855918,28333489,81416033,2670097,4897577,24439616,36643479,40817600,76022791,40072872,95193435,96967607,24983145,49883271,94602753,83555050,85455145,34563229,72328311,12002151,71481181,72998351,1489188,38426973,91893116,61594591,89693630,6268166,20056665,62169880,17143472,35103925,22452590,54272289,34236829,78028543,84474414,40386926,50550952,49413559,48781941,22927237,44447815,29960478,47578119,10192558,87733936,88699383,38808712,79944807,84014713,31865463,72617685,19557568,47865990,39069638,20086122,1777562,29018078,78358083,94561719,46281152,99789008,86929490,16534451,55989144,52455669,54561585,97379646,20416183,87617750,76115505,3282482,8383619,45456319,29576432,67750627,61736333,33745442,51502165,35349384,78106651,23232822,94851387,78254073,82406754,10317954,70125940,45067526,27061875,25640164,52574899,93819227,93789607,96122951,31673246,70431904,54067896,37146857,37817889,14058940,60710246,64844350,91604383,71972005,13888349,19093493,27397281,61085409,66529387,82761299,72236310,19277077,96599501,68304096,48292937,97503321,88011133,29224803,79782945,79965966,83716914,90432214,48938902,12498489,30246261,91624049,68652396,23677785,44084687,3865123,37823170,45287730,38784682,28058351,68226368,61569897,44737876,70575908,25568463,24668386,88650569,35559584,1897737,77844785,29780669,84004602,29029776,91003545,48058106,9463847);

SELECT * FROM test WHERE id=93674701 OR id=9720356 OR id=31732184 OR id=53855095 OR id=33144472 OR id=71864888 OR id=27541768 OR id=27238726 OR id=83648428 OR id=12942332 OR id=26918445 OR id=19781953 OR id=81861032 OR id=74800064 OR id=12286132 OR id=6624397 OR id=64942581 OR id=70512799 OR id=46356598 OR id=88292448 OR id=87069909 OR id=38175756 OR id=98121997 OR id=62570414 OR id=15900806 OR id=51527968 OR id=89092372 OR id=8084203 OR id=53772848 OR id=78871524 OR id=3608561 OR id=85909562 OR id=41702172 OR id=61800503 OR id=57877634 OR id=93407278 OR id=30824340 OR id=13159046 OR id=49055339 OR id=73058078 OR id=983603 OR id=73571456 OR id=51694978 OR id=75136628 OR id=82716874 OR id=83551181 OR id=7964224 OR id=47505945 OR id=92695321 OR id=15885152 OR id=79282709 OR id=18572099 OR id=27392970 OR id=14552787 OR id=19848227 OR id=4518183 OR id=11773920 OR id=22285326 OR id=71605145 OR id=2402625 OR id=63365854 OR id=70973600 OR id=10584706 OR id=83688869 OR id=84268419 OR id=6026005 OR id=36545233 OR id=24462648 OR id=19293921 OR id=17561083 OR id=52105483 OR id=59243514 OR id=35230465 OR id=34650779 OR id=30053489 OR id=24225251 OR id=59642405 OR id=81933853 OR id=94495716 OR id=26364324 OR id=25980634 OR id=5579237 OR id=14569289 OR id=89417845 OR id=71178959 OR id=4143920 OR id=20467990 OR id=53316808 OR id=21288525 OR id=82249537 OR id=37737589 OR id=44712689 OR id=36788133 OR id=15668654 OR id=4697556 OR id=63785060 OR id=11555169 OR id=36401204 OR id=92276179 OR id=4135929 OR id=75453019 OR id=28231031 OR id=8649240 OR id=11576980 OR id=20262028 OR id=56242424 OR id=11305608 OR id=5655216 OR id=90240601 OR id=28569373 OR id=5296027 OR id=10739594 OR id=72751648 OR id=22531251 OR id=12535926 OR id=36347415 OR id=19740655 OR id=69125465 OR id=7523885 OR id=88128548 OR id=88830806 OR id=25010302 OR id=29411467 OR id=99614288 OR id=32646290 OR id=16592563 OR id=69036910 OR id=32604729 OR id=88737786 OR id=90169676 OR id=57646877 OR id=72105460 OR id=40027541 OR id=70362483 OR id=37221415 OR id=25284914 OR id=69691185 OR id=17972978 OR id=1544661 OR id=47324366 OR id=25337670 OR id=91133621 OR id=63697117 OR id=48652228 OR id=18538437 OR id=79966496 OR id=26066529 OR id=65334307 OR id=8305141 OR id=86289387 OR id=20178085 OR id=88836090 OR id=74948034 OR id=14101728 OR id=7837868 OR id=83548120 OR id=65602502 OR id=83129211 OR id=24785681 OR id=65000269 OR id=49140174 OR id=62636621 OR id=31096695 OR id=52276400 OR id=28546681 OR id=83631937 OR id=57100225 OR id=42531528 OR id=28326396 OR id=38641032 OR id=93055463 OR id=20525612 OR id=66073509 OR id=35154065 OR id=29007664 OR id=12600294 OR id=76829494 OR id=73917074 OR id=67226149 OR id=12478806 OR id=39842542 OR id=70312958 OR id=82792046 OR id=49668650 OR id=46280815 OR id=96555182 OR id=22966062 OR id=83158116 OR id=87566530 OR id=66277804 OR id=7944142 OR id=90649884 OR id=64342810 OR id=9881875 OR id=14833854 OR id=82959569 OR id=50523207 OR id=48788762 OR id=3801076 OR id=14677723 OR id=63080506 OR id=96215352 OR id=36302231 OR id=35067168 OR id=11695282 OR id=19447382 OR id=66401373 OR id=40822285 OR id=41406321 OR id=48630216 OR id=78955925 OR id=57194625 OR id=52097877 OR id=16169037 OR id=44834346 OR id=2593695 OR id=29948466 OR id=41842778 OR id=50510473 OR id=39669493 OR id=64590865 OR id=26160800 OR id=94882286 OR id=2703212 OR id=41243905 OR id=89363549 OR id=82819429 OR id=25565895 OR id=86836890 OR id=58385785 OR id=55898457 OR id=99305620 OR id=43332680 OR id=98223672 OR id=4494624 OR id=25408421 OR id=28054121 OR id=48197701 OR id=90633404 OR id=25825550 OR id=90631154 OR id=24867226 OR id=61846156 OR id=38911183 OR id=67826056 OR id=10676975 OR id=57116645 OR id=474292 OR id=82387517 OR id=56211477 OR id=46555785 OR id=49282428 OR id=99468990 OR id=81172472 OR id=26720330 OR id=38692582 OR id=96073680 OR id=88412290 OR id=28829489 OR id=1816508 OR id=75321051 OR id=81650509 OR id=23175973 OR id=42008725 OR id=60743468 OR id=52532114 OR id=731909 OR id=77811415 OR id=86804961 OR id=29675484 OR id=33584929 OR id=180367 OR id=93687804 OR id=41093066 OR id=5987495 OR id=27291494 OR id=78229979 OR id=63194139 OR id=34357776 OR id=9992084 OR id=22643334 OR id=22407822 OR id=69740170 OR id=29581361 OR id=50036776 OR id=88768091 OR id=82537322 OR id=83709895 OR id=55361776 OR id=90616169 OR id=44595355 OR id=9468440 OR id=54552233 OR id=73496954 OR id=46104486 OR id=92947715 OR id=38522993 OR id=88515232 OR id=57725249 OR id=48507967 OR id=25309486 OR id=91597013 OR id=85635814 OR id=69579638 OR id=68775627 OR id=57556546 OR id=77900275 OR id=95965693 OR id=9601780 OR id=5448068 OR id=54075952 OR id=64335883 OR id=80114875 OR id=14793294 OR id=21016639 OR id=1959922 OR id=93176996 OR id=7893733 OR id=51407895 OR id=45849129 OR id=33857790 OR id=30096194 OR id=78021982 OR id=66555961 OR id=15842998 OR id=77678123 OR id=56648395 OR id=8171848 OR id=80152264 OR id=78616680 OR id=80098122 OR id=22882409 OR id=77242219 OR id=3124519 OR id=60865422 OR id=43164198 OR id=43256621 OR id=73261157 OR id=12541949 OR id=49780175 OR id=23167183 OR id=10509251 OR id=41809106 OR id=25655902 OR id=6752559 OR id=39850293 OR id=50992519 OR id=40061483 OR id=84526968 OR id=93056718 OR id=53267125 OR id=53914467 OR id=39404926 OR id=83672449 OR id=21484465 OR id=34147538 OR id=13437853 OR id=74079093 OR id=50400032 OR id=85705998 OR id=7557614 OR id=10300505 OR id=79264856 OR id=65669946 OR id=23899714 OR id=53506926 OR id=36081544 OR id=11113765 OR id=65755643 OR id=5826515 OR id=60392667 OR id=55562374 OR id=98132987 OR id=80904530 OR id=92663352 OR id=7283593 OR id=3709276 OR id=52078745 OR id=84847057 OR id=34235334 OR id=63889320 OR id=70036669 OR id=58603533 OR id=27394053 OR id=54766781 OR id=50920854 OR id=80202681 OR id=67618417 OR id=82912294 OR id=20150728 OR id=20042189 OR id=86403320 OR id=38738266 OR id=58393070 OR id=50887299 OR id=12170654 OR id=16212895 OR id=37361223 OR id=13677457 OR id=19503506 OR id=20213757 OR id=84240441 OR id=39618969 OR id=26401150 OR id=47937678 OR id=55871130 OR id=79189571 OR id=5717133 OR id=12444503 OR id=95283334 OR id=14827147 OR id=22008485 OR id=56345882 OR id=43237192 OR id=56980197 OR id=68699371 OR id=46407250 OR id=72120555 OR id=70694039 OR id=46438829 OR id=17774982 OR id=36484024 OR id=138767 OR id=89563532 OR id=54847019 OR id=7815592 OR id=44909604 OR id=50479084 OR id=17462504 OR id=96594465 OR id=58317102 OR id=92426225 OR id=91894699 OR id=4501659 OR id=43315607 OR id=9442814 OR id=19705166 OR id=87751308 OR id=95588126 OR id=92372510 OR id=20281564 OR id=19251355 OR id=10321183 OR id=34573093 OR id=19074704 OR id=84678191 OR id=24383998 OR id=27670253 OR id=50223562 OR id=34091936 OR id=99304371 OR id=32477827 OR id=54273037 OR id=86525073 OR id=73253547 OR id=33316827 OR id=6724062 OR id=76707318 OR id=78171148 OR id=44729510 OR id=16697684 OR id=68966388 OR id=57448392 OR id=51380186 OR id=35344477 OR id=98153122 OR id=51825492 OR id=27202774 OR id=26901641 OR id=37527637 OR id=88241695 OR id=15100257 OR id=30418000 OR id=21821200 OR id=95511035 OR id=9289513 OR id=83870196 OR id=54628801 OR id=39402988 OR id=88345504 OR id=84232433 OR id=13925255 OR id=70816934 OR id=6822742 OR id=14400466 OR id=430652 OR id=87397095 OR id=89773413 OR id=10883914 OR id=89939310 OR id=39597573 OR id=49356789 OR id=62857680 OR id=93292662 OR id=55644642 OR id=81922551 OR id=94304087 OR id=63705961 OR id=137763 OR id=22392805 OR id=65195561 OR id=39498904 OR id=22576234 OR id=59467794 OR id=46389072 OR id=66341462 OR id=44602153 OR id=18204976 OR id=45366397 OR id=3880945 OR id=98231882 OR id=27999162 OR id=38209350 OR id=10599910 OR id=77139550 OR id=35114264 OR id=57109708 OR id=93064441 OR id=34801782 OR id=24938667 OR id=84955486 OR id=53018874 OR id=37969943 OR id=64372852 OR id=69596670 OR id=21288762 OR id=12774121 OR id=97588451 OR id=23575359 OR id=10954061 OR id=50363988 OR id=56263940 OR id=61520763 OR id=85096643 OR id=36250068 OR id=19807406 OR id=20984386 OR id=24520668 OR id=44631794 OR id=62587890 OR id=44963362 OR id=7663521 OR id=78505677 OR id=98442373 OR id=90280978 OR id=14494324 OR id=16069861 OR id=11397153 OR id=87726305 OR id=26133866 OR id=42024935 OR id=93393929 OR id=72575268 OR id=76384597 OR id=42272046 OR id=81658814 OR id=40811718 OR id=86054463 OR id=35997739 OR id=51075676 OR id=62839927 OR id=68179261 OR id=19292480 OR id=10464999 OR id=6342696 OR id=75842285 OR id=28671096 OR id=30029838 OR id=19617648 OR id=94667632 OR id=75855376 OR id=83477767 OR id=456684 OR id=81197213 OR id=1961395 OR id=79590898 OR id=470693 OR id=64786459 OR id=90138714 OR id=30486571 OR id=75566704 OR id=64467558 OR id=21380112 OR id=17742907 OR id=7733647 OR id=92017 OR id=64615799 OR id=72272722 OR id=66873854 OR id=77198963 OR id=35594848 OR id=42694993 OR id=12431322 OR id=2247181 OR id=11020746 OR id=42416726 OR id=19127785 OR id=95444937 OR id=36842133 OR id=4203521 OR id=48149533 OR id=45322440 OR id=59710953 OR id=38250773 OR id=31370132 OR id=26889920 OR id=45927952 OR id=55298246 OR id=31197238 OR id=44744953 OR id=35531670 OR id=38850041 OR id=29759177 OR id=76433451 OR id=33696500 OR id=2823716 OR id=68574340 OR id=68889919 OR id=35744793 OR id=64772909 OR id=41562277 OR id=72606631 OR id=54617176 OR id=76086087 OR id=61060196 OR id=1593669 OR id=4666059 OR id=44201567 OR id=97015910 OR id=51039786 OR id=47534369 OR id=36899420 OR id=95163693 OR id=34278055 OR id=24361819 OR id=93200909 OR id=29991418 OR id=63172824 OR id=53644148 OR id=61454424 OR id=44726508 OR id=64910883 OR id=31088636 OR id=14005026 OR id=83267869 OR id=28497493 OR id=12406441 OR id=34686539 OR id=70646963 OR id=7687253 OR id=23115957 OR id=64556990 OR id=49701688 OR id=76843379 OR id=22370877 OR id=11199132 OR id=15492661 OR id=72101877 OR id=47154152 OR id=54969058 OR id=96696025 OR id=33567129 OR id=95788960 OR id=13301506 OR id=38695877 OR id=52992551 OR id=37817234 OR id=82136809 OR id=28111091 OR id=84977065 OR id=93404791 OR id=56350318 OR id=27576451 OR id=84170153 OR id=37381626 OR id=22432144 OR id=35119973 OR id=23922989 OR id=98961080 OR id=14336913 OR id=49612713 OR id=47410677 OR id=41559348 OR id=64216475 OR id=75502736 OR id=16203656 OR id=81726720 OR id=64541981 OR id=82181762 OR id=95869963 OR id=1086041 OR id=76856852 OR id=99484886 OR id=47292021 OR id=99746735 OR id=79082859 OR id=67416188 OR id=46391963 OR id=58631281 OR id=80994168 OR id=9464550 OR id=5851058 OR id=16534935 OR id=63307701 OR id=91875109 OR id=18716507 OR id=15870646 OR id=6003995 OR id=836024 OR id=35610568 OR id=39574140 OR id=76244639 OR id=83403189 OR id=51252728 OR id=6516065 OR id=94907007 OR id=81605606 OR id=40398075 OR id=40258386 OR id=6692981 OR id=50852074 OR id=2869416 OR id=97682971 OR id=44427361 OR id=9608914 OR id=58464559 OR id=81806036 OR id=20047387 OR id=66264452 OR id=58063775 OR id=54179837 OR id=48463792 OR id=17877188 OR id=31718426 OR id=64192249 OR id=35574859 OR id=3671766 OR id=88905164 OR id=78137697 OR id=46929619 OR id=21063327 OR id=83078770 OR id=93293821 OR id=41618319 OR id=3832324 OR id=91310612 OR id=79854291 OR id=68734227 OR id=8826717 OR id=80881657 OR id=95208907 OR id=7079422 OR id=30037415 OR id=5494004 OR id=44809486 OR id=97620027 OR id=35689182 OR id=13120783 OR id=26108678 OR id=1537176 OR id=16538727 OR id=50841024 OR id=36515680 OR id=82635278 OR id=11112660 OR id=16276555 OR id=72997511 OR id=93487848 OR id=88201238 OR id=53997085 OR id=15198916 OR id=61214583 OR id=78412499 OR id=3585265 OR id=1402827 OR id=56445518 OR id=47661453 OR id=25615629 OR id=58263458 OR id=62155263 OR id=46608555 OR id=15822703 OR id=82285214 OR id=76021596 OR id=84571697 OR id=45999350 OR id=40074628 OR id=8219220 OR id=5429523 OR id=74024203 OR id=22354037 OR id=17605466 OR id=60436920 OR id=52777032 OR id=65801717 OR id=43656316 OR id=10424270 OR id=48035786 OR id=29493228 OR id=83897372 OR id=62101275 OR id=84793857 OR id=56894828 OR id=70636689 OR id=72497148 OR id=67388694 OR id=68146510 OR id=64298548 OR id=97117498 OR id=25553211 OR id=54226533 OR id=90395845 OR id=24172623 OR id=91712292 OR id=98280822 OR id=54042497 OR id=25032894 OR id=6833135 OR id=39011254 OR id=9837753 OR id=63507766 OR id=26747954 OR id=45941264 OR id=99955245 OR id=80051546 OR id=78510759 OR id=71322333 OR id=92407609 OR id=95809491 OR id=18999217 OR id=23430377 OR id=11861293 OR id=42583098 OR id=24163209 OR id=11358738 OR id=3237302 OR id=3176665 OR id=87151132 OR id=2789150 OR id=63905882 OR id=59864282 OR id=3673596 OR id=19570439 OR id=22883042 OR id=72375525 OR id=51614404 OR id=47526636 OR id=98443133 OR id=99140135 OR id=33855918 OR id=28333489 OR id=81416033 OR id=2670097 OR id=4897577 OR id=24439616 OR id=36643479 OR id=40817600 OR id=76022791 OR id=40072872 OR id=95193435 OR id=96967607 OR id=24983145 OR id=49883271 OR id=94602753 OR id=83555050 OR id=85455145 OR id=34563229 OR id=72328311 OR id=12002151 OR id=71481181 OR id=72998351 OR id=1489188 OR id=38426973 OR id=91893116 OR id=61594591 OR id=89693630 OR id=6268166 OR id=20056665 OR id=62169880 OR id=17143472 OR id=35103925 OR id=22452590 OR id=54272289 OR id=34236829 OR id=78028543 OR id=84474414 OR id=40386926 OR id=50550952 OR id=49413559 OR id=48781941 OR id=22927237 OR id=44447815 OR id=29960478 OR id=47578119 OR id=10192558 OR id=87733936 OR id=88699383 OR id=38808712 OR id=79944807 OR id=84014713 OR id=31865463 OR id=72617685 OR id=19557568 OR id=47865990 OR id=39069638 OR id=20086122 OR id=1777562 OR id=29018078 OR id=78358083 OR id=94561719 OR id=46281152 OR id=99789008 OR id=86929490 OR id=16534451 OR id=55989144 OR id=52455669 OR id=54561585 OR id=97379646 OR id=20416183 OR id=87617750 OR id=76115505 OR id=3282482 OR id=8383619 OR id=45456319 OR id=29576432 OR id=67750627 OR id=61736333 OR id=33745442 OR id=51502165 OR id=35349384 OR id=78106651 OR id=23232822 OR id=94851387 OR id=78254073 OR id=82406754 OR id=10317954 OR id=70125940 OR id=45067526 OR id=27061875 OR id=25640164 OR id=52574899 OR id=93819227 OR id=93789607 OR id=96122951 OR id=31673246 OR id=70431904 OR id=54067896 OR id=37146857 OR id=37817889 OR id=14058940 OR id=60710246 OR id=64844350 OR id=91604383 OR id=71972005 OR id=13888349 OR id=19093493 OR id=27397281 OR id=61085409 OR id=66529387 OR id=82761299 OR id=72236310 OR id=19277077 OR id=96599501 OR id=68304096 OR id=48292937 OR id=97503321 OR id=88011133 OR id=29224803 OR id=79782945 OR id=79965966 OR id=83716914 OR id=90432214 OR id=48938902 OR id=12498489 OR id=30246261 OR id=91624049 OR id=68652396 OR id=23677785 OR id=44084687 OR id=3865123 OR id=37823170 OR id=45287730 OR id=38784682 OR id=28058351 OR id=68226368 OR id=61569897 OR id=44737876 OR id=70575908 OR id=25568463 OR id=24668386 OR id=88650569 OR id=35559584 OR id=1897737 OR id=77844785 OR id=29780669 OR id=84004602 OR id=29029776 OR id=91003545 OR id=48058106 OR id=9463847;
```

> 测试结果如下：

>> 第一种情况，ID列为主键的情况，4组测试执行计划一样，执行的时间也基本没有区别。

```txt
A组or和in的执行时间： or的执行时间为：0.002s     in的执行时间为：0.002s
B组or和in的执行时间： or的执行时间为：0.004s     in的执行时间为：0.004s
C组or和in的执行时间： or的执行时间为：0.006s     in的执行时间为：0.005s
D组or和in的执行时间： or的执行时间为：0.018s     in的执行时间为：0.014s
```

>> 第二种情况，ID列为一般索引的情况，4组测试执行计划一样，执行的时间也基本没有区别。

```txt
A组or和in的执行时间： or的执行时间为：0.002s     in的执行时间为：0.002s
B组or和in的执行时间： or的执行时间为：0.006s     in的执行时间为：0.005s  
C组or和in的执行时间： or的执行时间为：0.008s     in的执行时间为：0.008s
D组or和in的执行时间： or的执行时间为：0.021s     in的执行时间为：0.020s  
```

>> 第三种情况，ID列没有索引的情况，4组测试执行计划一样，执行的时间有很大的区别。

```txt
A组or和in的执行时间： or的执行时间为：5.016s      in的执行时间为：5.071s
B组or和in的执行时间： or的执行时间为：1min 02s     in的执行时间为：5.018s
C组or和in的执行时间： or的执行时间为：1min 55s     in的执行时间为：5.018s
D组or和in的执行时间： or的执行时间为：6min 17s     in的执行时间为：5.057s
```

**结论：从上面的测试结果，可以看出如果in和or所在列有索引或者主键的话，or和in没啥差别，执行计划和执行时间都几乎一样。如果in和or所在列没有索引的话，性能差别就很大了。在没有索引的情况下，随着in或者or后面的数据量越多，in的效率不会有太大的下降，但是or会随着记录越多的话性能下降非常厉害，从第三种测试情况中可以很明显地看出了，基本上是指数级增长。因此在给in和or的效率下定义的时候，应该再加上一个条件，就是所在的列是否有索引或者是否是主键。如果有索引或者主键性能没啥差别，如果没有索引，性能差别不是一点点！** 


## 模糊查询like

---

> `模糊查询`又被称为`模糊匹配`，在实际开发中使用较多，比如：**`查询公司中所有姓张的`，查询岗位中`带有经理两个字的职位`等等，这些都需要使用`模糊查询`**。

>> 模糊查询的`语法格式`如下：

```sql
select .. from .. where 字段 like '通配符表达式';
```

> 在模糊查询中，通配符主要包括两个：一个是`%`，一个是下划线`_`。其中`%`代表`任意多个字符`。`下划线_`代表`任意一个字符`。

> 案例1：查询员工名字以'S'开始的员工姓名

```sql
select ename from emp where ename like 'S%';
```

```sql
mysql> select ename from emp where ename like 'S%';
+-------+
| ename |
+-------+
| SMITH |
| SCOTT |
+-------+
2 rows in set (0.01 sec)
```

> 案例2：查询`员工名字以'T'结尾`的`员工姓名`

```sql
select ename from emp where ename like '%T';
```

```sql
mysql> select ename from emp where ename like '%T';
+-------+
| ename |
+-------+
| SCOTT |
+-------+
1 row in set (0.00 sec)
```

> 案例3：查询员工名字中含有'O'的员工姓名

```sql
select ename from emp where ename like '%O%';
```

```sql
mysql> select ename from emp where ename like '%O%';
+-------+
| ename |
+-------+
| JONES |
| SCOTT |
| FORD  |
+-------+
3 rows in set (0.00 sec)
```

> 案例4：查询`员工名字中第二个字母是'A'`的`员工姓名`

```sql
select ename from emp where ename like '_A%';
```

```sql
mysql> select ename from emp where ename like '_A%';
+--------+
| ename  |
+--------+
| WARD   |
| MARTIN |
| JAMES  |
+--------+
3 rows in set (0.00 sec)
```

> 案例5：查询`学员名字中含有下划线`的。

>> 执行以下`SQL语句`，先准备`测试数据`：

```sql
drop table if exists student;
create table student(
  id int,
  name varchar(255)
);
insert into student(id,name) values(1, 'susan');
insert into student(id,name) values(2, 'lucy');
insert into student(id,name) values(3, 'jack_son');
select * from student;
```

>> 查看`原始powernode表结构`：

```sql
mysql> show tables;
+---------------------+
| Tables_in_powernode |
+---------------------+
| dept                |
| emp                 |
| salgrade            |
+---------------------+
3 rows in set (0.01 sec)
```

>> 创建`student表`：

```sql
mysql> drop table if exists student;
Query OK, 0 rows affected, 1 warning (0.01 sec)

mysql> create table student(
    ->   id int,
    ->   name varchar(255)
    -> );
Query OK, 0 rows affected (0.05 sec)

mysql> insert into student(id,name) values(1, 'susan');
Query OK, 1 row affected (0.01 sec)

mysql> insert into student(id,name) values(2, 'lucy');
Query OK, 1 row affected (0.01 sec)

mysql> insert into student(id,name) values(3, 'jack_son');
Query OK, 1 row affected (0.01 sec)
```

>> 查看`student表`中的数据：

```sql
mysql> select * from student;

+------+----------+
| id   | name     |
+------+----------+
|    1 | susan    |
|    2 | lucy     |
|    3 | jack_son |
+------+----------+
3 rows in set (0.00 sec)
```

> 查询`学员名字中含有下划线的`，执行以下SQL试试：

```sql
select * from student where name like '%_%';
```

```sql
mysql> select * from student where name like '%_%';

+------+----------+
| id   | name     |
+------+----------+
|    1 | susan    |
|    2 | lucy     |
|    3 | jack_son |
+------+----------+
3 rows in set (0.00 sec)
```

> 显然这个查询结果不是我们想要的，以上SQL之所以将所有数据全部显示了，**因为`下划线代表任意单个字符`，如果你想让这个`下划线`变成一个`普通的下划线字符`**，就要使用转义字符了，在`mysql当中转义字符`是“`\`”，这个和java语言中的转义字符是一样的：

```sql
select * from student where name like '%\_%';
```

```sql
mysql> select * from student where name like '%\_%';

+------+----------+
| id   | name     |
+------+----------+
|    3 | jack_son |
+------+----------+
1 row in set (0.00 sec)
```