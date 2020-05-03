%% Dati
t = 0:0.01:6;
E1 = 10+zeros(size(t)); 
E2 = sin(3*t); 
I3=uzdlab3;
R1 =1; R2=2;R3=3;R4=4;R5=5;R6=6;R7=7;R8=8;
%% Matricas
% Rezistori
R = [R8+R6    -R6        0;
     -R6    -R6-R7+R5    -R7;
     0         -R7    R7+R4+R3+R2+R1];
% EDS
% E = [E1; E2; I3; -E1];
E = [E1; E2; -E1]; % ' - inversija
%% Meklesim konturstravu
 Ik = R\E;
%% Atrast
% Spriegumu UR8 un jaudu PR8
UR8 = Ik(1,:)*R8;
PR8 = UR8.*Ik(1,:);
%% Uzzimesim

figure(2),plot(t,UR8,t,PR8)
legend('UR8','PR8')
xlabel('t,s')
grid % grid lai uztaisit grafika rutinu
%% Cits panemiens, lai nebutu pretruna

figure(3),plot(t,UR8)
ylabel('spriegums')

figure(4),plot(t,PR8)
ylabel('jauda')

xlabel('t,s')

%% Parbaudit un attelot KSpL 3konturam
UR1= Ik(3,:)*R1;
UR4= Ik(3,:)*R4;
UR3= Ik(3,:)*R3;
UR2= Ik(3,:)*R2;
IR7 = Ik(3,:)-Ik(2,:);
UR7 = IR7*R7;
Utst = UR1+UR7+UR4+UR3+UR2+E1;
% UR4 = Ik(3,:)*R4;
% UR3 = Ik(3,:)*R3;
% IR7 = Ik(3,:)-Ik(2,:);
% UR7 = IR7*R7;
% Utst = UR4+UR3+UR7-I3;
figure(5),plot(t,Utst)
%% velamais rezultats 0
%% Secinajums
% Ir izpildits darbs ar datiem no 3. lab. darba
% Seit ar dotiem datiem ar Kirhofa likumiem bija izrekinati
% strava, jauda, spriegums.
% Vel katram izrekinam ir grafiks, ka vins mainijis no sakuma
% Ja ir kluda, tad ta lielaka dala no ETP puse