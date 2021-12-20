clear all; close all; clc;
participant_n = 1

%% Stimuli names - the first 92 stimuli are the ones used, the last ones are targets

folder = dir('C:\Users\Marcia\Desktop\BEHAV EXP\matlab\fMRI\images and targets');
names_folder = {folder(~[folder.isdir]).name}
nStimuli=length(names_folder)

%% Participant lc
% file_names = dir(pwd);
% file_names = file_names(~[file_names.isdir]);
% file_names = {file_names.name};
% 
% dat_csv_files = fileDatastore(pwd,'ReadFcn',@load,'FileExtensions','.csv');
% 
% file_names = dat_csv_files.Files;
% % file_names = file_names(1:6);
% 
% y = string(file_names);
% 
% for participant = 1:length(y)    
%     % reads data file for each participant
%     Data(:,:,participant) = readtable(y(participant));  
% end

% files = dir(pwd);
% fullpaths = fullfile({files.folder}, {files.name});

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

% for participant_n = 1:1:40 % document a
    
    p_data = data{participant_n,2}
    % read the csv docs with participant number (2 or 3)
    
    %     for participant_a_b_c
    %         % from the 2 or 3 files, read one by one        
    %     end
    %     % save the cell array for each participant
    % end

    % % read the psychopy data for the participant
    % p_data = readtable("part_1_b.csv")
    % 
    % % cell_array is where I am going to store my output
    % cell_array.names = names

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
    % duration_array = load('duration_array_b.mat');
    % duration_array = duration_array.duration_array_b
    duration_array = zeros(length(indices),1)
    % for i = 1:4
    %   eval(['start_block_' num2str(i) '=' num2str(time_blocks(i)+onsets_array(r(i)))]);
    % end
    % 
    % start_inst_fMRI = cat(1, start_block_1,start_block_2,start_block_3,start_block_4)
    % 
    % summary = [r time_blocks start_inst_fMRI n_block condition];
    % T = array2table(summary);
    % T.Properties.VariableNames(1:5) = {'row','inst time', 'inst time fMRI','block','condition'}

    %% Order according to behavioural data
    array = [onsets_array duration_array conditions]

    for na = 1:length(indices)
        check = strfind(names_folder,[names_excel{na}]);
        index(na,1) = find(~cellfun(@isempty,check)); % there is a problem with excel names
    end

    % gives index number in the names
    index  

    [sorted, indices] = sort(index)

    names_sorted = names_folder(sorted) 
    onsets_sorted = onsets_array(indices)
    duration_array_sorted = zeros(length(indices),1)
    conditions_sorted = conditions(indices)

    act=0;
    sem=0;
    %% read the 
    for yy = 1:length(indices)
        if conditions_sorted(yy) == 1
            act=act+1;
            names_action(act) = names_folder(yy) 
            onsets_action(act) = onsets_array(yy)
            duration_action(act) = 0
        else
            sem=sem+1;
            names_semantic(sem) = names_folder(yy) 
            onsets_semantic(sem) = onsets_array(yy)
            duration_semantic(sem) = 0 
        end
    end
    
    duration_semantic = num2cell(duration_semantic);
    duration_action = num2cell(duration_action);
    onsets_action = num2cell(onsets_action);
    onsets_semantic = num2cell(onsets_semantic);
    
    names_action_cond=strcat(names_action,'_action')
    names_semantic_cond=strcat(names_semantic,'_semantic')

    durations = cat(2,duration_action,duration_semantic)
    names = cat(2,names_action_cond,names_semantic_cond)
    onsets = cat(2,onsets_action,onsets_semantic)

    %% save the cell array
%     save subject_01_b durations names onsets
%     save_name = data{participant_n,1}
%     filename=strcat(participant_n);
% a=num2str(participant_n)

%     save_name = str2num(save_name)
%     save_name = csvread(data{participant_n,1})

%     save 20_a durations names onsets
    save 20_b durations names onsets
    
%     save save_name durations names onsetsonsets
%     folder = pwd; % or whatever you want.
%     for k = 1 : length(sixCenters)  
%       grouped(:, :, k) = fisher_matrix;
%       baseFileName = sprintf('%s.mat', sixCenters{k});
%       fullMatFileName = fullfile(folder, baseFileName);
%       save(fullMatFileName, 'grouped');  
%     end
    
    
    
% end