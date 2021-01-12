function dd = Minutia_Matching(T1, T2,Wxy,Wa,Wtb)            
if Wtb==Inf  % Different types of minutiae cannot be matched
                if (T1(4)==T2(4))
                    dx=T1(1)-T2(1);
                    dy=T1(2)-T2(2);
                    Dxy=sqrt(dx^2+dy^2);    % Distance between positions
                    Da=abs(T1(3)-T2(3));
                    Da=min(Da,2*pi-Da);  % Distance between angles
                    dd=Wxy*Dxy+Wa*Da;
                else
                    dd=1000;
                end
else        % T/B distance has to be considered
                dx=T1(1)-T2(1);
                dy=T1(2)-T2(2);
                Dxy=sqrt(dx^2+dy^2);    % Distance between positions
                Da=abs(T1(3)-T2(3));
                Da=min(Da,2*pi-Da);  % Distance between angles
                if (T1(4)==T2(4)) % Distance between Terminal or Bifurcation: Dtb
                    dd=Wxy*Dxy+Wa*Da; % Dtb=0;
                else
                    dd=Wxy*Dxy+Wa*Da+Wtb; % Dtb=1;
                end
end
end
