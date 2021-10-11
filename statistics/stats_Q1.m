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

figure(3); 
bar(standard_deviation);
xlim=get(gca,'xlim');
title('Action vs Semantic (fMRI Masks)')
xlabel('Masks')
ylabel('std')

