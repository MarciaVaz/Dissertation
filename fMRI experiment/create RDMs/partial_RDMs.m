%% Random image RDM selection
clear all;close all;clc;

Action_comparisons = load('RDMsActiondataeuclidean.mat');
Action_comparisons = Action_comparisons.RDMsActiondataeuclidean;
Action_comparisons = table2array(Action_comparisons);
Action_names = load('Action_names_fMRI_order.mat');
Action_names = Action_names.Action_names_fMRI_order;

Semantic_comparisons = load('RDMsSemanticdataeuclidean.mat');
Semantic_comparisons = Semantic_comparisons.RDMsSemanticdataeuclidean;
Semantic_comparisons = table2array(Semantic_comparisons);
Semantic_names = load('Semantic_names_fMRI_order.mat');
Semantic_names = Semantic_names.Semantic_names_fMRI_order;

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
            save Mask_1_partials_RDM_A partials_RDM_A
        elseif each_mask == 2
            save Mask_2_partials_RDM_A partials_RDM_A
       	elseif each_mask == 3
            save Mask_3_partials_RDM_A partials_RDM_A
        elseif each_mask == 4
            save Mask_4_partials_RDM_A partials_RDM_A
        elseif each_mask == 5
            save Mask_5_partials_RDM_A partials_RDM_A
       	elseif each_mask == 6
            save Mask_6_partials_RDM_A partials_RDM_A  
        elseif each_mask == 7
            save Mask_7_partials_RDM_A partials_RDM_A
        elseif each_mask == 8
            save Mask_8_partials_RDM_A partials_RDM_A
       	elseif each_mask == 9
            save Mask_9_partials_RDM_A partials_RDM_A
        elseif each_mask == 10
            save Mask_10_partials_RDM_A partials_RDM_A
        elseif each_mask == 11
            save Mask_11_partials_RDM_A partials_RDM_A
       	elseif each_mask == 12
            save Mask_12_partials_RDM_A partials_RDM_A 
        elseif each_mask == 13
            save Mask_13_partials_RDM_A partials_RDM_A
        elseif each_mask == 14
            save Mask_14_partials_RDM_A partials_RDM_A
        else    
            save Mask_15_partials_RDM_A partials_RDM_A
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
            save Mask_1_partials_RDM_S partials_RDM_S
        elseif each_mask == 2
            save Mask_2_partials_RDM_S partials_RDM_S
       	elseif each_mask == 3
            save Mask_3_partials_RDM_S partials_RDM_S
        elseif each_mask == 4
            save Mask_4_partials_RDM_S partials_RDM_S
        elseif each_mask == 5
            save Mask_5_partials_RDM_S partials_RDM_S
       	elseif each_mask == 6
            save Mask_6_partials_RDM_S partials_RDM_S  
        elseif each_mask == 7
            save Mask_7_partials_RDM_S partials_RDM_S
        elseif each_mask == 8
            save Mask_8_partials_RDM_S partials_RDM_S
       	elseif each_mask == 9
            save Mask_9_partials_RDM_S partials_RDM_S
        elseif each_mask == 10
            save Mask_10_partials_RDM_S partials_RDM_S
        elseif each_mask == 11
            save Mask_11_partials_RDM_S partials_RDM_S
       	elseif each_mask == 12
            save Mask_12_partials_RDM_S partials_RDM_S 
        elseif each_mask == 13
            save Mask_13_partials_RDM_S partials_RDM_S
        elseif each_mask == 14
            save Mask_14_partials_RDM_S partials_RDM_S
        else    
            save Mask_15_partials_RDM_S partials_RDM_S
        end
    % save the RDM for each participant for each Mask
    RDM_Semantic{each_mask,participant}=rdm;
    end
end
% save double_partials_RDM_S partials_RDM_S 
save all_partial_RDMs_Semantic RDM_Semantic