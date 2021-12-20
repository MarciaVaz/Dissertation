clear all; close all; clc;

%% Question 3: fMRI RDM stats compare different regions?
% can we relate the behaviour and the fMRI?
% Is the perception driven by the brain activation patterns in the different areas?
% does behaviour correlate with the brain patterns?
% behaviour data

%% Load data fMRI
load('RDMs_euclidean_estimation_nonnan_action.mat');
Masks_Action = RDMs_euclidean_estimation_nonnan_action'; % column is a mask

load('RDMs_euclidean_estimation_nonnan_semantic.mat');
Masks_Semantic = RDMs_euclidean_estimation_nonnan_semantic'; % column is a mask

fMRI = cat(2,Masks_Action,Masks_Semantic);

[row_fMRI col_fMRI] = size(fMRI);

%% Load data fMRI for animals stimuli
load('RDMs_euclidean_vector_action_animals.mat');
Masks_Action_animals = RDMs_euclidean_vector_action_animals'; % column is a mask

load('RDMs_euclidean_vector_semantic_animals.mat');
Masks_Semantic_animals = RDMs_euclidean_vector_semantic_animals'; % column is a mask

fMRI_animals = cat(2,Masks_Action_animals,Masks_Semantic_animals);

[row_fMRI_animals col_fMRI_animals] = size(fMRI_animals);

%% Load data fMRI for tools stimuli
load('RDMs_euclidean_vector_action_tools.mat');
Masks_Action_tools = RDMs_euclidean_vector_action_tools'; % column is a mask

load('RDMs_euclidean_vector_semantic_tools.mat');
Masks_Semantic_tools = RDMs_euclidean_vector_semantic_tools'; % column is a mask

fMRI_tools = cat(2,Masks_Action_tools,Masks_Semantic_tools);

[row_fMRI_tools col_fMRI_tools] = size(fMRI_tools);

%% Load data behaviour
load('All_RDMs_behaviour.mat');
behav = All_RDMs_behaviour;

behav_action = table2array (behav(:,1));
behav_semantic = table2array (behav(:,2));
behav_visual = table2array (behav(:,3));

behav = table2array (behav);
[row_behav col_behav] = size(behav);

%% Load data behaviour ANIMALS
load('All_RDMs_behaviour_animals.mat');
behav_animals = All_RDMs_behaviour_animals;
behav_animals = behav_animals(1:1035,:)

behav_action_animals = table2array (behav_animals(:,1));
behav_semantic_animals = table2array (behav_animals(:,2));
behav_visual_animals = table2array (behav_animals(:,3));

behav_animals = table2array (behav_animals);
[row_behav_animals col_behav_animals] = size(behav_animals);

%% Load data behaviour TOOLS
load('All_RDMs_behaviour_tools.mat');
behav_tools = All_RDMs_behaviour_tools;
behav_tools = behav_tools(1:1035,:)

behav_action_tools = table2array (behav_tools(:,1));
behav_semantic_tools = table2array (behav_tools(:,2));
behav_visual_tools = table2array (behav_tools(:,3));

behav_tools = table2array (behav_tools);
[row_behav_tools col_behav_tools] = size(behav_tools);

%% Matrix with all RDMs
all_RDMs = cat(2,fMRI,behav);
rdms = array2table(all_RDMs);
rdms.Properties.VariableNames(1:33) = {'M1_a','M2_a','M3_a','M4_a','M5_a','M6_a','M7_a','M8_a','M9_a','M10_a','M11_a','M12_a','M13_a','M14_a','M15_a',...
    'M1_s','M2_s','M3_s','M4_s','M5_s','M6_s','M7_s','M8_s','M9_s','M10_s','M11_s','M12_s','M13_s','M14_s','M15_s',...
    'B_a','B_s','B_v'};
[row_behav col_behav] = size(behav);

%% Matrix with all RDMs ANIMALS
all_RDMs_animals = cat(2,fMRI_animals,behav_animals);
rdms_animals = array2table(all_RDMs_animals);
rdms_animals.Properties.VariableNames(1:33) = {'M1_a','M2_a','M3_a','M4_a','M5_a','M6_a','M7_a','M8_a','M9_a','M10_a','M11_a','M12_a','M13_a','M14_a','M15_a',...
    'M1_s','M2_s','M3_s','M4_s','M5_s','M6_s','M7_s','M8_s','M9_s','M10_s','M11_s','M12_s','M13_s','M14_s','M15_s',...
    'B_a','B_s','B_v'};
