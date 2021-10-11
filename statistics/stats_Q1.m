clear all; close all; clc;

%% Question 1: Does the brain process stimuli deppending on the task?

% 15 different t-test, for each mask: semantic vc action task

Masks_Action = load('RDMs_euclidean_estimation_nonnan_action.mat');
Masks_Action = Masks_Action.RDMs_euclidean_estimation_nonnan_action;

Masks_Semantic = load('RDMs_euclidean_estimation_nonnan_semantic.mat');
Masks_Semantic = Masks_Semantic.RDMs_euclidean_estimation_nonnan_semantic;


% h= is 1 if the test rejects the null hypothesis at the 5% significance level, and 0 otherwise.
% p = p-value
% ci = confidence interval on the difference of the population means, ci. 
% stats contains information about the test statistic.

for each_mask = 1:15  
    Mask_A = Masks_Action(each_mask,:);
    Mask_S = Masks_Semantic(each_mask,:);

    [h,p,ci,stats] = ttest(Mask_A,Mask_S)
        
    h_values(1,each_mask)=h;
    p_values(1,each_mask)=p;
    confidence_intervals{1,each_mask}=ci;
    test_stats{1,each_mask}=stats;
    t_value(1,each_mask)=stats.tstat;
    degree_freedom(1,each_mask)=stats.df;
    standard_deviation(1,each_mask)=stats.sd;
end

degrees_of_freedom = unique(degree_freedom)
p_values

figure(1); 
bar(p_values);
xlim=get(gca,'xlim');
% hold on
% plot(xlim,[0.05 0.05]);
title('Action vs Semantic (fMRI Masks)')
xlabel('Masks')
ylabel('p-value')

figure(2); 
bar(t_value);
xlim=get(gca,'xlim');
title('Action vs Semantic (fMRI Masks)')
xlabel('Masks')
ylabel('t-value')

mean = load('mean_action_semantic.mat')
mean = mean.mean;
std = load('std_action_semantic.mat')
std = std.std;

mean_action = mean{:,2}
mean_semantic = mean{:,3}
std_action = std{:,2}
std_semantic = std{:,3}


means = cat(2,mean_action,mean_semantic);
stds = cat(2,std_action,std_semantic);
std_errors = stds/sqrt(4186)
figure();
b = bar(means, 'grouped')
hold on
% Calculate the number of groups and number of bars in each group
[ngroups,nbars] = size(means);
% Get the x coordinate of the bars
x = nan(nbars, ngroups);
for i = 1:nbars
    x(i,:) = b(i).XEndPoints;
end
% Plot the errorbars
errorbar(x',means,std_errors,'k','linestyle','none');
ylim([0.01 0.0145])
xlabel('Masks')
ylabel('Mean')
hold off


% figure(3); 
% bar(standard_deviation);
% xlim=get(gca,'xlim');
% title('Action vs Semantic (fMRI Masks)')
% xlabel('Masks')
% ylabel('std')
