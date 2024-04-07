% 输入你的源文件路径
input_file_path = 'sorted_data5.xlsx';

% 自定义的表头，由于源文件无表头，这里定义表头
custom_header = {'小区名', '行政区', '子区域', '每平方米房价'};

% 指定排序的列
column_name = '每平方米房价';


% 排序参数，ascend为升序排序，descend为降序排序
order = 'descend';

% 读取 Excel 文件
[num_data, txt_data, ~] = xlsread(input_file_path);

% 将数值数据和文本数据合并为一个表格数组
combined_data = [txt_data, num2cell(num_data)];

% 使用 array2table 将表格数组转换为表格
data = array2table(combined_data);

% 将自定义的表头添加到数据中
data.Properties.VariableNames = custom_header;



% 注意后面的的'行政区', '子区域'是表头名称，表示按照这些列进行分组后进行排序
sorted_data = sort_excel_by_column(data, column_name, order, '行政区', '子区域');

% 将排序后的数据写回 Excel 文件
[~, file_name, ~] = fileparts(input_file_path);
output_file_path = fullfile(fileparts(input_file_path), [file_name '_' order '_sorted.xlsx']);

writetable(sorted_data, output_file_path, 'WriteVariableNames', false);

fprintf('File sorted and saved as %s.\n', output_file_path);
