-- ���� -> SQL��ũ��Ʈ(Alt+F10): �� ��ũ��Ʈ(����) ����

-- ���̺��� ������ �˻�
-- 1) �÷� ���� �˻� - ��������(projection)
-- 2) ��(row)���� �˻� - �Ƿ���(selection)

-- select �÷��̸�1, �÷��̸�2, ... from ���̺��̸�;
-- ��� ���̺�(emp)���� ���(empno)�� ����̸�(ename)�� �˻�
select empno, ename from emp;
-- ��� ���̺��� ���, �̸�, �Ի糯¥, �޿��� �˻� 
select empno, ename, hiredate, sal from emp;

select ename, empno from emp;

-- ���̺��� ��� �÷��� �˻��� ��: select * from ���̺��̸�;
select * from emp;

-- select �÷��̸� as ����, ... from ���̺� �̸�;
select empno as ���, ename as �̸�
from emp;

-- ��� ���̺��� ���, �̸�, �޿�(sal), ����(sal * 12)�� �˻�
select empno, ename, sal, sal * 12 as ANNUAL_SAL
from emp;
-- ����(comm)�� ������ 1�� ������ ����ؼ� ���
select empno, ename, sal, 
       sal * 12 + comm as ANNUAL_SAL
from emp;


-- ��� ���̺��� ��å(job)�� �˻�
select job from emp;

-- �ߺ��� ���� ���� �����ϰ� �˻�
select distinct job from emp;

select job, deptno from emp;
select distinct job, deptno from emp;
-- select job, distinct deptno from emp;  -- ������ �߻��ϴ� ����

