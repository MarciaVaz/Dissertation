clear all; close all; clc;

%% Question 3: fMRI RDM stats compare different regions?
% can we relate the behaviour and the fMRI?
% Is the perception driven by the brain activation patterns in the different areas?
% does behaviour correlate with the brain patterns?
% behaviour data

%% Load data fMRI
Masks_Action = load('RDMs_euclidean_estimation_nonnan_action.mat');
Masks_Action = Masks_Action.RDMs_euclidean_estimation_nonnan_action;
Masks_Action = Masks_Action'; % column is a mask

Masks_Semantic = load('RDMs_euclidean_estimation_nonnan_semantic.mat');
Masks_Semantic = Masks_Semantic.RDMs_euclidean_estimation_nonnan_semantic;
Masks_Semantic = Masks_Semantic'; % column is a mask

fMRI = cat(2,Masks_Action,Masks_Semantic);

[row_fMRI col_fMRI] = size(fMRI);

%% Load data behaviour
load('All_RDMs_behaviour.mat');
behav = All_RDMs_behaviour;

behav_action = behav(:,1);
behav_action = table2array (behav_action);
behav_semantic = behav(:,2);
behav_semantic = table2array (behav_semantic);
behav_visual = behav(:,3);
behav_visual = table2array (behav_visual);

behav = table2array (behav);
[row_behav col_behav] = size(behav);

%% Matrix with all RDMs
all_RDMs = cat(2,fMRI,behav);
rdms = array2table(all_RDMs);
rdms.Properties.VariableNames(1:33) = {'M1_a','M2_a','M3_a','M4_a','M5_a','M6_a','M7_a','M8_a','M9_a','M10_a','M11_a','M12_a','M13_a','M14_a','M15_a',...
    'M1_s','M2_s','M3_s','M4_s','M5_s','M6_s','M7_s','M8_s','M9_s','M10_s','M11_s','M12_s','M13_s','M14_s','M15_s',...
    'B_a','B_s','B_v'};
[row_behav col_behav] = size(behav);

%% Action and semantic matrix vs behav (6 pairs)

% action fMRI with the action, semantic and visual task from behaviour
a_a_RDMs = cat(2,Masks_Action,behav_action);
a_s_RDMs = cat(2,Masks_Action,behav_semantic);
a_v_RDMs = cat(2,Masks_Action,behav_visual);

action_behav_RDMs = cat(2,a_a_RDMs,behav_semantic,behav_visual);
action_behav_RDMs = array2table(action_behav_RDMs);
action_behav_RDMs.Properties.VariableNames(1:18) = {'M1_a','M2_a','M3_a','M4_a','M5_a','M6_a','M7_a','M8_a','M9_a','M10_a','M11_a','M12_a','M13_a','M14_a','M15_a','B_a','B_s','B_v'};

action_action_RDMs = array2table(a_a_RDMs);
action_semantic_RDMs = array2table(a_s_RDMs);
action_visual_RDMs = array2table(a_v_RDMs);

action_action_RDMs.Properties.VariableNames(1:16) = {'M1_a','M2_a','M3_a','M4_a','M5_a','M6_a','M7_a','M8_a','M9_a','M10_a','M11_a','M12_a','M13_a','M14_a','M15_a','B_a'};
action_semantic_RDMs.Properties.VariableNames(1:16) = {'M1_a','M2_a','M3_a','M4_a','M5_a','M6_a','M7_a','M8_a','M9_a','M10_a','M11_a','M12_a','M13_a','M14_a','M15_a','B_s'};
action_visual_RDMs.Properties.VariableNames(1:16) = {'M1_a','M2_a','M3_a','M4_a','M5_a','M6_a','M7_a','M8_a','M9_a','M10_a','M11_a','M12_a','M13_a','M14_a','M15_a','B_v'};

% semantic fMRI with the action, semantic and visual task from behaviour
s_a_RDMs = cat(2,Masks_Semantic,behav_action);
s_s_RDMs = cat(2,Masks_Semantic,behav_semantic);
s_v_RDMs = cat(2,Masks_Semantic,behav_visual);

semantic_behav_RDMs = cat(2,s_a_RDMs,behav_semantic,behav_visual);
semantic_behav_RDMs = array2table(semantic_behav_RDMs);
semantic_behav_RDMs.Properties.VariableNames(1:18) = {'M1_s','M2_s','M3_s','M4_s','M5_s','M6_s','M7_s','M8_s','M9_s','M10_s','M11_s','M12_s','M13_s','M14_s','M15_s','B_a','B_s','B_v'};

semantic_action_RDMs = array2table(s_a_RDMs);
semantic_semantic_RDMs = array2table(s_s_RDMs);
semantic_visual_RDMs = array2table(s_v_RDMs);

semantic_action_RDMs.Properties.VariableNames(1:16) = {'M1_s','M2_s','M3_s','M4_s','M5_s','M6_s','M7_s','M8_s','M9_s','M10_s','M11_s','M12_s','M13_s','M14_s','M15_s','B_a'};
semantic_semantic_RDMs.Properties.VariableNames(1:16) = {'M1_s','M2_s','M3_s','M4_s','M5_s','M6_s','M7_s','M8_s','M9_s','M10_s','M11_s','M12_s','M13_s','M14_s','M15_s','B_s'};
semantic_visual_RDMs.Properties.VariableNames(1:16) = {'M1_s','M2_s','M3_s','M4_s','M5_s','M6_s','M7_s','M8_s','M9_s','M10_s','M11_s','M12_s','M13_s','M14_s','M15_s','B_v'};


[r_a_a,p_a_a] = corr(Masks_Action,behav_action,'Tail','right','Type','Spearman');
[r_a_s,p_a_s] = corr(Masks_Action,behav_semantic,'Tail','right','Type','Spearman');
[r_a_v,p_a_v] = corr(Masks_Action,behav_visual,'Tail','right','Type','Spearman');
[r_s_a,p_s_a] = corr(Masks_Semantic,behav_action,'Tail','right','Type','Spearman');
[r_s_s,p_s_s] = corr(Masks_Semantic,behav_semantic,'Tail','right','Type','Spearman');
[r_s_v,p_s_v] = corr(Masks_Semantic,behav_visual,'Tail','right','Type','Spearman');

figure();[r,p] = corrplot(action_behav_RDMs,'Tail','right','Type','Spearman');title(['Correlation Matrix Action fMRI and behaviour']);
figure();[r,p] = corrplot(semantic_behav_RDMs,'Tail','right','Type','Spearman');title(['Correlation Matrix Semantic fMRI and Behaviour']);

%% Test the alternative hypothesis that the correlation is greater than zero.
% [r,p] = corrplot(rdms,'Tail','right','Type','Spearman')
%% Test the alternative hypothesis that the correlation is less than zero.
% [rho,pval] = corr(behav,fMRI,'Tail','left','Type','Spearman')
%% Test the alternative hypothesis that the correlation is not zero.
% [rho,pval] = corr(behav,fMRI,'Type','Spearman')
