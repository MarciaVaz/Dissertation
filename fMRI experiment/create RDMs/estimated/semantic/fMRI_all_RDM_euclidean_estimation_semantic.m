%% Random image RDM selection
clear all;close all;clc;
rng(0);

path = dir('C:\Users\Marcia\Desktop\BEHAV EXP\euclidean fMRI\estimated\semantic');
file_names = path(~[path.isdir]);
file_names = {file_names.name};
file_names = file_names(1:15)

 for each_mask=1:numel(file_names)
    mask_name = file_names{each_mask}
    estimated_mask = load(file_names{each_mask});
    comparisons = estimated_mask.estimate_RDM_S;

    nStimuli=92;
    nComparisons = ((nStimuli^2)-nStimuli)/2; % counts only one way and not the same imgs

    rdm = NaN(92,92);

    countComparison=0;
    for img_1 = 1:nStimuli-1
        for img_2 = img_1+1:nStimuli
            countComparison=countComparison+1;

            rdm(img_1,img_2) = comparisons(countComparison); 
            rdm(img_2,img_1) = comparisons(countComparison);

        end   
    end
    for imag = 1:92
        rdm(imag,imag)=0;
    end
    
    max_array(each_mask)=max(rdm,[],'all');
    max_val = max(max_array);
    max_val = 0.0227
    if each_mask == 1
        figure(); image(rdm,'CDataMapping','scaled');C = colorbar;title('Semantic final RDM');caxis([0 max_val]);
        save('final_Mask_1_RDM_semantic','rdm');
    elseif each_mask == 2
        figure(); image(rdm,'CDataMapping','scaled');C = colorbar;title('Semantic final RDM');caxis([0 max_val]);
        save('final_Mask_2_RDM_semantic','rdm');
    elseif each_mask == 3
        figure(); image(rdm,'CDataMapping','scaled');C = colorbar;title('Semantic final RDM');caxis([0 max_val]);
        save('final_Mask_3_RDM_semantic','rdm');
    elseif each_mask == 4
        figure(); image(rdm,'CDataMapping','scaled');C = colorbar;title('Semantic final RDM');caxis([0 max_val]);
        save('final_Mask_4_RDM_semantic','rdm');
    elseif each_mask == 5
        figure(); image(rdm,'CDataMapping','scaled');C = colorbar;title('Semantic final RDM');caxis([0 max_val]);
        save('final_Mask_5_RDM_semantic','rdm');
    elseif each_mask == 6
        figure(); image(rdm,'CDataMapping','scaled');C = colorbar;title('Semantic final RDM');caxis([0 max_val]);
        save('final_Mask_6_RDM_semantic','rdm');
    elseif each_mask == 7
        figure(); image(rdm,'CDataMapping','scaled');C = colorbar;title('Semantic final RDM');caxis([0 max_val]);
        save('final_Mask_7_RDM_semantic','rdm');
    elseif each_mask == 8
        figure(); image(rdm,'CDataMapping','scaled');C = colorbar;title('Semantic final RDM');caxis([0 max_val]);
        save('final_Mask_8_RDM_semantic','rdm');
    elseif each_mask == 9
        figure(); image(rdm,'CDataMapping','scaled');C = colorbar;title('Semantic final RDM');caxis([0 max_val]);
        save('final_Mask_9_RDM_semantic','rdm');
    elseif each_mask == 10
        figure(); image(rdm,'CDataMapping','scaled');C = colorbar;title('Semantic final RDM');caxis([0 max_val]);
        save('final_Mask_10_RDM_semantic','rdm');
    elseif each_mask == 11
        figure(); image(rdm,'CDataMapping','scaled');C = colorbar;title('Semantic final RDM');caxis([0 max_val]);
        save('final_Mask_11_RDM_semantic','rdm');
    elseif each_mask == 12
        figure(); image(rdm,'CDataMapping','scaled');C = colorbar;title('Semantic final RDM');caxis([0 max_val]);
        save('final_Mask_12_RDM_semantic','rdm');
    elseif each_mask == 13
        figure(); image(rdm,'CDataMapping','scaled');C = colorbar;title('Semantic final RDM');caxis([0 max_val]);
        save('final_Mask_13_RDM_semantic','rdm');
    elseif each_mask == 14
        figure(); image(rdm,'CDataMapping','scaled');C = colorbar;title('Semantic final RDM');caxis([0 max_val]);
        save('final_Mask_14_RDM_semantic','rdm');
    else    
        figure(); image(rdm,'CDataMapping','scaled');C = colorbar;title('Semantic final RDM');caxis([0 max_val]);
        save('final_Mask_15_RDM_semantic','rdm');
        end
 end
