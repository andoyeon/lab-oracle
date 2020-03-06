-- ��Ű�� ��(specification) �ۼ�
create or replace package my_stat
is
    -- ���� Ÿ���� �����ϰ�, �ε����� ���� ������ index-by table�� ����: NumberArray
    type NumberArray is table of number index by pls_integer;
    
    /**
     * sum: �Ķ���Ϳ� ���޹��� �迭�� �ִ� ��� ���ҵ��� ���� ����
     * @param arr   NumberArray
     */
    function sum(arr NumberArray) return number;
    
    /**
     * avg: �Ķ���Ϳ� ���޹��� �迭�� �ִ� ��� ���ҵ��� ����� ����ؼ� ����
     * @param arr   NumberArray
     * @param digit number  ���ϰ�(���)�� �Ҽ��� ���� �ڸ���, �⺻���� 3
     */
    function avg(arr NumberArray, digit number := 3) return number;
    
    /**
     * var: �Ķ���Ϳ� ���޹��� �迭�� �ִ� ��� ���ҵ��� �л��� ����ؼ� ����
     * @param arr   NumberArray
     * @param digit number  ���ϰ�(�л�)�� �Ҽ��� ���� �ڸ���, �⺻���� 3
     */
    function var(arr NumberArray, digit number := 3) return number;
   
    /**
     * std: �Ķ���Ϳ� ���޹��� �迭�� �ִ� ��� ���ҵ��� ǥ�������� ����ؼ� ����
     * @param arr   NumberArray
     * @param digit number  ���ϰ�(ǥ������)�� �Ҽ��� ���� �ڸ���, �⺻���� 3
     */
    function std(arr NumberArray, digit number := 3) return number;
     
    /**
     * max: �Ķ���Ϳ� ���޹��� �迭�� �ִ� ��� ���ҵ� �߿��� �ִ��� ����
     * @param arr   NumberArray
     */
    function max(arr NumberArray) return number;
     
     /**
     * min: �Ķ���Ϳ� ���޹��� �迭�� �ִ� ��� ���ҵ� �߿��� �ּڰ��� ����
     * @param arr   NumberArray
     */ 
    function min(arr NumberArray) return number;
end;
/

-- ��Ű�� ����(body) �ۼ�
create or replace package body my_stat
is

    function sum(arr NumberArray) return number
    is
        v_result number;
    begin
        v_result := 0;
        for i in 1..arr.count loop
            v_result := v_result + arr(i);
        end loop;
        
        return v_result;
    end sum;

    function avg(arr NumberArray, digit number := 3) return number
    is
        v_result number;
    begin
        -- ��� = �հ� / ����;
        v_result := my_stat.sum(arr) / arr.count;
        return round(v_result, digit);
    end avg;
    
    function var(arr NumberArray, digit number := 3) return number
    is
        v_avg number;  -- �迭 ���ҵ��� ���
        v_ss number;  -- ���� ��(sum of squares)
        v_var number;  -- �л�(variance)
    begin
        v_avg := my_stat.avg(arr, digit);
        
        v_ss := 0;
        for i in 1..arr.count loop
            v_ss := v_ss + (v_avg - arr(i)) ** 2;
        end loop;
        
        v_var := v_ss / (arr.count - 1);
        
        return round(v_var, digit);
    end var;
    
    function std(arr NumberArray, digit number := 3) return number
    is
        v_std number;
    begin
        v_std := sqrt(my_stat.var(arr, digit));
        return round(v_std, digit);
    end std;
    
    function max(arr NumberArray) return number
    is
        v_result number;  --  �ִ��� ������ ����
    begin
        v_result := arr(1);
        for i in 2..arr.count loop
            if arr(i) > v_result then
                v_result := arr(i);
            end if;
        end loop;
        
        return v_result;
    end max;
    
    function min(arr NumberArray) return number
    is
        v_result number;
    begin
        v_result := arr(1);
        for i in 2..arr.count loop
            if arr(i) < v_result then
                v_result := arr(i);
            end if;
        end loop;
        
        return v_result;
    end min;
end;
/
































