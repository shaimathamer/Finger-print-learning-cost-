function F = Hamming_optimisation(Wa)
global SET;   
    [Hamming,~,~] = Hamming_Database_Fingerprint(SET,1,Wa,Inf,0,0);
    F=1/Hamming
end