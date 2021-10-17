clear all; close all; clc;

%% Question 1: Does the similarity rating depend on the task?

% behaviour data - repeated way anova (3 tasks);

X = categorical({'Action','Semantic','Visual'});

data = load('All_RDMs_behaviour.mat');
data = data.All_RDMs_behaviour;

mean = [0.015093;0.015107;0.015123]
std = [0.003332;0.003267;0.003192]
st_error = std/sqrt(4186)
% st_error = [0.000233743;5.04951E-05;4.93359E-05]

t = table(mean,std,st_error)

p_value = 0.743558
f_value = 0.296319

figure(1);hold on;bar(X, t{1:3,1});errorbar(t{1:3,1},t{1:3,3},'.');
ylim([0.0148 0.0152])
ylabel('Mean');
title('Action vs Semantic vs Visual (Behaviour RDMs)')