[row_behav_animals col_behav_animals] = size(behav_animals);

%% Matrix with all RDMs TOOLS
all_RDMs_tools = cat(2,fMRI_tools,behav_tools);
rdms_tools = array2table(all_RDMs_tools);
rdms_tools.Properties.VariableNames(1:33) = {'M1_a','M2_a','M3_a','M4_a','M5_a','M6_a','M7_a','M8_a','M9_a','M10_a','M11_a','M12_a','M13_a','M14_a','M15_a',...
    'M1_s','M2_s','M3_s','M4_s','M5_s','M6_s','M7_s','M8_s','M9_s','M10_s','M11_s','M12_s','M13_s','M14_s','M15_s',...
    'B_a','B_s','B_v'};
[row_behav_tools col_behav_tools] = size(behav_tools);

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

figure('units','normalized','WindowState','maximized');[r,p] = corrplot(action_behav_RDMs,'Tail','right','Type','Spearman');
title(['Spearman Correlation between fMRI (Action task) and Behaviour RDMs (stimuli: all)']);
saveas(gcf,['C:\Users\Márcia Vaz\Documents\GitHub\Dissertation\05_statistics\results\question 3\','q3_spearman_correlation_action.png']) ;

figure('units','normalized','WindowState','maximized'); [r,p] = corrplot(semantic_behav_RDMs,'Tail','right','Type','Spearman');
title(['Spearman Correlation between fMRI (Semantic task) and Behaviour RDMs (stimuli: all)']);
saveas(gcf,['C:\Users\Márcia Vaz\Documents\GitHub\Dissertation\05_statistics\results\question 3\','q3_spearman_correlation_semantic.png']) ;

%% Action and semantic matrix vs behav (6 pairs) ANIMALS

% action fMRI with the action, semantic and visual task from behaviour
a_a_RDMs_animals = cat(2,Masks_Action_animals,behav_action_animals);
a_s_RDMs_animals = cat(2,Masks_Action_animals,behav_semantic_animals);
a_v_RDMs_animals = cat(2,Masks_Action_animals,behav_visual_animals);

action_behav_RDMs_animals = array2table(cat(2,a_a_RDMs_animals,behav_semantic_animals,behav_visual_animals));
action_behav_RDMs_animals.Properties.VariableNames(1:18) = {'M1_a','M2_a','M3_a','M4_a','M5_a','M6_a','M7_a','M8_a','M9_a','M10_a','M11_a','M12_a','M13_a','M14_a','M15_a','B_a','B_s','B_v'};

action_action_RDMs_animals = array2table(a_a_RDMs_animals);
action_semantic_RDMs_animals = array2table(a_s_RDMs_animals);
action_visual_RDMs_animals = array2table(a_v_RDMs_animals);

action_action_RDMs_animals.Properties.VariableNames(1:16) = {'M1_a','M2_a','M3_a','M4_a','M5_a','M6_a','M7_a','M8_a','M9_a','M10_a','M11_a','M12_a','M13_a','M14_a','M15_a','B_a'};
action_semantic_RDMs_animals.Properties.VariableNames(1:16) = {'M1_a','M2_a','M3_a','M4_a','M5_a','M6_a','M7_a','M8_a','M9_a','M10_a','M11_a','M12_a','M13_a','M14_a','M15_a','B_s'};
action_visual_RDMs_animals.Properties.VariableNames(1:16) = {'M1_a','M2_a','M3_a','M4_a','M5_a','M6_a','M7_a','M8_a','M9_a','M10_a','M11_a','M12_a','M13_a','M14_a','M15_a','B_v'};

% semantic fMRI with the action, semantic and visual task from behaviour
s_a_RDMs_animals = cat(2,Masks_Semantic_animals,behav_action_animals);
s_s_RDMs_animals = cat(2,Masks_Semantic_animals,behav_semantic_animals);
s_v_RDMs_animals = cat(2,Masks_Semantic_animals,behav_visual_animals);

semantic_behav_RDMs_animals = array2table(cat(2,s_a_RDMs_animals,behav_semantic_animals,behav_visual_animals));
semantic_behav_RDMs_animals.Properties.VariableNames(1:18) = {'M1_s','M2_s','M3_s','M4_s','M5_s','M6_s','M7_s','M8_s','M9_s','M10_s','M11_s','M12_s','M13_s','M14_s','M15_s','B_a','B_s','B_v'};

semantic_action_RDMs_animals = array2table(s_a_RDMs_animals);
semantic_semantic_RDMs_animals = array2table(s_s_RDMs_animals);
semantic_visual_RDMs_animals = array2table(s_v_RDMs_animals);

semantic_action_RDMs_animals.Properties.VariableNames(1:16) = {'M1_s','M2_s','M3_s','M4_s','M5_s','M6_s','M7_s','M8_s','M9_s','M10_s','M11_s','M12_s','M13_s','M14_s','M15_s','B_a'};
semantic_semantic_RDMs_animals.Properties.VariableNames(1:16) = {'M1_s','M2_s','M3_s','M4_s','M5_s','M6_s','M7_s','M8_s','M9_s','M10_s','M11_s','M12_s','M13_s','M14_s','M15_s','B_s'};
semantic_visual_RDMs_animals.Properties.VariableNames(1:16) = {'M1_s','M2_s','M3_s','M4_s','M5_s','M6_s','M7_s','M8_s','M9_s','M10_s','M11_s','M12_s','M13_s','M14_s','M15_s','B_v'};


[r_a_a_animals,p_a_a_animals] = corr(Masks_Action_animals,behav_action_animals,'Tail','right','Type','Spearman');
[r_a_s_animals,p_a_s_animals] = corr(Masks_Action_animals,behav_semantic_animals,'Tail','right','Type','Spearman');
[r_a_v_animals,p_a_v_animals] = corr(Masks_Action_animals,behav_visual_animals,'Tail','right','Type','Spearman');
[r_s_a_animals,p_s_a_animals] = corr(Masks_Semantic_animals,behav_action_animals,'Tail','right','Type','Spearman');
[r_s_s_animals,p_s_s_animals] = corr(Masks_Semantic_animals,behav_semantic_animals,'Tail','right','Type','Spearman');
[r_s_v_animals,p_s_v_animals] = corr(Masks_Semantic_animals,behav_visual_animals,'Tail','right','Type','Spearman');

figure('units','normalized','WindowState','maximized');[r,p] = corrplot(action_behav_RDMs_animals,'Tail','right','Type','Spearman');
title(['Spearman Correlation between fMRI (Action task) and Behaviour RDMs (stimuli: animals)']);
saveas(gcf,['C:\Users\Márcia Vaz\Documents\GitHub\Dissertation\05_statistics\results\question 3\','q3_spearman_correlation_action_animals.png']) ;

figure('units','normalized','WindowState','maximized'); [r,p] = corrplot(semantic_behav_RDMs_animals,'Tail','right','Type','Spearman');
title(['Spearman Correlation between fMRI (Semantic task) and Behaviour RDMs (stimuli: animals)']);
saveas(gcf,['C:\Users\Márcia Vaz\Documents\GitHub\Dissertation\05_statistics\results\question 3\','q3_spearman_correlation_semantic_animals.png']) ;

%% Action and semantic matrix vs behav (6 pairs) tools

% action fMRI with the action, semantic and visual task from behaviour
a_a_RDMs_tools = cat(2,Masks_Action_tools,behav_action_tools);
a_s_RDMs_tools = cat(2,Masks_Action_tools,behav_semantic_tools);
a_v_RDMs_tools = cat(2,Masks_Action_tools,behav_visual_tools);

action_behav_RDMs_tools = array2table(cat(2,a_a_RDMs_tools,behav_semantic_tools,behav_visual_tools));
action_behav_RDMs_tools.Properties.VariableNames(1:18) = {'M1_a','M2_a','M3_a','M4_a','M5_a','M6_a','M7_a','M8_a','M9_a','M10_a','M11_a','M12_a','M13_a','M14_a','M15_a','B_a','B_s','B_v'};

action_action_RDMs_tools = array2table(a_a_RDMs_tools);
action_semantic_RDMs_tools = array2table(a_s_RDMs_tools);
action_visual_RDMs_tools = array2table(a_v_RDMs_tools);

action_action_RDMs_tools.Properties.VariableNames(1:16) = {'M1_a','M2_a','M3_a','M4_a','M5_a','M6_a','M7_a','M8_a','M9_a','M10_a','M11_a','M12_a','M13_a','M14_a','M15_a','B_a'};
action_semantic_RDMs_tools.Properties.VariableNames(1:16) = {'M1_a','M2_a','M3_a','M4_a','M5_a','M6_a','M7_a','M8_a','M9_a','M10_a','M11_a','M12_a','M13_a','M14_a','M15_a','B_s'};
action_visual_RDMs_tools.Properties.VariableNames(1:16) = {'M1_a','M2_a','M3_a','M4_a','M5_a','M6_a','M7_a','M8_a','M9_a','M10_a','M11_a','M12_a','M13_a','M14_a','M15_a','B_v'};

% semantic fMRI with the action, semantic and visual task from behaviour
s_a_RDMs_tools = cat(2,Masks_Semantic_tools,behav_action_tools);
s_s_RDMs_tools = cat(2,Masks_Semantic_tools,behav_semantic_tools);
s_v_RDMs_tools = cat(2,Masks_Semantic_tools,behav_visual_tools);

semantic_behav_RDMs_tools = array2table(cat(2,s_a_RDMs_tools,behav_semantic_tools,behav_visual_tools));
semantic_behav_RDMs_tools.Properties.VariableNames(1:18) = {'M1_s','M2_s','M3_s','M4_s','M5_s','M6_s','M7_s','M8_s','M9_s','M10_s','M11_s','M12_s','M13_s','M14_s','M15_s','B_a','B_s','B_v'};

semantic_action_RDMs_tools = array2table(s_a_RDMs_tools);
semantic_semantic_RDMs_tools = array2table(s_s_RDMs_tools);
semantic_visual_RDMs_tools = array2table(s_v_RDMs_tools);

semantic_action_RDMs_tools.Properties.VariableNames(1:16) = {'M1_s','M2_s','M3_s','M4_s','M5_s','M6_s','M7_s','M8_s','M9_s','M10_s','M11_s','M12_s','M13_s','M14_s','M15_s','B_a'};
semantic_semantic_RDMs_tools.Properties.VariableNames(1:16) = {'M1_s','M2_s','M3_s','M4_s','M5_s','M6_s','M7_s','M8_s','M9_s','M10_s','M11_s','M12_s','M13_s','M14_s','M15_s','B_s'};
semantic_visual_RDMs_tools.Properties.VariableNames(1:16) = {'M1_s','M2_s','M3_s','M4_s','M5_s','M6_s','M7_s','M8_s','M9_s','M10_s','M11_s','M12_s','M13_s','M14_s','M15_s','B_v'};


[r_a_a_tools,p_a_a_tools] = corr(Masks_Action_tools,behav_action_tools,'Tail','right','Type','Spearman');
[r_a_s_tools,p_a_s_tools] = corr(Masks_Action_tools,behav_semantic_tools,'Tail','right','Type','Spearman');
[r_a_v_tools,p_a_v_tools] = corr(Masks_Action_tools,behav_visual_tools,'Tail','right','Type','Spearman');
[r_s_a_tools,p_s_a_tools] = corr(Masks_Semantic_tools,behav_action_tools,'Tail','right','Type','Spearman');
[r_s_s_tools,p_s_s_tools] = corr(Masks_Semantic_tools,behav_semantic_tools,'Tail','right','Type','Spearman');
[r_s_v_tools,p_s_v_tools] = corr(Masks_Semantic_tools,behav_visual_tools,'Tail','right','Type','Spearman');

figure('units','normalized','WindowState','maximized');[r,p] = corrplot(action_behav_RDMs_tools,'Tail','right','Type','Spearman');
title(['Spearman Correlation between fMRI (Action task) and Behaviour RDMs (stimuli: tools)']);
saveas(gcf,['C:\Users\Márcia Vaz\Documents\GitHub\Dissertation\05_statistics\results\question 3\','q3_spearman_correlation_action_tools.png']) ;

figure('units','normalized','WindowState','maximized'); [r,p] = corrplot(semantic_behav_RDMs_tools,'Tail','right','Type','Spearman');
title(['Spearman Correlation between fMRI (Semantic task) and Behaviour RDMs (stimuli: tools)']);
saveas(gcf,['C:\Users\Márcia Vaz\Documents\GitHub\Dissertation\05_statistics\results\question 3\','q3_spearman_correlation_semantic_tools.png']) ;

%% Test the alternative hypothesis that the correlation is greater than zero.
% [r,p] = corrplot(rdms,'Tail','right','Type','Spearman')
%% Test the alternative hypothesis that the correlation is less than zero.
% [rho,pval] = corr(behav,fMRI,'Tail','left','Type','Spearman')
%% Test the alternative hypothesis that the correlation is not zero.
% [rho,pval] = corr(behav,fMRI,'Type','Spearman')
