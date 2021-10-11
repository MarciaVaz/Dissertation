%% Random image RDM selection
clear all;close all;clc;
rng(0);

estimated_rdm = load ('estimate_RDM_behav_action.mat');  
comparisons = estimated_rdm.estimate_RDM_a;

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

figure(); image(rdm,'CDataMapping','scaled');C = colorbar;title('Action final RDM');caxis([0 0.0227]);
save('final_RDM_action','rdm');