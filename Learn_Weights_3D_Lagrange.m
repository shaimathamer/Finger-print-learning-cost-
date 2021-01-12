function [Wxy,Wa, Wtb, error] = Learn_Weights_3D_Lagrange(DD) 
[V,D] = eig(DD'*DD);
%  if sum(V(1,:))<0
%      V(1,:)=-V(1,:);
%  end
%  Wxy=V(1,1); % The first eigenvector
%  Wa=V(1,2);
%  Wtb=V(1,3);

 Wxy=1; % The first eigenvector
 Wa=-V(1,2)/V(1,1);
 Wtb=-V(1,3)/V(1,1);
 error=D(1,1); % The smallest eigenvalue
end