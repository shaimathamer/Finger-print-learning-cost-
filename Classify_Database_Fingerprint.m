function [average_accuracy,DunnIndex,class,classification_runtime,Dist_Matrix] = Classify_Database_Fingerprint(Database_Learning,Database_Test,Wxy,Wa,Wtb,display_flag,num_test_graphs)
% This function measures the classification accuracy using a 1NN
   Database.Learning=Database_Learning;
   Database.Test=Database_Test;
   accuracy = [];
   class =[];
    Dist_Matrix = [];
    number_of_test=0;
    total_runtime=0;
    if num_test_graphs==0
        num_test_graphs=length(Database.Test);
    end
    for i = 1:num_test_graphs
        currentElem = Database.Test{i};
        G1 = currentElem.Graph;
        
        for j = 1:length(Database.Learning)
            %display(j);
            currentElem = Database.Learning{j};
            G2 = currentElem.Graph;
            tic
            cost = Fingerprint_Matching(G1.Nodes,G2.Nodes,Wxy,Wa,Wtb,display_flag );
            runtime=toc;
%                     runtime
            total_runtime=total_runtime+runtime;
            number_of_test=number_of_test+1;
%                     number_of_test
            Dist_Matrix(i, j) = cost/(size(G1.Nodes,1)+size(G2.Nodes,1));
            %j
        end
        
        [~, pos] = min(Dist_Matrix(i,:));
        class(end+1) = Database.Learning{pos}.Class;
        if (Database.Learning{pos}.Class == Database.Test{i}.Class)
            accuracy(end+1) = 1;
        else
            accuracy(end+1) = 0;
        end            
        %display(floor(100*i/num_test_graphs));
    end
    average_accuracy = mean(accuracy);
    classification_runtime=total_runtime/number_of_test;
    Num_Class=Database.Test{end}.Class;
    DunnIndex=Dunn_Index(Dist_Matrix,Num_Class);
end