% ***** Test Classification Fingerprint DB ****
% clear;
% clc;
% close all;

%% Execution parameters
% Database_Name='FingerPrint_Synthetic_1';
% Database_Name='FingerPrint1';
%%

Name_Data=strcat(Database_Name,'_Linear_Classifier_FingerPrint_Learned_Weights.mat');
disp(Database_Name);

load(strcat(Database_Name,'_Surface_Classification_Hamming'));
Name_Data=strcat(Database_Name,'_Linear_Classifier_FingerPrint_Learned_Weights.mat');
load(Name_Data);
Wa_LC=Wa;
Wxy_LC=Wxy;
Name_Data=strcat(Database_Name,'_Minimisation_Learn_FingerPrint_Learned_Weights.mat');
load(Name_Data);
Wa_ML=Wa_end;
Wxy_ML=Wxy;


figure     
surf(WWa,WWxy, classification_accuracy);
     xlabel('W_a');
     ylabel('W_x_y');
     zlabel('Classification');
     hold on;
     plot3([Wa_ML Wa_ML],[Wxy_ML Wxy_ML],[min(min(classification_accuracy)) max(max(classification_accuracy))+0.025],'Color','blue');
     plot3([Wa_LC Wa_LC],[Wxy_LC Wxy_LC],[min(min(classification_accuracy)) max(max(classification_accuracy))+0.025],'Color','red');
     plot3([0 Wa_LC],[Wxy_LC Wxy_LC],[min(min(classification_accuracy)) min(min(classification_accuracy))],'Color','red');
     plot3([Wa_LC Wa_LC],[0 Wxy_LC],[min(min(classification_accuracy)) min(min(classification_accuracy))],'Color','red');
     title(strcat('W_x_y=1     W_a=',num2str(round(Wa_LC))));
     hold off;
      
     figure
     surf(WWa,WWxy, 1-average_hamming);
     xlabel('W_a');
     ylabel('W_x_y');
     zlabel('1-Hamming');
     hold on;
     plot3([Wa_ML Wa_ML],[Wxy_ML Wxy_ML],[min(min(1-average_hamming)) max(max(1-average_hamming))+0.025],'Color','blue');
     plot3([Wa_LC Wa_LC],[Wxy_LC Wxy_LC],[min(min(1-average_hamming)) max(max(1-average_hamming))+0.025],'Color','red');
     plot3([0 Wa_LC],[Wxy_LC Wxy_LC],[min(min(1-average_hamming)) min(min(1-average_hamming))],'Color','red');
     plot3([Wa_LC Wa_LC],[0 Wxy_LC],[min(min(1-average_hamming)) min(min(1-average_hamming))],'Color','red');
     title(strcat('W_x_y=1     W_a=',num2str(round(Wa_LC))))
     
     figure
     surf(WWa,WWxy, DI);
     xlabel('W_a');
     ylabel('W_x_y');
     zlabel('Dunn Index');
     hold on;
     plot3([Wa_ML Wa_ML],[Wxy_ML Wxy_ML],[min(min(DI)) max(max(DI))+0.025],'Color','blue');
     plot3([Wa_LC Wa_LC],[Wxy_LC Wxy_LC],[min(min(DI)) max(max(DI))+0.025],'Color','red');
     plot3([0 Wa_LC],[Wxy_LC Wxy_LC],[min(min(DI)) min(min(DI))],'Color','red');
     plot3([Wa_LC Wa_LC],[0 Wxy_LC],[min(min(DI)) min(min(DI))],'Color','red');
     title(strcat('W_x_y=1     W_a=',num2str(round(Wa_LC))))
     
     
 