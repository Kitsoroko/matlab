%%1.Laboretorijas darbs
%% *Rostislavs Arhipovs REBM02*
%%Merijumu datu apstrade
%%darba merki
% * iemacities apstradat merijumu datus
% * iemacities veidot atskaites izmantojot report generation
% * iemacities nolasit datus no grafika
%% Dots sekojosais grafiks
%
%<<../bildes1.png>>

t = 0:0.01:1;
y = sin(2*pi*t);
%plot(t,y);

xlabel('uzraksti');
C = 1;
%% Polinoma koeficienti
C
%% Secinajumi
% * Secinajomos jaraksta, ko esam iemacijusi
% * Vai ari jaskatas darba merkus
% * Secinajumiem jabut unikaliem

%% Saksim
A = imread('picture1.png')
B = imread('picture2.png')
figure(2),image(A)
figure(3),image([450,750],[1,0],B)
set(gca,'YDir','normal')
[x,y] = ginput(15)
hold on
plot(x,y,'o')
x = (560:0.01:605);
y = (0:0.01:1);
p = polyfit(x,y,6)
f = polyval(p,x);
T = table(x,y,f,y-f,'VariableNames',{'X','Y','Fit','FitError'})
