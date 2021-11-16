clear all;close all;clc;

path = dir(pwd);
file_names=dir('*_ROI_estimate_RDM_S*');
file_names.name

RDMs_euclidean_estimation_semantic = NaN(15,4186);
RDMs_euclidean_estimation_nonnan_semantic = NaN(15,4186);

load('name_ROI.mat')
load('stimuli_names_92.mat');

 for each_ROI=1:numel(file_names)
    ROI_name = file_names(each_ROI).name
    estimated_ROI = load(file_names(each_ROI).name)
    comparisons = estimated_ROI.estimate_RDM_S;
    
    % each row is a ROI and the columns are the rdm vector
    if each_ROI==1
        RDMs_euclidean_estimation_semantic=comparisons;
    else
        RDMs_euclidean_estimation_semantic=cat(1,RDMs_euclidean_estimation_semantic,comparisons);
    end
    
    nStimuli=92;
    nComparisons = ((nStimuli^2)-nStimuli)/2; % counts only one way and not the same imgs

    rdm = NaN(92,92);

    countComparison=0;
    for img_1 = 1:nStimuli-1
        for img_2 = img_1+1:nStimuli
            countComparison=countComparison+1;

            rdm(img_1,img_2) = comparisons(countComparison); 
            rdm(img_2,img_1) = comparisons(countComparison);

        end   
    end
    for imag = 1:92
        rdm(imag,imag)=0;
    end
    
    % find where the nans are
    [row column] = find(isnan(rdm)==1)
    for m=1:length(row)
        % get the average across that row and column
        size_row = length(find(isnan(rdm(row(m),:))==0));
        size_col = length(find(isnan(rdm(:,column(m)))==0));
        n_pixels = size_row + size_col;
        average_row_col(m,1)= (sum(rdm(row(m),:),'omitnan') + sum(rdm(:,column(m)),'omitnan')) / n_pixels;    
    end
    % Get the average values into the RDM to comple it (24 values missing)
    rdm_nonnan=rdm;
    for idx = 1:length(row)
        rdm_nonnan(row(idx),column(idx))=average_row_col(idx,1);
    end
    
    save ([num2str(each_ROI) '_final_ROI_rdm_Semantic'], 'rdm_nonnan');
    
    % convert from matrix to vector
    count=0
    for r = 1:nStimuli-1
        for c = r+1:nStimuli
            count=count+1;
            vector_nonnan(1,count) = rdm_nonnan(r,c);
        end
    end
    
    % without nans -> estimated mean value instead
    % each row is a ROI and the columns are the rdm vector
    if each_ROI==1
        RDMs_euclidean_estimation_nonnan_semantic = vector_nonnan;
    else
        RDMs_euclidean_estimation_nonnan_semantic=cat(1,RDMs_euclidean_estimation_nonnan_semantic,vector_nonnan);
    end
    
    max_val = 0.0227;
    
%     % get RMDs for each ROI: semantic
%     f=figure('units','normalized','WindowState','maximized');image(rdm_nonnan,'CDataMapping','scaled');C = colorbar;caxis([0 max_val]);       
%     set(gca,'XTick',1:1:92); set(gca,'xticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);xtickangle(90);
%     set(gca,'YTick',1:1:92); set(gca,'yticklabel',table2array(stimuli_names_92(:,1)),'fontsize', 6);ytickangle(0);
%     set(gca, 'TickLength',[0 0]);
%     axis equal; axis image; 
%     title(['Semantic RDM: ' table2array(name_ROI(each_ROI,2))],'fontsize',11);
%     if each_ROI<10
%         saveas(gcf,[ num2str(0) num2str(each_ROI) '_final_ROI_semantic.png']);
%     else
%         saveas(gcf,[ num2str(each_ROI) '_final_ROI_semantic.png']);
%     end 
%     close(f)
    
 end

save RDMs_euclidean_estimation_semantic RDMs_euclidean_estimation_semantic
save RDMs_euclidean_estimation_nonnan_semantic RDMs_euclidean_estimation_nonnan_semantic