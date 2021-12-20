clear all;close all;clc;

nStimuli = 46;

path = dir(pwd);
Files=dir('*_final_ROI_rdm_Action*');
Files.name;

RDMs_euclidean_vector_action_all = NaN(15,4186);
RDMs_euclidean_vector_action_animals = NaN(15,1035);
RDMs_euclidean_vector_action_tools = NaN(15,1035);
RDMs_euclidean_vector_action_mix = NaN(15,1035);

load('stimuli_names_92.mat');
    
load('name_ROI.mat');
    
 for each_ROI=1:numel(Files)
    Files(each_ROI).name;
    estimated_ROI = load(Files(each_ROI).name);
    rdm_matrix = estimated_ROI.rdm_nonnan;
    
    %% create a small rdm for animals and for tools and for mix
    half_stimuli = length(rdm_matrix)/2;
    rdm_action_animals = rdm_matrix(1:half_stimuli,1:half_stimuli);
    rdm_action_tools = rdm_matrix(half_stimuli+1:end,half_stimuli+1:end);
    rdm_action_mix = rdm_matrix(1:half_stimuli,half_stimuli+1:end);
    
%     figure(); image(rdm_action_animals,'CDataMapping','scaled');C = colorbar;caxis([0 0.0227]);
%     figure(); image(rdm_action_tools,'CDataMapping','scaled');C = colorbar;caxis([0 0.0227]);
    
    %% convert original RDM into vectors
    count=0;
    for r = 1:91
        for c = r+1:92
            count=count+1;
            rdm_vector_all(1,count) = rdm_matrix(r,c);
        end
    end
    
    %% convert the mixed rdm into vectors
    rdm_vector_mix=reshape(rdm_action_mix',1,[]);
    rdm_vector_animals_completed = reshape(rdm_action_animals',1,[]);
    rdm_vector_tools_completed = reshape(rdm_action_tools',1,[]);
    
    
    %% convert the 2 rdms matrices into vectors
    count=0;
    for r = 1:nStimuli-1
        for c = r+1:nStimuli
            count=count+1;
            rdm_vector_animals(1,count) = rdm_action_animals(r,c);
            rdm_vector_tools(1,count) = rdm_action_tools(r,c);
        end
    end
    
    
    % each row is a ROI and the columns are the rdm vector
    if each_ROI==1
        RDMs_euclidean_vector_action_all=rdm_vector_all;
        RDMs_euclidean_vector_action_animals=rdm_vector_animals;
        RDMs_euclidean_vector_action_tools=rdm_vector_tools;
        RDMs_euclidean_vector_action_mix=rdm_vector_mix;
        % completed animals and tools
        RDMs_euclidean_vector_action_animals_completed = rdm_vector_animals_completed;
        RDMs_euclidean_vector_action_tools_completed = rdm_vector_tools_completed;
    else
        RDMs_euclidean_vector_action_all=cat(1,RDMs_euclidean_vector_action_all,rdm_vector_all);
        RDMs_euclidean_vector_action_animals=cat(1,RDMs_euclidean_vector_action_animals,rdm_vector_animals);
        RDMs_euclidean_vector_action_tools=cat(1,RDMs_euclidean_vector_action_tools,rdm_vector_tools);
        RDMs_euclidean_vector_action_mix=cat(1,RDMs_euclidean_vector_action_mix,rdm_vector_mix);
        % completed animals and tools
        RDMs_euclidean_vector_action_animals_completed=cat(1,RDMs_euclidean_vector_action_animals_completed,rdm_vector_animals_completed);
        RDMs_euclidean_vector_action_tools_completed=cat(1,RDMs_euclidean_vector_action_tools_completed,rdm_vector_tools_completed);
    end
    
%     na = find(isnan(rdm_action_animals))
%     vector_na = find(isnan(rdm_vector_animals))
%     
%     nt = find(isnan(rdm_action_tools))
%     vector_nt = find(isnan(rdm_vector_tools))
    
    max_val=0.0227;
    
%     % get the RDMs for each ROI: ANIMALS
%     g=figure('units','normalized','WindowState','maximized');image(rdm_action_animals,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
%     set(gca,'XTick',1:1:46); set(gca,'xticklabel',table2array(stimuli_names_92(1:46,1)),'fontsize', 6);xtickangle(90);
%     set(gca,'YTick',1:1:46); set(gca,'yticklabel',table2array(stimuli_names_92(1:46,1)),'fontsize', 6);ytickangle(0);
%     set(gca, 'TickLength',[0 0]);
%     axis equal; axis image; 
%     title(['Action RDM: ' table2array(name_ROI(each_ROI,2)) ' (Stimuli: Animals)'],'fontsize',11);
%     if each_ROI<10
%         saveas(gcf,[ num2str(0) num2str(each_ROI) '_final_ROI_action_animals.png']);
%     else
%         saveas(gcf,[ num2str(each_ROI) '_final_ROI_action_animals.png']);
%     end 
%     close(g)
    
%     % get the RDMs for each ROI: TOOLS
%     f=figure('units','normalized','WindowState','maximized');image(rdm_action_tools,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
%     set(gca,'XTick',1:1:46); set(gca,'xticklabel',table2array(stimuli_names_92(47:92,1)),'fontsize', 6);xtickangle(90);
%     set(gca,'YTick',1:1:46); set(gca,'yticklabel',table2array(stimuli_names_92(47:92,1)),'fontsize', 6);ytickangle(0);
%     set(gca, 'TickLength',[0 0]);
%     axis equal; axis image; 
%     title(['Action RDM: ' table2array(name_ROI(each_ROI,2)) ' (Stimuli: Tools)'],'fontsize',11);
%     if each_ROI<10
%         saveas(gcf,[ num2str(0) num2str(each_ROI) '_final_ROI_action_tools.png']);
%     else
%         saveas(gcf,[ num2str(each_ROI) '_final_ROI_action_tools.png']);
%     end 
%     close(f)

%     % get the RDMs for each ROI: MIX
%     h=figure('units','normalized','WindowState','maximized');image(rdm_action_mix,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
%     set(gca,'XTick',1:1:46); set(gca,'xticklabel',table2array(stimuli_names_92(47:92,1)),'fontsize', 6);xtickangle(90);
%     set(gca,'YTick',1:1:46); set(gca,'yticklabel',table2array(stimuli_names_92(47:92,1)),'fontsize', 6);ytickangle(0);
%     set(gca, 'TickLength',[0 0]);
%     axis equal; axis image; 
%     title(['Action RDM: ' table2array(name_ROI(each_ROI,2)) ' (Stimuli: Mix)'],'fontsize',11);
%     if each_ROI<10
%         saveas(gcf,[ num2str(0) num2str(each_ROI) '_final_ROI_action_mix.png']);
%     else
%         saveas(gcf,[ num2str(each_ROI) '_final_ROI_action_mix.png']);
%     end 
%     close(h)
end
RDMs_euclidean_vector_action_all;
RDMs_euclidean_vector_action_animals;
RDMs_euclidean_vector_action_tools;
RDMs_euclidean_vector_action_mix;

save RDMs_euclidean_vector_action_all RDMs_euclidean_vector_action_all
save RDMs_euclidean_vector_action_animals RDMs_euclidean_vector_action_animals
save RDMs_euclidean_vector_action_tools RDMs_euclidean_vector_action_tools
save RDMs_euclidean_vector_action_mix RDMs_euclidean_vector_action_mix


%% completed animals and tools

save RDMs_euclidean_vector_action_animals_completed RDMs_euclidean_vector_action_animals_completed
save RDMs_euclidean_vector_action_tools_completed RDMs_euclidean_vector_action_tools_completed
