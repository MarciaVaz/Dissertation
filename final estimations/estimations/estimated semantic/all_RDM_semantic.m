clear all;close all;clc;

estimated_rdm = load ('estimate_RDM_behav_semantic.mat');  
comparisons = estimated_rdm.estimate_RDM_s;
save behav_RDMs_euclidean_vector_semantic comparisons

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

figure('units','normalized','outerposition',[0 0 1 1]); image(rdm,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
set(gca,'XTick',1:1:92); set(gca,'xticklabel',table2array(stimuli_names_92(1:92,1)),'fontsize', 6);xtickangle(90);
set(gca,'YTick',1:1:92); set(gca,'yticklabel',table2array(stimuli_names_92(1:92,1)),'fontsize', 6);ytickangle(0);
set(gca, 'TickLength',[0 0]);
axis equal; axis image; 
title(['Semantic RDM: behaviour data'],'fontsize',11);
saveas(gcf,'behav_RDM_semantic.png');
save('behav_RDM_semantic','rdm');

%% create a small rdm for animals and for tools
half_stimuli = length(rdm)/2;
rdm_semantic_animals = rdm(1:half_stimuli,1:half_stimuli);
rdm_semantic_tools = rdm(half_stimuli+1:end,half_stimuli+1:end);

figure('units','normalized','outerposition',[0 0 1 1]); image(rdm_semantic_animals,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
set(gca,'XTick',1:1:46); set(gca,'xticklabel',table2array(stimuli_names_92(1:46,1)),'fontsize', 6);xtickangle(90);
set(gca,'YTick',1:1:46); set(gca,'yticklabel',table2array(stimuli_names_92(1:46,1)),'fontsize', 6);ytickangle(0);
set(gca, 'TickLength',[0 0]);
axis equal; axis image; 
title(['Semantic RDM: behaviour (animals)'],'fontsize',11);
saveas(gcf,'behav_semantic_animals.png');
save('behav_RDM_semantic_animals','rdm_semantic_animals');
        
figure('units','normalized','outerposition',[0 0 1 1]); image(rdm_semantic_tools,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
set(gca,'XTick',1:1:46); set(gca,'xticklabel',table2array(stimuli_names_92(47:92,1)),'fontsize', 6);xtickangle(90);
set(gca,'YTick',1:1:46); set(gca,'yticklabel',table2array(stimuli_names_92(47:92,1)),'fontsize', 6);ytickangle(0);
set(gca, 'TickLength',[0 0]);
axis equal; axis image; 
title(['Semantic RDM: behaviour (tools)'],'fontsize',11);
saveas(gcf,'behav_semantic_tools.png');
save('behav_RDM_semantic_tools','rdm_semantic_tools');
