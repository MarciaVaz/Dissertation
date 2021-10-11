%% Random image RDM selection
clear all;close all;clc;
rng(0);

file_names = dir(pwd);
file_names = file_names(~[file_names.isdir]);
file_names = {file_names.name};

dat_mat_files = fileDatastore(pwd,'ReadFcn',@load,'FileExtensions','.mat');

file_names = dat_mat_files.Files;
file_names = file_names(1:44);

y = string(file_names);

for participant = 1:length(y)
    % reads data file for each participant
    Data = load (y(participant));  
        
    stimuli = Data.stimuli;
    comparisons = Data.rdmutv;

    %% load stimuli names
    nStimuli=length(stimuli);
    nComparisons = ((nStimuli^2)-nStimuli)/2; % counts only one way and not the same imgs

    %% get the comparisons values associated witht the RDM position

    % initialize the big RDM
    rdm = NaN(92,92);

    for name=1:nStimuli
        idx=stimuli(name,:);
        img_idx = sscanf(idx,'%f'); % reads the index of the image from the stimuli
        idx_array(1,name) = img_idx;
    end
    
        countComparison=0;
    % fill the matrix with small RDM values
    for img_1 = 1:nStimuli-1
        for img_2 = img_1+1:nStimuli
            countComparison=countComparison+1;
    %         rdm(countComparison,countComparison)=0;

            img1_idx = idx_array(1,img_1);
            img2_idx = idx_array(1,img_2);

            if isnan(rdm(img1_idx,img2_idx)) == 0 % if not empty calculate the mean
                A= [rdm(img1_idx,img2_idx) comparisons(countComparison)];
                mean_value=mean(A);
                rdm(img1_idx,img2_idx) = mean_value;
                rdm(img2_idx,img1_idx) = mean_value;
            else % if empty just place the values
                rdm(img1_idx,img2_idx) = comparisons(countComparison); 
                rdm(img2_idx,img1_idx) = comparisons(countComparison);
            end

        end
    end

    for imag = 1:92
        rdm(imag,imag)=0;
    end
    
    c=0;
    for row = 1:91
        for col = row+1:92
            c=c+1;
            
            if isnan(rdm(row,col)) == 1
                partials_RDM_all (1,c,participant) = NaN;
            else
                partials_RDM_all (1,c,participant) = rdm(row,col);
            end
            
            
        end
    end
    
end
save('partials_RDM_visual_all','partials_RDM_all');
