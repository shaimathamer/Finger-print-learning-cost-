function Generate_Random_Fingerprint_Database(Database_Name,num_class,num_nodes,image_number,noisxy,noisa)
%     num_class=2; %%%%%number of class
%     num_nodes=10;%%%%%number of nodes in each fingerprint
%     image_number=6; %%%number of images each class Multiple of 3
%
%     noisxy=10;%%%%%%%%%noise of x and y [0 100]
%     noisa=1;%%%%%%%%%%%%%%%noise of angle [ 0 2*pi]


MAX_pixels=100; %2*pi;
%%%%%%%%%%%%%%%code of generting random database of fingeprint
Database=[];
Database.Name=Database_Name;
Database.Num_Class=num_class;

uu=1;
t=1;
k=1;
c=1;
g=1;
%             image_all=image_number+2;
imageeach=image_number/3;%%%%%%%%divide number of fingerprint to 3 valid,learn,test

set={'training','test','validation'};
for p=1:3
    ke=char(set(p));
    switch ke
        case 'training'
            for rrr=1:num_class
                for yyy=1:imageeach
                    for ttt=1: num_nodes
                        if yyy==1 %%%%%%%%%%%%%%Generate First FingerPrint
                            Data.Training_minut.class{rrr}.Finger_image{yyy}.Nodes(ttt,1)=MAX_pixels.*rand;
                            Data.Training_minut.class{rrr}.Finger_image{yyy}.Nodes(ttt,2)=MAX_pixels.*rand;
                            Data.Training_minut.class{rrr}.Finger_image{yyy}.Nodes(ttt,3)=2*pi.*rand;
                            tb=randi([1,3],1);
                            if tb==2
                                Data.Training_minut.class{rrr}.Finger_image{yyy}.Nodes(ttt,4)=3;
                            else
                                Data.Training_minut.class{rrr}.Finger_image{yyy}.Nodes(ttt,4)=tb;
                            end
                            
                        else
                            x= Data.Training_minut.class{rrr}.Finger_image{1}.Nodes(ttt,1);
                            y= Data.Training_minut.class{rrr}.Finger_image{1}.Nodes(ttt,2);
                            a =Data.Training_minut.class{rrr}.Finger_image{1}.Nodes(ttt,3);
                            ttb =Data.Training_minut.class{rrr}.Finger_image{1}.Nodes(ttt,4);
                            Data.Training_minut.class{rrr}.Finger_image{yyy}.Nodes(ttt,1)=x+(randn(1,1)*noisxy);
                            Data.Training_minut.class{rrr}.Finger_image{yyy}.Nodes(ttt,2)=y+(randn(1,1)*noisxy);
                            a=a+(randn(1,1)*noisa);
                            while a<0
                                a=a+2*pi;
                            end
                            while a>2*pi
                                a=a-2*pi;
                            end
                            Data.Training_minut.class{rrr}.Finger_image{yyy}.Nodes(ttt,3)=a;
                            Data.Training_minut.class{rrr}.Finger_image{yyy}.Nodes(ttt,4)  =ttb;
                            %        if ttb == 3
                            %          Data.Training_minut.class{rrr}.Finger_image{yyy}.Nodes(ttt,4)  =1;
                            %        else
                            %          Data.Training_minut.class{rrr}.Finger_image{yyy}.Nodes(ttt,4) =3;
                            %        end
                        end
                    end
                end
            end
            %%%%%%%%%%%%%%%%%%%%%%%%%Generting Training class%%%%%
            for jjjj=1:num_class
                for m=1:imageeach
                    finger1=Data.Training_minut.class{jjjj}.Finger_image{m};
                    %  finger2=Data.Training_minut.class{jjjj}.Finger_image{j};
                    
                    % if m==j
                    [N1,E1,L]= Generate_minutia(finger1);
                    % else
                    %  [N1,E1,N2,E2,L]=Generate_graph_minutia(finger1,finger2);
                    % end
                    Database.Learning{k}.Graph.Nodes=N1;
                    Database.Learning{k}.Graph.Edges=E1;
                    Database.Learning{k}.Image_Name=strcat('FingerPrint',num2str(m));
                    Database.Learning{k}.Class=jjjj;
                    
                    
                    
                    for s=1:imageeach
                        ddd=jjjj*imageeach;
                        ddd=ddd-imageeach;
                        Database.Learning{k}.Correspondences{s}.Mappings=L;
                        Database.Learning{k}.Correspondences{s}.InputGraph=ddd+s;
                    end
                    k=k+1;
                    
                    
                end
            end
            k=1;
            
            %
        case 'test'
            for rrr=1:num_class
                for yyy=1:imageeach
                    for ttt=1: num_nodes
                        if yyy==1 %%%%%%%%%%%%%%Generate First FingerPrint
                            Fi_Tr=Data.Training_minut.class{rrr}.Finger_image{yyy}.Nodes(ttt,1);
                            Se_Tr = Data.Training_minut.class{rrr}.Finger_image{yyy}.Nodes(ttt,2) ;
                            Tr_a= Data.Training_minut.class{rrr}.Finger_image{yyy}.Nodes(ttt,3);
                            Tr_a=Tr_a+(randn(1,1)*noisa);
                            while Tr_a<0
                                Tr_a=a+2*pi;
                            end
                            while Tr_a>2*pi
                                Tr_a=Tr_a-2*pi;
                            end
                            
                            Data.Test_minut.class{rrr}.Finger_image{yyy}.Nodes(ttt,1)=Fi_Tr+(randn(1,1)*noisxy);
                            Data.Test_minut.class{rrr}.Finger_image{yyy}.Nodes(ttt,2)=Se_Tr+(randn(1,1)*noisxy);
                            Data.Test_minut.class{rrr}.Finger_image{yyy}.Nodes(ttt,3)=Tr_a;
                            Data.Test_minut.class{rrr}.Finger_image{yyy}.Nodes(ttt,4)=Data.Training_minut.class{rrr}.Finger_image{yyy}.Nodes(ttt,4);
                            %       tb=randi([1,3],1);
                            %        if tb==2
                            %             Data.Test_minut.class{rrr}.Finger_image{yyy}.Nodes(ttt,4)=3;
                            %        else
                            %             Data.Test_minut.class{rrr}.Finger_image{yyy}.Nodes(ttt,4)=tb;
                            %        end
                            
                        else
                            x= Data.Test_minut.class{rrr}.Finger_image{1}.Nodes(ttt,1);
                            y= Data.Test_minut.class{rrr}.Finger_image{1}.Nodes(ttt,2);
                            a =Data.Test_minut.class{rrr}.Finger_image{1}.Nodes(ttt,3);
                            ttb =Data.Test_minut.class{rrr}.Finger_image{1}.Nodes(ttt,4);
                            
                            Data.Test_minut.class{rrr}.Finger_image{yyy}.Nodes(ttt,1)=x+(randn(1,1)*noisxy);
                            Data.Test_minut.class{rrr}.Finger_image{yyy}.Nodes(ttt,2)=y+(randn(1,1)*noisxy);
                            a=a+(randn(1,1)*noisa);
                            while a<0
                                a=a+2*pi;
                            end
                            while a>2*pi
                                a=a-2*pi;
                            end
                            Data.Test_minut.class{rrr}.Finger_image{yyy}.Nodes(ttt,3)=a;
                            Data.Test_minut.class{rrr}.Finger_image{yyy}.Nodes(ttt,4)=ttb;
                            %        if ttb == 3
                            %          Data.Test_minut.class{rrr}.Finger_image{yyy}.Nodes(ttt,4)  =1;
                            %        else
                            %          Data.Test_minut.class{rrr}.Finger_image{yyy}.Nodes(ttt,4) =3;
                            %        end
                        end
                    end
                    
                end
            end
            
            %%%%%%%%%%Generting Test Class%%%%%%%%%%
            for jjjj=1:num_class
                for m=1:imageeach
                    finger1=Data.Test_minut.class{jjjj}.Finger_image{m};
                    %  finger2=Data.Training_minut.class{jjjj}.Finger_image{j};
                    
                    % if m==j
                    [N1,E1,L]= Generate_minutia(finger1);
                    % else
                    %  [N1,E1,N2,E2,L]=Generate_graph_minutia(finger1,finger2);
                    % end
                    Database.Test{k}.Graph.Nodes=N1;
                    Database.Test{k}.Graph.Edges=E1;
                    Database.Test{k}.Image_Name=strcat('FingerPrint',num2str(m));
                    Database.Test{k}.Class=jjjj;
                    
                    
                    
                    for s=1:imageeach
                        ddd=jjjj*imageeach;
                        ddd=ddd-imageeach;
                        Database.Test{k}.Correspondences{s}.Mappings=L;
                        Database.Test{k}.Correspondences{s}.InputGraph=ddd+s;
                    end
                    k=k+1;
                    
                    
                    
                end
            end
            k=1;
            
            
        case 'validation'
            for rrr=1:num_class
                for yyy=1:imageeach
                    for ttt=1: num_nodes
                        if yyy==1 %%%%%%%%%%%%%%Generate First FingerPrint
                            Fi_Tr=Data.Training_minut.class{rrr}.Finger_image{yyy}.Nodes(ttt,1);
                            Se_Tr =Data.Training_minut.class{rrr}.Finger_image{yyy}.Nodes(ttt,2) ;
                            Tr_a= Data.Training_minut.class{rrr}.Finger_image{yyy}.Nodes(ttt,3);
                            Tr_a=Tr_a+(randn(1,1)*noisa);
                            while Tr_a<0
                                Tr_a=a+2*pi;
                            end
                            while Tr_a>2*pi
                                Tr_a=Tr_a-2*pi;
                            end
                            
                            Data.Vildation_minut.class{rrr}.Finger_image{yyy}.Nodes(ttt,1)=Fi_Tr+(randn(1,1)*noisxy);
                            Data.Vildation_minut.class{rrr}.Finger_image{yyy}.Nodes(ttt,2)=Se_Tr+(randn(1,1)*noisxy);
                            Data.Vildation_minut.class{rrr}.Finger_image{yyy}.Nodes(ttt,3)=Tr_a;
                            Data.Vildation_minut.class{rrr}.Finger_image{yyy}.Nodes(ttt,4)=Data.Training_minut.class{rrr}.Finger_image{yyy}.Nodes(ttt,4);
                            %       tb=randi([1,3],1);
                            %        if tb==2
                            %             Data.Vildation_minut.class{rrr}.Finger_image{yyy}.Nodes(ttt,4)=3;
                            %        else
                            %             Data.Vildation_minut.class{rrr}.Finger_image{yyy}.Nodes(ttt,4)=tb;
                            %        end
                            
                        else
                            x= Data.Vildation_minut.class{rrr}.Finger_image{1}.Nodes(ttt,1);
                            y= Data.Vildation_minut.class{rrr}.Finger_image{1}.Nodes(ttt,2);
                            a =Data.Vildation_minut.class{rrr}.Finger_image{1}.Nodes(ttt,3);
                            ttb =Data.Vildation_minut.class{rrr}.Finger_image{1}.Nodes(ttt,4);
                            
                            Data.Vildation_minut.class{rrr}.Finger_image{yyy}.Nodes(ttt,1)=x+(randn(1,1)*noisxy);
                            Data.Vildation_minut.class{rrr}.Finger_image{yyy}.Nodes(ttt,2)=y+(randn(1,1)*noisxy);
                            a=a+(randn(1,1)*noisa);
                            while a<0
                                a=a+2*pi;
                            end
                            while a>2*pi
                                a=a-2*pi;
                            end
                            Data.Vildation_minut.class{rrr}.Finger_image{yyy}.Nodes(ttt,3)=a;
                            Data.Vildation_minut.class{rrr}.Finger_image{yyy}.Nodes(ttt,4)  =ttb;
                            %        if ttb == 3
                            %          Data.Vildation_minut.class{rrr}.Finger_image{yyy}.Nodes(ttt,4)  =1;
                            %        else
                            %          Data.Vildation_minut.class{rrr}.Finger_image{yyy}.Nodes(ttt,4) =3;
                            %        end
                        end
                    end
                end
            end
    end
end
%%%%%%%%%%%%%%%%%%%%%Generting Validation class%%%%%%%%%%
for jjjj=1:num_class
    for m=1:imageeach
        finger1=Data.Vildation_minut.class{jjjj}.Finger_image{m};
        %  finger2=Data.Training_minut.class{jjjj}.Finger_image{j};
        
        % if m==j
        [N1,E1,L]= Generate_minutia(finger1);
        % else
        %  [N1,E1,N2,E2,L]=Generate_graph_minutia(finger1,finger2);
        % end
        Database.Vildation{k}.Graph.Nodes=N1;
        Database.Vildation{k}.Graph.Edges=E1;
        Database.Vildation{k}.Image_Name=strcat('FingerPrint',num2str(m));
        Database.Vildation{k}.Class=jjjj;
        
        
        
        for s=1:imageeach
            ddd=jjjj*imageeach;
            ddd=ddd-imageeach;
            Database.Vildation{k}.Correspondences{s}.Mappings=L;
            Database.Vildation{k}.Correspondences{s}.InputGraph=ddd+s;
        end
        k=k+1;
    end
end

k=1;
save(Database.Name,'Database');
end