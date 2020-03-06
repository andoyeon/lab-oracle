-- ���� ���� 2
/*
1.
create table ���̺��̸� (
    �÷��̸�1 ������Ÿ�� constraint ���������̸� �������ǳ���, 
    �÷��̸�2 ������Ÿ�� constraint ���������̸� �������ǳ���,
    ...
);


2.
create table ���̺��̸� (
    �÷��̸�1 ������Ÿ��,
    �÷��̸�2 ������Ÿ��,
    ...,
    constraint ���������̸� �������ǳ���,
    constraint ���������̸� �������ǳ���,
    ...
);

(����) not null ���� ������ 1�� ����� ����
*/

create table ex08 (
    col1 number,
    col2 number,
    constraint uq_ex8 unique (col2),
    constraint pk_ex08 primary key (col1)
);

create table ex09 (
    col1 varchar2(10),
    constraint nn_ex09 not null (col1)
);

create table ex_emp2 (
    empno number constraint pk_ex_emp2 primary key,
    ename varchar2(20),
    deptno number(2),
    constraint fk_ex_dept2 foreign key (deptno) references ex_dept (deptno)
);


-- �ϳ��� ���̺��� �ΰ� �̻��� �÷��� ��� PK ����
create table ex09 (
    col1 number primary key,
    col2 varchar2(20) primary key
);  -- ���̺��� ���� �Ѱ��� PK�� ���� �� �ֱ� ������ ���� �߻�

create table ex09 (
    col1 number,
    col2 varchar2(20),
    constraint pk_ex09 primary key (col1, col2)
);
insert into ex09 values(1, 'a');
insert into ex09 values(1, 'b');
insert into ex09 values(2, 'a');
insert into ex09 values(100, null);
select * from ex09;

insert into ex_dept values(30, '�λ��');
-- insert ~ select ����:
-- �ٸ� ���̺��� select�� ������ ���̺� insert�ϴ� ���
insert into ex_emp2 (empno, ename, deptno)
select empno, ename, deptno from emp;

select * from ex_emp2;
select e.empno, e.ename, e.deptno, d.dname
from ex_emp2 e join ex_dept d
        on e.deptno = d.deptno;
        
-- ���̺� ����: ���̺��� ������ �� �ٸ� ���̺��� ������ ����Ʈ�� �״�� �������� ���.
-- create ~ as select ����
create table ex_emp3
as select * from emp;

select * from ex_emp3;

create table ex_emp4
as select * from emp where deptno = 10;

select * from ex_emp4;

select * from emp where 1 != 1;
create table ex_emp5
as select * from emp where 1 != 1;
select * from ex_emp5;














