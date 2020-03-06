/*
�÷���(collection): ���� Ÿ���� ������ �������� ������ �� ���
1) ���� �迭(associative array, index-by table)
2) ��ø ���̺�(nested table)
3) VARRAY(variable-size array)

���� �迭: key/index�� value�� ������ �����Ǵ� �÷���
���� �迭���� key/index�� 
binary_integer(����), pls_integer(���� ����), varchar2(���ڿ�) Ÿ���� ����.

���� �迭�� ����(����)�ϴ� ���:
type �迭�̸� is table of ������Ÿ�� index by �ε���Ÿ��;
*/

set serveroutput on;

declare
    -- ���ڿ��� ���ҷ� ����, ���� ������ �ε����� ����ϴ� ���� �迭�� ����
    type students is table of varchar2(20) 
        index by pls_integer;
    
    -- ������ ���� �迭 Ÿ���� ���� ����
    v_stu students;
begin
    -- ���� �迭�� ������ ����: �迭�̸�(�ε���) := ��;
    v_stu(1) := '������';
    v_stu(2) := '�����';
    v_stu(3) := '�迵��';
    
    -- ���� �迭�� ����� ����(������)�� ���� ���� ��: �迭�̸�(�ε���)
    -- dbms_output.put_line(v_stu(1));
    for i in 1..3 loop
        dbms_output.put_line(i || ':' || v_stu(i));
    end loop;
end;
/

declare
    -- �ε��� Ÿ��: varchar2(20), ������ Ÿ��: number�� ���� �迭�� ����(����)
    type arr_menu is table of number index by varchar2(20);
    
    -- ���� �迭 Ÿ���� ������ ����
    v_menu arr_menu;
begin
    -- ���� �迭�� �����͸� 3�� ����
    v_menu('¥���') := 1000;
    v_menu('����') := 5000;
    v_menu('�Ľ�Ÿ') := 3000;
    
    -- ���� �迭�� ����� �����͸� ���
    DBMS_OUTPUT.PUT_LINE(v_menu('¥���'));
    DBMS_OUTPUT.PUT_LINE(v_menu('����'));
    DBMS_OUTPUT.PUT_LINE(v_menu('�Ľ�Ÿ'));
end;
/

declare
    -- �ε���: ���� ����, ����(������ Ÿ��): ������ ���� �迭(arr_numbers)�� ����(����)
    type arr_numbers is table of number index by pls_integer;
    -- ���� �迭 Ÿ���� ����(v_scores)�� ����
    v_scores arr_numbers;
    v_sum number; -- �������� �հ踦 ������ ����
    v_avg number; -- �������� ����� ������ ����
begin
    -- ���� �迭 v_scores�� 5���� ����(0 ~ 100)�� �Է�
    v_scores(1) := 90;
    v_scores(2) := 80;
    v_scores(3) := 70;
    v_scores(4) := 90;
    v_scores(5) := 80;
    -- 5�� ������ �հ踦 ����ؼ� ���
    -- v_sum := v_scores(1) + v_scores(2) + v_scores(3) + v_scores(4) + v_scores(5);
    v_sum := 0;
    for i in 1..v_scores.count loop
        v_sum := v_sum + v_scores(i);
    end loop;
    dbms_output.put_line('sum = ' || v_sum);
    -- 5�� ������ ����� ����ؼ� ���
    v_avg := v_sum / v_scores.count;
    dbms_output.put_line('avg = ' || v_avg);
end;
/

select sum(sal), avg(sal), variance(sal), stddev(sal) from emp;
-- emp ���̺��� �޿��� ����, ���, �л�, ǥ�������� ����ϴ� PL/SQL
declare
    v_sum number;
    v_avg number;
    v_var number;
    v_std number;
begin
    select sum(sal), avg(sal), variance(sal), stddev(sal) 
    into v_sum, v_avg, v_var, v_std
    from emp;
    
    dbms_output.put_line(trunc(v_sum, 2));
    dbms_output.put_line(trunc(v_avg, 2));
    dbms_output.put_line(trunc(v_var, 2));
    dbms_output.put_line(trunc(v_std, 2));
end;
/

-- �÷��� �޼ҵ�:
-- �迭 ���� �̸�.count: �迭�� ������ ���� (��. v_scores.count)
-- �迭 ���� �̸�.first: �迭�� ù��° �ε��� (��. v_scores.first)
-- �迭 ���� �̸�.last: �迭�� ������ �ε��� (��. v_scores.last)

