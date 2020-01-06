function write_table_latex(filename,cell_data,mode)
if nargin<3
    mode='row_mode'; % The results of different algorithms are listed using row;
end
% Replace the underscore ('_') to the dash('-')
for ii=1:size(cell_data(:))
    temp=cell_data{ii};
    for jj=1:length(temp);
        if strcmp(temp(jj),'_')
            temp(jj)='-';
        end
    end
    cell_data{ii}=temp;
end
fid = fopen(filename, 'wt');
if strcmp(mode,'row_mode')
    for ii=1:size(cell_data,1)
        for jj=1:size(cell_data,2)
            if ii==1
                if jj==size(cell_data,2)
                    fprintf(fid,'%s\t \\\\', cell_data{ii,jj});
                else
                    fprintf(fid,'%s\t &', cell_data{ii,jj});
                end
            else
                if jj==size(cell_data,2)
                    fprintf(fid,'%.2f\t \\\\', cell_data{ii,jj});
                else
                    fprintf(fid,'%.2f\t &', cell_data{ii,jj});
                end
            end
            if jj==size(cell_data,2)
                if ii==1
                    fprintf(fid,'\t');
                    fprintf(fid,'\\midrule[.5pt]');
                end
                fprintf(fid,'\n');
            end
        end
    end
else
    if strcmp(mode,'column_mode')
        for jj=1:size(cell_data,2)
            for ii=1:size(cell_data,1)
                if ii==1
                    fprintf(fid,'%s\t &', cell_data{ii,jj});
                else
                    if ii==size(cell_data,1)
                        fprintf(fid,'%.2f\t \\\\', cell_data{ii,jj});
                    else
                        fprintf(fid,'%.2f\t &', cell_data{ii,jj});
                    end
                end
                if ii==size(cell_data,1)
                    if jj==1
                        fprintf(fid,'\t');
                        fprintf(fid,'\\midrule[.5pt]');
                    end
                    fprintf(fid,'\n');
                end
            end
        end
    end
end
fclose(fid);
end