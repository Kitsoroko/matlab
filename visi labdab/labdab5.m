%% Laboratorijas darbs 5
% Rostislavs Arhipovs
function labdab5
global E i0 a R
R=1;
Ud=2;
id=0.9;
i0=5*exp(-7); 
a=log((id + 1)/i0)/Ud;
t = 0:0.01:6;
y = uzdlab3;

URm=[];
for E=y
    UR = newmet5;
    URm=[URm,UR];
end
plot(t,y,t,URm)
legend('E','UR')

%% newmet5
% ar so funkciju mes varam taisit ciklu, lai vins pats
% nem un rekina x0 punktu
function x0=newmet5
x0=0;
epsilon= 1e-3;
delta = funx(x0)/fund(x0);
while (abs(delta)>epsilon);
    delta = funx(x0)/fund(x0);
    x0=x0-delta;
end
%% funx
% so funkcija palig atrast punktus uz Y asi
% Piemeram, lai atrast punktu grafika funx(0.55)
% Ta bus (x=0.55,y=0)
function fx = funx(UR)
global E i0 a R
fx=i0*(exp(a*(E-UR))-1)-UR/R;
%% fund
% lai atrast garumu malai trijsturam deltai 
% mums vajadzes tg(alfa) = f'(x0)
% x0=x0-delta
% kad mes to atradisim, mes varesim atrast tuvaku punktu,
% kur finkcija krusto Xasi
function fx=fund(UR)
global E i0 a R
fx = - 1/R - a*i0*exp(a*(E - UR)); % atvasinajums funkcijai no funx
                                   % diff(i0*(exp(a*(E-UR))-1)-UR/R,UR)
                                   
%% Secinajums
% Seit laboratorijas darba es iemaciju Nutona metode, ka atrast punktu no 
% grafika, Ebersa-Mola moduli. Atkartoju funcijas, ciklus,
% komandas no simboliskai matematikai, atvasinot.