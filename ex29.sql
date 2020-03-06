-- ���ǹ�, �ݺ��� ���� 

set serveroutput on;

begin
    dbms_output.put_line('hello');
    dbms_output.put_line('world');
    dbms_output.put('hello');
    dbms_output.put('world');
    dbms_output.new_line;
end;
/

-- ȭ�鿡 ***** ���
begin
    -- (1)
--    dbms_output.put_line('*****');
    
    -- (2)
--    dbms_output.put('*');
--    dbms_output.put('*');
--    dbms_output.put('*');
--    dbms_output.put('*');
--    dbms_output.put('*');
--    dbms_output.new_line;

    -- (3)
    for i in 1..5 loop
        dbms_output.put('*');
    end loop;
    dbms_output.new_line;
end;
/

/*
�Ʒ��� ���� ����ϴ� PL/SQL�� �ۼ��Ͻÿ�.
*
**
***
****
*****

�Ʒ��� ���� ����ϴ� PL/SQL�� �ۼ��Ͻÿ�.
*****
****
***
**
*

*/

begin
    for i in 1..5 loop
        for j in 1..i loop
            dbms_output.put('*');
        end loop;
        dbms_output.new_line;
        
    end loop;
end;
/

begin
    for i in 1..5 loop
        for j in i..5 loop
            dbms_output.put('*');
        end loop;
        dbms_output.new_line;
        
    end loop;
end;
/

declare
    i number;
    j number;
begin 
    i := 1;
    loop
        j := 1;
        loop
            dbms_output.put('*');
            j := j + 1;
            exit when j > i;
        end loop;
        dbms_output.new_line();
        
        i := i + 1;
        exit when i > 5;
    end loop;
end;
/


/*
�Ʒ��� ���� ����ϴ� PL/SQL
1 2 3 4 5 6 7 8 9 10
11 12 13 14 15 16 17 18 19 20
21 22 23 24 25 26 27 28 29 30
...
91 92 93 94 95 96 97 98 99 100
*/
begin
    for x in 1..100 loop
        -- dbms_output.put(x || ' ');
        dbms_output.put(rpad(x, 4, ' '));
        if mod(x, 10) = 0 then
            dbms_output.new_line();
        end if;
    end loop;
    
    dbms_output.new_line();
end;
/




/*
�Ʒ��� ���� ����ϴ� PL/SQL
1  2  *  4  5  *  7  8  *  10
11 12 *  14 15 *  17 18 *  20
21 22 *  24 25 *  27 28 *  *
*  *  #  *  *  #  *  *  #  40
...
*  *  #  *  *  #  *  *  #  100
*/

declare
    n1 number; -- 1�� �ڸ� ���ڸ� ������ ����
    n10 number; -- 10�� �ڸ� ���ڸ� ������ ���� 
begin
    for x in 1..100 loop
        -- 1�� �ڸ� ���ڴ� x�� 10���� ���� ������ 
        n1 := mod(x, 10);
        -- 10�� �ڸ� ���ڴ� x�� 10���� ���� ��
        n10 := trunc(x / 10, 0);
        
        if n1 in (3, 6, 9) and n10 in (3, 6, 9) then
        -- 1�� �ڸ����� 3, 6, 9 �̰� 10�� �ڸ����� 3, 6, 9 �̸�
            dbms_output.put('# ');
        elsif n1 in (3, 6, 9) or n10 in (3, 6, 9) then
        -- 1�� �ڸ����� 3, 6, 9 �̰ų� �Ǵ� 10�� �ڸ����� 3, 6, 9 �̸�
            dbms_output.put('* ');
        else 
            dbms_output.put(x || ' ');
        end if;
        
        if mod(x, 10) = 0 then
            dbms_output.new_line();
        end if;
    end loop;
    dbms_output.new_line();
end;
/

declare
    num number;
begin
    for x in 0..9 loop  -- x�� 10�� �ڸ� ���� 
        for y in 0..9 loop  -- y�� 1�� �ڸ� ����
            num := x * 10 + y;
            
            if x in (3, 6, 9) and y in (3, 6, 9) then
                dbms_output.put('# ');
            elsif x in (3, 6, 9) or y in (3, 6, 9) then
                dbms_output.put('* ');
            else 
                dbms_output.put(num || ' ');
            end if;
        end loop;
        dbms_output.new_line();
        
    end loop;
end;
/

declare
    num number;
begin
    for x in 0..9 loop
        for y in 1..10 loop
            num := x * 10 + y;
            
            if num in (30, 60, 90) then
                dbms_output.put('* ');
            elsif x in (3, 6, 9) and y in (3, 6, 9) then
                dbms_output.put('# ');
            elsif x in (3, 6, 9) and y!= 10 or y in (3, 6, 9) then
                dbms_output.put('* ');
            else
                dbms_output.put(num || ' ');
            end if;
        end loop;
        dbms_output.new_line();
    end loop;
end;
/


-- factorial
-- 5! = 1 x 2 x 3 x 4 x 5
-- n! = 1 x 2 x 3 x ... x n
accept p_num prompt '���丮���� ����� ����?';
declare
    v_num number := &p_num;
    v_factorial number := 1;
begin
    for i in 1..v_num loop
        v_factorial := v_factorial * i;
    end loop;
    dbms_output.put_line(v_factorial);
end;
/












