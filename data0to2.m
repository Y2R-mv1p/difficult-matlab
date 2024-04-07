% 读取Excel文件中的数据
[num, txt, raw] = xlsread('output.xlsx');

% 对第四列进行排序
sortedData = sortrows(raw, -4);

% 提取第三列数据
thirdColumn = raw(:, 3);

% 将字符串转换为字符数组
charArray = cellfun(@char, thirdColumn, 'UniformOutput', false);

% 对字符数组进行排序
[sortedChars, sortedIndices] = sortrows(charArray);

% 使用排序后的索引重新排序原始数据
sortedData = raw(sortedIndices, :);

% 将排序后的数据写入Excel文件
xlswrite('sorted_data2.xlsx', sortedData);

% 显示排序后的数据
disp(sortedData);




