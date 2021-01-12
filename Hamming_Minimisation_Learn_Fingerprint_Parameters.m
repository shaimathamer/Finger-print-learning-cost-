function [Wxy_end,Wa_end] = Hamming_Minimisation_Learn_Fingerprint_Parameters(data, Wa)
%% variables
global SET;
SET = data;
%% main code
o = optimset('MaxFunEvals',Inf, 'MaxTime', Inf,'MaxIter',Inf);
%Wa_end = fminsearch(@Dunn_Index_optimisation,Wa);
Wa_end = fminsearch(@Hamming_optimisation,Wa,o);
Wxy_end= 1;
clear SET;
end