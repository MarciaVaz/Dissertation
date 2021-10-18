clear all; close all; clc;

%% Question 2: Does the brain process stimuli deppending on the task?

% 15 different t-test, for each mask: semantic vc action task

load('RDMs_euclidean_estimation_nonnan_action.mat');
Masks_Action = RDMs_euclidean_estimation_nonnan_action;

load('RDMs_euclidean_estimation_nonnan_semantic.mat');
Masks_Semantic = RDMs_euclidean_estimation_nonnan_semantic;

load('Mask_names.mat');
Masks_n = Mask_names;

count=0;
new_order = Masks_n{:,3}';

for each_mask = new_order 
    count=count+1;
    Mask_A = Masks_Action(each_mask,:);
    Mask_S = Masks_Semantic(each_mask,:);

    [h,p,ci,stats] = ttest(Mask_A,Mask_S);
        
    h_values(1,count)=h;
    p_values(1,count)=p;
    confidence_intervals{1,count}=ci;
    test_stats{1,count}=stats;
    t_value(1,count)=stats.tstat;
    degree_freedom(1,count)=stats.df;
    standard_deviation(1,count)=stats.sd;
end
degrees_of_freedom = unique(degree_freedom)
p_values


mean = load('mean_action_semantic.mat');
mean = mean.mean;
std = load('std_action_semantic.mat');
std = std.std;

mean_action = mean{:,2};
mean_semantic = mean{:,3};

std_action = std{:,2};
std_semantic = std{:,3};

means = cat(2,mean_action,mean_semantic, new_order');
means = sortrows(means,3);
means = means(:,1:2);

subgroups_means = cat(2,Masks_n,array2table(means));
subgroups_means.Properties.VariableNames(1:5) = {'Group','Mask Name','Mask index','Mean action','Mean semantic'};

stds = cat(2,std_action,std_semantic,new_order');
stds = sortrows(stds,3);
stds = stds(:,1:2);
std_errors = stds/sqrt(4186);

figure(1); 
bar(p_values);
xlim=get(gca,'xlim');
% hold on
% plot(xlim,[0.05 0.05]);
title('Action vs Semantic (fMRI Masks)');
xlabel('Masks');
ylabel('p-value');
set(gca,'xticklabel',table2array(subgroups_means(:,2)));

figure(2); 
bar(t_value);
xlim=get(gca,'xlim');
title('Action vs Semantic (fMRI Masks)');
xlabel('Masks');
ylabel('t-value');
set(gca,'xticklabel',table2array(subgroups_means(:,2)));

figure(3);
% b = bar(means, 'grouped')%,'EdgeColor',[0 .9 .9],'LineWidth',1.5)
% set(gca,'xticklabel',table2array(subgroups_means(:,2)));

%% get different colours for the 3 groups in the bar plot

b1 = bar(1:5,means(1:5,:),'grouped');%,'EdgeColor',[0 0.4470 0.7410],'LineWidth',1.5)
hold on
b2 = bar(6:10,means(6:10,:),'grouped');%,'EdgeColor',[0.9137 0.5059 0.1216],'LineWidth',1.5)
b3 = bar(11:15,means(11:15,:),'grouped');%,'EdgeColor',[0.4660 0.6740 0.1880],'LineWidth',1.5)

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

% hold on
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
ylim([0.01 0.0145]);
xlabel('Masks');
ylabel('Mean');
legend([b1(1) b1(2) b2(1) b2(2) b3(1) b3(2)],{'All stimuli (Action task)' 'All stimuli (Semantic task)' 'Semantic > Action (Action task)' 'Semantic > Action (Semantic task)' 'Action > Semantic (Action task)','Action > Semantic (Semantic task)'});
title('fMRI ROIs mean (action vs semantic)')
hold off

%% Only the 3 masks selected
% Mask 7: 'left posterior occipital visual cortex (all stimulli)'
% Mask 2: 'left anterior temporal lobe (semantic > action)'
% Mask 6: 'left parietal (action > semantic)'


% 3 by 2 repeated measure anova  --> we hope to get an interaction

% anova -> wether the green in one region is more green than the green in
% the other region, that's why it is by 2 (action and semantic)
% does action dets more similar in action region and less similar in semantic region?
%  does the mask produces different RDMs?


