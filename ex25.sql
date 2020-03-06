/* ���ǹ�(Conditional Statement)
(1)
if ���ǽ� then
    ���ǽ��� ���� �� ������ ����;
end if;

(2)
if ���ǽ� then
    ���ǽ��� ���� �� ������ ����;
else
    ���ǽ��� ������ �� ������ ����;
end if;

(3)
if ���ǽ�1 then
    ���ǽ�1�� ���� �� ������ ����;
elsif ���ǽ�2 then
    ���ǽ�2�� ���� �� ������ ����;
elsif ...
    ...
else
    ���� ��� ������ ������ �� ������ ����;
end if;
*/


set serveroutput on;

declare
    v_num number := 122;
begin
    if mod(v_num, 2) = 1 then
        dbms_output.put_line('Ȧ��');
    end if;
    
    dbms_output.put_line('End PL/SQL');
end;
/

accept p_num prompt '���ڸ� �Է��ϼ���...';
declare
    v_test number := &p_num;
begin
    if mod(v_test, 2) = 1 then
        dbms_output.put_line('odd number');
    else
        dbms_output.put_line('even number');
    end if;
    
    dbms_output.put_line('End PL/SQL');
end;
/

-- ���� ������ 90�� �̻��̸� 'A'
-- ���� ������ 80�� �̻��̸� 'B'
-- ���� ������ 70�� �̻��̸� 'C'
-- ���� ������ 70�� �̸��̸� 'F'
declare
    v_score number := 68;
begin
    if v_score >= 90 then
        dbms_output.put_line('A');
    elsif v_score >= 80 then
        dbms_output.put_line('B');
    elsif v_score >= 70 then
        dbms_output.put_line('C');
    else
        dbms_output.put_line('F');
    end if;
end;
/

-- �Է¹��� ���ڰ� 
-- 1. ¦���̸�, 'even number'��� ���
--    (1) 4�� ����̸�, '4�� ���'��� ���
--    (2) �׷��� ������, '4�� ����� �ƴմϴ�.'��� ��� 
-- 2. Ȧ���̸�, 'odd number'��� ���
accept p_num prompt '������ �Է��ϼ���...';
declare
    v_test number := &p_num;
begin
    if mod(v_test, 2) = 0 then
        dbms_output.put_line('even number');
        if mod(v_test, 4) = 0 then
            dbms_output.put_line('4�� ���');
        else
            dbms_output.put_line('4�� ����� �ƴմϴ�.');
        end if;
    else 
        dbms_output.put_line('odd number');
    end if;
end;
/

select power(5, 2) from dual;
-- �ﰢ���� �� ���� ���̸� �Է�
-- ��Ÿ��� ������ �̿��ؼ�, �����ﰢ������ �ƴ����� ���
accept a prompt '�ﰢ�� �غ��� ����?';
accept b prompt '�ﰢ���� ����?';
accept c prompt '�ﰢ�� ������ ����?';
begin
    if power(&a, 2) + power(&b, 2) = power(&c, 2) then
        dbms_output.put_line('�����ﰢ��');
    else
        dbms_output.put_line('NOT �����ﰢ��');
    end if;
end;








