% 读取Excel文件中的数据
[~, ~, raw] = xlsread('sorted_data2.xlsx');

% 提取第二列数据
secondColumn = raw(:, 2);

% 对第二列数据进行排序
[sortedSecond, sortedIndices] = sort(secondColumn);

% 使用排序后的索引重新排序原始数据
sortedData = raw(sortedIndices, :);

% 将排序后的数据写入Excel文件
xlswrite('sorted_data5.xlsx', sortedData);

% 显示排序后的数据
disp(sortedData);
