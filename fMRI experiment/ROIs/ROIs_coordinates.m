clear all;close all;clc;

path = dir(pwd);
file_names=dir('*_VOI_*');
file_names.name

for roi = 1:15
         % save an image 
    ROI = file_names(roi).name
    load(ROI)
    coordinates(roi,:)= xY.xyz'
end

load('Mask_names.mat');

names = Mask_names(:,1:2)
coordinates = array2table(coordinates)
table_ROIs = cat(2,names,coordinates)

table_ROIs = renamevars(table_ROIs,["VarName1","VarName2","coordinates1","coordinates2","coordinates3"], ...
                 ["Contrast","ROI","x","y","z"])
             