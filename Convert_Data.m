function dist = Convert_Data(data)
%DD=[];
dist=[];
    for elem = 1:size(data,2)
        T1=[];
        T2=[];
% Select the mapped nodes        
        TT1 = data{elem}.graph1.nodes;
        TT2 = data{elem}.graph2.nodes;
        lablab = data{elem}.labelling;
        LLa=size(TT1,1);
        for a = 1:LLa
            if lablab(a)>0
                T1(end+1,:)=TT1(a,:);
                T2(end+1,:)=TT2(lablab(a),:);
            end
        end
% Deduce the data with the mapped nodes only        
        La=size(T1,1);
        Li=size(T2,1);
        for a = 1:La
                data22=[];
                data1=[0 0];
                mapped=0;
                for i = 1:Li
                    if (T1(a,4)==T2(i,4))
                        % Distance between positions
                        dx=T1(a,1)-T2(i,1);
                        dy=T1(a,2)-T2(i,2);
                        Dxy=sqrt(dx^2+dy^2);
                        % Distance between angles
                        Da=abs(T1(a,3)-T2(i,3));
                        Da=min(Da,2*pi-Da);
                        % Distance
                        distances=[Dxy,Da];
                        if a==i       % Ground truth assignments
                                data1=distances;
                                mapped=1;
                        else           % Non Ground truth assignments
                                data22=[data22;distances];
                        end
                    end
                end  
                if mapped && ~isempty(data22)
                    %data2=mean(data22,1);
                    data2=min(data22,[],1);
                    distdist=data1-data2;
                     %if sum(distdist)>0
                        dist=[dist;distdist];
                     %end
                end
        end
    end
    
    % Outlier rejection
    Outlier = 0;
if Outlier >0
    percntiles = prctile(dist,[Outlier 100-Outlier]); %5th and 95th percentile
    outlierIndexA(:,1) = dist(:,1) < percntiles(1,1) | dist(:,1) > percntiles(2,1);
    outlierIndexA(:,2) = dist(:,2) < percntiles(1,2) | dist(:,2) > percntiles(2,2);
    outlierIndexA(:,1) = outlierIndexA(:,2) | outlierIndexA(:,1);
    dist(outlierIndexA(:,1),:) = [];
end
% outliers have been removed           

    
end