-- �ε����� ���� ����, �迭�� ����(������)�� ���� Ÿ���� ���� �迭�� ����
-- ����(dbms_random.value(x, y)) �Լ��� trunc() �Լ��� ���
-- for loop�� ����ؼ� ���� �迭�� 10���� ���� ����(0 ~ 100)�� ����
-- 10�� ���� ������ ����, ���, �л�, ǥ������, �ִ�, �ּڰ��� ����ϴ� ���� ����
-- power(x, y) = x ** y, sqrt(x)
-- ���̺� 10���� ���� ������ insert
-- select sum(score), avg(score), variance(score), stddev(score), max(score), min(score) from ex_scores;
-- ����� ����� SQL�� �̿��� ����� ���� �� ��
create table ex_scores (
    sid number primary key,
    score number not null
);

declare
    -- ���� �迭 ����(����)
    type arr_numbers is table of number index by pls_integer;
    -- �迭�� ������ ���� ������ ���� - ����� ����
    v_cnt constant number := 10;
    -- �������� ���� �������� ������ �� �ִ� ���� ����
    v_scores arr_numbers;
    -- ���� �������� ��� ��跮(descriptive statistics) ������
    v_sum number;  -- ����
    v_avg number;  -- ���
    v_var number;  -- �л�
    v_std number;  -- ǥ�� ����
    v_max number;  -- �ִ�
    v_min number;  -- �ּڰ�
    v_ss number; -- sum of squares
begin
    -- 10���� ������ �����ؼ� ���� �迭�� ����
    for i in 1..v_cnt loop
        v_scores(i) := trunc(dbms_random.value(0, 101), 0);
    end loop;
    
    -- ���� �迭�� ����� �������� Ȯ�� 
    for i in 1..v_scores.count loop
        dbms_output.put_line(i || ' : ' || v_scores(i));
    end loop;
    
    -- ex_scores ���̺� ������ �������� insert
    delete from ex_scores; -- ���̺� �����Ͱ� �ִٸ� ���� ����
    for i in 1..v_scores.count loop
        insert into ex_scores(sid, score) values(i, v_scores(i));
    end loop;
    commit;
    
    -- SQL���� �����ϴ� �Լ���(sum, avg, variance, ....)�� �̿��ؼ� ���� ��跮�� ã��
    select sum(score), avg(score), variance(score), 
            stddev(score), max(score), min(score)
    into v_sum, v_avg, v_var, v_std, v_max, v_min
    from ex_scores;
    
    -- ��� ��跮 Ȯ�� 
    dbms_output.put_line('�հ�: ' || v_sum);
    dbms_output.put_line('���: ' || v_avg);
    dbms_output.put_line('�л�: ' || v_var);
    dbms_output.put_line('ǥ������: ' || v_std);
    dbms_output.put_line('�ִ�: ' || v_max);
    dbms_output.put_line('�ּڰ�: ' || v_min);
    
    dbms_output.put_line('=================================');
    v_sum := 0;
    for i in v_scores.first .. v_scores.last loop
        v_sum := v_sum + v_scores(i);
    end loop;
    dbms_output.put_line('�հ�: ' || v_sum);
    
    v_avg := v_sum / v_scores.count;
    dbms_output.put_line('���: ' || v_avg);
    
    v_ss := 0;
    for i in 1 .. v_scores.count loop
        v_ss := v_ss + (v_avg - v_scores(i)) ** 2;
    end loop;
    v_var := v_ss / (v_scores.count - 1);
    dbms_output.put_line('�л�: ' || v_var);
    
    v_std := sqrt(v_var);
    dbms_output.put_line('ǥ������: ' || v_std);
    
    -- �ִ� ã��
    v_max := v_scores(1);
    for i in 2 .. v_scores.count loop
        if v_scores(i) > v_max then
            v_max := v_scores(i);
        end if;
    end loop;
    dbms_output.put_line('�ִ�: ' || v_max);
    
    -- �ּڰ� ã��
    v_min := v_scores(1);
    for i in 2 .. v_scores.count loop
        if v_scores(i) < v_min then
            v_min := v_scores(i);
        end if;
    end loop;
    dbms_output.put_line('�ּڰ�: ' || v_min);
end;
/










