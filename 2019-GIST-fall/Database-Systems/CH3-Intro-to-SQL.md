# CH3 Intro to SQL

## Create table

```sql
create talbe r(A_iD_i,
              (integrity-constraint_i),
              ...,
              )
```

- r : name of the relation
- A_i : attribute name in the schema of relation r
- D_i : the date type of values in the domain of attribute A_i

example)

```sql
create table instructor (
	ID			char(5),
    name		varchar(20) not null
    dept_name	varchar(20),
    salary		numeric(8,2))
)
insert into instructor values('10211', 'Smith', 'Bilogy', 66000);
insert into instructor values('10211', null, 'Biology', 66000);
```

### Integrity Constraints in Create Table

- Not null
- Primary key(A_1, ..., A_n)
  - Example : Declare dept_name as the primary key for department
  - ***Primary key*** declaration on an attribute automatically ***ensures not null***
- Foreign key(A_m, ..., A_n) references r
  - The values of attributes (A_m, ..., A_n) for any tuple in the relation must ***correspond to values of the primary key attribute of some tuple in relation r***
  - Example : Declare dept_name as the foreign key for instructor. For each instructor tuple, the department name specified in the tuple must exist in the primary key attribute (dept_name) of the department relation.

```sql
create table instructor (
    ID		char(5),
    name	varchar(20) not null,
    dept_name	varchar(20),
    salary	numeric(8,2),
    primary key(ID),
	foreign key(dept_name) reference department
)

create table course (
	course_id	varchar(8) primary key,
    title		varchar(50),
    dept_name	varchar(20),
    credits		numberic(2,0),
    foreign key(dept_name) reference department);
```

## Drop, delete, Alter

- drop table *Name*
  - Deletes the table and its contents
- delete from *Name*
  - Deletes all contents of table, but retains table
- alter table
  - alter table r add A D
    - Where A is the name of the attribute to be added to relation r and D is the domain of A.
    - All tuples in the relation are assigned ***null*** as the value for the new attribute.
  - alter table r drop A
    - where A is the name of an attribute of relation r
    - Dropping of attributes not supported by many databases

## Basic Query Structure

- The SQL ***data-manipulation language (DML)*** provides the ability to query information, and insert, delete and update tuples
- A typical SQL query has the form:

```sql
select A_1, A_2, ..., A_n
from r_1, r_2, ..., r_m
where P
```

- A_i represents an attribute
- r_i represents a relation
- P is a predicate
- The result of an SQL query is a relation

### The select Clause

- The select clause list the attributes desired in the result of a query

```sql
select name
from instructor
```

- SQL names are case insensitive (i.e., You may use upper- or lower-case letters)
  - e.g. Name = NAME = name
- SQL allows duplicates in relations as well as in query results.
- To force the elimination of duplicates, insert the keyword `distinct` after select.
- Find the names of all departments with instructor, and remove duplicates

```sql
select distinct dept_name
from instructor
```

- The keyword `all` specifies that duplicates not be remved

```sql
select all dept_name
from instructor
```

- An asterisk in the select clause denotes "all attributes"

```sql
select *
from instructor
```

- The `select` clause can contain arithmetic expressions involving the operation, +, -, * and /, and operating on constants or attributes of tuples

```sql
select ID, name, salary/12
from instructor
```

### The where Clause

- The `where` clause specifies conditions that the result must satisfy
  - Corresponds to the selection predicate of the relational algebra
- To find all instructors in Comp. Sci. dept with salary > 80000

```sql
select name
from instructor
where dept_name = 'Comp.Sci.' and salary > 8000
```

- Comparison results can be combined using the logical connectives `and`, `or`, and `not`
- Comparisons can be applied to results of arithmetic expressions

### The from Clause

- The `from` clause lists the relations involved in the query
  - Corresponds to the Cartesian product operation of the relational algebra
- Find the Cartesian product instructor X teaches

```sql
select *
from instructor, teaches
```

- Generates every possible instructor - teaches pair, with all attributes from both relations
- Cartesian product not very useful directly, but ***useful combined with where-clause condition ***(selection operation in relational algebra)

### Joins

- For all instructors who have taught some course, find their names and the course ID of the courses they taught

```sql
select name, course_id
from instructor, teaches
where instructor.ID = teaches.ID
```

- Find the course ID, semester, year and title of each course offered by the Comp. Sci. department

```sql
select section.course_id, semester, year, title
from section, course
where section.course_id = course.course_id and dept_name = 'Comp.Sci.'
```

### Natural Join

- natural join matches tuples with the same values for all common attributes, and retains only one copy each common column

```sql
select *
from instructor natural join teaches;
```

- Danger in natural join : beware of unrelated attributes with same name which get equated incorrectly
- List the names of instructors along with the titles of courses that they teach

Incorrect version(makes course.dept_name = instructor.dept_name)

```sql
select name, title
from instructor natural join teaches natural join course;
```

correct version

```sql
select name, title
from instructor natural join teaches, course
where teaches.course_id = course.course_id;
```

Another correct version

```sql
select name, title
from (instructor natural join teaches) join course using (coourse_id)
```

### The Rename Operation

- Rename이 아니라 nickname 같은 느낌인듯?
- The SQL allows renaming relations and attributes using the as clauses:

```sql
old-name as new-name
```

Example)

```sql
select ID, name, salary/12 as monthly_salary
from instructor
```

- Fine the names of all instructors who have a higher salsry than some instructor in 'Comp. Sci'

```sql
select distinc T.name
from instructor as T, instructor as S
where T.salary > S.salary and S.dept_name = 'Comp. Sci.'
```

- Keyword as is optional and may be omitted

```sql
instructor as T = instructor R
```

- keyword as must be omitted in Oracle

### String Operation

- SQL includes a string-matching operator for comparisons on character strings. The operator "like" uses patterns that are described using two special characters:
  - percent(%) : The % character matches any substring
  - underscore(_) : The _ character matches any character
- Find the names of all instructors whose name includes the substring "dar"

```sql
select name
from instructor
where name like '%dar%'
```

### Ordering the Display of Tuples

- List in alphabetic order the names of all instructors

```sql
select distinct name
from instructor
order by name
```

- We may specify desc for descending or asc for ascending order, for each attribute; ascending order is the default

```sql
order by name desc
```

- Can sort on multiple attributes

```sql
order by dept_name, name
```

### Set Operation

- union
- intersect
- except

### Null Values

- It is possible for tuples to have a null value, denoted by null, for some of their attributes

```sql
select name
from instructor
where salary is null
```

