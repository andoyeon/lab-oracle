-- ���ڵ� & �÷���
/*
-- ���ڵ�(record): ������ Ÿ���� ���� �ٸ� �������� ��(������)���� ������ �� ���
-- ���ڵ� ���� ���:
type ���ڵ��̸� is record (
     �����̸� ����Ÿ��,
     ...
);
-- ���ڵ忡 ���� ����:
���ڵ�.�ʵ� := ��;
*/

set serveroutput on;

declare 
    -- ���ڵ� ����
    type rec_dept is record (
        deptno number,
        dname varchar2(20),
        loc varchar2(20)
    );
    
    -- ���ڵ��� �̸��� ������ ������ �� ���
    v_dept_row rec_dept;  -- �����̸� Ÿ��;
begin
    -- ���ڵ� ������ ���� ����
    v_dept_row.deptno := 99;
    v_dept_row.dname := 'ITWILL';
    v_dept_row.loc := '���� ����';
    
    -- ���ڵ� ������ ���� �о�� ��: ���ڵ庯��.�ʵ� 
    dbms_output.put_line('��ȣ: ' || v_dept_row.deptno);
    dbms_output.put_line('�̸�: ' || v_dept_row.dname);
    dbms_output.put_line('��ġ: ' || v_dept_row.loc);
end;
/

select * from dept2;

-- dept2 ���̺� ���ڵ带 insert
declare
    type rec_dept is record (
        deptno  dept2.deptno%type,
        dname   dept2.dname%type,
        loc     dept2.loc%type
    );
    num1 number;
    num2 number;
    v_row rec_dept;
    v_row2 rec_dept;
begin
    v_row.deptno := 11;
    v_row.dname := '�����ͺ��̽�';
    v_row.loc := 'Seoul';
    
    -- dept2 ���̺� v_row ���ڵ带 ����(insert)
--    insert into dept2
--    values (v_row.deptno, v_row.dname, v_row.loc);
    insert into dept2 values v_row;
    
    -- ���ڵ� Ÿ���� ������ ����� dept2 ���̺� update
    -- update dept2 set deptno = ?, dname = '', loc = '' where deptno = 11;
    v_row.deptno := 99;
    v_row.dname := 'PL/SQL';
    v_row.loc := '����';
    update dept2 set row = v_row where deptno = 11;
end;
/
select * from dept2;

declare
    -- row Ÿ�� ���� ���� ����
    v_row1 dept%rowtype;
    -- ���̺��� ����(�÷� �̸�/Ÿ��)�� �Ȱ��� ���ڵ� Ÿ��
begin
    v_row1.deptno := 22;
    v_row1.dname := 'ABC';
    v_row1.loc := 'Korea';
    
    insert into dept2 values v_row1;
end;
/

-- ���ڵ带 ����� select
declare
    -- ���̺��� ��� �÷��� �˻��ϴ� ��쿡��
    -- ���ڵ带 ���� �����ϴ� �ͺ��� %rowtype ������ ����ϴ� ���� ����.
    v_emp_row1 emp%rowtype;
    
    -- ���̺��� �Ϻ� �÷��� �˻��ϰų�, �ΰ� �̻��� ���̺��� �����ϴ� ��쿡��
    -- ����� ���� ���ڵ带 �����ϴ� �� ����.
    type rec_emp is record (
        empno   emp.empno%type,
        ename   emp.ename%type,
        job     emp.job%type
    );
    v_emp_row2 rec_emp;
begin
    -- ���̺��� ��ü �÷� �˻�
    select * into v_emp_row1 from emp where empno = 7788;
    dbms_output.put_line(v_emp_row1.empno || ', ' || v_emp_row1.ename);
    
    -- ���̺��� �Ϻ� �÷��� �˻�
    select empno, ename, job into v_emp_row2
    from emp
    where empno = 7839;
    dbms_output.put_line(v_emp_row2.empno || ', ' 
                    || v_emp_row2.ename || ', '
                    || v_emp_row2.job);
end;
/


-- emp ���̺�� dept ���̺���
-- ���, �̸�, �޿�, �μ� �̸�, �μ� ��ġ
-- �������� ������ �� �ִ� ���ڵ�(emp_dept)�� ����
-- ����(join) ������ �ۼ��ؼ� SCOTT�� ������ ����ϴ� PL/SQL
declare
    type emp_dept is record (
        empno   emp.empno%type,
        ename   emp.ename%type,
        sal     emp.sal%type,
        dname   dept.dname%type,
        loc     dept.loc%type
    );
    v_row emp_dept;
begin
    select e.empno, e.ename, e.sal, d.dname, d.loc
    into v_row
    from emp e join dept d
    on e.deptno = d.deptno
    where e.ename = 'SCOTT';
    
    dbms_output.put_line(v_row.empno || ', '
                    || v_row.ename || ', '
                    || v_row.sal || ', '
                    || v_row.dname || ', '
                    || v_row.loc);
end;
/


-- emp ���̺�� salgrade ���̺���
-- ���, �̸�, �޿�, �޿� ��� 
-- 4���� �������� ������ �� �ִ� ���ڵ�(emp_sal)�� ����
-- ����(join) ������ �ۼ��ؼ� SCOTT�� ������ ����ϴ� PL/SQL
declare
    type emp_sal is record (
        empno   emp.empno%type,
        ename   emp.ename%type,
        sal     emp.sal%type,
        grade   salgrade.grade%type
    );
    v_row emp_sal;
begin
    select e.empno, e.ename, e.sal, s.grade
    into v_row
    from emp e join salgrade s
    on e.sal between s.losal and s.hisal
    where e.ename = 'SCOTT';
    
    dbms_output.put_line(v_row.empno || ', '
                    || v_row.ename || ', '
                    || v_row.sal || ', '
                    || v_row.grade);
end;
/










