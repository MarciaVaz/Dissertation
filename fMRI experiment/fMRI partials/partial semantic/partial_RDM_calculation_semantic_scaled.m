clear all;close all;clc;

mask = 15

load('stimuli_names_92.mat');

path = dir(pwd);
file_names=dir('*_Mask_partials*');
file_names.name

for pt = 1:20
         % save an image 
    participant = file_names(mask).name
    load(participant)
    comparisons_vector = partials_RDM_S(:,:,pt);
    
    rdm = NaN(92,92);

        countComparison=0;
        % fill the matrix with small RDM values
        for img_1 = 1:91
            for img_2 = img_1+1:92
                countComparison=countComparison+1;
                rdm(img_1,img_2) = comparisons_vector(1,countComparison);
                rdm(img_2,img_1) = comparisons_vector(1,countComparison);
                
            end
        end

        for imag = 1:92
            rdm(imag,imag)=0;
        end
        
    max_val=0.0227;
% 	max_val=0.009;

	if pt == 1
        figure('units','normalized','WindowState','maximized');   image(rdm,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:92); set(gca,'xticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:92); set(gca,'yticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Partial RDM: Participant 1, Mask 15 (Semantic)'],'fontsize',11);
        saveas(gcf,'Mask_15_Participant_01_Semantic.png');
        
    elseif pt == 2
        figure('units','normalized','WindowState','maximized');   image(rdm,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:92); set(gca,'xticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:92); set(gca,'yticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Partial RDM: Participant 2, Mask 15 (Semantic)'],'fontsize',11);
        saveas(gcf,'Mask_15_Participant_02_Semantic.png');
    elseif pt == 3
        figure('units','normalized','WindowState','maximized');   image(rdm,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:92); set(gca,'xticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:92); set(gca,'yticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Partial RDM: Participant 3, Mask 15 (Semantic)'],'fontsize',11);
        saveas(gcf,'Mask_15_Participant_03_Semantic.png');
    elseif pt == 4
        figure('units','normalized','WindowState','maximized');   image(rdm,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:92); set(gca,'xticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:92); set(gca,'yticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Partial RDM: Participant 4, Mask 15 (Semantic)'],'fontsize',11);
        saveas(gcf,'Mask_15_Participant_04_Semantic.png');
    elseif pt == 5
        figure('units','normalized','WindowState','maximized');   image(rdm,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:92); set(gca,'xticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:92); set(gca,'yticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Partial RDM: Participant 5, Mask 15 (Semantic)'],'fontsize',11);
        saveas(gcf,'Mask_15_Participant_05_Semantic.png');
    elseif pt == 6
        figure('units','normalized','WindowState','maximized');   image(rdm,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:92); set(gca,'xticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:92); set(gca,'yticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Partial RDM: Participant 6, Mask 15 (Semantic)'],'fontsize',11);
        saveas(gcf,'Mask_15_Participant_06_Semantic.png');
    elseif pt == 7
        figure('units','normalized','WindowState','maximized');   image(rdm,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:92); set(gca,'xticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:92); set(gca,'yticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Partial RDM: Participant 7, Mask 15 (Semantic)'],'fontsize',11);
        saveas(gcf,'Mask_15_Participant_07_Semantic.png');
    elseif pt == 8
        figure('units','normalized','WindowState','maximized');   image(rdm,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:92); set(gca,'xticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:92); set(gca,'yticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Partial RDM: Participant 8, Mask 15 (Semantic)'],'fontsize',11);
        saveas(gcf,'Mask_15_Participant_08_Semantic.png');
    elseif pt == 9
        figure('units','normalized','WindowState','maximized');   image(rdm,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:92); set(gca,'xticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:92); set(gca,'yticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Partial RDM: Participant 9, Mask 15 (Semantic)'],'fontsize',11);
        saveas(gcf,'Mask_15_Participant_09_Semantic.png');
    elseif pt == 10
        figure('units','normalized','WindowState','maximized');   image(rdm,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:92); set(gca,'xticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:92); set(gca,'yticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Partial RDM: Participant 10, Mask 15 (Semantic)'],'fontsize',11);
        saveas(gcf,'Mask_15_Participant_10_Semantic.png');
    elseif pt == 11
        figure('units','normalized','WindowState','maximized');   image(rdm,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:92); set(gca,'xticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:92); set(gca,'yticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Partial RDM: Participant 11, Mask 15 (Semantic)'],'fontsize',11);
        saveas(gcf,'Mask_15_Participant_11_Semantic.png');
    elseif pt == 12
        figure('units','normalized','WindowState','maximized');   image(rdm,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:92); set(gca,'xticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:92); set(gca,'yticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Partial RDM: Participant 12, Mask 15 (Semantic)'],'fontsize',11);
        saveas(gcf,'Mask_15_Participant_12_Semantic.png');
    elseif pt == 13
        figure('units','normalized','WindowState','maximized');   image(rdm,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:92); set(gca,'xticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:92); set(gca,'yticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Partial RDM: Participant 13, Mask 15 (Semantic)'],'fontsize',11);
        saveas(gcf,'Mask_15_Participant_13_Semantic.png');
    elseif pt == 14
        figure('units','normalized','WindowState','maximized');   image(rdm,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:92); set(gca,'xticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:92); set(gca,'yticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Partial RDM: Participant 14, Mask 15 (Semantic)'],'fontsize',11);
        saveas(gcf,'Mask_15_Participant_14_Semantic.png');
    elseif pt == 15
        figure('units','normalized','WindowState','maximized');   image(rdm,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:92); set(gca,'xticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:92); set(gca,'yticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Partial RDM: Participant 15, Mask 15 (Semantic)'],'fontsize',11);
        saveas(gcf,'Mask_15_Participant_15_Semantic.png');
    elseif pt == 16
        figure('units','normalized','WindowState','maximized');   image(rdm,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:92); set(gca,'xticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:92); set(gca,'yticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Partial RDM: Participant 16, Mask 15 (Semantic)'],'fontsize',11);
        saveas(gcf,'Mask_15_Participant_16_Semantic.png');
    elseif pt == 17
        figure('units','normalized','WindowState','maximized');   image(rdm,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:92); set(gca,'xticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:92); set(gca,'yticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Partial RDM: Participant 17, Mask 15 (Semantic)'],'fontsize',11);
        saveas(gcf,'Mask_15_Participant_17_Semantic.png');
    elseif pt == 18
        figure('units','normalized','WindowState','maximized');   image(rdm,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:92); set(gca,'xticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:92); set(gca,'yticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Partial RDM: Participant 18, Mask 15 (Semantic)'],'fontsize',11);
        saveas(gcf,'Mask_15_Participant_18_Semantic.png');
    elseif pt == 19
        figure('units','normalized','WindowState','maximized');   image(rdm,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:92); set(gca,'xticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:92); set(gca,'yticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Partial RDM: Participant 19, Mask 15 (Semantic)'],'fontsize',11);
        saveas(gcf,'Mask_15_Participant_19_Semantic.png');
    else    
        figure('units','normalized','WindowState','maximized');   image(rdm,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:92); set(gca,'xticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:92); set(gca,'yticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Partial RDM: Participant 20, Mask 15 (Semantic)'],'fontsize',11);
        saveas(gcf,'Mask_15_Participant_20_Semantic.png');
    end
    

    
end
