clear all;close all;clc;

nStimuli = 46;

%% returns the final RDMs names in the current directory
Files=dir('*_final_ROI_rdm_Semantic*');
Files.name;

%% initialyse the vectors for part of the RDMs
RDMs_euclidean_vector_semantic_all = NaN(15,4186); % all RDM
RDMs_euclidean_vector_semantic_animals = NaN(15,1035); % RDM with only animals
RDMs_euclidean_vector_semantic_tools = NaN(15,1035); % RDM with only tools
RDMs_euclidean_vector_semantic_mix = NaN(15,1035); % RDM with comparisons across category

%% Load stimuli names and ROI names
load('stimuli_names_92.mat');
load('name_ROI.mat');
    
%% create the RDMs matrices and vectors for part of the RDM
 for each_ROI=1:numel(Files)
    Files(each_ROI).name;
    estimated_ROI = load(Files(each_ROI).name);
    rdm_matrix = estimated_ROI.rdm_nonnan;
    
    %% create a small rdm for animals and for tools and for mix
    half_stimuli = length(rdm_matrix)/2;
    rdm_semantic_animals = rdm_matrix(1:half_stimuli,1:half_stimuli);
    rdm_semantic_tools = rdm_matrix(half_stimuli+1:end,half_stimuli+1:end);
    rdm_semantic_mix = rdm_matrix(1:half_stimuli,half_stimuli+1:end);
    
