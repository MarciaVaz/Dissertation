clear all;close all;clc;

estimated_rdm = load ('estimate_RDM_behav_action.mat');  
comparisons = estimated_rdm.estimate_RDM_a;
save behav_RDMs_euclidean_vector_action comparisons

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

load('stimuli_names_92.mat');
max_val=0.0227;

figure('units','normalized','WindowState','maximized');   image(rdm,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
set(gca,'XTick',1:1:92); set(gca,'xticklabel',table2array(stimuli_names_92(1:92,1)),'fontsize', 6);xtickangle(90);
set(gca,'YTick',1:1:92); set(gca,'yticklabel',table2array(stimuli_names_92(1:92,1)),'fontsize', 6);ytickangle(0);
set(gca, 'TickLength',[0 0]);
axis equal; axis image; 
title(['Action RDM: behaviour data'],'fontsize',11);
saveas(gcf,'behav_RDM_action.png');
save('behav_RDM_action','rdm');

%% create a small rdm for animals and for tools
half_stimuli = length(rdm)/2;
rdm_action_animals = rdm(1:half_stimuli,1:half_stimuli);
rdm_action_tools = rdm(half_stimuli+1:end,half_stimuli+1:end);

figure('units','normalized','WindowState','maximized');   image(rdm_action_animals,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
set(gca,'XTick',1:1:46); set(gca,'xticklabel',table2array(stimuli_names_92(1:46,1)),'fontsize', 6);xtickangle(90);
set(gca,'YTick',1:1:46); set(gca,'yticklabel',table2array(stimuli_names_92(1:46,1)),'fontsize', 6);ytickangle(0);
set(gca, 'TickLength',[0 0]);
axis equal; axis image; 
title(['Action RDM: behaviour data (animals)'],'fontsize',11);
saveas(gcf,'behav_RDM_action_animals.png');
save('behav_RDM_action_animals','rdm_action_animals');
        
figure('units','normalized','WindowState','maximized');   image(rdm_action_tools,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
set(gca,'XTick',1:1:46); set(gca,'xticklabel',table2array(stimuli_names_92(47:92,1)),'fontsize', 6);xtickangle(90);
set(gca,'YTick',1:1:46); set(gca,'yticklabel',table2array(stimuli_names_92(47:92,1)),'fontsize', 6);ytickangle(0);
set(gca, 'TickLength',[0 0]);
axis equal; axis image; 
title(['Action RDM: behaviour data (tools)'],'fontsize',11);
saveas(gcf,'behav_RDM_action_tools.png');
save('behav_RDM_action_tools','rdm_action_tools');

 %% convert the 2 rdms matrices into vectors
count=0;
for r = 1:half_stimuli-1
	for c = r+1:half_stimuli
        count=count+1;
        rdm_vector_animals(1,count) = rdm_action_animals(r,c);,
        rdm_vector_tools(1,count) = rdm_action_tools(r,c);
	end
end

save RDMs_behav_vector_action_animals rdm_vector_animals
save RDMs_behav_vector_action_tools rdm_vector_tools
