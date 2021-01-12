% FINGERPRINT MATCHING SCORE
%
% Usage:  [ S ] = match( M1, M2, display_flag );
%
% Argument:   M1 -  First Minutiae 
%             M2 -  Second Minutiae
%             display_flag
%               
% Returns:    S - Similarity Measure

% Francesc Serratosa

function Dist_min = Minutia_Matching_Fast( M1, M2,Wxy,Wa,Wtb,display_flag)
    if nargin==5; display_flag=0; end    
    count1=size(M1,1); count2=size(M2,1); 
    bi=0; bj=0; ba=0; % Best i,j,alpha
    Dist_min=Inf;            % Best Similarity Score
    for i=1:count1
        T1=transform(M1,i);
        for j=1:count2
            if M1(i,4)==M2(j,4) % the same type: Bifurcation or Terminal
                T2=transform(M2,j);
                for a=-2:2                      %Alpha
                    T3=transform2(T2,a*pi/180);
                    negT1=find(T1(:,3)<0);
                    T1(negT1,3)=T1(negT1,3)+2*pi;
                    posT1=find(T1(:,3)>2*pi);
                    T1(posT1,3)=T1(posT1,3)-2*pi;
                    negT3=find(T3(:,3)<0);
                    T3(negT3,3)=T3(negT3,3)+2*pi;
                    posT3=find(T3(:,3)>2*pi);
                    T3(posT3,3)=T3(posT3,3)-2*pi;
                                    
                    Dist=dist_URV(T1,T3,Wxy,Wa,Wtb);
                    if Dist_min>Dist
                        Dist_min=Dist;
                        bi=i; bj=j; ba=a;
                    end                
                end
            end
        end
    end
    ba
    if display_flag==1
        figure, title(['Distance Measure: ' num2str(Dist_min)]);
        T1=transform(M1,bi);
        T2=transform(M2,bj);
        T3=transform2(T2,ba*pi/180);
        plot_data(T1,1);
        plot_data(T3,2);
    end
end