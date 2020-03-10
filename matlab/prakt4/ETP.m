R1=1;R2=2;R3=3;R4=4;R5=5;R6=6;R7=7;
E1=1; E2=2; E3=3;
%Norakstit koeficentus
R=[R1+R2+R3 -R2 0;
    -R2 R2+R4+R5 -R5;
    0 -R5 R5+R6+R7]

E = [E1 -E2 -E3]'
%Vinai jabut E = [E1;
%                 E2;
%                 E3] Bet mes ar transponejam ar zime '
%Meklesim kontrstravu Ik - Istrava Kkonturs
Ik = R\E % gausa metode ar zime \ 
%% Uzdevums: Atrast IR2, UR2, PR2 -?
IR2 = Ik(1) - Ik(2) % no vektora Ik - mes izsaucam () - elementu pirmo, otru...
UR2 = IR2*R2
PR2 = UR2*IR2
%% Cits variants
%Tagad mums 3 laikas momenti
% un E1 E2 E3 bus 3 veribas
E1 = [1 -1 0];
E2 = [2 -2 0];
E3 = [3 -3 0];
%aliksim matricai
E = [E1; E2; E3]
%% Meklesim konturstrave
Ik = R\E
% Pirma rinda - pirma konturstrave, otra- otra un ta talak
%% Uzdevums atrast IR 3 UR3 PR3 - ?
IR3 = Ik(1,:) % nozime, ka mes panemsim 1 rindu
UR3 = IR3*R3
PR3 = UR3.*IR3 % punkts jaliek, lai sareizinat elementu uz elementu no matricai
%% Cits variants
% Tagad mums bus laika mainigais signals
t = 0:0.01:1;

E1 = sin(2*pi*3*t);
%E2 = 5; %ka pareizi pierakstit kanstanti?
E2 = 5+zeros(size(t));
E3 = cos(2*pi*7*t);
%% risinasim vienadojumu sistemas
% lai atrast konturstravas, tagad jau
% mums ir 101 3 vienadojumu sistema
E = [E1; -E2; -E3];
Ik = R\E;
%% Uzdevums bus 
% atrast un uzzimet UR5, PR5 - ?
IR5 = Ik(3,:)-Ik(2,:);
UR5 = IR5*R5;
PR5 = UR5.*IR5; % mes liksim beiga ;;;;; lai nebut daudz atbildes
%% zimesim
plot(t,UR5,t,PR5)
legend('UR5','PR5')
xlabel('t,s')
grid % grid lai uztaisit grafika rutinu
%% Cits panemiens, lai nebutu pretruna
% ka uz y asi gan Volti, gan Wati

figure
yyaxis left
plot(t,UR5)
ylabel('spriegums')

yyaxis right
plot(t,PR5)
ylabel('jauda')

xlabel('t,s')

%% Rezultatu parbaude
% parbaudisim Kirhofa spriegumu likums
% 3.konturam
% UR5+UR6+UR7 == -E3
% Parnesisim visu viena puse
% UR5+UR6+UR7+E3==0
% un pielidzinasim kadam mainigajam Utst
% Utsts = UR5+UR6+UR7+E3;
% un to uzzimesim
UR6 = Ik(3,:)*R6;
UR7 = Ik(3,:)*R7;
Utst = UR5+UR6+UR7+E3;
figure(3),plot(t,Utst)
%% velamais rezultats 0