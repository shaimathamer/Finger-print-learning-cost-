function  data  = Load_Learning_Random(Num_fingerprint,Num_minutiae,noisxy,noisea,noisetb)
data=[];
for i =1:Num_fingerprint
        for j=1:Num_minutiae
           G1.Nodes(j,1) =round(rand(1,1)*100);
           G1.Nodes(j,2) =round(rand(1,1)*100);
           G1.Nodes(j,3) =rand(1,1)*2*pi;
           if abs(rand(1,1))>0.5
               G1.Nodes(j,4) = 1;
           else
               G1.Nodes(j,4) = 3;
           end
           
           G2.Nodes(j,1) =G1.Nodes(j,1)+round(rand(1,1)*noisxy-noisxy/2);
           G2.Nodes(j,2) =G1.Nodes(j,2)+round(rand(1,1)*noisxy-noisxy/2);
           G2.Nodes(j,3) =G1.Nodes(j,3)+rand(1,1)*noisea-noisea/2;
           while G2.Nodes(j,3)<0
               G2.Nodes(j,3)=G2.Nodes(j,3)+ 2*pi;
           end
           G2.Nodes(j,4) = G1.Nodes(j,4);
           if abs(rand(1,1)*noisetb)>0.5
               if G1.Nodes(j,4) == 3
                   G2.Nodes(j,4) =1;
               else
                   G2.Nodes(j,4) =3;
               end
           end
        end
        data{end+1}.graph1.nodes=G1.Nodes;
        data{end}.graph2.nodes=G2.Nodes;
        data{end}.labelling=1:Num_minutiae;
end
end

