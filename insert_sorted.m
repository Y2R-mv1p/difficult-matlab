function [sorted_list, index] = insert_sorted(list, data, order)
    % ����б�Ϊ�գ�ֱ�ӽ����ݲ��뵽�б���
    if isempty(list)
        sorted_list = [data];
        index = 1;
        return;
    end

    % �����ݲ��뵽�б���
    list = [list, data];

    % ���ݸ�����˳����б��������
    if strcmpi(order, 'ascend')
        [sorted_list, idx] = sort(list);
    elseif strcmpi(order, 'descend')
        [sorted_list, idx] = sort(list, 'descend');
    else
        error('Invalid sorting order. Use ''ascend'' or ''descend''.');
    end

    % �ҵ��²���������������б��е�����λ��
    index = find(idx == length(list));
end
