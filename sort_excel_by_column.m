% sort_excel_by_column.m
function sorted_data = sort_excel_by_column(data, column_name, order, varargin)
    % 检查排序列不能包含在分组
    if any(strcmp(varargin, column_name))
        error('Invalid parameter, column_name can''t in varargin!');
    end

    % 判断输入是否合法
    if ~ismember(order, {'ascend', 'descend'})
        error('Invalid sorting order. Use ''ascend'' or ''descend''.');
    end
    
    % 获取 varargin 的长度
    varargin_length = nargin - 3; % 减去函数名和三个必需的参数
    if varargin_length < 1
        error('Must pass group column.');
    end
    
    groupIndex = findgroups(data(:, varargin{1}));


    % 遍历分组，排序追加到结果表格中
    sorted_list = []; 
    table_sorted_list = [];
    for i = 1:max(groupIndex)
        if varargin_length > 1
            % 递归
            g_sorted_data = sort_excel_by_column(data(groupIndex == i, :), column_name, order, varargin{2:end});
        else
            % 使用 sortrows 函数对数据进行排序
            g_sorted_data = sortrows(data(groupIndex == i, :), column_name, order);
        end
        % 确定分组所在索引
        [sorted_list, insert_index] = insert_sorted(sorted_list, g_sorted_data.(column_name){1}, order);
        % 排序分组保存在列表
        table_sorted_list = [table_sorted_list(1:insert_index-1), {g_sorted_data}, table_sorted_list(insert_index:end)];
    end
    % 合并分组
    sorted_data = merge_tables(table_sorted_list);
end

