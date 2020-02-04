mkdir lab1
cd lab1
diary lab1_diary.m

%% Mērījumu datu apstrāde
% pieņemsim kā mums ir mērījumu dati
% mainam spriegumu un mēram strāvu
Vm = [-1 0.3 1.5 2.5 3.2];
Im = [1.1 2.2 2.1 3.2 4.7]*1e-3;
plot(Vm,Im,'-o')
% pielaikosim 2.kārtas polinomu
% y = a*x^2+b*x+c
% polyfit - meklē polinoma koeficientus
% C = polyfit(x,y,N)
% N - polinoma kārta
C = polyfit(Vm,Im,2)
% šie nozīmē
% y = C(1)*x^2+C(2)*x+C(3);
% definēsim x ar sīkāku soli
V = -1:0.01:3.2;
V = min(Vm):0.01:max(Vm);
V = linspace(min(Vm),max(Vm),100);
% liekam x mūsu izteismē
% liekam x mūsu izteiksmē
I = C(1)*V.^2+C(2)*V+C(3);
plot(Vm,Im,'o',V,I)
%y = C(1)*x^2+C(2)*x+C(3);
%% atkārtosim 3.kārtai
C = polyfit(Vm,Im,3)
I = C(1)*V.^3+C(2)*V.^2+C(3)*V+C(4);
plot(Vm,Im,'o',V,I)
%Vel atkartosim
C = polyfit(Vm,Im,3)
%lai nerakstit I = C(1)*V.^3+C(2)*V.^2+C(3)*V+C(4);
%izmantosim funkc polyval - polyfit
C = polyfit(Vm,Im,3);
I = polyval(C,V);
plot(Vm,Im,'o',V,I)
%atkartot 4 karti
C = polyfit(Vm,Im,4);
I = polyval(C,V);
plot(Vm,Im,'o',V,I)
%1.karta
C = polyfit(Vm,Im,1);
I = polyval(C,V);
plot(Vm,Im,'o',V,I)
%%Merijuma serijas

Vm = [-1 0.3 1.5 2.5 3.2];
Im = [1.1 2.2 2.1 3.2 4.7
      0.9  1.8 2.6 3.3 4.5
      1.0  2.0 2.4 3.4 4.3
      0.8 1.9  2.5 3.5 4.6
      0.9 2.0  2.3 3.1 4.4];
 figure
 plot(Vm,Im,'o-')
 plot(Vm,Im','o-') %transponiruem Im
 %Videjas vertibas atrasana
 sum([1 2 3 4 5])
 sum([1 2; 3 4])
 Ivid = sum(Im)/5
 %%videjais
 %videjai vertibai pielaikosim polival
 C = polyfit(Vm,Ivid,4);
 V = -1:0.01:3.2;
 I = polyval(C,V);
 % uzzimet 3 grafikus vienas asis
 %Vm, Im, ar 'o'
 %Vm, Ivid, ar '*'
 %V, I ar '-'
 plot(Vm, Im', 'o',Vm, Ivid, '*', V, I, '-')
 %%
 % aprekinasim standartnovirzi
 Istd = std(Im)
 errorbar(Vm,Ivid,Istd)
 %meginasim tikt vala no lauztas linijas
 errorbar(Vm,Ivid,Istd)
 hold on
 plot(V,I)
 hold off
 %no ortusa saglabat bildes matlaba folder
 ls
 %atrodam bildes
 %% Datu iegusana no rasejuma
 A = imread('bilde1.png');
 B = imread('bilde2.png');
 figure(1),image(A)
 figure(2),image([500,800],[1,0],B)
 set(gca,'YDir','normal')
 [x,y] = ginput(10)
 hold on
 plot(x,y,'o')