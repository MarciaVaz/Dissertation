%% Random image RDM selection
clear all;close all;clc;
rng(0);

path = dir('C:\Users\Marcia\Desktop\BEHAV EXP\euclidean fMRI\estimated\action');
file_names = path(~[path.isdir]);
file_names = {file_names.name};
file_names = file_names(1:15)

RDMs_euclidean_estimation_action = NaN(15,4186);
RDMs_euclidean_estimation_nonnan_action = NaN(15,4186);

 for each_mask=1:numel(file_names)
    mask_name = file_names{each_mask}
    estimated_mask = load(file_names{each_mask});
    comparisons = estimated_mask.estimate_RDM_A;
    
    % each row is a mask and the columns are the rdm vector
    if each_mask==1
        RDMs_euclidean_estimation_action=comparisons;
    else
        RDMs_euclidean_estimation_action=cat(1,RDMs_euclidean_estimation_action,comparisons);
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
        RDMs_euclidean_estimation_nonnan_action = vector_nonnan;
    else
        RDMs_euclidean_estimation_nonnan_action=cat(1,RDMs_euclidean_estimation_nonnan_action,vector_nonnan);
    end
    
    max_val=0.0227
    
    load('stimuli_names_92.mat');

    if each_mask == 1
        figure('units','normalized','outerposition',[0 0 1 1]); image(rdm_nonnan,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:92); set(gca,'xticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:92); set(gca,'yticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Action RDM: frontal polar'],'fontsize',11);
        saveas(gcf,'07_Mask_action.png');
        save('07_final_Mask_rdm_action','rdm_nonnan');
        
    elseif each_mask == 2
        figure('units','normalized','outerposition',[0 0 1 1]); image(rdm_nonnan,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:92); set(gca,'xticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:92); set(gca,'yticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Action RDM: left anterior temporal lobe'],'fontsize',11);
        saveas(gcf,'12_Mask_action.png')
        save('12_final_Mask_rdm_action','rdm_nonnan');
    elseif each_mask == 3
        figure('units','normalized','outerposition',[0 0 1 1]); image(rdm_nonnan,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:92); set(gca,'xticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:92); set(gca,'yticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Action RDM: left fusiform gyrus'],'fontsize',11);
        saveas(gcf,'05_Mask_action.png')
        save('05_final_Mask_rdm_action','rdm_nonnan');
    elseif each_mask == 4
        figure('units','normalized','outerposition',[0 0 1 1]); image(rdm_nonnan,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:92); set(gca,'xticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:92); set(gca,'yticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Action RDM: left lateral occipital cortex'],'fontsize',11);
        saveas(gcf,'11_Mask_action.png')
        save('11_final_Mask_rdm_action','rdm_nonnan');
    elseif each_mask == 5
        figure('units','normalized','outerposition',[0 0 1 1]); image(rdm_nonnan,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:92); set(gca,'xticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:92); set(gca,'yticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Action RDM: left lateral occipital cortex'],'fontsize',11);
        saveas(gcf,'03_Mask_action.png')
        save('03_final_Mask_rdm_action','rdm_nonnan');
    elseif each_mask == 6
        figure('units','normalized','outerposition',[0 0 1 1]); image(rdm_nonnan,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:92); set(gca,'xticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:92); set(gca,'yticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Action RDM: left parietal'],'fontsize',11);
        saveas(gcf,'02_Mask_action.png')
        save('02_final_Mask_rdm_action','rdm_nonnan');
    elseif each_mask == 7
        figure('units','normalized','outerposition',[0 0 1 1]); image(rdm_nonnan,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:92); set(gca,'xticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:92); set(gca,'yticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Action RDM: left posterior occipital visual cortex'],'fontsize',11);
        saveas(gcf,'01_Mask_action.png')
        save('01_final_Mask_rdm_action','rdm_nonnan');
    elseif each_mask == 8
        figure('units','normalized','outerposition',[0 0 1 1]); image(rdm_nonnan,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:92); set(gca,'xticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:92); set(gca,'yticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Action RDM: left pre-motor cortex'],'fontsize',11);
        saveas(gcf,'09_Mask_action.png')
        save('09_final_Mask_rdm_action','rdm_nonnan');
    elseif each_mask == 9
        figure('units','normalized','outerposition',[0 0 1 1]); image(rdm_nonnan,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:92); set(gca,'xticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:92); set(gca,'yticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Action RDM: posterior cirgulate gyrus'],'fontsize',11);
        saveas(gcf,'14_Mask_action.png')
        save('14_final_Mask_rdm_action','rdm_nonnan');
    elseif each_mask == 10
        figure('units','normalized','outerposition',[0 0 1 1]); image(rdm_nonnan,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:92); set(gca,'xticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:92); set(gca,'yticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Action RDM: right cerebellum'],'fontsize',11);
        saveas(gcf,'15_Mask_action.png')
        save('15_final_Mask_rdm_action','rdm_nonnan');
    elseif each_mask == 11
        figure('units','normalized','outerposition',[0 0 1 1]); image(rdm_nonnan,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:92); set(gca,'xticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:92); set(gca,'yticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Action RDM: right fusiform gyrus'],'fontsize',11);
        saveas(gcf,'04_Mask_action.png')
        save('04_final_Mask_rdm_action','rdm_nonnan');
    elseif each_mask == 12
        figure('units','normalized','outerposition',[0 0 1 1]); image(rdm_nonnan,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:92); set(gca,'xticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:92); set(gca,'yticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Action RDM: right lateral occipital cortex'],'fontsize',11);
        saveas(gcf,'06_Mask_action.png')
        save('06_final_Mask_rdm_action','rdm_nonnan');
    elseif each_mask == 13
        figure('units','normalized','outerposition',[0 0 1 1]); image(rdm_nonnan,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:92); set(gca,'xticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:92); set(gca,'yticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Action RDM: right parietal'],'fontsize',11);
        saveas(gcf,'13_Mask_action.png')
        save('13_final_Mask_rdm_action','rdm_nonnan');
    elseif each_mask == 14
        figure('units','normalized','outerposition',[0 0 1 1]); image(rdm_nonnan,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:92); set(gca,'xticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:92); set(gca,'yticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Action RDM: right posterior insula'],'fontsize',11);
        saveas(gcf,'08_Mask_action.png')
        save('08_final_Mask_rdm_action','rdm_nonnan');
    else    
        figure('units','normalized','outerposition',[0 0 1 1]); image(rdm_nonnan,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:92); set(gca,'xticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:92); set(gca,'yticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Action RDM: right superior frontal'],'fontsize',11);
        saveas(gcf,'10_Mask_action.png')
        save('10_final_Mask_rdm_action','rdm_nonnan');
    end

end

save RDMs_euclidean_estimation_action RDMs_euclidean_estimation_action
save RDMs_euclidean_estimation_nonnan_action RDMs_euclidean_estimation_nonnan_action