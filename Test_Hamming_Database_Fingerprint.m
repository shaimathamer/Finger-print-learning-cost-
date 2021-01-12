% ***** Test hamming Fingerprint DB ****
close all;
clc;
clear;
%% Database
Database_Name='FingerPrint_Synthetic_1';
 Database_Name='FingerPrint1';
%%

% Classification parameters
Name_Data=strcat(Database_Name,'_FingerPrint_Learned_Weights.mat');
load(Name_Data);
disp(Database_Name);
display_flag=0; % Show mapping (1)  or not (0)
num_test_graphs=0; % Number of test
load(strcat(Database_Name,'.mat'));

% Executing Hamming
% Wxy=1;
%Wa=10;
Wtb=Inf;

[average_hamming,average_runtime,hamming] = Hamming_Database_Fingerprint(Database.Test,Wxy,Wa,Wtb,display_flag,num_test_graphs);

% Saving results
clear display_flag
clear Name_Data
save(strcat(Database_Name,'_Hamming_Result'));