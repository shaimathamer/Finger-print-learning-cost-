function [ N1,E1,L] = Generate_minutia( image1 )
%GENERATE_MINUTIA Summary of this function goes here
%   Detailed explanation goes here
j=1;
x1_vector(:,1)=image1.Nodes(:,1);
Y1_vector(:,1)=image1.Nodes(:,2);
x1_vector=x1_vector';
Y1_vector=Y1_vector';
TRI1 = delaunay(double(x1_vector),double(Y1_vector));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Extract Adjacency Matrix%%%%%%%%%%%%%%%%%%%%
IMG_Node1=size(image1.Nodes,1);
for uu=1:IMG_Node1
%      Lebeling(uu)=-1; 
%      lebeling1(uu)=uu;
     lebeling(uu)=uu;
end

adjacency_matrix1=[];
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
 
 
 E1=adjacency_matrix1;
 N1=image1.Nodes;
 L=lebeling;
 

end

