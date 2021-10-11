clear all; close all; clc;

%% Question 2: Does the similarity rating depend on the task?

mean_a_s = load('mean_action_semantic.mat');
mean_a_s = mean_a_s.mean;
mean_a_s = renamevars(mean_a_s,["VarName9","Mean1","VarName11"],...
    ["Masks","Action","Semantic"])

std_as = load('std_action_semantic.mat');
std_as = std_as.std;

std_error_Action =  std_as{:,2}./sqrt(4186);
std_error_Semantic =  std_as{:,3}./sqrt(4186);

std_error_a_s = table(std_error_Action,std_error_Semantic)

std_a_s = renamevars(std_as,["VarName13","std1","VarName15"],...
    ["Masks","Action","Semantic"])

figure();hold on;bar(categorical(mean_a_s{1:15,1}), mean_a_s{1:15,2:3});
errorbar(mean_a_s{1:15,2:3},std_error_a_s{1:15,1:2} ,'.');
XTick=1:1:3
% set(gca, 'XTick',XTick);
% set(gca, 'XTickLabel', XTickLabel);
ylabel('Mean');
xlabel('Masks');
legend(mean_a_s.Properties.VariableNames(2:3),'Location','best');

% figure();bar(categorical(std_a_s{1:15,1}), std_a_s{1:15,2:3});
% ylabel('Std');
% xlabel('Masks');
% legend(std_a_s.Properties.VariableNames(2:3),'Location','best');

p_t_values = load('p_t_values.mat');
p_t_values = p_t_values.p_t_values;

figure();bar(p_t_values{1:15,1}) ;
ylabel('p values');
xlabel('Masks');

figure();bar(p_t_values{1:15,2}) ;
ylabel('t values');
xlabel('Masks');

%% behaviour data
X = categorical({'Action','Semantic','Visual'});

data = load('All_RDMs_behaviour.mat');
data = data.All_RDMs_behaviour;

mean = [0.015093;0.015107;0.015123]
std = [0.015123;0.003267;0.003192]
st_error = [0.000233743;5.04951E-05;4.93359E-05]

t = table(mean,std,st_error)

figure();hold on;bar(X, t{1:3,1});errorbar(t{1:3,1},t{1:3,3},'.');
ylim([0.0148 0.01535])
ylabel('Mean');

% action=data(:,1);
% semantic=data(:,2);
% visual=data(:,3);
% data_t = table(action,semantic,visual)
% figure();hold on;bar(categorical([1; 2; 3]), data{:,1:3});errorbar(t{1:3,1},t{1:3,3},'.');


%% Question 3: 