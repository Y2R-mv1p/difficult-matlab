% 读取 Excel 文件到 MATLAB
data = readtable('sorted_data5_descend_sorted.xlsx');

% 提取第四列进行绘图
values = data.{'49651'};

% 创建二维直方图
histogram(values, 'Normalization', 'probability');
xlabel('Value Range');
ylabel('Probability');
title('2D Histogram of Values in Column 4');
