function  data  = Load_Learning_Random(Database,Selected_Registers,Num_graphs,noisxy,noisea,noisetb)
%LOAD_LEARNING_SELECTED Summary of this function goes here
%   Detailed explanation goes here
data=[];
if Selected_Registers == 0
    Max_Register=length(Database.Learning);
    Selected_Registers=1:Max_Register;
else
Max_Register= size(Selected_Registers,2);
end
for i =1:Max_Register
    Register=Selected_Registers(i);
    [G1,~,~,~,~,~]=LoadRegister(Database,Register,'Learning');
    for k=1:Num_graphs
        G2=G1;
        for j=1:length(G1.Nodes)
           G2.Nodes(j,1) =G2.Nodes(j,1)+round(rand(1,1)*noisxy-noisxy/2);
           G2.Nodes(j,2) =G2.Nodes(j,2)+round(rand(1,1)*noisxy-noisxy/2);
           G2.Nodes(j,3) =G2.Nodes(j,3)+rand(1,1)*noisea-noisea/2;
           while G2.Nodes(j,3)<0
               G2.Nodes(j,3)=G2.Nodes(j,3)+ 2*pi;
           end
           if abs(rand(1,1)*noisetb)>0.5
               if G2.Nodes(j,4) == 3
                   G1.Nodes(j,4) =1;
               else
                   G1.Nodes(j,4) =3;
               end
           end
        end
               data{end+1}.graph1.nodes=G1.Nodes;
               data{end}.graph2.nodes=G2.Nodes;
               data{end}.graph1.edges=G1.Edges;
               data{end}.graph2.edges=G2.Edges;
               data{end}.labelling=1:length(G1.Nodes);
    end
end
end

