function [Wxy, Wa,error] = Linear_Classifier_Learn_Fingerprint_Parameters(data)
    dist = Convert_Data(data);
    [Wxy,Wa,error] = Learn_Weights_2D_Lagrange(dist);
end
