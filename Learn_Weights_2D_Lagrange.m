function [Wxy,Wa, error] = Learn_Weights_2D_Lagrange(DD) 
[V,D] = eig(DD'*DD);
% VV=V(1,:);
% if sum(VV)<0
%     VV=-VV;
% end
% Wxy=VV(1,1);
% Wa=VV(1,2);
 Wa=-V(1,2)/V(1,1);
 Wxy=1;
  error=D(1,1); % The smallest eigenvalue
end