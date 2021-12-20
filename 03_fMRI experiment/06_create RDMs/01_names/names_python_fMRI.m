%% Random image RDM selection
clear all;close all;clc;
rng(0);

file_names = dir(pwd);
file_names = file_names(~[file_names.isdir]);
file_names = {file_names.name}
file_names = file_names(1:40)
dat_mat_files = fileDatastore(pwd,'ReadFcn',@load,'FileExtensions','.mat');

file_names = dat_mat_files.Files;

y = string(file_names);

count=0;

for participant = 1:2:40
    count=count+1;
    participant_a = load (y(participant));
    % now I just need to make it read all names files
    participant_a = participant_a.names;
    Action_a = participant_a(find(contains(participant_a,'action')));
    Semantic_a = participant_a(find(contains(participant_a,'semantic')));

    % now I just need to make it read all names files
    participant_b = load (y(participant+1)).names;
    Action_b = participant_b(find(contains(participant_b,'action')));
    Semantic_b = participant_b(find(contains(participant_b,'semantic')));
    
    
    count1=0;
    count2=0;
    for value_action = 1:(length(Action_a)+length(Action_b))
        
        if value_action<length(Action_a)+1
            count1=count1+1;
            Action_names_fMRI_order{count,value_action} = Action_a{count1}
        else
            count2=count2+1;
            Action_names_fMRI_order{count,value_action} = Action_b{count2}
        end
    end
    count3=0;
    count4=0;
    for value_semantic = 1:(length(Semantic_a)+length(Semantic_b))
        
        if value_semantic<length(Semantic_a)+1
            count3=count3+1;
            Semantic_names_fMRI_order{count,value_semantic} = Semantic_a{count3}
        else
            count4=count4+1;
            Semantic_names_fMRI_order{count,value_semantic} = Semantic_b{count4}
        end
    end
    
end
save Action_names_fMRI_order Action_names_fMRI_order
save Semantic_names_fMRI_order Semantic_names_fMRI_order

