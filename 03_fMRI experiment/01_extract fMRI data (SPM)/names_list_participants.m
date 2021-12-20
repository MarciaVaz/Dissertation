
for participant_n = 1:40
    %% Stimuli names - the first 92 stimuli are the ones used, the last ones are targets

    folder = dir('C:\Users\Marcia\Desktop\BEHAV EXP\matlab\fMRI\images and targets');
    names_folder = {folder(~[folder.isdir]).name}
    nStimuli=length(names_folder)

    dd = dir('*.csv');

    fileNames = {dd.name}; 

    data = cell(numel(fileNames),2);
    data(:,1) = regexprep(fileNames, '.csv','');


    % the first column is the name of the csv file
    % the second column is the data for each participant
    for i = 1:numel(fileNames)    
       data{i,2} = readtable(fileNames{i}); 
    end

    count=0;


    p_data = data{participant_n,2}

    %% get output names with fMRI order
    names_all = [p_data.image1 p_data.image2 p_data.image3 p_data.image4];

    [roww columnq] = find(~cellfun(@isempty,names_all));
    [row_sorted, indices] = sort(roww);
    col = columnq(indices);

    for p=1:length(indices)
        array_imag(p,1) = names_all(row_sorted(p),col(p));
    end
    names_excel=array_imag(1:length(indices),1)
    names_all_list{participant_n} = names_excel
%     save 3_b_names names_excel
end