clear all; close all; clc;

%% Question 2: Does the brain process stimuli deppending on the task?

% 15 different t-test, for each ROI mask: semantic vc action task

load('RDMs_euclidean_estimation_nonnan_action.mat');
Masks_Action = RDMs_euclidean_estimation_nonnan_action;

load('RDMs_euclidean_estimation_nonnan_semantic.mat');
Masks_Semantic = RDMs_euclidean_estimation_nonnan_semantic;

%% ANIMALS
load('RDMs_euclidean_vector_action_animals.mat');
Masks_Action_animals = RDMs_euclidean_vector_action_animals;

load('RDMs_euclidean_vector_semantic_animals.mat');
Masks_Semantic_animals = RDMs_euclidean_vector_semantic_animals;

%% TOOLS
load('RDMs_euclidean_vector_action_tools.mat');
Masks_Action_tools = RDMs_euclidean_vector_action_tools;

load('RDMs_euclidean_vector_semantic_tools.mat');
Masks_Semantic_tools = RDMs_euclidean_vector_semantic_tools;

%% Load names of the masks (correct order)
load('Mask_names.mat');
Masks_n = Mask_names;

count=0;

for each_mask = 1:15 
    count=count+1;
    Mask_A = Masks_Action(each_mask,:);
    Mask_S = Masks_Semantic(each_mask,:);
    % Masks for animals stimuli
    Mask_A_animals = Masks_Action_animals(each_mask,:);
    Mask_S_animals = Masks_Semantic_animals(each_mask,:);
    % Masks for tools stimuli
    Mask_A_tools = Masks_Action_tools(each_mask,:);
    Mask_S_tools = Masks_Semantic_tools(each_mask,:);
    
    [h,p,ci,stats] = ttest(Mask_A,Mask_S); 
    h_values(1,count)=h;
    p_values(1,count)=p;
    confidence_intervals{1,count}=ci;
    test_stats{1,count}=stats;
    t_value(1,count)=stats.tstat;
    degree_freedom(1,count)=stats.df;
    standard_deviation(1,count)=stats.sd;
    
    [h_an,p_an,ci_an,stats_an] = ttest(Mask_A_animals,Mask_S_animals);
    h_values_an(1,count)=h_an;
    p_values_an(1,count)=p_an;
    confidence_intervals_an{1,count}=ci_an;
    test_stats_an{1,count}=stats_an;
    t_value_an(1,count)=stats_an.tstat;
    degree_freedom_an(1,count)=stats_an.df;
    standard_deviation_an(1,count)=stats_an.sd;
    
    [h_to,p_to,ci_to,stats_to] = ttest(Mask_A_tools,Mask_S_tools);  
    h_values_to(1,count)=h_to;
    p_values_to(1,count)=p_to;
    confidence_intervals_to{1,count}=ci_to;
    test_stats_to{1,count}=stats_to;
    t_value_to(1,count)=stats_to.tstat;
    degree_freedom_to(1,count)=stats_to.df;
    standard_deviation_to(1,count)=stats_to.sd;
    
end
degrees_of_freedom = unique(degree_freedom)
degrees_of_freedom_an = unique(degree_freedom_an)
degrees_of_freedom_to = unique(degree_freedom_to)

p_values
p_values_an
p_values_to

% calculate mean and std and std error for action masks
mean_action = mean(Masks_Action,2);
std_error_action = std(Masks_Action,0,2)/sqrt(4186);
mean_action_animals = mean(Masks_Action_animals,2);
std_error_action_animals = std(Masks_Action_animals,0,2)/sqrt(1035);
mean_action_tools = mean(Masks_Action_tools,2);
std_error_action_tools = std(Masks_Action_tools,0,2)/sqrt(1035);

