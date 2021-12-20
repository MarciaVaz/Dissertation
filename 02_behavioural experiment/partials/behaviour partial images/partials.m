clear all;close all;clc;

task = 1

load('stimuli_names_92.mat');

% load('partial_1.mat')
% load('partial.mat')


path = dir(pwd);
file_names=dir('*partials_RDM*');
file_names.name

for pt = 1:45
         % save an image 
    participant = file_names(task).name
    load(participant)
    comparisons_vector = partials_RDM_all_behav_action(:,:,pt);
    
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
        
%     max_val=0.0227;
	max_val=0.0227;

	if pt == 1
        figure('units','normalized','WindowState','maximized');   image(rdm,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:92); set(gca,'xticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:92); set(gca,'yticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Partial RDM: Participant 1 (Action)'],'fontsize',11);
        saveas(gcf,'Participant_01_Action.png');       
    elseif pt == 2
        figure('units','normalized','WindowState','maximized');   image(rdm,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:92); set(gca,'xticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:92); set(gca,'yticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Partial RDM: Participant 2 (Action)'],'fontsize',11);
        saveas(gcf,'Participant_02_Action.png');
    elseif pt == 3
        figure('units','normalized','WindowState','maximized');   image(rdm,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:92); set(gca,'xticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:92); set(gca,'yticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Partial RDM: Participant 3 (Action)'],'fontsize',11);
        saveas(gcf,'Participant_03_Action.png');
    elseif pt == 4
        figure('units','normalized','WindowState','maximized');   image(rdm,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:92); set(gca,'xticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:92); set(gca,'yticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Partial RDM: Participant 4 (Action)'],'fontsize',11);
        saveas(gcf,'Participant_04_Action.png');
    elseif pt == 5
        figure('units','normalized','WindowState','maximized');   image(rdm,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:92); set(gca,'xticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:92); set(gca,'yticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Partial RDM: Participant 5 (Action)'],'fontsize',11);
        saveas(gcf,'Participant_05_Action.png');
    elseif pt == 6
        figure('units','normalized','WindowState','maximized');   image(rdm,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:92); set(gca,'xticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:92); set(gca,'yticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Partial RDM: Participant 6 (Action)'],'fontsize',11);
        saveas(gcf,'Participant_06_Action.png');
    elseif pt == 7
        figure('units','normalized','WindowState','maximized');   image(rdm,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:92); set(gca,'xticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:92); set(gca,'yticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Partial RDM: Participant 7 (Action)'],'fontsize',11);
        saveas(gcf,'Participant_07_Action.png');
    elseif pt == 8
        figure('units','normalized','WindowState','maximized');   image(rdm,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:92); set(gca,'xticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:92); set(gca,'yticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Partial RDM: Participant 8 (Action)'],'fontsize',11);
        saveas(gcf,'Participant_08_Action.png');
    elseif pt == 9
        figure('units','normalized','WindowState','maximized');   image(rdm,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:92); set(gca,'xticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:92); set(gca,'yticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Partial RDM: Participant 9 (Action)'],'fontsize',11);
        saveas(gcf,'Participant_09_Action.png');
    elseif pt == 10
        figure('units','normalized','WindowState','maximized');   image(rdm,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:92); set(gca,'xticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:92); set(gca,'yticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Partial RDM: Participant 10 (Action)'],'fontsize',11);
        saveas(gcf,'Participant_10_Action.png');
    elseif pt == 11
        figure('units','normalized','WindowState','maximized');   image(rdm,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:92); set(gca,'xticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:92); set(gca,'yticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Partial RDM: Participant 11 (Action)'],'fontsize',11);
        saveas(gcf,'Participant_11_Action.png');
    elseif pt == 12
        figure('units','normalized','WindowState','maximized');   image(rdm,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:92); set(gca,'xticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:92); set(gca,'yticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Partial RDM: Participant 12 (Action)'],'fontsize',11);
        saveas(gcf,'Participant_12_Action.png');
    elseif pt == 13
        figure('units','normalized','WindowState','maximized');   image(rdm,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:92); set(gca,'xticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:92); set(gca,'yticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Partial RDM: Participant 13 (Action)'],'fontsize',11);
        saveas(gcf,'Participant_13_Action.png');
    elseif pt == 14
        figure('units','normalized','WindowState','maximized');   image(rdm,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:92); set(gca,'xticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:92); set(gca,'yticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Partial RDM: Participant 14 (Action)'],'fontsize',11);
        saveas(gcf,'Participant_14_Action.png');
    elseif pt == 15
        figure('units','normalized','WindowState','maximized');   image(rdm,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:92); set(gca,'xticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:92); set(gca,'yticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Partial RDM: Participant 15 (Action)'],'fontsize',11);
        saveas(gcf,'Participant_15_Action.png');
    elseif pt == 16
        figure('units','normalized','WindowState','maximized');   image(rdm,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:92); set(gca,'xticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:92); set(gca,'yticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Partial RDM: Participant 16 (Action)'],'fontsize',11);
        saveas(gcf,'Participant_16_Action.png');
    elseif pt == 17
        figure('units','normalized','WindowState','maximized');   image(rdm,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:92); set(gca,'xticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:92); set(gca,'yticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Partial RDM: Participant 17 (Action)'],'fontsize',11);
        saveas(gcf,'Participant_17_Action.png');
    elseif pt == 18
        figure('units','normalized','WindowState','maximized');   image(rdm,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:92); set(gca,'xticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:92); set(gca,'yticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Partial RDM: Participant 18 (Action)'],'fontsize',11);
        saveas(gcf,'Participant_18_Action.png');
    elseif pt == 19
        figure('units','normalized','WindowState','maximized');   image(rdm,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:92); set(gca,'xticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:92); set(gca,'yticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Partial RDM: Participant 19 (Action)'],'fontsize',11);
        saveas(gcf,'Participant_19_Action.png');
    elseif pt == 20    
        figure('units','normalized','WindowState','maximized');   image(rdm,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:92); set(gca,'xticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:92); set(gca,'yticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Partial RDM: Participant 20 (Action)'],'fontsize',11);
        saveas(gcf,'Participant_20_Action.png');
    elseif pt == 21
        figure('units','normalized','WindowState','maximized');   image(rdm,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:92); set(gca,'xticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:92); set(gca,'yticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Partial RDM: Participant 21 (Action)'],'fontsize',11);
        saveas(gcf,'Participant_21_Action.png');   
    elseif pt == 22
        figure('units','normalized','WindowState','maximized');   image(rdm,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:92); set(gca,'xticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:92); set(gca,'yticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Partial RDM: Participant 22 (Action)'],'fontsize',11);
        saveas(gcf,'Participant_22_Action.png');
    elseif pt == 23
        figure('units','normalized','WindowState','maximized');   image(rdm,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:92); set(gca,'xticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:92); set(gca,'yticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Partial RDM: Participant 23 (Action)'],'fontsize',11);
        saveas(gcf,'Participant_23_Action.png');
    elseif pt == 24
        figure('units','normalized','WindowState','maximized');   image(rdm,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:92); set(gca,'xticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:92); set(gca,'yticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Partial RDM: Participant 24 (Action)'],'fontsize',11);
        saveas(gcf,'Participant_24_Action.png');
    elseif pt == 25
        figure('units','normalized','WindowState','maximized');   image(rdm,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:92); set(gca,'xticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:92); set(gca,'yticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Partial RDM: Participant 25 (Action)'],'fontsize',11);
        saveas(gcf,'Participant_25_Action.png');
    elseif pt == 26
        figure('units','normalized','WindowState','maximized');   image(rdm,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:92); set(gca,'xticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:92); set(gca,'yticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Partial RDM: Participant 26 (Action)'],'fontsize',11);
        saveas(gcf,'Participant_26_Action.png');
    elseif pt == 27
        figure('units','normalized','WindowState','maximized');   image(rdm,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:92); set(gca,'xticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:92); set(gca,'yticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Partial RDM: Participant 27 (Action)'],'fontsize',11);
        saveas(gcf,'Participant_27_Action.png');
    elseif pt == 28
        figure('units','normalized','WindowState','maximized');   image(rdm,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:92); set(gca,'xticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:92); set(gca,'yticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Partial RDM: Participant 28 (Action)'],'fontsize',11);
        saveas(gcf,'Participant_28_Action.png');
    elseif pt == 29
        figure('units','normalized','WindowState','maximized');   image(rdm,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:92); set(gca,'xticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:92); set(gca,'yticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Partial RDM: Participant 29 (Action)'],'fontsize',11);
        saveas(gcf,'Participant_29_Action.png');
    elseif pt == 30
        figure('units','normalized','WindowState','maximized');   image(rdm,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:92); set(gca,'xticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:92); set(gca,'yticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Partial RDM: Participant 30 (Action)'],'fontsize',11);
        saveas(gcf,'Participant_30_Action.png');
    elseif pt == 31
        figure('units','normalized','WindowState','maximized');   image(rdm,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:92); set(gca,'xticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:92); set(gca,'yticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Partial RDM: Participant 31 (Action)'],'fontsize',11);
        saveas(gcf,'Participant_31_Action.png');
    elseif pt == 32
        figure('units','normalized','WindowState','maximized');   image(rdm,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:92); set(gca,'xticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:92); set(gca,'yticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Partial RDM: Participant 32 (Action)'],'fontsize',11);
        saveas(gcf,'Participant_32_Action.png');
    elseif pt == 33
        figure('units','normalized','WindowState','maximized');   image(rdm,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:92); set(gca,'xticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:92); set(gca,'yticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Partial RDM: Participant 33 (Action)'],'fontsize',11);
        saveas(gcf,'Participant_33_Action.png');
    elseif pt == 34
        figure('units','normalized','WindowState','maximized');   image(rdm,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:92); set(gca,'xticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:92); set(gca,'yticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Partial RDM: Participant 34 (Action)'],'fontsize',11);
        saveas(gcf,'Participant_34_Action.png');
    elseif pt == 35
        figure('units','normalized','WindowState','maximized');   image(rdm,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:92); set(gca,'xticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:92); set(gca,'yticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Partial RDM: Participant 35 (Action)'],'fontsize',11);
        saveas(gcf,'Participant_35_Action.png');
    elseif pt == 36
        figure('units','normalized','WindowState','maximized');   image(rdm,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:92); set(gca,'xticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:92); set(gca,'yticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Partial RDM: Participant 36 (Action)'],'fontsize',11);
        saveas(gcf,'Participant_36_Action.png');
    elseif pt == 37
        figure('units','normalized','WindowState','maximized');   image(rdm,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:92); set(gca,'xticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:92); set(gca,'yticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Partial RDM: Participant 37 (Action)'],'fontsize',11);
        saveas(gcf,'Participant_37_Action.png');
    elseif pt == 38
        figure('units','normalized','WindowState','maximized');   image(rdm,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:92); set(gca,'xticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:92); set(gca,'yticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Partial RDM: Participant 38 (Action)'],'fontsize',11);
        saveas(gcf,'Participant_38_Action.png');
    elseif pt == 39
        figure('units','normalized','WindowState','maximized');   image(rdm,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:92); set(gca,'xticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:92); set(gca,'yticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Partial RDM: Participant 39 (Action)'],'fontsize',11);
        saveas(gcf,'Participant_39_Action.png');
    elseif pt == 40    
        figure('units','normalized','WindowState','maximized');   image(rdm,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:92); set(gca,'xticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:92); set(gca,'yticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Partial RDM: Participant 40 (Action)'],'fontsize',11);
        saveas(gcf,'Participant_40_Action.png');
    elseif pt == 41
        figure('units','normalized','WindowState','maximized');   image(rdm,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:92); set(gca,'xticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:92); set(gca,'yticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Partial RDM: Participant 41 (Action)'],'fontsize',11);
        saveas(gcf,'Participant_41_Action.png');
    elseif pt == 42
        figure('units','normalized','WindowState','maximized');   image(rdm,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:92); set(gca,'xticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:92); set(gca,'yticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Partial RDM: Participant 42 (Action)'],'fontsize',11);
        saveas(gcf,'Participant_42_Action.png');
    elseif pt == 43
        figure('units','normalized','WindowState','maximized');   image(rdm,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:92); set(gca,'xticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:92); set(gca,'yticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Partial RDM: Participant 43 (Action)'],'fontsize',11);
        saveas(gcf,'Participant_43_Action.png');
    elseif pt == 44
        figure('units','normalized','WindowState','maximized');   image(rdm,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:92); set(gca,'xticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:92); set(gca,'yticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Partial RDM: Participant 44 (Action)'],'fontsize',11);
        saveas(gcf,'Participant_44_Action.png');
    else 
        figure('units','normalized','WindowState','maximized');   image(rdm,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:92); set(gca,'xticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:92); set(gca,'yticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Partial RDM: Participant 45 (Action)'],'fontsize',11);
        saveas(gcf,'Participant_45_Action.png');
    end

    
end
