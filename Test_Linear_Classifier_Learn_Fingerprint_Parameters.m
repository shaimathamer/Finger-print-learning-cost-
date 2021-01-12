% ***** Learn Fingerprint parameters ****
close all;
clc;
clear;
%% Database
% Database_Name='FingerPrint_Synthetic_1';
Database_Name='FingerPrint1';
%%

% Learning parameters
Selected_Registers = 0; % All registers
disp(Database_Name);    
varname=[Database_Name '.mat'];
load(varname);
%% Real database
DB_Learning=Load_Learning_Selected_Registers(Database,Selected_Registers);

%% Executing Learning
tic
[Wxy, Wa,error] = Linear_Classifier_Learn_Fingerprint_Parameters(DB_Learning);
Time_Learning=toc;
Embdding_figure=Show_data(DB_Learning,Wxy, Wa);
disp(strcat(' Wxy=',num2str(Wxy),' Wa=',num2str(Wa),' error=',num2str(error)));

clear Database;
clear DB_Learning;
clear varname;

save(strcat(Database_Name,'_Linear_Classifier_FingerPrint_Learned_Weights'));
saveas(Embdding_figure,strcat(Database_Name,'_Embedding'),'png')
disp('Learning done');
