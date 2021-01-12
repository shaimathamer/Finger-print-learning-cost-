function [N1,E1,N2,E2,L]=Generate_graph_minutia(image1,image2)
j=1;
lebeling=[];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%CLEANING DATA%%%%%%%%%%%%%%%%%

IMG_Node1=length(image1.Nodes);

for uu=1:IMG_Node1
%      Lebeling(uu)=-1; 
%      lebeling1(uu)=uu;
     lebeling(uu)=uu;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
x1_vector(:,1)=image1.Nodes(:,1);
Y1_vector(:,1)=image1.Nodes(:,2);
x2_vector(:,1)=image2.Nodes(:,1);
Y2_vector(:,1)=image2.Nodes(:,2);
x1_vector=x1_vector';
Y1_vector=Y1_vector';
x2_vector=x2_vector';
Y2_vector=Y2_vector';
TRI1 = delaunay(double(x1_vector),double(Y1_vector));
TRI2 = delaunay(double(x2_vector),double(Y2_vector));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Extract Adjacency Matrix%%%%%%%%%%%%%%%%%%%%
 adjacency_matrix1=[];
 adjacency_matrix2=[];
 for i=1:size(TRI1,1)
     for j=1:size(TRI1,2)
         if j<2
        node=TRI1(i,j);
        adjacency_matrix1(node,TRI1(i,j+1))=1;
        adjacency_matrix1(node,TRI1(i,j+2))=1;
         elseif j==2
         node=TRI1(i,j);
        adjacency_matrix1(node,TRI1(i,j-1))=1;
        adjacency_matrix1(node,TRI1(i,j+1))=1;   
         elseif j>2
         node=TRI1(i,j);
        adjacency_matrix1(node,TRI1(i,j-1))=1;
        adjacency_matrix1(node,TRI1(i,j-2))=1;  
         end
     end
 end
 for i=1:size(TRI2,1)
     for j=1:size(TRI2,2)
         if j<2
        node=TRI2(i,j);
        adjacency_matrix2(node,TRI2(i,j+1))=1;
        adjacency_matrix2(node,TRI2(i,j+2))=1;
         elseif j==2
         node=TRI2(i,j);
        adjacency_matrix2(node,TRI2(i,j-1))=1;
        adjacency_matrix2(node,TRI2(i,j+1))=1 ;   
         elseif j>2
         node=TRI2(i,j);
        adjacency_matrix2(node,TRI2(i,j-1))=1;
        adjacency_matrix2(node,TRI2(i,j-2))=1; 
         end
     end
 end
 
 E1=adjacency_matrix1;
 E2=adjacency_matrix2;
 N1=image1.Nodes;
 N2=image2.Nodes;
 L=lebeling;

   
    
    
 
end
