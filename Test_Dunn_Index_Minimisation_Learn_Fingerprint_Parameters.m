% ***** Learn Fingerprint parameters ****
% close all;
% clc;
% clear;
%% Database
% Database_Name='FingerPrint_Synthetic_1';
% Database_Name='FingerPrint1';
%%

% Learning parameters
Selected_Registers = 0; % All registers
%Selected_Registers=1:2;
disp(Database_Name);    

%% Initial Wa is the one learned in the Linear method
Name_Data=strcat(Database_Name,'_Linear_Classifier_FingerPrint_Learned_Weights.mat');
load(Name_Data);
load(strcat(Database_Name,'.mat'));

%% Executing Learning
tic
[Wxy_end,Wa_end]=Dunn_Index_Minimisation_Learn_Fingerprint_Parameters(Database.Learning, Wa);
Time_Learning=toc;
disp(strcat(' Wxy=',num2str(Wxy_end),' Wa=',num2str(Wa_end)));

save(strcat(Database_Name,'_Dunn_Index_Minimisation_Learn_FingerPrint_Learned_Weights'));
disp('Learning done');
