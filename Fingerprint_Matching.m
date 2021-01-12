% FINGERPRINT MATCHING SCORE
% Francesc Serratosa

function [Dist , lab]= Fingerprint_Matching( T1, T2,Wxy,Wa,Wtb,display_flag)
    Count1=size(T1,1); Count2=size(T2,1);
    
    D=zeros(Count1,Count2);
    for i=1:Count1
        for j=1:Count2
            dd=Minutia_Matching(T1(i,:), T2(j,:),Wxy,Wa,Wtb);
            D(i,j)=dd;
        end
    end
     lab=Hungarian(D);
     Dist=sum(sum(lab.*D)); %/min(Count1,Count2);
     lab=lab(1:Count1,:);
     lab=lab(:,1:Count2);
     lab=(vec2ind(lab')).*(sum(lab',1));

    if display_flag==1
        figure, title(['Distance Measure: ' num2str(Dist)]);
        plot_data(T1,1);
        plot_data(T2,2);
    end
end