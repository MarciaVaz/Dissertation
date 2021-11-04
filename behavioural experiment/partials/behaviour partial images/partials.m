clear all;close all;clc;

task = 3

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
    comparisons_vector = partials_RDM_all_behav_visual(:,:,pt);
    
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
	max_val=0.02;

	if pt == 1
        figure('units','normalized','WindowState','maximized');   image(rdm,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:92); set(gca,'xticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:92); set(gca,'yticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Partial RDM: Participant 1 (Visual)'],'fontsize',11);
        saveas(gcf,'Participant_01_Visual.png');       
    elseif pt == 2
        figure('units','normalized','WindowState','maximized');   image(rdm,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:92); set(gca,'xticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:92); set(gca,'yticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Partial RDM: Participant 2 (Visual)'],'fontsize',11);
        saveas(gcf,'Participant_02_Visual.png');
    elseif pt == 3
        figure('units','normalized','WindowState','maximized');   image(rdm,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:92); set(gca,'xticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:92); set(gca,'yticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Partial RDM: Participant 3 (Visual)'],'fontsize',11);
        saveas(gcf,'Participant_03_Visual.png');
    elseif pt == 4
        figure('units','normalized','WindowState','maximized');   image(rdm,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:92); set(gca,'xticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:92); set(gca,'yticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Partial RDM: Participant 4 (Visual)'],'fontsize',11);
        saveas(gcf,'Participant_04_Visual.png');
    elseif pt == 5
        figure('units','normalized','WindowState','maximized');   image(rdm,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:92); set(gca,'xticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:92); set(gca,'yticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Partial RDM: Participant 5 (Visual)'],'fontsize',11);
        saveas(gcf,'Participant_05_Visual.png');
    elseif pt == 6
        figure('units','normalized','WindowState','maximized');   image(rdm,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:92); set(gca,'xticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:92); set(gca,'yticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Partial RDM: Participant 6 (Visual)'],'fontsize',11);
        saveas(gcf,'Participant_06_Visual.png');
    elseif pt == 7
        figure('units','normalized','WindowState','maximized');   image(rdm,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:92); set(gca,'xticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:92); set(gca,'yticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Partial RDM: Participant 7 (Visual)'],'fontsize',11);
        saveas(gcf,'Participant_07_Visual.png');
    elseif pt == 8
        figure('units','normalized','WindowState','maximized');   image(rdm,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:92); set(gca,'xticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:92); set(gca,'yticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Partial RDM: Participant 8 (Visual)'],'fontsize',11);
        saveas(gcf,'Participant_08_Visual.png');
    elseif pt == 9
        figure('units','normalized','WindowState','maximized');   image(rdm,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:92); set(gca,'xticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:92); set(gca,'yticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Partial RDM: Participant 9 (Visual)'],'fontsize',11);
        saveas(gcf,'Participant_09_Visual.png');
    elseif pt == 10
        figure('units','normalized','WindowState','maximized');   image(rdm,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:92); set(gca,'xticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:92); set(gca,'yticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Partial RDM: Participant 10 (Visual)'],'fontsize',11);
        saveas(gcf,'Participant_10_Visual.png');
    elseif pt == 11
        figure('units','normalized','WindowState','maximized');   image(rdm,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:92); set(gca,'xticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:92); set(gca,'yticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Partial RDM: Participant 11 (Visual)'],'fontsize',11);
        saveas(gcf,'Participant_11_Visual.png');
    elseif pt == 12
        figure('units','normalized','WindowState','maximized');   image(rdm,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:92); set(gca,'xticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:92); set(gca,'yticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Partial RDM: Participant 12 (Visual)'],'fontsize',11);
        saveas(gcf,'Participant_12_Visual.png');
    elseif pt == 13
        figure('units','normalized','WindowState','maximized');   image(rdm,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:92); set(gca,'xticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:92); set(gca,'yticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Partial RDM: Participant 13 (Visual)'],'fontsize',11);
        saveas(gcf,'Participant_13_Visual.png');
    elseif pt == 14
        figure('units','normalized','WindowState','maximized');   image(rdm,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:92); set(gca,'xticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:92); set(gca,'yticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Partial RDM: Participant 14 (Visual)'],'fontsize',11);
        saveas(gcf,'Participant_14_Visual.png');
    elseif pt == 15
        figure('units','normalized','WindowState','maximized');   image(rdm,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:92); set(gca,'xticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:92); set(gca,'yticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Partial RDM: Participant 15 (Visual)'],'fontsize',11);
        saveas(gcf,'Participant_15_Visual.png');
    elseif pt == 16
        figure('units','normalized','WindowState','maximized');   image(rdm,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:92); set(gca,'xticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:92); set(gca,'yticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Partial RDM: Participant 16 (Visual)'],'fontsize',11);
        saveas(gcf,'Participant_16_Visual.png');
    elseif pt == 17
        figure('units','normalized','WindowState','maximized');   image(rdm,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:92); set(gca,'xticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:92); set(gca,'yticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Partial RDM: Participant 17 (Visual)'],'fontsize',11);
        saveas(gcf,'Participant_17_Visual.png');
    elseif pt == 18
        figure('units','normalized','WindowState','maximized');   image(rdm,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:92); set(gca,'xticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:92); set(gca,'yticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Partial RDM: Participant 18 (Visual)'],'fontsize',11);
        saveas(gcf,'Participant_18_Visual.png');
    elseif pt == 19
        figure('units','normalized','WindowState','maximized');   image(rdm,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:92); set(gca,'xticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:92); set(gca,'yticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Partial RDM: Participant 19 (Visual)'],'fontsize',11);
        saveas(gcf,'Participant_19_Visual.png');
    elseif pt == 20    
        figure('units','normalized','WindowState','maximized');   image(rdm,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:92); set(gca,'xticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:92); set(gca,'yticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Partial RDM: Participant 20 (Visual)'],'fontsize',11);
        saveas(gcf,'Participant_20_Visual.png');
    elseif pt == 21
        figure('units','normalized','WindowState','maximized');   image(rdm,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:92); set(gca,'xticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:92); set(gca,'yticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Partial RDM: Participant 21 (Visual)'],'fontsize',11);
        saveas(gcf,'Participant_21_Visual.png');   
    elseif pt == 22
        figure('units','normalized','WindowState','maximized');   image(rdm,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:92); set(gca,'xticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:92); set(gca,'yticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Partial RDM: Participant 22 (Visual)'],'fontsize',11);
        saveas(gcf,'Participant_22_Visual.png');
    elseif pt == 23
        figure('units','normalized','WindowState','maximized');   image(rdm,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:92); set(gca,'xticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:92); set(gca,'yticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Partial RDM: Participant 23 (Visual)'],'fontsize',11);
        saveas(gcf,'Participant_23_Visual.png');
    elseif pt == 24
        figure('units','normalized','WindowState','maximized');   image(rdm,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:92); set(gca,'xticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:92); set(gca,'yticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Partial RDM: Participant 24 (Visual)'],'fontsize',11);
        saveas(gcf,'Participant_24_Visual.png');
    elseif pt == 25
        figure('units','normalized','WindowState','maximized');   image(rdm,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:92); set(gca,'xticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:92); set(gca,'yticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Partial RDM: Participant 25 (Visual)'],'fontsize',11);
        saveas(gcf,'Participant_25_Visual.png');
    elseif pt == 26
        figure('units','normalized','WindowState','maximized');   image(rdm,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:92); set(gca,'xticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:92); set(gca,'yticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Partial RDM: Participant 26 (Visual)'],'fontsize',11);
        saveas(gcf,'Participant_26_Visual.png');
    elseif pt == 27
        figure('units','normalized','WindowState','maximized');   image(rdm,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:92); set(gca,'xticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:92); set(gca,'yticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Partial RDM: Participant 27 (Visual)'],'fontsize',11);
        saveas(gcf,'Participant_27_Visual.png');
    elseif pt == 28
        figure('units','normalized','WindowState','maximized');   image(rdm,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:92); set(gca,'xticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:92); set(gca,'yticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Partial RDM: Participant 28 (Visual)'],'fontsize',11);
        saveas(gcf,'Participant_28_Visual.png');
    elseif pt == 29
        figure('units','normalized','WindowState','maximized');   image(rdm,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:92); set(gca,'xticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:92); set(gca,'yticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Partial RDM: Participant 29 (Visual)'],'fontsize',11);
        saveas(gcf,'Participant_29_Visual.png');
    elseif pt == 30
        figure('units','normalized','WindowState','maximized');   image(rdm,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:92); set(gca,'xticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:92); set(gca,'yticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Partial RDM: Participant 30 (Visual)'],'fontsize',11);
        saveas(gcf,'Participant_30_Visual.png');
    elseif pt == 31
        figure('units','normalized','WindowState','maximized');   image(rdm,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:92); set(gca,'xticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:92); set(gca,'yticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Partial RDM: Participant 31 (Visual)'],'fontsize',11);
        saveas(gcf,'Participant_31_Visual.png');
    elseif pt == 32
        figure('units','normalized','WindowState','maximized');   image(rdm,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:92); set(gca,'xticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:92); set(gca,'yticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Partial RDM: Participant 32 (Visual)'],'fontsize',11);
        saveas(gcf,'Participant_32_Visual.png');
    elseif pt == 33
        figure('units','normalized','WindowState','maximized');   image(rdm,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:92); set(gca,'xticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:92); set(gca,'yticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Partial RDM: Participant 33 (Visual)'],'fontsize',11);
        saveas(gcf,'Participant_33_Visual.png');
    elseif pt == 34
        figure('units','normalized','WindowState','maximized');   image(rdm,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:92); set(gca,'xticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:92); set(gca,'yticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Partial RDM: Participant 34 (Visual)'],'fontsize',11);
        saveas(gcf,'Participant_34_Visual.png');
    elseif pt == 35
        figure('units','normalized','WindowState','maximized');   image(rdm,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:92); set(gca,'xticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:92); set(gca,'yticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Partial RDM: Participant 35 (Visual)'],'fontsize',11);
        saveas(gcf,'Participant_35_Visual.png');
    elseif pt == 36
        figure('units','normalized','WindowState','maximized');   image(rdm,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:92); set(gca,'xticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:92); set(gca,'yticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Partial RDM: Participant 36 (Visual)'],'fontsize',11);
        saveas(gcf,'Participant_36_Visual.png');
    elseif pt == 37
        figure('units','normalized','WindowState','maximized');   image(rdm,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:92); set(gca,'xticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:92); set(gca,'yticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Partial RDM: Participant 37 (Visual)'],'fontsize',11);
        saveas(gcf,'Participant_37_Visual.png');
    elseif pt == 38
        figure('units','normalized','WindowState','maximized');   image(rdm,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:92); set(gca,'xticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:92); set(gca,'yticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Partial RDM: Participant 38 (Visual)'],'fontsize',11);
        saveas(gcf,'Participant_38_Visual.png');
    elseif pt == 39
        figure('units','normalized','WindowState','maximized');   image(rdm,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:92); set(gca,'xticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:92); set(gca,'yticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Partial RDM: Participant 39 (Visual)'],'fontsize',11);
        saveas(gcf,'Participant_39_Visual.png');
    elseif pt == 40    
        figure('units','normalized','WindowState','maximized');   image(rdm,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:92); set(gca,'xticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:92); set(gca,'yticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Partial RDM: Participant 40 (Visual)'],'fontsize',11);
        saveas(gcf,'Participant_40_Visual.png');
    elseif pt == 41
        figure('units','normalized','WindowState','maximized');   image(rdm,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:92); set(gca,'xticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:92); set(gca,'yticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Partial RDM: Participant 41 (Visual)'],'fontsize',11);
        saveas(gcf,'Participant_41_Visual.png');
    elseif pt == 42
        figure('units','normalized','WindowState','maximized');   image(rdm,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:92); set(gca,'xticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:92); set(gca,'yticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Partial RDM: Participant 42 (Visual)'],'fontsize',11);
        saveas(gcf,'Participant_42_Visual.png');
    elseif pt == 43
        figure('units','normalized','WindowState','maximized');   image(rdm,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:92); set(gca,'xticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:92); set(gca,'yticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Partial RDM: Participant 43 (Visual)'],'fontsize',11);
        saveas(gcf,'Participant_43_Visual.png');
    else %pt == 44
        figure('units','normalized','WindowState','maximized');   image(rdm,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
        set(gca,'XTick',1:1:92); set(gca,'xticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);xtickangle(90);
        set(gca,'YTick',1:1:92); set(gca,'yticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);ytickangle(0);
        set(gca, 'TickLength',[0 0]);
        axis equal; axis image; 
        title(['Partial RDM: Participant 44 (Visual)'],'fontsize',11);
        saveas(gcf,'Participant_44_Visual.png');
%     else 
%         figure('units','normalized','WindowState','maximized');   image(rdm,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
%         set(gca,'XTick',1:1:92); set(gca,'xticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);xtickangle(90);
%         set(gca,'YTick',1:1:92); set(gca,'yticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);ytickangle(0);
%         set(gca, 'TickLength',[0 0]);
%         axis equal; axis image; 
%         title(['Partial RDM: Participant 45 (Visual)'],'fontsize',11);
%         saveas(gcf,'Participant_45_Visual.png');
    end

    
end
