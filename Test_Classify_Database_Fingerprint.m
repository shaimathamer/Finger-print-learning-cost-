% ***** Test Classification Fingerprint DB ****
clear;
clc;
close all;
%% Database
Database_Name='FingerPrint_Synthetic_1';
%%

% Classification parameters
Name_Data=strcat(Database_Name,'_FingerPrint_Learned_Weights.mat');
load(Name_Data);
disp(Database_Name);

% Execution parameters
display_flag=0; % Show mapping (1)  or not (0)
num_test_graphs=0; % Number of test

% Executing Classification
Wtb=Inf;
%acu = [];
%Wa= 0.001
 load(strcat(Database_Name,'.mat'));  
 [classification_accuracy,Dunn_Index,class,classification_runtime,Dist_Matrix] = Classify_Database_Fingerprint(Database.Learning,Database.Test,Wxy,Wa,Wtb,display_flag,num_test_graphs);
%  acu(end+1)=classification_accuracy;
%end
% Saving results
clear display_flag
clear Name_Data
save(strcat(Database_Name,'_Classification_Result'));
imagesc(Dist_Matrix);