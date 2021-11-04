%% Random image RDM selection
clear all;close all;clc;

load('RDMs_Action_data_euclidean.mat');
Action_comparisons = RDMs_Action_data_euclidean;
Action_comparisons = table2array(Action_comparisons);
load('Action_names_fMRI_order.mat');
Action_names = Action_names_fMRI_order;

load('RDMs_Semantic_data_euclidean.mat');
Semantic_comparisons = RDMs_Semantic_data_euclidean;
Semantic_comparisons = table2array(Semantic_comparisons);
load('Semantic_names_fMRI_order.mat');
Semantic_names = Semantic_names_fMRI_order;

pt=0;
for mask = 1:15
	a = 1 + (pt*20)
	b = 20 + (pt*20)
    pt=pt+1;
    % each cell is a mask
    % columns are dissimilarities and rows are participants
    Masks_A{mask}= Action_comparisons(a:b,:)
    Masks_S{mask}= Semantic_comparisons(a:b,:)
%     for participant = 1:20
%         % columns are participants
%         % Rows are Masks
%         Data{mask,participant} = Masks{mask}(participant,:);
%     end
end

% cell array with 15 masks 
% each mask includes 20 row participants and columns are dissimilarities
save Masks_A Masks_A
save Masks_S Masks_S
    
%% Create the partial array

