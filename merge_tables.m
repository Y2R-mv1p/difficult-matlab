function merged_table = merge_tables(table_list)
    % ʹ�õ�һ������Ϊ��ʼ��
    merged_table = table_list{1};
    
    % ��������һ����֮������б�
    for i = 2:length(table_list)
        % ʹ�� vertcat ��������ǰ�����Ѻϲ��ı�ϲ�
        merged_table = vertcat(merged_table, table_list{i});
    end
end