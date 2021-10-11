%% Random image RDM selection
clear all;close all;clc;
rng(0);

path = dir('C:\Users\Marcia\Desktop\BEHAV EXP\euclidean fMRI\estimated\semantic');
file_names = path(~[path.isdir]);
file_names = {file_names.name};
file_names = file_names(1:15)

RDMs_euclidean_estimation_semantic = NaN(15,4186);
RDMs_euclidean_estimation_nonnan_semantic = NaN(15,4186);

 for each_mask=1:numel(file_names)
    mask_name = file_names{each_mask}
    estimated_mask = load(file_names{each_mask});
    comparisons = estimated_mask.estimate_RDM_S;
    
    % each row is a mask and the columns are the rdm vector
    if each_mask==1
        RDMs_euclidean_estimation_semantic=comparisons;
    else
        RDMs_euclidean_estimation_semantic=cat(1,RDMs_euclidean_estimation_semantic,comparisons);
    end
    
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
    
    % find where the nans are
    [row column] = find(isnan(rdm)==1)
    for m=1:length(row)
        % get the average across that row and column
        size_row = length(find(isnan(rdm(row(m),:))==0));
        size_col = length(find(isnan(rdm(:,column(m)))==0));
        n_pixels = size_row + size_col;
        average_row_col(m,1)= (sum(rdm(row(m),:),'omitnan') + sum(rdm(:,column(m)),'omitnan')) / n_pixels;    
    end
    % Get the average values into the RDM to comple it (24 values missing)
    rdm_nonnan=rdm;
    for idx = 1:length(row)
        rdm_nonnan(row(idx),column(idx))=average_row_col(idx,1);
    end
    
    % convert from matrix to vector
    count=0
    for r = 1:nStimuli-1
        for c = r+1:nStimuli
            count=count+1;
            vector_nonnan(1,count) = rdm_nonnan(r,c);
        end
    end
    
    % without nans -> estimated mean value instead
    % each row is a mask and the columns are the rdm vector
    if each_mask==1
        RDMs_euclidean_estimation_nonnan_semantic = vector_nonnan;
    else
        RDMs_euclidean_estimation_nonnan_semantic=cat(1,RDMs_euclidean_estimation_nonnan_semantic,vector_nonnan);
    end
    
    max_array(each_mask)=max(rdm,[],'all');
    max_val = max(max_array);
    max_val = 0.0227
    
    if each_mask == 1
        figure(); image(rdm_nonnan,'CDataMapping','scaled');C = colorbar;title('Mask 1: Semantic RDM');caxis([0 max_val]);saveas(gcf,'01_Mask_semantic.png')
        save('final_Mask_1_RDM_semantic','rdm');
    elseif each_mask == 2
        figure(); image(rdm_nonnan,'CDataMapping','scaled');C = colorbar;title('Mask 2: Semantic RDM');caxis([0 max_val]);saveas(gcf,'02_Mask_semantic.png')
        save('final_Mask_2_RDM_semantic','rdm');
    elseif each_mask == 3
        figure(); image(rdm_nonnan,'CDataMapping','scaled');C = colorbar;title('Mask 3: Semantic RDM');caxis([0 max_val]);saveas(gcf,'03_Mask_semantic.png')
        save('final_Mask_3_RDM_semantic','rdm');
    elseif each_mask == 4
        figure(); image(rdm_nonnan,'CDataMapping','scaled');C = colorbar;title('Mask 4: Semantic RDM');caxis([0 max_val]);saveas(gcf,'04_Mask_semantic.png')
        save('final_Mask_4_RDM_semantic','rdm');
    elseif each_mask == 5
        figure(); image(rdm_nonnan,'CDataMapping','scaled');C = colorbar;title('Mask 5: Semantic RDM');caxis([0 max_val]);saveas(gcf,'05_Mask_semantic.png')
        save('final_Mask_5_RDM_semantic','rdm');
    elseif each_mask == 6
        figure(); image(rdm_nonnan,'CDataMapping','scaled');C = colorbar;title('Mask 6: Semantic RDM');caxis([0 max_val]);saveas(gcf,'06_Mask_semantic.png')
        save('final_Mask_6_RDM_semantic','rdm');
    elseif each_mask == 7
        figure(); image(rdm_nonnan,'CDataMapping','scaled');C = colorbar;title('Mask 7: Semantic RDM');caxis([0 max_val]);saveas(gcf,'07_Mask_semantic.png')
        save('final_Mask_7_RDM_semantic','rdm');
    elseif each_mask == 8
        figure(); image(rdm_nonnan,'CDataMapping','scaled');C = colorbar;title('Mask 8: Semantic RDM');caxis([0 max_val]);saveas(gcf,'08_Mask_semantic.png')
        save('final_Mask_8_RDM_semantic','rdm');
    elseif each_mask == 9
        figure(); image(rdm_nonnan,'CDataMapping','scaled');C = colorbar;title('Mask 9: Semantic RDM');caxis([0 max_val]);saveas(gcf,'09_Mask_semantic.png')
        save('final_Mask_9_RDM_semantic','rdm');
    elseif each_mask == 10
        figure(); image(rdm_nonnan,'CDataMapping','scaled');C = colorbar;title('Mask 10: Semantic RDM');caxis([0 max_val]);saveas(gcf,'10_Mask_semantic.png')
        save('final_Mask_10_RDM_semantic','rdm');
    elseif each_mask == 11
        figure(); image(rdm_nonnan,'CDataMapping','scaled');C = colorbar;title('Mask 11: Semantic RDM');caxis([0 max_val]);saveas(gcf,'11_Mask_semantic.png')
        save('final_Mask_11_RDM_semantic','rdm');
    elseif each_mask == 12
        figure(); image(rdm_nonnan,'CDataMapping','scaled');C = colorbar;title('Mask 12: Semantic RDM');caxis([0 max_val]);saveas(gcf,'12_Mask_semantic.png')
        save('final_Mask_12_RDM_semantic','rdm');
    elseif each_mask == 13
        figure(); image(rdm_nonnan,'CDataMapping','scaled');C = colorbar;title('Mask 13: Semantic RDM');caxis([0 max_val]);saveas(gcf,'13_Mask_semantic.png')
        save('final_Mask_13_RDM_semantic','rdm');
    elseif each_mask == 14
        figure(); image(rdm_nonnan,'CDataMapping','scaled');C = colorbar;title('Mask 14: Semantic RDM');caxis([0 max_val]);saveas(gcf,'14_Mask_semantic.png')
        save('final_Mask_14_RDM_semantic','rdm');
    else    
        figure(); image(rdm_nonnan,'CDataMapping','scaled');C = colorbar;title('Mask 15: Semantic RDM');caxis([0 max_val]);saveas(gcf,'15_Mask_semantic.png')
        save('final_Mask_15_RDM_semantic','rdm');
    end
 end

 save RDMs_euclidean_estimation_semantic RDMs_euclidean_estimation_semantic
 save RDMs_euclidean_estimation_nonnan_semantic RDMs_euclidean_estimation_nonnan_semantic