% calculate mean and std and std error for semantic masks
mean_semantic = mean(Masks_Semantic,2);
std_error_semantic = std(Masks_Semantic,0,2)/sqrt(4186);
mean_semantic_animals = mean(Masks_Semantic_animals,2);
std_error_semantic_animals = std(Masks_Semantic_animals,0,2)/sqrt(1035);
mean_semantic_tools = mean(Masks_Semantic_tools,2);
std_error_semantic_tools = std(Masks_Semantic_tools,0,2)/sqrt(1035);

means = cat(2,mean_action,mean_semantic);
std_errors = cat(2,std_error_action,std_error_semantic);

means_animals = cat(2,mean_action_animals,mean_semantic_animals);
std_errors_animals = cat(2,std_error_action_animals,std_error_semantic_animals);

means_tools = cat(2,mean_action_tools,mean_semantic_tools);
std_errors_tools = cat(2,std_error_action_tools,std_error_semantic_tools);

subgroups_means = cat(2,Masks_n,array2table(means));
subgroups_means.Properties.VariableNames(1:5) = {'Group','Mask Name','Mask index','Mean action','Mean semantic'};

subgroups_means_animals = cat(2,Masks_n,array2table(means_animals));
subgroups_means_animals.Properties.VariableNames(1:5) = {'Group','Mask Name','Mask index','Mean action','Mean semantic'};

subgroups_means_tools = cat(2,Masks_n,array2table(means_tools));
subgroups_means_tools.Properties.VariableNames(1:5) = {'Group','Mask Name','Mask index','Mean action','Mean semantic'};

% figure();
% bar(p_values);xlim=get(gca,'xlim');
% % hold on
% % plot(xlim,[0.05 0.05]);
% title('t-test between Action and Semantictask for each fMRI Masks (stimuli: all)');
% xlabel('Masks');ylabel('p-value');
% set(gca,'xticklabel',table2array(subgroups_means(:,2)));
% 
% figure();
% bar(t_value);xlim=get(gca,'xlim');
% ylim([0.01,0.08])
% title('t-test between Action and Semantictask for each fMRI Masks (stimuli: all)');
% xlabel('Masks');ylabel('t-value');
% set(gca,'xticklabel',table2array(subgroups_means(:,2)));

%% get different colours for the 3 groups in the bar plot

figure('units','normalized','WindowState','maximized');;
b1 = bar(1:5,means(1:5,:),'grouped');
hold on
b2 = bar(6:10,means(6:10,:),'grouped');
b3 = bar(11:15,means(11:15,:),'grouped');

% 3 groups 
set(b1,'FaceColor',[0 0.4470 0.7410]);
set(b2,'FaceColor',[0.9137 0.5059 0.1216]);
set(b3,'FaceColor',[0.4660 0.6740 0.1880]);

% semantic
b1(2).EdgeColor = [0 0.4470 0.7410];
b2(2).EdgeColor = [0.9137 0.5059 0.1216];
b3(2).EdgeColor = [0.4660 0.6740 0.1880];
b1(2).FaceColor = [0.5020 0.7255 0.8706];
b2(2).FaceColor = [0.9373 0.7529 0.5608];
b3(2).FaceColor = [0.7333 0.8392 0.5961];

set(gca,'XTick',1:1:15);
set(gca,'xticklabel',table2array(subgroups_means(:,2)));

%% get the std error in the bar plot

% Calculate the number of groups and number of bars in each group
[ngroups,nbars] = size(means);
% Get the x coordinate of the bars
x = nan(nbars, ngroups);
for i = 1:nbars
    x(i,1:5) = b1(i).XEndPoints;
    x(i,6:10) = b2(i).XEndPoints;
    x(i,11:15) = b3(i).XEndPoints;
    
