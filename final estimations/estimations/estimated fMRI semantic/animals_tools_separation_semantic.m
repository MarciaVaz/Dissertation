%% Random image RDM selection
clear all;close all;clc;
rng(0);

nStimuli = 46;

path = dir(pwd);
Files=dir('*_final_Mask_rdm*');
Files.name

RDMs_euclidean_vector_semantic_animals = NaN(15,1035);
RDMs_euclidean_vector_semantic_tools = NaN(15,1035);

 for each_mask=1:numel(Files)
    Files(each_mask).name
    estimated_mask = load(Files(each_mask).name)
    rdm_matrix = estimated_mask.rdm_nonnan;
    
    %% create a small rdm for animals and for tools
    half_stimuli = length(rdm_matrix)/2;
    rdm_semantic_animals = rdm_matrix(1:half_stimuli,1:half_stimuli)
    rdm_semantic_tools = rdm_matrix(half_stimuli+1:end,half_stimuli+1:end)
    
%     figure(); image(rdm_semantic_animals,'CDataMapping','scaled');C = colorbar;caxis([0 0.0227]);
%     figure(); image(rdm_semantic_tools,'CDataMapping','scaled');C = colorbar;caxis([0 0.0227]);
    
    %% convert the 2 rdms matrices into vectors
    count=0
    for r = 1:nStimuli-1
        for c = r+1:nStimuli
            count=count+1;
            rdm_vector_animals(1,count) = rdm_semantic_animals(r,c);,
            rdm_vector_tools(1,count) = rdm_semantic_tools(r,c);
        end
    end
    
    % each row is a mask and the columns are the rdm vector
    if each_mask==1
        RDMs_euclidean_vector_semantic_animals=rdm_vector_animals;
        RDMs_euclidean_vector_semantic_tools=rdm_vector_tools;
    else
        RDMs_euclidean_vector_semantic_animals=cat(1,RDMs_euclidean_vector_semantic_animals,rdm_vector_animals);
        RDMs_euclidean_vector_semantic_tools=cat(1,RDMs_euclidean_vector_semantic_tools,rdm_vector_tools);
    end
    
    max_val=0.0227

    load('stimuli_names_92.mat');

    if each_mask == 1
        figure('units','normalized','WindowState','maximized');   image(rdm_semantic_animals,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:46); set(gca,'xticklabel',table2array(stimuli_names_92(1:46,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:46); set(gca,'yticklabel',table2array(stimuli_names_92(1:46,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Semantic RDM: left posterior occipital visual cortex (animals)'],'fontsize',11);
        saveas(gcf,'01_Mask_semantic_animals.png');
        save('01_final_Mask_semantic_animals','rdm_semantic_animals');
        
        figure('units','normalized','WindowState','maximized');   image(rdm_semantic_tools,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:46); set(gca,'xticklabel',table2array(stimuli_names_92(47:92,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:46); set(gca,'yticklabel',table2array(stimuli_names_92(47:92,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Semantic RDM: left posterior occipital visual cortex (tools)'],'fontsize',11);
        saveas(gcf,'01_Mask_semantic_tools.png');
        save('01_final_Mask_semantic_tools','rdm_semantic_tools');
        
    elseif each_mask == 2
        figure('units','normalized','WindowState','maximized');   image(rdm_semantic_animals,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:46); set(gca,'xticklabel',table2array(stimuli_names_92(1:46,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:46); set(gca,'yticklabel',table2array(stimuli_names_92(1:46,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Semantic RDM: right lateral occipital cortex (animals)'],'fontsize',11);
        saveas(gcf,'02_Mask_semantic_animals.png');
        save('02_final_Mask_semantic_animals','rdm_semantic_animals');
        
        figure('units','normalized','WindowState','maximized');   image(rdm_semantic_tools,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:46); set(gca,'xticklabel',table2array(stimuli_names_92(47:92,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:46); set(gca,'yticklabel',table2array(stimuli_names_92(47:92,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Semantic RDM: right lateral occipital cortex (tools)'],'fontsize',11);
        saveas(gcf,'02_Mask_semantic_tools.png');
        save('02_final_Mask_semantic_tools','rdm_semantic_tools');
        
    elseif each_mask == 3
        figure('units','normalized','WindowState','maximized');   image(rdm_semantic_animals,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:46); set(gca,'xticklabel',table2array(stimuli_names_92(1:46,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:46); set(gca,'yticklabel',table2array(stimuli_names_92(1:46,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Semantic RDM: left lateral occipital cortex (animals)'],'fontsize',11);
        saveas(gcf,'03_Mask_semantic_animals.png');
        save('03_final_Mask_semantic_animals','rdm_semantic_animals');
        
        figure('units','normalized','WindowState','maximized');   image(rdm_semantic_tools,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:46); set(gca,'xticklabel',table2array(stimuli_names_92(47:92,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:46); set(gca,'yticklabel',table2array(stimuli_names_92(47:92,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Semantic RDM: left lateral occipital cortex (tools)'],'fontsize',11);
        saveas(gcf,'03_Mask_semantic_tools.png');
        save('03_final_Mask_semantic_tools','rdm_semantic_tools');
        
    elseif each_mask == 4
        figure('units','normalized','WindowState','maximized');   image(rdm_semantic_animals,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:46); set(gca,'xticklabel',table2array(stimuli_names_92(1:46,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:46); set(gca,'yticklabel',table2array(stimuli_names_92(1:46,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Semantic RDM: right fusiform gyrus (animals)'],'fontsize',11);
        saveas(gcf,'04_Mask_semantic_animals.png');
        save('04_final_Mask_semantic_animals','rdm_semantic_animals');
        
        figure('units','normalized','WindowState','maximized');   image(rdm_semantic_tools,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:46); set(gca,'xticklabel',table2array(stimuli_names_92(47:92,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:46); set(gca,'yticklabel',table2array(stimuli_names_92(47:92,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Semantic RDM: right fusiform gyrus (tools)'],'fontsize',11);
        saveas(gcf,'04_Mask_semantic_tools.png');
        save('04_final_Mask_semantic_tools','rdm_semantic_tools');
        
    elseif each_mask == 5
        figure('units','normalized','WindowState','maximized');   image(rdm_semantic_animals,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:46); set(gca,'xticklabel',table2array(stimuli_names_92(1:46,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:46); set(gca,'yticklabel',table2array(stimuli_names_92(1:46,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Semantic RDM: left fusiform gyrus (animals)'],'fontsize',11);
        saveas(gcf,'05_Mask_semantic_animals.png');
        save('05_final_Mask_semantic_animals','rdm_semantic_animals');
        
        figure('units','normalized','WindowState','maximized');   image(rdm_semantic_tools,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:46); set(gca,'xticklabel',table2array(stimuli_names_92(47:92,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:46); set(gca,'yticklabel',table2array(stimuli_names_92(47:92,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Semantic RDM: left fusiform gyrus (tools)'],'fontsize',11);
        saveas(gcf,'05_Mask_semantic_tools.png');
        save('05_final_Mask_semantic_tools','rdm_semantic_tools');
        
    elseif each_mask == 6
        figure('units','normalized','WindowState','maximized');   image(rdm_semantic_animals,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:46); set(gca,'xticklabel',table2array(stimuli_names_92(1:46,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:46); set(gca,'yticklabel',table2array(stimuli_names_92(1:46,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Semantic RDM: left anterior temporal lobe (animals)'],'fontsize',11);
        saveas(gcf,'06_Mask_semantic_animals.png');
        save('06_final_Mask_semantic_animals','rdm_semantic_animals');
        
        figure('units','normalized','WindowState','maximized');   image(rdm_semantic_tools,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:46); set(gca,'xticklabel',table2array(stimuli_names_92(47:92,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:46); set(gca,'yticklabel',table2array(stimuli_names_92(47:92,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Semantic RDM: left anterior temporal lobe (tools)'],'fontsize',11);
        saveas(gcf,'06_Mask_semantic_tools.png');
        save('06_final_Mask_semantic_tools','rdm_semantic_tools');
        
    elseif each_mask == 7
        figure('units','normalized','WindowState','maximized');   image(rdm_semantic_animals,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:46); set(gca,'xticklabel',table2array(stimuli_names_92(1:46,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:46); set(gca,'yticklabel',table2array(stimuli_names_92(1:46,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Semantic RDM: frontal polar (animals)'],'fontsize',11);
        saveas(gcf,'07_Mask_semantic_animals.png');
        save('07_final_Mask_semantic_animals','rdm_semantic_animals');
        
        figure('units','normalized','WindowState','maximized');   image(rdm_semantic_tools,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:46); set(gca,'xticklabel',table2array(stimuli_names_92(47:92,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:46); set(gca,'yticklabel',table2array(stimuli_names_92(47:92,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Semantic RDM: frontal polar (tools)'],'fontsize',11);
        saveas(gcf,'07_Mask_semantic_tools.png');
        save('07_final_Mask_semantic_tools','rdm_semantic_tools');
        
    elseif each_mask == 8
        figure('units','normalized','WindowState','maximized');   image(rdm_semantic_animals,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:46); set(gca,'xticklabel',table2array(stimuli_names_92(1:46,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:46); set(gca,'yticklabel',table2array(stimuli_names_92(1:46,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Semantic RDM: posterior cirgulate gyrus (animals)'],'fontsize',11);
        saveas(gcf,'08_Mask_semantic_animals.png');
        save('08_final_Mask_semantic_animals','rdm_semantic_animals');
        
        figure('units','normalized','WindowState','maximized');   image(rdm_semantic_tools,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:46); set(gca,'xticklabel',table2array(stimuli_names_92(47:92,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:46); set(gca,'yticklabel',table2array(stimuli_names_92(47:92,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Semantic RDM: posterior cirgulate gyrus (tools)'],'fontsize',11);
        saveas(gcf,'08_Mask_semantic_tools.png');
        save('08_final_Mask_semantic_tools','rdm_semantic_tools');
        
    elseif each_mask == 9
        figure('units','normalized','WindowState','maximized');   image(rdm_semantic_animals,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:46); set(gca,'xticklabel',table2array(stimuli_names_92(1:46,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:46); set(gca,'yticklabel',table2array(stimuli_names_92(1:46,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Semantic RDM: right posterior insula (animals)'],'fontsize',11);
        saveas(gcf,'09_Mask_semantic_animals.png');
        save('09_final_Mask_semantic_animals','rdm_semantic_animals');
        
        figure('units','normalized','WindowState','maximized');   image(rdm_semantic_tools,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:46); set(gca,'xticklabel',table2array(stimuli_names_92(47:92,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:46); set(gca,'yticklabel',table2array(stimuli_names_92(47:92,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Semantic RDM: right posterior insula (tools)'],'fontsize',11);
        saveas(gcf,'09_Mask_semantic_tools.png');
        save('09_final_Mask_semantic_tools','rdm_semantic_tools');
        
    elseif each_mask == 10
        figure('units','normalized','WindowState','maximized');   image(rdm_semantic_animals,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:46); set(gca,'xticklabel',table2array(stimuli_names_92(1:46,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:46); set(gca,'yticklabel',table2array(stimuli_names_92(1:46,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Semantic RDM: right superior frontal (animals)'],'fontsize',11);
        saveas(gcf,'10_Mask_semantic_animals.png');
        save('10_final_Mask_semantic_animals','rdm_semantic_animals');
        
        figure('units','normalized','WindowState','maximized');   image(rdm_semantic_tools,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:46); set(gca,'xticklabel',table2array(stimuli_names_92(47:92,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:46); set(gca,'yticklabel',table2array(stimuli_names_92(47:92,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Semantic RDM: right superior frontal (tools)'],'fontsize',11);
        saveas(gcf,'10_Mask_semantic_tools.png');
        save('10_final_Mask_semantic_tools','rdm_semantic_tools');
        
    elseif each_mask == 11
        figure('units','normalized','WindowState','maximized');   image(rdm_semantic_animals,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:46); set(gca,'xticklabel',table2array(stimuli_names_92(1:46,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:46); set(gca,'yticklabel',table2array(stimuli_names_92(1:46,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Semantic RDM: left lateral occipital cortex (animals)'],'fontsize',11);
        saveas(gcf,'11_Mask_semantic_animals.png');
        save('11_final_Mask_semantic_animals','rdm_semantic_animals');
        
        figure('units','normalized','WindowState','maximized');   image(rdm_semantic_tools,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:46); set(gca,'xticklabel',table2array(stimuli_names_92(47:92,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:46); set(gca,'yticklabel',table2array(stimuli_names_92(47:92,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Semantic RDM: left lateral occipital cortex (tools)'],'fontsize',11);
        saveas(gcf,'11_Mask_semantic_tools.png');
        save('11_final_Mask_semantic_tools','rdm_semantic_tools');
        
    elseif each_mask == 12
        figure('units','normalized','WindowState','maximized');   image(rdm_semantic_animals,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:46); set(gca,'xticklabel',table2array(stimuli_names_92(1:46,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:46); set(gca,'yticklabel',table2array(stimuli_names_92(1:46,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Semantic RDM: left parietal (animals)'],'fontsize',11);
        saveas(gcf,'12_Mask_semantic_animals.png');
        save('12_final_Mask_semantic_animals','rdm_semantic_animals');
        
        figure('units','normalized','WindowState','maximized');   image(rdm_semantic_tools,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:46); set(gca,'xticklabel',table2array(stimuli_names_92(47:92,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:46); set(gca,'yticklabel',table2array(stimuli_names_92(47:92,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Semantic RDM: left parietal (tools)'],'fontsize',11);
        saveas(gcf,'12_Mask_semantic_tools.png');
        save('12_final_Mask_semantic_tools','rdm_semantic_tools');
        
    elseif each_mask == 13
        figure('units','normalized','WindowState','maximized');   image(rdm_semantic_animals,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:46); set(gca,'xticklabel',table2array(stimuli_names_92(1:46,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:46); set(gca,'yticklabel',table2array(stimuli_names_92(1:46,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Semantic RDM: right parietal (animals)'],'fontsize',11);
        saveas(gcf,'13_Mask_semantic_animals.png');
        save('13_final_Mask_semantic_animals','rdm_semantic_animals');
        
        figure('units','normalized','WindowState','maximized');   image(rdm_semantic_tools,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:46); set(gca,'xticklabel',table2array(stimuli_names_92(47:92,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:46); set(gca,'yticklabel',table2array(stimuli_names_92(47:92,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Semantic RDM: right parietal (tools)'],'fontsize',11);
        saveas(gcf,'13_Mask_semantic_tools.png');
        save('13_final_Mask_semantic_tools','rdm_semantic_tools');
        
    elseif each_mask == 14
        figure('units','normalized','WindowState','maximized');   image(rdm_semantic_animals,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:46); set(gca,'xticklabel',table2array(stimuli_names_92(1:46,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:46); set(gca,'yticklabel',table2array(stimuli_names_92(1:46,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Semantic RDM: left pre-motor cortex (animals)'],'fontsize',11);
        saveas(gcf,'14_Mask_semantic_animals.png');
        save('14_final_Mask_semantic_animals','rdm_semantic_animals');
        
        figure('units','normalized','WindowState','maximized');   image(rdm_semantic_tools,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:46); set(gca,'xticklabel',table2array(stimuli_names_92(47:92,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:46); set(gca,'yticklabel',table2array(stimuli_names_92(47:92,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Semantic RDM: left pre-motor cortex (tools)'],'fontsize',11);
        saveas(gcf,'14_Mask_semantic_tools.png');
        save('14_final_Mask_semantic_tools','rdm_semantic_tools');
        
    else    
        figure('units','normalized','WindowState','maximized');   image(rdm_semantic_animals,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:46); set(gca,'xticklabel',table2array(stimuli_names_92(1:46,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:46); set(gca,'yticklabel',table2array(stimuli_names_92(1:46,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Semantic RDM: right cerebellum (animals)'],'fontsize',11);
        saveas(gcf,'15_Mask_semantic_animals.png');
        save('15_final_Mask_semantic_animals','rdm_semantic_animals');
        
        figure('units','normalized','WindowState','maximized');   image(rdm_semantic_tools,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:46); set(gca,'xticklabel',table2array(stimuli_names_92(47:92,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:46); set(gca,'yticklabel',table2array(stimuli_names_92(47:92,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Semantic RDM: right cerebellum (tools)'],'fontsize',11);
        saveas(gcf,'15_Mask_semantic_tools.png');
        save('15_final_Mask_semantic_tools','rdm_semantic_tools');
        
    end

end
RDMs_euclidean_vector_semantic_animals
RDMs_euclidean_vector_semantic_tools

save RDMs_euclidean_vector_semantic_animals RDMs_euclidean_vector_semantic_animals
save RDMs_euclidean_vector_semantic_tools RDMs_euclidean_vector_semantic_tools
