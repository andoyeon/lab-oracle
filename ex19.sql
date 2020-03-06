-- Session, Transaction, Lock
-- SQL ����
-- DML(Data Manipluation Language): ������ ���� ���
--      insert, update, delete
-- DDL(Data Definition Language): ������ ���� ���
--      create, alter, truncate, drop
-- DQL(Data Query Language): ������ ����(����) ���. select
-- TCL(Transaction Control Language): Ʈ����� ���� ���. commit, rollback

select * from dept2;

update dept2 
set loc = '����Seoul'
where deptno = 50;
select * from dept2;

commit;

insert into dept2
values (90, 'itwill', 'gangnam');
select * from dept2;

update dept2 set loc = '����' where deptno = 10;

commit;