end
% Plot the errorbars
errorbar(x',means,std_errors,'k','linestyle','none');
ylim([0.01 0.015]);
xlabel('Masks');
ylabel('Dissimilarity mean');
legend([b1(1) b1(2) b2(1) b2(2) b3(1) b3(2)],{'All stimuli (Action task)' 'All stimuli (Semantic task)' 'Semantic > Action (Action task)' 'Semantic > Action (Semantic task)' 'Action > Semantic (Action task)','Action > Semantic (Semantic task)'});
title('Mean RDMs of fMRI ROIs for action and semantic task (stimuli: all)')
hold off


%% ANIMALS

% figure();
% bar(p_values_an);xlim=get(gca,'xlim');
% % hold on
% % plot(xlim,[0.05 0.05]);
% title('t-test between Action and Semantictask for each fMRI Masks (stimuli: animals)');
% xlabel('Masks');ylabel('p-value');
% set(gca,'xticklabel',table2array(subgroups_means_animals(:,2)));
% 
% figure();
% bar(t_value_an);xlim=get(gca,'xlim');
% title('t-test between Action and Semantictask for each fMRI Masks (stimuli: animals)');
% xlabel('Masks');ylabel('t-value');
% set(gca,'xticklabel',table2array(subgroups_means_animals(:,2)));

%% get different colours for the 3 groups in the bar plot

figure('units','normalized','WindowState','maximized');;
b1 = bar(1:5,means_animals(1:5,:),'grouped');
hold on
b2 = bar(6:10,means_animals(6:10,:),'grouped');
b3 = bar(11:15,means_animals(11:15,:),'grouped');

% 3 groups 
set(b1,'FaceColor',[0 0.4470 0.7410]);
set(b2,'FaceColor',[0.9137 0.5059 0.1216]);
set(b3,'FaceColor',[0.4660 0.6740 0.1880]);

% semantic
b1(2).EdgeColor = [0 0.4470 0.7410];
b2(2).EdgeColor = [0.9137 0.5059 0.1216];
b3(2).EdgeColor = [0.4660 0.6740 0.1880];
b1(2).FaceColor = [0.5020 0.7255 0.8706];
b2(2).FaceColor = [0.9373 0.7529 0.5608];
b3(2).FaceColor = [0.7333 0.8392 0.5961];

set(gca,'XTick',1:1:15);
set(gca,'xticklabel',table2array(subgroups_means_animals(:,2)));

%% get the std error in the bar plot

% Get the x coordinate of the bars
x = nan(2, 3);
for i = 1:nbars
    x(i,1:5) = b1(i).XEndPoints;
    x(i,6:10) = b2(i).XEndPoints;
    x(i,11:15) = b3(i).XEndPoints;
    
end
% Plot the errorbars
errorbar(x',means_animals,std_errors_animals,'k','linestyle','none');
ylim([0.01 0.015]);
xlabel('Masks');
ylabel('Dissimilarity mean');
legend([b1(1) b1(2) b2(1) b2(2) b3(1) b3(2)],{'All stimuli (Action task)' 'All stimuli (Semantic task)' 'Semantic > Action (Action task)' 'Semantic > Action (Semantic task)' 'Action > Semantic (Action task)','Action > Semantic (Semantic task)'});
title('Mean RDMs of fMRI ROIs for action and semantic task (stimuli: animals)')
hold off

%% TOOLS

% figure();
% bar(p_values_to);xlim=get(gca,'xlim');
% % hold on
% % plot(xlim,[0.05 0.05]);
% title('t-test between Action and Semantictask for each fMRI Masks (stimuli: tools)');
% xlabel('Masks');ylabel('p-value');
% set(gca,'xticklabel',table2array(subgroups_means_tools(:,2)));
% 
% figure('units','normalized','WindowState','maximized');
% bar(t_value_to);xlim=get(gca,'xlim');
% title('t-test between Action and Semantictask for each fMRI Masks (stimuli: tools)');
% xlabel('Masks');ylabel('t-value');
% set(gca,'xticklabel',table2array(subgroups_means_tools(:,2)));

%% get different colours for the 3 groups in the bar plot

figure('units','normalized','WindowState','maximized');;
b1 = bar(1:5,means_tools(1:5,:),'grouped');
hold on
b2 = bar(6:10,means_tools(6:10,:),'grouped');
b3 = bar(11:15,means_tools(11:15,:),'grouped');

% 3 groups 
set(b1,'FaceColor',[0 0.4470 0.7410]);
set(b2,'FaceColor',[0.9137 0.5059 0.1216]);
set(b3,'FaceColor',[0.4660 0.6740 0.1880]);

% semantic
b1(2).EdgeColor = [0 0.4470 0.7410];
b2(2).EdgeColor = [0.9137 0.5059 0.1216];
b3(2).EdgeColor = [0.4660 0.6740 0.1880];
b1(2).FaceColor = [0.5020 0.7255 0.8706];
b2(2).FaceColor = [0.9373 0.7529 0.5608];
b3(2).FaceColor = [0.7333 0.8392 0.5961];

set(gca,'XTick',1:1:15);
set(gca,'xticklabel',table2array(subgroups_means_tools(:,2)));

%% get the std error in the bar plot

% Get the x coordinate of the bars
x = nan(2, 3);
for i = 1:nbars
    x(i,1:5) = b1(i).XEndPoints;
    x(i,6:10) = b2(i).XEndPoints;
    x(i,11:15) = b3(i).XEndPoints;
    
end
% Plot the errorbars
errorbar(x',means_tools,std_errors_tools,'k','linestyle','none');
ylim([0.01 0.015]);
xlabel('Masks');
ylabel('Dissimilarity mean');
legend([b1(1) b1(2) b2(1) b2(2) b3(1) b3(2)],{'All stimuli (Action task)' 'All stimuli (Semantic task)' 'Semantic > Action (Action task)' 'Semantic > Action (Semantic task)' 'Action > Semantic (Action task)','Action > Semantic (Semantic task)'},'location','best');
title('Mean RDMs of fMRI ROIs for action and semantic task (stimuli: tools)')
hold off

%% ONLY THE 3 MASKS SELECTED
% Mask 1 (7): 'left posterior occipital visual cortex (all stimulli)'
% Mask 6 (2): 'left anterior temporal lobe (semantic > action)'
% Mask 12 (6): 'left parietal (action > semantic)'

h_values_3 = [h_values(1,1),h_values(1,6),h_values(1,12)];
p_values_3 = [p_values(1,1),p_values(1,6),p_values(1,12)];
confidence_intervals_3 = [confidence_intervals(1,1),confidence_intervals(1,6),confidence_intervals(1,12)];
test_stats_3 = [test_stats(1,1),test_stats(1,6),test_stats(1,12)];
t_value_3 = [t_value(1,1),t_value(1,6),t_value(1,12)];
degree_freedom_3 = [degree_freedom(1,1),degree_freedom(1,6),degree_freedom(1,12)];
standard_deviation_3 = [standard_deviation(1,1),standard_deviation(1,6),standard_deviation(1,12)];

% animals
h_values_3_an = [h_values_an(1,1),h_values_an(1,6),h_values_an(1,12)];
p_values_3_an = [p_values_an(1,1),p_values_an(1,6),p_values_an(1,12)];
confidence_intervals_3_an = [confidence_intervals_an(1,1),confidence_intervals_an(1,6),confidence_intervals_an(1,12)];
test_stats_3_an = [test_stats_an(1,1),test_stats_an(1,6),test_stats_an(1,12)];
t_value_3_an = [t_value_an(1,1),t_value_an(1,6),t_value_an(1,12)];
degree_freedom_3_an = [degree_freedom_an(1,1),degree_freedom_an(1,6),degree_freedom_an(1,12)];
standard_deviation_3_an = [standard_deviation_an(1,1),standard_deviation_an(1,6),standard_deviation_an(1,12)];

% tools
h_values_3_to = [h_values_to(1,1),h_values_to(1,6),h_values_to(1,12)];
p_values_3_to = [p_values_to(1,1),p_values_to(1,6),p_values_to(1,12)];
confidence_intervals_3_to = [confidence_intervals_to(1,1),confidence_intervals_to(1,6),confidence_intervals_to(1,12)];
test_stats_3 = [test_stats_to(1,1),test_stats_to(1,6),test_stats_to(1,12)];
t_value_3_to = [t_value_to(1,1),t_value_to(1,6),t_value_to(1,12)];
degree_freedom_3_to = [degree_freedom_to(1,1),degree_freedom_to(1,6),degree_freedom_to(1,12)];
standard_deviation_3_to = [standard_deviation_to(1,1),standard_deviation_to(1,6),standard_deviation_to(1,12)];

% action
mean_action_3 = [mean_action(1,1);mean_action(6,1);mean_action(12,1)];
std_error_action_3 = [std_error_action(1,1);std_error_action(6,1);std_error_action(12,1)];
mean_action_animals_3 = [mean_action_animals(1,1);mean_action_animals(6,1);mean_action_animals(12,1)];
std_error_action_animals_3 = [std_error_action_animals(1,1);std_error_action_animals(6,1);std_error_action_animals(12,1)];
mean_action_tools_3 = [mean_action_tools(1,1);mean_action_tools(6,1);mean_action_tools(12,1)];
std_error_action_tools_3 = [std_error_action_tools(1,1);std_error_action_tools(6,1);std_error_action_tools(12,1)];

% semantic
mean_semantic_3 = [mean_semantic(1,1);mean_semantic(6,1);mean_semantic(12,1)];
std_error_semantic_3 = [std_error_semantic(1,1);std_error_semantic(6,1);std_error_semantic(12,1)];
mean_semantic_animals_3 = [mean_semantic_animals(1,1);mean_semantic_animals(6,1);mean_semantic_animals(12,1)];
std_error_semantic_animals_3 = [std_error_semantic_animals(1,1);std_error_semantic_animals(6,1);std_error_semantic_animals(12,1)];
mean_semantic_tools_3 = [mean_semantic_tools(1,1);mean_semantic_tools(6,1);mean_semantic_tools(12,1)];
std_error_semantic_tools_3 = [std_error_semantic_tools(1,1);std_error_semantic_tools(6,1);std_error_semantic_tools(12,1)];

means_3 = cat(2,mean_action_3,mean_semantic_3);
std_errors_3 = cat(2,std_error_action_3,std_error_semantic_3);

means_animals_3 = cat(2,mean_action_animals_3,mean_semantic_animals_3);
std_errors_animals_3 = cat(2,std_error_action_animals_3,std_error_semantic_animals_3);

means_tools_3 = cat(2,mean_action_tools_3,mean_semantic_tools_3);
std_errors_tools_3 = cat(2,std_error_action_tools_3,std_error_semantic_tools_3);

M(1,:) = Masks_n(1,:);
M(2,:) = Masks_n(6,:);
M(3,:) = Masks_n(12,:);

subgroups_means_3 = cat(2,M,array2table(means_3));
subgroups_means_3.Properties.VariableNames(1:5) = {'Group','Mask Name','Mask index','Mean action','Mean semantic'};

subgroups_means_animals_3 = cat(2,M,array2table(means_animals_3));
subgroups_means_animals_3.Properties.VariableNames(1:5) = {'Group','Mask Name','Mask index','Mean action','Mean semantic'};

subgroups_means_tools_3 = cat(2,M,array2table(means_tools_3));
subgroups_means_tools_3.Properties.VariableNames(1:5) = {'Group','Mask Name','Mask index','Mean action','Mean semantic'};

% figure();
% bar(p_values_3);xlim=get(gca,'xlim');
% % hold on
% % plot(xlim,[0.05 0.05]);
% title('t-test between Action and Semantictask for each fMRI Masks (stimuli: all)');
% xlabel('Masks');ylabel('p-value');
% set(gca,'xticklabel',table2array(subgroups_means_3(:,2)));
% 
% figure();
% bar(t_value_3);xlim=get(gca,'xlim');
% title('t-test between Action and Semantictask for each fMRI Masks (stimuli: all)');
% xlabel('Masks');ylabel('t-value');
% set(gca,'xticklabel',table2array(subgroups_means_3(:,2)));

%% get different colours for the 3 groups in the bar plot

figure('units','normalized','WindowState','maximized');;
b1 = bar(1,means_3(1,:),'grouped');
hold on
b2 = bar(2,means_3(2,:),'grouped');
b3 = bar(3,means_3(3,:),'grouped');

% 3 groups 
set(b1,'FaceColor',[0 0.4470 0.7410]);
set(b2,'FaceColor',[0.9137 0.5059 0.1216]);
set(b3,'FaceColor',[0.4660 0.6740 0.1880]);

% semantic
b1(2).EdgeColor = [0 0.4470 0.7410];
b2(2).EdgeColor = [0.9137 0.5059 0.1216];
b3(2).EdgeColor = [0.4660 0.6740 0.1880];
b1(2).FaceColor = [0.5020 0.7255 0.8706];
b2(2).FaceColor = [0.9373 0.7529 0.5608];
b3(2).FaceColor = [0.7333 0.8392 0.5961];

set(gca,'XTick',1:1:3);
set(gca,'xticklabel',table2array(subgroups_means_3(:,2)));

%% get the std error in the bar plot
% Get the x coordinate of the bars
x = nan(2, 3);
for i = 1:nbars
    x(i,1) = b1(i).XEndPoints;
    x(i,2) = b2(i).XEndPoints;
    x(i,3) = b3(i).XEndPoints;
    
end
% Plot the errorbars
errorbar(x',means_3,std_errors_3,'k','linestyle','none');
ylim([0.01 0.015]);
xlabel('Masks');
ylabel('Dissimilarity mean');
legend([b1(1) b1(2) b2(1) b2(2) b3(1) b3(2)],{'All stimuli (Action task)' 'All stimuli (Semantic task)' 'Semantic > Action (Action task)' 'Semantic > Action (Semantic task)' 'Action > Semantic (Action task)','Action > Semantic (Semantic task)'});
title('Mean RDMs of fMRI ROIs for action and semantic task (stimuli: all)')
hold off

%% 3 CHOICES : ANIMALS

% figure();
% bar(p_values_3_an);xlim=get(gca,'xlim');
% % hold on
% % plot(xlim,[0.05 0.05]);
% title('t-test between Action and Semantictask for each fMRI Masks (stimuli: animals)');
% xlabel('Masks');ylabel('p-value');
% set(gca,'xticklabel',table2array(subgroups_means_animals_3(:,2)));
% 
% figure();
% bar(t_value_3_an);xlim=get(gca,'xlim');
% title('t-test between Action and Semantictask for each fMRI Masks (stimuli: animals)');
% xlabel('Masks');ylabel('t-value');
% set(gca,'xticklabel',table2array(subgroups_means_animals_3(:,2)));

%% get different colours for the 3 groups in the bar plot

figure('units','normalized','WindowState','maximized');;
b1 = bar(1,means_animals_3(1,:),'grouped');
hold on
b2 = bar(2,means_animals_3(2,:),'grouped');
b3 = bar(3,means_animals_3(3,:),'grouped');

% 3 groups 
set(b1,'FaceColor',[0 0.4470 0.7410]);
set(b2,'FaceColor',[0.9137 0.5059 0.1216]);
set(b3,'FaceColor',[0.4660 0.6740 0.1880]);

% semantic
b1(2).EdgeColor = [0 0.4470 0.7410];
b2(2).EdgeColor = [0.9137 0.5059 0.1216];
b3(2).EdgeColor = [0.4660 0.6740 0.1880];
b1(2).FaceColor = [0.5020 0.7255 0.8706];
b2(2).FaceColor = [0.9373 0.7529 0.5608];
b3(2).FaceColor = [0.7333 0.8392 0.5961];

set(gca,'XTick',1:1:3);
set(gca,'xticklabel',table2array(subgroups_means_animals_3(:,2)));

%% get the std error in the bar plot

% Get the x coordinate of the bars
x = nan(2, 3);
for i = 1:nbars
    x(i,1) = b1(i).XEndPoints;
    x(i,2) = b2(i).XEndPoints;
    x(i,3) = b3(i).XEndPoints;
    
end
% Plot the errorbars
errorbar(x',means_animals_3,std_errors_animals_3,'k','linestyle','none');
ylim([0.01 0.015]);
xlabel('Masks');
ylabel('Dissimilarity mean');
legend([b1(1) b1(2) b2(1) b2(2) b3(1) b3(2)],{'All stimuli (Action task)' 'All stimuli (Semantic task)' 'Semantic > Action (Action task)' 'Semantic > Action (Semantic task)' 'Action > Semantic (Action task)','Action > Semantic (Semantic task)'});
title('Mean RDMs of fMRI ROIs for action and semantic task (stimuli: animals)')
hold off

%% 3 CHOICES : TOOLS

% figure();
% bar(p_values_3_to);xlim=get(gca,'xlim');
% % hold on
% % plot(xlim,[0.05 0.05]);
% title('t-test between Action and Semantictask for each fMRI Masks (stimuli: tools)');
% xlabel('Masks');ylabel('p-value');
% set(gca,'xticklabel',table2array(subgroups_means_tools_3(:,2)));
% 
% figure('units','normalized','WindowState','maximized');
% bar(t_value_3_to);xlim=get(gca,'xlim');
% title('t-test between Action and Semantictask for each fMRI Masks (stimuli: tools)');
% xlabel('Masks');ylabel('t-value');
% set(gca,'xticklabel',table2array(subgroups_means_tools_3(:,2)));

%% get different colours for the 3 groups in the bar plot

figure('units','normalized','WindowState','maximized');;
b1 = bar(1,means_tools_3(1,:),'grouped');
hold on
b2 = bar(2,means_tools_3(2,:),'grouped');
b3 = bar(3,means_tools_3(3,:),'grouped');

% 3 groups 
set(b1,'FaceColor',[0 0.4470 0.7410]);
set(b2,'FaceColor',[0.9137 0.5059 0.1216]);
set(b3,'FaceColor',[0.4660 0.6740 0.1880]);

% semantic
b1(2).EdgeColor = [0 0.4470 0.7410];
b2(2).EdgeColor = [0.9137 0.5059 0.1216];
b3(2).EdgeColor = [0.4660 0.6740 0.1880];
b1(2).FaceColor = [0.5020 0.7255 0.8706];
b2(2).FaceColor = [0.9373 0.7529 0.5608];
b3(2).FaceColor = [0.7333 0.8392 0.5961];

set(gca,'XTick',1:1:3);
set(gca,'xticklabel',table2array(subgroups_means_tools_3(:,2)));

%% get the std error in the bar plot

% Get the x coordinate of the bars
x = nan(2, 3);
for i = 1:nbars
    x(i,1) = b1(i).XEndPoints;
    x(i,2) = b2(i).XEndPoints;
    x(i,3) = b3(i).XEndPoints;
    
end
% Plot the errorbars
errorbar(x',means_tools_3,std_errors_tools_3,'k','linestyle','none');
ylim([0.01 0.015]);
xlabel('Masks');
ylabel('Dissimilarity mean');
legend([b1(1) b1(2) b2(1) b2(2) b3(1) b3(2)],{'All stimuli (Action task)' 'All stimuli (Semantic task)' 'Semantic > Action (Action task)' 'Semantic > Action (Semantic task)' 'Action > Semantic (Action task)','Action > Semantic (Semantic task)'},'location','best');
title('Mean RDMs of fMRI ROIs for action and semantic task (stimuli: tools)')
hold off
