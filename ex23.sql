set SERVEROUTPUT ON;

accept p_name prompt '�̸� �Է��ϼ���...';
begin
    dbms_output.put_line('&p_name');
end;
/

-- �̸��� �Է� �޾Ƽ�
-- ���, �μ���ȣ�� �˻��ؼ�
-- ���, �̸�, �μ���ȣ�� ���
accept p_name prompt '�̸� �Է��ϼ���...';
declare
    v_empno number(4); -- ����� ������ ����
    v_deptno number(2); -- �μ� ��ȣ�� ������ ����
    v_ename varchar2(100) := upper('&p_name'); -- �Է¹��� �̸�(���ڿ�)�� ������ ���� 
begin
    select empno, deptno into v_empno, v_deptno
    from emp
    where upper(ename) = v_ename;
    
    dbms_output.put_line('���: ' || v_empno);
    dbms_output.put_line('�̸�: ' || v_ename);
    dbms_output.put_line('�μ� ��ȣ: ' || v_deptno);
end;
/


-- �̸��� �Է� �޾Ƽ�
-- emp, dept ���̺��� ����ؼ�(JOIN)
-- 'SCOTT�� DALLAS�� RESEARCH�μ����� �ٹ��մϴ�.'�� ���� �������� ���
accept p_name prompt '�̸� �Է��ϼ���...';
declare
    v_ename varchar2(100) := '&p_name';  -- �Է¹��� �̸��� �����ϴ� ����
    v_loc varchar2(13);  -- �μ� ��ġ(loc)�� ������ ����
    v_dname varchar2(14);  -- �μ� �̸��� ������ ����
begin
    select d.dname, d.loc into v_dname, v_loc
    from emp e , dept d
    where e.deptno = d.deptno
            and upper(e.ename) = upper(trim(v_ename));
    
    dbms_output.put_line(v_ename || '��(��) ' ||
                        v_loc || '�� ' ||
                        v_dname || '�μ����� �ٹ��մϴ�.');
end;
/

-- �Էµ� �̸��� ��/�ҹ��ڿ� ������� ����� ����� �� �ֵ���

accept p_name prompt '�̸� �Է��ϼ���...';
declare
    v_ename varchar2(20) := upper(trim('&p_name'));
    v_dname varchar2(14);
    v_loc varchar2(13);
    v_deptno number(2);
begin
    -- ��� �̸����� �� ����� �ٹ��ϴ� �μ� ��ȣ�� �˻�
    select deptno into v_deptno from emp where upper(ename) = v_ename;
    -- �μ� ��ȣ�� ����ؼ� �μ��� �̸�, ��ġ�� �˻�
    select dname, loc into v_dname, v_loc from dept where deptno = v_deptno;
    -- �˻��� ������ ȭ�� ���
    dbms_output.put_line(v_ename || ' : ' || v_loc || ' : ' || v_dname );
end;
/








