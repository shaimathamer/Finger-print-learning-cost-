% ***** Test Classification Fingerprint DB ****
% clear;
% clc;
% close all;

%% Execution parameters
Samples = 30;
% Database_Name='FingerPrint_Synthetic_1';
% Database_Name='FingerPrint1';
%%

Name_Data=strcat(Database_Name,'_Linear_Classifier_FingerPrint_Learned_Weights.mat');
load(Name_Data);
disp(Database_Name);
display_flag=0; % Show mapping (1)  or not (0)
num_test_graphs=0; % Number of test
Wtb=Inf;
Bound=2;
WWxy=Bound*Wxy/Samples:Bound*Wxy/Samples:Bound*Wxy;
WWa= Bound*Wa/Samples:Bound*Wa/Samples:Bound*Wa;
classification_accuracy=zeros(length(WWxy),length(WWa));
average_hamming=zeros(length(WWxy),length(WWa));
DI=zeros(length(WWxy),length(WWa));
load(strcat(Database_Name,'.mat'));  
for i=1:length(WWxy)
    disp(i);
    for j=1:length(WWa)
        %[i j]
        [classification_accuracy(i,j),DI(i,j),class,classification_runtime,Dist_Matrix] = Classify_Database_Fingerprint(Database.Learning,Database.Test,WWxy(i),WWa(j),Wtb,display_flag,num_test_graphs);
        [average_hamming(i,j),average_runtime,hamming] = Hamming_Database_Fingerprint(Database.Test,WWxy(i),WWa(j),Wtb,display_flag,num_test_graphs);
    end
end

% Saving results
    save(strcat(Database_Name,'_Surface_Classification_Hamming'));
   
 