for each_mask = 1:15
    for participant = 1:20    
        mask_action = Masks_A{1,each_mask} ;
        emptyCells = cellfun(@isempty,Action_names(participant,:));
        stimuli_action = Action_names(participant,find(emptyCells==0));
        stimuli_action = char(stimuli_action');
        
        % Dissimilarities for this participant
        comparisons_action = mask_action(participant,:);

        %% load stimuli names
        nStimuli=length(stimuli_action);
        nComparisons = ((nStimuli^2)-nStimuli)/2; % counts only one way and not the same imgs

        %% get the comparisons values associated witht the RDM position

        % initialize the big RDM
        rdm = NaN(92,92);

        for name=1:nStimuli
            idx=stimuli_action(name,:);
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
                    A= [rdm(img1_idx,img2_idx) comparisons_action(countComparison)];
                    mean_value=mean(A);
                    rdm(img1_idx,img2_idx) = mean_value;
                    rdm(img2_idx,img1_idx) = mean_value;
                else % if empty just place the values
                    rdm(img1_idx,img2_idx) = comparisons_action(countComparison); 
                    rdm(img2_idx,img1_idx) = comparisons_action(countComparison);
                end

            end
        end

        for imag = 1:92
            rdm(imag,imag)=0;
        end
        
        max_rdm = max(rdm,[],'all','omitnan');
        min_rdm = 0;
        
        % I want max to be 0.0227 to correspond to behaviour data
        max_behav = 0.0227;
        scaled_rdm = (rdm*max_behav)/max_rdm;
        
        % get the partial RDMs for mask 1 for each participant: Semantic
        if each_mask == 1
%         	figure(); image(rdm,'CDataMapping','scaled');C = colorbar;title('Semantic partial RDM');caxis([0 0.00227]);
            figure('units','normalized','WindowState','maximized'); image(scaled_rdm,'CDataMapping','scaled');C = colorbar;title('scaled Semantic partial RDM');caxis([0 0.009]);
        end
        
        c=0;
        for row = 1:91
            for col = row+1:92
                c=c+1;

                if isnan(rdm(row,col)) == 1
                    partials_RDM_A (1,c,participant) = NaN;

                else
                    partials_RDM_A (1,c,participant) = rdm(row,col);
                end

            end
        end
        
        max_array(each_mask)=max(rdm,[],'all');
        max_val = max(max_array);
        
        if each_mask == 1
            save 01_Mask_partials_RDM_A partials_RDM_A
        elseif each_mask == 2
            save 02_Mask_partials_RDM_A partials_RDM_A
       	elseif each_mask == 3
            save 03_Mask_partials_RDM_A partials_RDM_A
        elseif each_mask == 4
            save 04_Mask_partials_RDM_A partials_RDM_A
        elseif each_mask == 5
            save 05_Mask_partials_RDM_A partials_RDM_A
       	elseif each_mask == 6
            save 06_Mask_partials_RDM_A partials_RDM_A  
        elseif each_mask == 7
            save 07_Mask_partials_RDM_A partials_RDM_A
        elseif each_mask == 8
            save 08_Mask_partials_RDM_A partials_RDM_A
       	elseif each_mask == 9
            save 09_Mask_partials_RDM_A partials_RDM_A
        elseif each_mask == 10
            save 10_Mask_partials_RDM_A partials_RDM_A
        elseif each_mask == 11
            save 11_Mask_partials_RDM_A partials_RDM_A
       	elseif each_mask == 12
            save 12_Mask_partials_RDM_A partials_RDM_A 
        elseif each_mask == 13
            save 13_Mask_partials_RDM_A partials_RDM_A
        elseif each_mask == 14
            save 14_Mask_partials_RDM_A partials_RDM_A
        else    
            save 15_Mask_partials_RDM_A partials_RDM_A
        end
    % save the RDM for each participant for each Mask
    RDM_Action{each_mask,participant}=rdm;
    end
end

% save double_partials_RDM_A partials_RDM_A
save all_partial_RDMs_Action RDM_Action

for each_mask = 1:15
    for participant = 1:20    
        mask_semantic = Masks_S{1,each_mask} ;
        emptyCells = cellfun(@isempty,Semantic_names(participant,:));
        stimuli_semantic = Semantic_names(participant,find(emptyCells==0));
        stimuli_semantic = char(stimuli_semantic');
        
        % Dissimilarities for this participant
        comparisons_semantic = mask_semantic(participant,:);

        %% load stimuli names
        nStimuli=length(stimuli_semantic);
        nComparisons = ((nStimuli^2)-nStimuli)/2; % counts only one way and not the same imgs

        %% get the comparisons values associated witht the RDM position

        % initialize the big RDM
        rdm = NaN(92,92);

        for name=1:nStimuli
            idx=stimuli_semantic(name,:);
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
                    A= [rdm(img1_idx,img2_idx) comparisons_semantic(countComparison)];
                    mean_value=mean(A);
                    rdm(img1_idx,img2_idx) = mean_value;
                    rdm(img2_idx,img1_idx) = mean_value;
                else % if empty just place the values
                    rdm(img1_idx,img2_idx) = comparisons_semantic(countComparison); 
                    rdm(img2_idx,img1_idx) = comparisons_semantic(countComparison);
                end

            end
        end

        for imag = 1:92
            rdm(imag,imag)=0;
        end
        
        % get the partial RDMs for mask 1 for each participant: Action
%         if each_mask == 1
%         	figure(); image(rdm,'CDataMapping','scaled');C = colorbar;title('Action partial RDM');caxis([0 0.02]);
%         end
        
        c=0;
        for row = 1:91
            for col = row+1:92
                c=c+1;

                if isnan(rdm(row,col)) == 1
                    partials_RDM_S (1,c,participant) = NaN;
                else
                    partials_RDM_S (1,c,participant) = rdm(row,col);
                end


            end
        end
        if each_mask == 1
            save 01_Mask_partials_RDM_S partials_RDM_S
        elseif each_mask == 2
            save 02_Mask_partials_RDM_S partials_RDM_S
       	elseif each_mask == 3
            save 03_Mask_partials_RDM_S partials_RDM_S
        elseif each_mask == 4
            save 04_Mask_partials_RDM_S partials_RDM_S
        elseif each_mask == 5
            save 05_Mask_partials_RDM_S partials_RDM_S
       	elseif each_mask == 6
            save 06_Mask_partials_RDM_S partials_RDM_S  
        elseif each_mask == 7
            save 07_Mask_partials_RDM_S partials_RDM_S
        elseif each_mask == 8
            save 08_Mask_partials_RDM_S partials_RDM_S
       	elseif each_mask == 9
            save 09_Mask_partials_RDM_S partials_RDM_S
        elseif each_mask == 10
            save 10_Mask_partials_RDM_S partials_RDM_S
        elseif each_mask == 11
            save 11_Mask_partials_RDM_S partials_RDM_S
       	elseif each_mask == 12
            save 12_Mask_partials_RDM_S partials_RDM_S 
        elseif each_mask == 13
            save 13_Mask_partials_RDM_S partials_RDM_S
        elseif each_mask == 14
            save 14_Mask_partials_RDM_S partials_RDM_S
        else    
            save 15_Mask_partials_RDM_S partials_RDM_S
        end
    % save the RDM for each participant for each Mask
    RDM_Semantic{each_mask,participant}=rdm;
    end
end
% save double_partials_RDM_S partials_RDM_S 
save all_partial_RDMs_Semantic RDM_Semantic