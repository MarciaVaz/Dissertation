%% Random image RDM selection
clear all;close all;clc;
rng(0);

estimated_rdm = load ('estimate_RDM_behav_visual.mat');  
comparisons = estimated_rdm.estimate_RDM_v;
save behav_RDMs_euclidean_vector_visual comparisons

nStimuli=92;
nComparisons = ((nStimuli^2)-nStimuli)/2;
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

rdm_visual_mix = rdm(1:46,47:92)

load('stimuli_names_92.mat');
max_val=0.0227;

figure('units','normalized','WindowState','maximized');   image(rdm,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
set(gca,'XTick',1:1:92); set(gca,'xticklabel',table2array(stimuli_names_92(1:92,1)),'fontsize', 6);xtickangle(90);
set(gca,'YTick',1:1:92); set(gca,'yticklabel',table2array(stimuli_names_92(1:92,1)),'fontsize', 6);ytickangle(0);
set(gca, 'TickLength',[0 0]);
axis equal; axis image; 
title(['visual RDM: behaviour data'],'fontsize',11);
saveas(gcf,'behav_RDM_visual.png');
save('behav_RDM_visual','rdm');

%% create a small rdm for animals and for tools
half_stimuli = length(rdm)/2;
rdm_visual_animals = rdm(1:half_stimuli,1:half_stimuli);
rdm_visual_tools = rdm(half_stimuli+1:end,half_stimuli+1:end);

figure('units','normalized','WindowState','maximized');   image(rdm_visual_animals,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
set(gca,'XTick',1:1:46); set(gca,'xticklabel',table2array(stimuli_names_92(1:46,1)),'fontsize', 6);xtickangle(90);
set(gca,'YTick',1:1:46); set(gca,'yticklabel',table2array(stimuli_names_92(1:46,1)),'fontsize', 6);ytickangle(0);
set(gca, 'TickLength',[0 0]);
axis equal; axis image; 
title(['Visual RDM: behaviour data (animals)'],'fontsize',11);
saveas(gcf,'behav_RDM_visual_animals.png');
save('behav_RDM_visual_animals','rdm_visual_animals');
        
figure('units','normalized','WindowState','maximized');   image(rdm_visual_tools,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
set(gca,'XTick',1:1:46); set(gca,'xticklabel',table2array(stimuli_names_92(47:92,1)),'fontsize', 6);xtickangle(90);
set(gca,'YTick',1:1:46); set(gca,'yticklabel',table2array(stimuli_names_92(47:92,1)),'fontsize', 6);ytickangle(0);
set(gca, 'TickLength',[0 0]);
axis equal; axis image; 
title(['Visual RDM: behaviour data (tools)'],'fontsize',11);
saveas(gcf,'behav_RDM_visual_tools.png');
save('behav_RDM_visual_tools','rdm_visual_tools');

figure('units','normalized','WindowState','maximized');   image(rdm_visual_mix,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
set(gca,'XTick',1:1:46); set(gca,'xticklabel',table2array(stimuli_names_92(47:92,1)),'fontsize', 6);xtickangle(90);
set(gca,'YTick',1:1:46); set(gca,'yticklabel',table2array(stimuli_names_92(1:46,1)),'fontsize', 6);ytickangle(0);
set(gca, 'TickLength',[0 0]);
axis equal; axis image; 
title(['visual RDM: behaviour data (animals vs tools)'],'fontsize',11);
saveas(gcf,'behav_RDM_visual_mixed.png');
save('behav_RDM_visual_mixed','rdm_visual_mix');

 %% convert the 2 rdms matrices into vectors
count=0;
for r = 1:half_stimuli-1
	for c = r+1:half_stimuli
        count=count+1;
        rdm_vector_animals(1,count) = rdm_visual_animals(r,c);,
        rdm_vector_tools(1,count) = rdm_visual_tools(r,c);
	end
end

rdm_vector_mixed = reshape(rdm_visual_mix',1,[]);
rdm_vector_animals_completed = reshape(rdm_visual_animals',1,[]);
rdm_vector_tools_completed = reshape(rdm_visual_tools',1,[]);

save RDMs_behav_vector_visual_animals rdm_vector_animals
save RDMs_behav_vector_visual_tools rdm_vector_tools
save RDMs_behav_vector_visual_mixed rdm_vector_mixed

%% completed
save RDMs_behav_vector_visual_animals_completed rdm_vector_animals_completed
save RDMs_behav_vector_visual_tools_completed rdm_vector_tools_completed
