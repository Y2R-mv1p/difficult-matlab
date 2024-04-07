function merged_table = merge_tables(table_list)
    % 使用第一个表作为初始表
    merged_table = table_list{1};
    
    % 遍历除第一个表之外的所有表
    for i = 2:length(table_list)
        % 使用 vertcat 函数将当前表与已合并的表合并
        merged_table = vertcat(merged_table, table_list{i});
    end
end