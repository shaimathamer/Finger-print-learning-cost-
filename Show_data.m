function  Embdding_figure=Show_data(data,Wxy, Wa)        
 D = Convert_Data(data);
Embdding_figure = figure;
    XY=D(:,1);
    A=D(:,2);
    plot(A,XY,'r+');
    hold on
    if Wa*max(A) < max(XY)
        line([min(A) , max(A)],[Wa*min(A) , Wa*max(A)]);
    else
        line([min(XY)/Wa , max(XY)/Wa],[min(XY) , max(XY)]);
    end   
     ylabel('S_x_y');
     xlabel('S_a');
     title(strcat('Sxy=',num2str(round(Wa)),'*Sa'))
     hold off;
end
