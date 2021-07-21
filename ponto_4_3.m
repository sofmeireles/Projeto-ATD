function ponto_4_3(data,n)
figure(26);
labels = handler_label(n);
aac_X = data(:,1);
aac_Y = data(:,2);
aac_Z = data(:,3);

simbs=["o","*","v"];
plotsM=[];
plotsP=[];
plotsU=[];


for i = 1: 12
    matriz = janelas(labels,i);
    picosX=calcula_relevantes(matriz,aac_X);
    disp(picosX);
    
   
    matriz = janelas(labels,i);
    picosY=calcula_relevantes(matriz,aac_Y);
    %disp(picosY);
    
    
    matriz = janelas(labels,i);
    picosZ=calcula_relevantes(matriz,aac_Z);
    %disp(picosZ);

    if i<=3 %atividade dinamica
        cor="r"; 
    elseif i>=7 %atividade de transi�ao
        cor="b";
    else %atividade estatica
        cor="g";
    end
    
    contap=1;    
    for j=1:numel(picosX)
        simb=strcat(cor,simbs(contap));
        %hold on
        if contap==1    %pico m�ximo
            hold on
            grid on
            subplot(2,2,2);
            plot3(picosX(j),picosY(j),picosZ(j),simb);
            title("Pico m�ximo");
            
            
        elseif contap==2    %primeiro pico
            hold on
            grid on
            subplot(2,2,3);
            plot3(picosX(j),picosY(j),picosZ(j),simb);
            title("Primeiro pico");
        else    %ultimo pico
            hold on
            grid on
            subplot(2,2,4);
            plot3(picosX(j),picosY(j),picosZ(j),simb);
            title("�ltimo pico");
        end
        %conjunto dos picos
        %hold on
        %grid on
        %subplot(2,2,1);
        %pLot=plot3(picosX(j),picosY(j),picosZ(j),simb);
        %title("Frequencias relevantes");
        drawnow;
        
        
        contap=contap+1;
        if mod(j,3)==0
            contap=1;
        end
    end
end
hold off

%legend([plots(1) plots(5) plots(10) plots(11) plots(13) plots(16) plots(17) plots(18) plots(19) plots(20) plots(21) plots(22)],["Walking","Walking Upstairs","Walking Downstairs","Sitting","Standing","Laying","Stand to sit","Sit to stand","Sit to lie","Lie to sit","Stand to lie","Lie to stand"]);


    