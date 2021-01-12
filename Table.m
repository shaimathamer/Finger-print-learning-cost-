
%% Database
% Database_Name='FingerPrint1';
% Database_Name='FingerPrint2';
%

close all;
clc;
clear;
Database_Name='FingerPrint_Synthetic_03_04';
disp(Database_Name);    

%% Initial Wa is the one learned in the Linear method
Name_Data=strcat(Database_Name,'_Hamming_Minimisation_Learn_FingerPrint_Learned_Weights.mat');
load(Name_Data);
load(strcat(Database_Name,'.mat'));

%% Executing Learning
% [CC_LR,Dunn_Index,class,classification_runtime,Dist_Matrix] = Classify_Database_Fingerprint(Database.Learning,Database.Test,Wxy,Wa,Inf,0,0);
% [H_LR,average_runtime,hamming] = Hamming_Database_Fingerprint(Database.Test,Wxy,Wa,Inf,0,0);
% disp(strcat('LR:',' Wxy=',num2str(Wxy_end),' Wa=',num2str(Wa),' CC=',num2str(CC_LR),' H=',num2str(H_LR)));


[CC_Min,Dunn_Index,class,classification_runtime,Dist_Matrix] = Classify_Database_Fingerprint(Database.Learning,Database.Test,Wxy,Wa_end,Inf,0,0);
[H_Min,average_runtime,hamming] = Hamming_Database_Fingerprint(Database.Test,Wxy,Wa_end,Inf,0,0);
disp(strcat('Min:',' Wxy=',num2str(Wxy_end),' Wa=',num2str(Wa_end),' CC=',num2str(CC_Min),' H=',num2str(H_Min)));


