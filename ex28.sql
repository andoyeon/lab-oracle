set serveroutput on;

-- 1. 
-- ������(2�� ~ 9��)�� ���
declare
    v_dan number := 2;
    v_x number := 1;
begin
    loop
        v_x := 1;
        loop
            dbms_output.put_line(v_dan || ' x ' || v_x || ' = ' || (v_dan * v_x));
            v_x := v_x + 1;
            exit when v_x = 10;
        end loop;
        
        dbms_output.put_line('---------------');
        v_dan := v_dan + 1;
        exit when v_dan = 10;
    end loop;
end;
/


declare
    dan number;
    n   number;
begin
    dan := 2;  -- ������ 2�ܺ��� ����
    while dan < 10 loop
        dbms_output.put_line(dan || '��');
        
        -- �ش� ��(2��, 3��, ..., 9��) ���
        n := 1;
        while n < 10 loop
            dbms_output.put_line(dan || ' x ' || n || ' = ' || (dan * n));
            n := n + 1;
        end loop;
        
        dbms_output.put_line('---------------');
        dan := dan + 1;   
    end loop;
end;
/

begin
    for dan in 2..9 loop
        dbms_output.put_line(dan || '��');
        
        for n in 1..9 loop
            dbms_output.put_line(dan || ' x ' || n || ' = ' || (dan * n));
        end loop;
        
        dbms_output.put_line('---------------');
    end loop;
end;
/


-- 2. 
-- ������(2�� ~ 9��)�� ���.
-- 2���� 2x2����, 3���� 3x3����, 4���� 4x4����, ...
begin
    for dan in 2..9 loop
        dbms_output.put_line(dan || '��');
        
        for n in 1..9 loop
            dbms_output.put_line(dan || ' x ' || n || ' = ' || (dan * n));
            exit when dan = n;
        end loop;
        
        dbms_output.put_line('--------------');
    end loop;
end;
/


begin
    for dan in 2..9 loop
        dbms_output.put_line(dan || '��');
        
        for n in 1..dan loop
            dbms_output.put_line(dan || ' x ' || n || ' = ' || (dan * n));
        end loop;
        
        dbms_output.put_line('--------------');
    end loop;
end;
/



-- dbms_random.value(x, y) �Լ��� x���� ũ�ų� ����, y���� ���� ����(������ ����)�� �����մϴ�.
-- x <= r < y
select dbms_random.value(0, 1) from dual;  -- 0 <= r < 0.99999...
select dbms_random.value(0, 2) from dual;  -- 0 <= r < 1.99999...
select trunc(dbms_random.value(0, 2), 0) from dual;  -- r = 0 or 1

-- 3. �������� ���� �������� �ո�� �޸��� ���� Ȯ���� 1/2���� �����ϼ���.
-- (1) dbms_random.value(x, y) �Լ��� ����ؼ� 0 �Ǵ� 1�� �������� ����ϴ� PL/SQL�� �ۼ��ϼ���.
-- (2) (1)���� �ۼ��� �ڵ带 �����ؼ�, 
-- ������ 0�̸� '���� �ո�(head)', 1�̸� '���� �޸�(tail)'�̶�� ����ϴ� PL/SQL�� �ۼ��ϼ���.
-- (3) 0 �Ǵ� 1�� �����ϰ� ����� ����((1) �ڵ�)�� 1000�� �ݺ��ؼ�, 0�� 1�� �߻� Ƚ���� �����ϰ�,
-- 0�� ���� Ƚ�� / ��ü Ƚ��, 1�� ���� Ƚ�� / ��ü Ƚ�� �� ���
declare
    v_trials constant number := 10000;  -- ����(�ݺ�) Ƚ��
    v_coin number;  -- ������ ��/�޸�(0 �Ǵ� 1)�� ������ ����
    -- ������ �ո��� ��(v_coin = 0) ī��Ʈ�� 1 ������ų ����
    v_head number := 0;  
    -- ������ �޸��� ��(v_coin = 1) ī��Ʈ�� 1 ������ų ����
    v_tail number := 0;  
begin
    for i in 1..v_trials loop
        v_coin := trunc(dbms_random.value(0, 2), 0);
        -- dbms_output.put_line(v_coin);
        if v_coin = 0 then
            -- dbms_output.put_line('head');
            v_head := v_head + 1;
        else
            -- dbms_output.put_line('tail');
            v_tail := v_tail + 1;
        end if;
    end loop;
    
    dbms_output.put_line('�ո�: ' || v_head || ', Ȯ��=' || (v_head / v_trials));
    dbms_output.put_line('�޸�: ' || v_tail || ', Ȯ��=' || (v_tail / v_trials));
end;
/


-- 4. ����ī���� �˰����� �̿��� pi�� �ٻ簪(3.141592...) ���
-- (1) dbms_random.value() �Լ��� ����ؼ�, 2���� ��ǥ���(x-y) ���� ���� ��ǥ (x, y)�� �������� ����.
-- ��, 0 <= x < 1, 0 <= y < 1
-- (2) sqrt(x ** 2 + y ** 2) < 1�� �����ϸ� v_hit ������ ���� 1 ����
-- (3) (1), (2)�� ������ 1000�� �ݺ�
-- (4) (v_hit / 1000) * 4�� ����� ���� ���

declare
    x number;  -- x��ǥ�� ���� ������ ����
    y number;  -- y��ǥ�� ���� ������ ����
    -- ���������� �Ÿ��� 1 �̸��� ��� 1�� ������ų ����
    hit number := 0;
    trials constant number := 10000;
    pi number;
begin
    for i in 1..trials loop
        x := dbms_random.value(0, 1);
        y := dbms_random.value(0, 1);
        -- dbms_output.put_line(x || ', ' || y);
        if sqrt(x ** 2 + y ** 2) < 1 then
            hit := hit + 1;
        end if;
        -- dbms_output.put_line(hit);
    end loop;
    
    dbms_output.put_line('hit = ' || hit);
    pi := (hit / trials) * 4;
    dbms_output.put_line('pi = ' || pi);
end;
/









