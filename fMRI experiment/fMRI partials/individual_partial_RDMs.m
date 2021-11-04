%% Random image RDM selection
clear all;close all;clc;

Action_comparisons = load('RDMs_Action_data.mat');
Action_comparisons = Action_comparisons.RDMsActiondata;
Action_comparisons = table2array(Action_comparisons);
Action_names = load('Action_names_fMRI_order.mat');
Action_names = Action_names.Action_names_fMRI_order;

Semantic_comparisons = load('RDMs_Semantic_data.mat');
Semantic_comparisons = Semantic_comparisons.RDMsSemanticdata;
Semantic_comparisons = table2array(Semantic_comparisons);
Semantic_names = load('Semantic_names_fMRI_order.mat');
Semantic_names = Semantic_names.Semantic_names_fMRI_order;

pt=0;
for mask = 1:15
	a = 1 + (pt*20);
	b = 20 + (pt*20);
    pt=pt+1;
    % each cell is a mask
    % columns are dissimilarities and rows are participants
    Masks_A{mask}= Action_comparisons(a:b,:);
    Masks_S{mask}= Semantic_comparisons(a:b,:);
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
        comparisons_action = comparisons_action(~isnan(comparisons_action));

        %% number of images presented to the participant
        nStimuli=length(stimuli_action);
        nComparisons = ((nStimuli^2)-nStimuli)/2; % counts only one way and not the same imgs
        if length(comparisons_action) ~= nComparisons
            break
        end
        
        %% get the comparisons values associated witht the RDM position

        % initialize the big RDM
        rdm = NaN(nStimuli,nStimuli);

        count=0;
        for row = 1:(nStimuli-1)
            for col = (row+1):nStimuli
                count=count+1;
                
                rdm(row,col) = comparisons_action(count);
                rdm(col,row) = comparisons_action(count);
                
            end
        end
        
        for imag = 1:nStimuli
            rdm(imag,imag)=0;
        end 
        
        
        max_array(each_mask)=max(rdm,[],'all');
        max_val = max(max_array);
        
        if (participant==3) && (each_mask==1)
            figure(); image(rdm,'CDataMapping','scaled');C = colorbar;title('Action full partial RDM');caxis([0 max_val]);
        end
        
    % save the RDM for each participant for each Mask
    RDM_Action{each_mask,participant}=rdm;
    end
    
end

% % save double_partials_RDM_A partials_RDM_A
save full_partial_RDMs_Action RDM_Action


for each_mask = 1:15
    for participant = 1:20    
        mask_semantic = Masks_S{1,each_mask} ;
        emptyCells = cellfun(@isempty,Semantic_names(participant,:));
        stimuli_semantic = Semantic_names(participant,find(emptyCells==0));
        stimuli_semantic = char(stimuli_semantic');
        
        % Dissimilarities for this participant
        comparisons_semantic = mask_semantic(participant,:);
        comparisons_semantic = comparisons_semantic(~isnan(comparisons_semantic));

        %% number of images presented to the participant
        nStimuli=length(stimuli_semantic);
        nComparisons = ((nStimuli^2)-nStimuli)/2; % counts only one way and not the same imgs
        if length(comparisons_semantic) ~= nComparisons
            break
        end
        
        %% get the comparisons values associated witht the RDM position

        % initialize the big RDM
        rdm = NaN(nStimuli,nStimuli);

        count=0;
        for row = 1:(nStimuli-1)
            for col = (row+1):nStimuli
                count=count+1;
                
                rdm(row,col) = comparisons_semantic(count);
                rdm(col,row) = comparisons_semantic(count);
                
            end
        end
        
        for imag = 1:nStimuli
            rdm(imag,imag)=0;
        end 
        
        
        max_array(each_mask)=max(rdm,[],'all');
        max_val = max(max_array);
        
        if (participant==3) && (each_mask==1)
            figure(); image(rdm,'CDataMapping','scaled');C = colorbar;title('Semantic full partial RDM');caxis([0 max_val]);
        end
        
    % save the RDM for each participant for each Mask
    RDM_Semantic{each_mask,participant}=rdm;
    end
    
end

save full_partial_RDMs_Semantic RDM_Semantic