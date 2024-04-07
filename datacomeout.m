Data = {};
for pageNo = 1:10
    try
        clc;
        fprintf('%d\n',pageNo);
        web_1='https://hf.lianjia.com/xiaoqu/pg';
        web=strcat(web_1,num2str(pageNo));
        %读网页
        str=urlread(web);
        % 爬取小区的名称
        name = regexp(str,'(?<=<div class="title">\n\s{6}<a href=).*?(?=</div>)','match');
        name = cellfun(@(s)s(s>999),name,'UniformOutput',false);
        % 爬取小区所在行政区和子区域
        temp = regexp(str,'(?<=<span class="positionIcon"></span>).*?(?=</div)','match');
        loc = cell(size(temp,1),2);
        for i = 1:length(temp)
            loc(i,:) = regexp(temp{i},'(?<=>)[^\n].*?(?=<)','match');
        end
        %爬取小区价格信息
        price = regexp(str, '(?<=<div class="totalPrice( noPrice)?"><span>).*?(?=</span>)','match');
        Data = [Data;name',loc,price'];

    catch
        break;
    end
end

Data = strrep(Data,'暂无数据','0');


% 创建或覆盖一个Excel文件  
filename = 'output.xlsx';  
xlswrite(filename, Data);