%     figure(); image(rdm_semantic_animals,'CDataMapping','scaled');C = colorbar;caxis([0 0.0227]);
%     figure(); image(rdm_semantic_tools,'CDataMapping','scaled');C = colorbar;caxis([0 0.0227]);
    
    %% convert original RDM into vectors
    count=0;
    for r = 1:91
        for c = r+1:92
            count=count+1;
            rdm_vector_all(1,count) = rdm_matrix(r,c);
        end
    end
    
    %% convert the mixed rdm into vectors
    rdm_vector_mix=reshape(rdm_semantic_mix',1,[]);
    rdm_vector_animals_completed = reshape(rdm_semantic_animals',1,[]);
    rdm_vector_tools_completed = reshape(rdm_semantic_tools',1,[]);
    
    
    %% convert the 2 rdms matrices into vectors
    count=0;
    for r = 1:nStimuli-1
        for c = r+1:nStimuli
            count=count+1;
            rdm_vector_animals(1,count) = rdm_semantic_animals(r,c);
            rdm_vector_tools(1,count) = rdm_semantic_tools(r,c);
        end
    end
    
    
    % each row is a ROI and the columns are the rdm vector
    if each_ROI==1
        RDMs_euclidean_vector_semantic_all=rdm_vector_all;
        RDMs_euclidean_vector_semantic_animals=rdm_vector_animals;
        RDMs_euclidean_vector_semantic_tools=rdm_vector_tools;
        RDMs_euclidean_vector_semantic_mix=rdm_vector_mix;
        % completed animals and tools
        RDMs_euclidean_vector_semantic_animals_completed = rdm_vector_animals_completed;
        RDMs_euclidean_vector_semantic_tools_completed = rdm_vector_tools_completed;
    else
        RDMs_euclidean_vector_semantic_all=cat(1,RDMs_euclidean_vector_semantic_all,rdm_vector_all);
        RDMs_euclidean_vector_semantic_animals=cat(1,RDMs_euclidean_vector_semantic_animals,rdm_vector_animals);
        RDMs_euclidean_vector_semantic_tools=cat(1,RDMs_euclidean_vector_semantic_tools,rdm_vector_tools);
        RDMs_euclidean_vector_semantic_mix=cat(1,RDMs_euclidean_vector_semantic_mix,rdm_vector_mix);
        % completed animals and tools
        RDMs_euclidean_vector_semantic_animals_completed=cat(1,RDMs_euclidean_vector_semantic_animals_completed,rdm_vector_animals_completed);
        RDMs_euclidean_vector_semantic_tools_completed=cat(1,RDMs_euclidean_vector_semantic_tools_completed,rdm_vector_tools_completed);
    end
    
    max_val=0.0227;
    
    % get the RDMs for each ROI: ANIMALS
    g=figure('units','normalized','WindowState','maximized');image(rdm_semantic_animals,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
    set(gca,'XTick',1:1:46); set(gca,'xticklabel',table2array(stimuli_names_92(1:46,1)),'fontsize', 6);xtickangle(90);
    set(gca,'YTick',1:1:46); set(gca,'yticklabel',table2array(stimuli_names_92(1:46,1)),'fontsize', 6);ytickangle(0);
    set(gca, 'TickLength',[0 0]);
    axis equal; axis image; 
    title(['semantic RDM: ' table2array(name_ROI(each_ROI,2)) ' (Stimuli: Animals)'],'fontsize',11);
    if each_ROI<10
%         saveas(gcf,[ num2str(0) num2str(each_ROI) '_final_ROI_semantic_animals.png']);
        imgName = ['C:\Users\Márcia Vaz\Documents\GitHub\Dissertation\04_final estimations\final estimations (animals and tools separation)\',[ num2str(0) num2str(each_ROI) '_final_ROI_semantic_animals.png']] ;
        saveas(gcf,imgName) ; 
    else
%         saveas(gcf,[ num2str(each_ROI) '_final_ROI_semantic_animals.png']);
        imgName = ['C:\Users\Márcia Vaz\Documents\GitHub\Dissertation\04_final estimations\final estimations (animals and tools separation)\',[ num2str(each_ROI) '_final_ROI_semantic_animals.png']] ;
        saveas(gcf,imgName) ; 
    end 
    close(g)
    
    % get the RDMs for each ROI: TOOLS
    f=figure('units','normalized','WindowState','maximized');image(rdm_semantic_tools,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
    set(gca,'XTick',1:1:46); set(gca,'xticklabel',table2array(stimuli_names_92(47:92,1)),'fontsize', 6);xtickangle(90);
    set(gca,'YTick',1:1:46); set(gca,'yticklabel',table2array(stimuli_names_92(47:92,1)),'fontsize', 6);ytickangle(0);
    set(gca, 'TickLength',[0 0]);
    axis equal; axis image; 
    title(['semantic RDM: ' table2array(name_ROI(each_ROI,2)) ' (Stimuli: Tools)'],'fontsize',11);
    if each_ROI<10
%         saveas(gcf,[ num2str(0) num2str(each_ROI) '_final_ROI_semantic_tools.png']);
        imgName = ['C:\Users\Márcia Vaz\Documents\GitHub\Dissertation\04_final estimations\final estimations (animals and tools separation)\',[ num2str(0) num2str(each_ROI) '_final_ROI_semantic_tools.png']] ;
        saveas(gcf,imgName) ; 
    else
%         saveas(gcf,[ num2str(each_ROI) '_final_ROI_semantic_tools.png']);
        imgName = ['C:\Users\Márcia Vaz\Documents\GitHub\Dissertation\04_final estimations\final estimations (animals and tools separation)\',[ num2str(each_ROI) '_final_ROI_semantic_tools.png']] ;
        saveas(gcf,imgName) ; 
    end 
    close(f)

    % get the RDMs for each ROI: MIX
    h=figure('units','normalized','WindowState','maximized');image(rdm_semantic_mix,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
    set(gca,'XTick',1:1:46); set(gca,'xticklabel',table2array(stimuli_names_92(47:92,1)),'fontsize', 6);xtickangle(90);
    set(gca,'YTick',1:1:46); set(gca,'yticklabel',table2array(stimuli_names_92(47:92,1)),'fontsize', 6);ytickangle(0);
    set(gca, 'TickLength',[0 0]);
    axis equal; axis image; 
    title(['semantic RDM: ' table2array(name_ROI(each_ROI,2)) ' (Stimuli: Mix)'],'fontsize',11);
    if each_ROI<10
%         saveas(gcf,[ num2str(0) num2str(each_ROI) '_final_ROI_semantic_mix.png']);
        imgName = ['C:\Users\Márcia Vaz\Documents\GitHub\Dissertation\04_final estimations\final estimations (animals and tools separation)\',[ num2str(0) num2str(each_ROI) '_final_ROI_semantic_mix.png']] ;
        saveas(gcf,imgName) ;
    else
%         saveas(gcf,[ num2str(each_ROI) '_final_ROI_semantic_mix.png']);
        imgName = ['C:\Users\Márcia Vaz\Documents\GitHub\Dissertation\04_final estimations\final estimations (animals and tools separation)\',[ num2str(each_ROI) '_final_ROI_semantic_mix.png']] ;
        saveas(gcf,imgName) ;
    end 
    close(h)

end
RDMs_euclidean_vector_semantic_all;
RDMs_euclidean_vector_semantic_animals;
RDMs_euclidean_vector_semantic_tools;
RDMs_euclidean_vector_semantic_mix;

save RDMs_euclidean_vector_semantic_all RDMs_euclidean_vector_semantic_all
save RDMs_euclidean_vector_semantic_animals RDMs_euclidean_vector_semantic_animals
save RDMs_euclidean_vector_semantic_tools RDMs_euclidean_vector_semantic_tools
save RDMs_euclidean_vector_semantic_mix RDMs_euclidean_vector_semantic_mix


%% completed animals and tools

save RDMs_euclidean_vector_semantic_animals_completed RDMs_euclidean_vector_semantic_animals_completed
save RDMs_euclidean_vector_semantic_tools_completed RDMs_euclidean_vector_semantic_tools_completed
