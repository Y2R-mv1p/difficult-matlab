% sort_excel_by_column.m
function sorted_data = sort_excel_by_column(data, column_name, order, varargin)
    % ��������в��ܰ����ڷ���
    if any(strcmp(varargin, column_name))
        error('Invalid parameter, column_name can''t in varargin!');
    end

    % �ж������Ƿ�Ϸ�
    if ~ismember(order, {'ascend', 'descend'})
        error('Invalid sorting order. Use ''ascend'' or ''descend''.');
    end
    
    % ��ȡ varargin �ĳ���
    varargin_length = nargin - 3; % ��ȥ����������������Ĳ���
    if varargin_length < 1
        error('Must pass group column.');
    end
    
    groupIndex = findgroups(data(:, varargin{1}));


    % �������飬����׷�ӵ���������
    sorted_list = []; 
    table_sorted_list = [];
    for i = 1:max(groupIndex)
        if varargin_length > 1
            % �ݹ�
            g_sorted_data = sort_excel_by_column(data(groupIndex == i, :), column_name, order, varargin{2:end});
        else
            % ʹ�� sortrows ���������ݽ�������
            g_sorted_data = sortrows(data(groupIndex == i, :), column_name, order);
        end
        % ȷ��������������
        [sorted_list, insert_index] = insert_sorted(sorted_list, g_sorted_data.(column_name){1}, order);
        % ������鱣�����б�
        table_sorted_list = [table_sorted_list(1:insert_index-1), {g_sorted_data}, table_sorted_list(insert_index:end)];
    end
    % �ϲ�����
    sorted_data = merge_tables(table_sorted_list);
end

