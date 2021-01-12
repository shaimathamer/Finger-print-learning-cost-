function DI = Dunn_Index(costs_matrix,num_classes)
deltaCluster=zeros(num_classes);
n_el_per_class=round(size(costs_matrix,1)/num_classes);
for i=0:num_classes-1
    for j=0:num_classes-1
        deltaCluster(i+1,j+1)=max(max(costs_matrix(i*n_el_per_class+1:(i+1)*n_el_per_class,j*n_el_per_class+1:(j+1)*n_el_per_class)));
    end
end
den=max(diag(deltaCluster));
rmD=reshape(deltaCluster(~diag(ones(1,size(deltaCluster, 1)))), size(deltaCluster)-[1 0]);
num=min(min(rmD));
DI=num/den;
end