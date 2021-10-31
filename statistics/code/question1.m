clear all; close all; clc;

%% Question 1: Does the similarity rating depend on the task?

% behaviour data - repeated way anova (3 tasks);

X = categorical({'Action','Semantic','Visual'});

%% ALL STIMULI

mean_all = [0.015092885994769;0.015107044497849;0.015122906043485]
std_all = [0.0033315142266602;0.00326669543460956;0.00319244275564001]
st_error_all = std_all/sqrt(4186)

table_all = table(mean_all,std_all,st_error_all)

p_value_all = 0.743558
f_value_all = 0.296319

% figure();hold on;bar(X, table_all{1:3,1});errorbar(table_all{1:3,1},table_all{1:3,3},'.');
% ylim([0.014 0.0155])
% ylabel('Mean');
% xlabel('Tasks');
% title('Behaviour dissimilarities by task (stimuli: all)')

%% ANIMALS

mean_animals = [0.012372757642845;0.012662738839460;0.013351479489145]
std_animals = [0.003229019351881;0.002870734422219;0.003192273517161]
st_error_animals = std_animals/sqrt(4186)

table_animals = table(mean_animals,std_animals,st_error_animals)

p_value_animals = 2.9419E-38
f_value_animals = 94.069552

% figure();hold on;bar(X, table_animals{1:3,1});errorbar(table_animals{1:3,1},table_animals{1:3,3},'.');
% ylim([0.012 0.0135])
% ylabel('Dissimilarity mean');
% xlabel('Tasks');
% title('Behaviour dissimilarities by task (stimuli: animals)')

%% TOOLS

mean_tools = [0.013033933886690;0.012783002528197;0.012362197329356];
std_tools = [0.002554393514404;0.002785186202814;0.002367348429177];
st_error_tools = std_tools/sqrt(4186)

table_tools = table(mean_tools,std_tools,st_error_tools)

p_value_tools = 2.82014705996604E-13
f_value_tools = 29.720456

% figure();hold on;bar(X, table_tools{1:3,1});errorbar(table_tools{1:3,1},table_tools{1:3,3},'.');
% ylim([0.012 0.0135])
% ylabel('Dissimilarity mean');
% xlabel('Tasks');
% title('Behaviour dissimilarities by task (stimuli: tools)')

means_both = cat(2,mean_all,mean_animals,mean_tools);
std_errors_both = cat(2,st_error_all,st_error_animals,st_error_tools)

%% PLOT TOGETHER
figure('units','normalized','WindowState','maximized'); 
b1 = bar(1,means_both(1,:),'grouped');
hold on
b2 = bar(2,means_both(2,:),'grouped');
b3 = bar(3,means_both(3,:),'grouped');

% 3 groups: one for each task
set(b1,'FaceColor',[0 0.4470 0.7410]);
set(b2,'FaceColor',[0.9137 0.5059 0.1216]);
set(b3,'FaceColor',[0.4660 0.6740 0.1880]);

% animals
b1(2).EdgeColor = [0 0.4470 0.7410];
b2(2).EdgeColor = [0.9137 0.5059 0.1216];
b3(2).EdgeColor = [0.4660 0.6740 0.1880];
b1(2).FaceColor = [0.5020 0.7255 0.8706];
b2(2).FaceColor = [241 173 110]/255;
b3(2).FaceColor = [0.6510 0.7882 0.4706];

% tools
b1(3).EdgeColor = [0.5020 0.7255 0.8706];
b2(3).EdgeColor = [241 173 110]/255;
b3(3).EdgeColor = [0.6510 0.7882 0.4706];
b1(3).FaceColor = [0.8000 0.8706 0.9137];
b2(3).FaceColor = [248 214 182]/255;
b3(3).FaceColor = [0.7882 0.8941 0.7333];


set(gca,'XTick',1:1:3);
array_tasks={'Action' 'Semantic','Visual'};
set(gca,'xticklabel',array_tasks);

% Get the x coordinate of the bars
x = nan(3, 3);
for i = 1:3
    x(i,1) = b1(i).XEndPoints;
    x(i,2) = b2(i).XEndPoints;
    x(i,3) = b3(i).XEndPoints;
end
% Plot the errorbars
errorbar(x',means_both,std_errors_both,'k','linestyle','none');
ylim([0.012 0.0152]);
xlabel('Masks');
ylabel('Dissimilarity mean');
legend([b1(1) b1(2) b1(3) b2(1) b2(2) b2(3) b3(1) b3(2) b3(3)],{'Action task (stimuli: all)' 'Action task (stimuli: animals)' 'Action task (stimuli: tools)' 'Semantic task (stimuli: all)' 'Semantic task (stimuli: animals)' 'Semantic task (stimuli: tools)' 'Visual task (stimuli: all)' 'Visual task (stimuli: animals)' 'Visual task (stimuli: tools)'},'Location','north');
title('Mean Behaviour dissimilarities by task')
hold off

