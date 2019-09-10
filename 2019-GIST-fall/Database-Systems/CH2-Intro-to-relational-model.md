# CH 2: Intro to Relational Model

## Attributed Types

- Domain : The set of allowed values for each attribute is called the domain of the attribute
- Attribute values are (normally) required to be `atomic`; that is, invisible
  - The important issue is not what the domain it self is, but rather how we use domain elements in our database.

> Atomic : 더 이상 쪼개어 질 수 없음. 따라서 atomic한 transaction set은 모두 다 성공하거나 모두 다 실패해야 함. atomic은 쪼개어 질 수 없기 때문에 transaction 일부만 성공하거나 실패 할 수 없음

- The special value `null` is a member of every domain
- The `null` value causes complications in the definition of many operations

> 테이블에서 
>
> 행(row) : tuple
>
> 열(column) : attribute

## Relation Schema and instance

- $A_1, A_2, ..., A_n$ are attributes
- $R = (A_1, A_2, ..., A_n)$ is a relation schema
  - Relation schema : attribute의 집합
  - Example) instructor = (ID, name, dept_name, salary)

## Database

- A database consists of multiple relations
- Information about an enterprise is broken up into parts
- Bad design: univ(instructor-ID, name, dept_name, salary, student_id,..)
  - Repetition of information (e.g., two students have the same instructor)
  - The need for null values (e.g., represent an student with no advisor)
- Normalization theory deals with how to design good relational schemes

## Keys

- Let $K \subseteq R$
  - Key is a subset of relation schemes
- K is a `superkey` of R ***if values for K are sufficient to identify a unique tuple of each possible relation r(R)***
  - 중복이 없는 attribute의 집합을 불러오는 key
    - Example : {ID} and {ID, name} are both superkeys of instructor.
  - 테이블에서 하나의 행을 tuple이라 함
  - Superkey is used to reference subset of attribute
- Superkey K is a candidate key if K is minimal
  - Example : {ID} is a candidate key for instructor
  - 더 이상 줄일 수 없는(irreducible)형태를 가진 superkey를 candidate key라고 함
- ***One of the candidate keys is selected to be the primary key.***
  - Candidate key는 primary key로 사용 될 수 있음
  - Primary key is defined using one of candidate keys
    - Primary key is a specific choice of a minimal set of attributes that uniquely specify a tuple in a relation.

- Foreign key
  - A relation(r1) may include among its attributes the primary key of another relation(r2). This attribute is called a foreign key from r1 referencing r2.
  - Primary key에 필요한 정보를 얻기 위해 추가한 key를 foreign key라고 함
    - Example) Primary Key{A, B, C} + foreign key{D}
  - ***Constraint : Value in one relation must appear in another***

#### Relational Query language

- Procedural vs Non-procedural, or declarative
- Relational algebra : Procedural "Pure" languages

