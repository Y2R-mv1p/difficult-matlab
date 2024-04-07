function [sorted_list, index] = insert_sorted(list, data, order)
    % 如果列表为空，直接将数据插入到列表中
    if isempty(list)
        sorted_list = [data];
        index = 1;
        return;
    end

    % 将数据插入到列表中
    list = [list, data];

    % 根据给定的顺序对列表进行排序
    if strcmpi(order, 'ascend')
        [sorted_list, idx] = sort(list);
    elseif strcmpi(order, 'descend')
        [sorted_list, idx] = sort(list, 'descend');
    else
        error('Invalid sorting order. Use ''ascend'' or ''descend''.');
    end

    % 找到新插入数据在排序后列表中的索引位置
    index = find(idx == length(list));
end
