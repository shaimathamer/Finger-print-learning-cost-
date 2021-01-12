function F = Dunn_Index_optimisation(Wa)
global SET;   
    [~,Dunn_Index,~,~,~] = Classify_Database_Fingerprint(SET,SET,1,Wa,Inf,0,0);
    F=1/Dunn_Index
end