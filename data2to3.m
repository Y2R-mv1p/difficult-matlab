
% 读取Excel文件中的数据
[~, ~, raw] = xlsread('sorted_data2.xlsx');

% 提取第三列和第四列数据
thirdColumn = raw(:, 3);
fourthColumn = cell2mat(raw(:, 4)); % 将第四列数据转换为数值数组

% 找到第三列中唯一的值
uniqueThird = unique(thirdColumn);

% 初始化排序后的数据
sortedData = cell(size(raw));

% 遍历每个唯一的第三列值
currentRowIndex = 1;
for i = 1:length(uniqueThird)
    % 获取当前第三列值的索引
    currentIndices = find(strcmp(thirdColumn, uniqueThird{i}));
    % 对当前第三列值的第四列数据进行降序排序
    [~, sortedFourthIndices] = sort(fourthColumn(currentIndices), 'descend');
    % 更新排序后的索引顺序
    sortedIndices = currentIndices(sortedFourthIndices);
    % 将排序后的数据存入排序后的数据中
    sortedData(currentRowIndex:currentRowIndex+length(sortedIndices)-1, :) = raw(sortedIndices, :);
    % 更新当前行索引
    currentRowIndex = currentRowIndex + length(sortedIndices);
end

% 删除空行
sortedData(currentRowIndex:end, :) = [];

% 将排序后的数据写入Excel文件
xlswrite('sorted_data3.xlsx', sortedData);

% 显示排序后的数据
disp(sortedData);
