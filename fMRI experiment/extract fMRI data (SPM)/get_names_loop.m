clear all; close all; clc;
count_participant=0

for participant_n = 1:40
    count_participant = count_participant+1;
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

    %% get onset times with fMRI order

    fMRI_delay = p_data.triggerClock;
    fMRI_delay = fMRI_delay(~isnan(fMRI_delay))

    img_start_time = p_data.Img_starttime;
    img_start_time = img_start_time(~isnan(img_start_time))

    onsets_array = img_start_time - fMRI_delay;

    %% get output names with fMRI order
    names_all = [p_data.image1 p_data.image2 p_data.image3 p_data.image4];

    [roww columnq] = find(~cellfun(@isempty,names_all));
    [row_sorted, indices] = sort(roww);
    col = columnq(indices);

    for p=1:length(indices)
        array_imag(p,1) = names_all(row_sorted(p),col(p));
    end
    names_excel=array_imag(:,1)

    %% get conditions with fMRI order

    % merge action and semantic array
    block_condition_time = [p_data.ActInstr_starttime p_data.SemInstr_starttime]

    % check the block numbe 
    block_number = rmmissing(unique(p_data(:,{'selectBlock'}),'stable'))

    % find where the time when the 4 blocks start
    [row_f column] = find(isnan(block_condition_time)==0)
    [r c] = sort(row_f)
    time_blocks = unique(block_condition_time(row_f,column))
    time_blocks(isnan(time_blocks)) = []
    time_blocks = time_blocks - fMRI_delay
    n_block = block_number.selectBlock

    % Action = 1
    % Semantic = 2
    for b=1:4
        condition_order(b,1) = column(c(b));
    %     if condition == 1
    %         condition_name(b,1) = {'action'}
    %     else
    %         condition_name(b,1) = {'semantic'}
    %     end
    end

    conditions = zeros(length(row_sorted),1);
    n=1;

    for current = 1:length(row_sorted)
        if current == 1
            conditions(1,1) = condition_order(1,1);
        else
            current_condition = row_sorted(current);
            previous_condition = row_sorted(current-1);

            if current_condition == previous_condition + 1
                conditions(current,1) = condition_order(n,1);
            else
                n = n+1;
                conditions(current,1) = condition_order(n,1);
            end
        end  
    end

    row_sorted;
    condition_order;
    conditions

    %% get duration with fMRI order
    duration_array = zeros(length(indices),1)

    %% Order according to behavioural data
    array = [onsets_array duration_array conditions]

    for na = 1:length(indices)
        check = strfind(names_folder,[names_excel{na}])
        index(na,1) = find(~cellfun(@isempty,check)) % there is a problem with excel names
    end

    % gives index number in the names
    index  

    % Before I sort I have to separate Action and semantic

    action_names = index(find(conditions==1))
    semantic_names = index(find(conditions==2))

    [sorted_action, indices_action] = sort(action_names)
    [sorted_semantic, indices_semantic] = sort(semantic_names)
    indices_semantic = indices_semantic+length(indices_action)
    
    sorted = cat(1,sorted_action,sorted_semantic)
    indices = cat(1,indices_action,indices_semantic)

    names_action = names_folder(sorted_action)
    names_action=strcat(names_action,'_action')

    names_semantic = names_folder(sorted_semantic)
    names_semantic =strcat(names_semantic,'_semantic')

    names_sorted = cat(2,names_action,names_semantic)

    targets = find(contains(names_sorted,'target'))
    
    onsets_sorted = onsets_array(indices)
    duration_array_sorted = zeros(length(indices),1)
    conditions_sorted = conditions(indices)

    % detele target data
    names_sorted(targets)=[]
    onsets_sorted(targets)=[]
    duration_array_sorted(targets)=[]
    conditions_sorted(targets)=[]
    indices(targets)=[]
    
    act=0;
    sem=0;
    %% add action or semantic to the end of the image name


    durations = num2cell(duration_array_sorted)';
    onsets = num2cell(onsets_sorted)';
    names = names_sorted
    count_participant
   
    if count_participant == 1
        save 01_a_names names
    elseif count_participant == 2
        save 01_b_names names
    elseif count_participant== 3
        save 02_a_names names
    elseif count_participant== 4
        save 02_b_names names
    elseif count_participant== 5  
        save 03_a_names names  
    elseif count_participant== 6
        save 03_b_names names
    elseif count_participant== 7
        save 04_a_names names 
    elseif count_participant== 8
        save 04_b_names names
    elseif count_participant== 9  
        save 05_a_names names  
    elseif count_participant== 10
        save 05_b_names names
    elseif count_participant== 11
        save 06_a_names names 
    elseif count_participant== 12
        save 06_b_names names
    elseif count_participant== 13
        save 07_a_names names 
    elseif count_participant== 14
        save 07_b_names names
    elseif count_participant== 15  
        save 08_a_names names  
    elseif count_participant==16
        save 08_b_names names
    elseif count_participant== 17
        save 09_a_names names
    elseif count_participant== 18
        save 09_b_names names
    elseif count_participant== 19
        save 10_a_names names
    elseif count_participant== 20
        save 10_b_names names
    elseif count_participant== 21 
        save 11_a_names names  
    elseif count_participant== 22
        save 11_b_names names
    elseif count_participant== 23  
        save 12_a_names names   
    elseif count_participant== 24
        save 12_b_names names
    elseif count_participant== 25
        save 13_a_names names 
    elseif count_participant== 26
        save 13_b_names names
    elseif count_participant== 27
        save 14_a_names names 
    elseif count_participant== 28
        save 14_b_names names
    elseif count_participant== 29
        save 15_a_names names
    elseif count_participant== 30
        save 15_b_names names
    elseif count_participant== 31
        save 16_a_names names
    elseif count_participant== 32
        save 16_b_names names
    elseif count_participant== 33 
        save 17_a_names names 
    elseif count_participant== 34
        save 17_b_names names
    elseif count_participant== 35 
        save 18_a_names names  
    elseif count_participant== 36
        save 18_b_names names
    elseif count_participant== 37
        save 19_a_names names
    elseif count_participant== 38
        save 19_b_names names   
    elseif count_participant== 39
        save 20_a_names names
    else 
        save 20_b_names names
    end
end

