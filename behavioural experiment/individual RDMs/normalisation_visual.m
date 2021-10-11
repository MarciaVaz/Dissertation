%% Geat each participant responses as a dimension

clear all;close all;clc;

file_names = dir(pwd);
file_names = file_names(~[file_names.isdir]);
file_names = {file_names.name};

dat_mat_files = fileDatastore(pwd,'ReadFcn',@load,'FileExtensions','.mat');

file_names = dat_mat_files.Files;
% file_names = file_names(1:6);

y = string(file_names);

for participant = 1:length(y)    
    % reads data file for each participant
    Data = load (y(participant));  
        
    stimuli = Data.stimuli;
    comparisons = Data.rdmutv;

    %% number of stimuli and comparisons
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
    
 
    
end

%% After saving all small rdms, I create the big RDM
rdm = cat(3,rdm1,rdm2,rdm3,rdm4,rdm5,rdm6);

% Go to each pixel
rdm_single=zeros(92);
for rows = 1:92
    for cols = 1:92
        if rows ~= cols
            pixel = rdm(rows,cols,:);
            mean_value = mean(pixel,'omitnan');
            rdm_single(rows,cols) = mean_value;
        end
       
    end
end

figure(); image(rdm_single,'CDataMapping','scaled');C = colorbar;title('Semantic RDM 6');caxis([0 0.06]);
RDM_E6_semantic = rdm_single;
save('RDM_E6_semantic');


