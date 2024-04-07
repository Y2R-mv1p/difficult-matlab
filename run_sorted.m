% �������Դ�ļ�·��
input_file_path = 'sorted_data5.xlsx';

% �Զ���ı�ͷ������Դ�ļ��ޱ�ͷ�����ﶨ���ͷ
custom_header = {'С����', '������', '������', 'ÿƽ���׷���'};

% ָ���������
column_name = 'ÿƽ���׷���';


% ���������ascendΪ��������descendΪ��������
order = 'descend';

% ��ȡ Excel �ļ�
[num_data, txt_data, ~] = xlsread(input_file_path);

% ����ֵ���ݺ��ı����ݺϲ�Ϊһ���������
combined_data = [txt_data, num2cell(num_data)];

% ʹ�� array2table ���������ת��Ϊ���
data = array2table(combined_data);

% ���Զ���ı�ͷ��ӵ�������
data.Properties.VariableNames = custom_header;



% ע�����ĵ�'������', '������'�Ǳ�ͷ���ƣ���ʾ������Щ�н��з�����������
sorted_data = sort_excel_by_column(data, column_name, order, '������', '������');

% ������������д�� Excel �ļ�
[~, file_name, ~] = fileparts(input_file_path);
output_file_path = fullfile(fileparts(input_file_path), [file_name '_' order '_sorted.xlsx']);

writetable(sorted_data, output_file_path, 'WriteVariableNames', false);

fprintf('File sorted and saved as %s.\n', output_file_path);
