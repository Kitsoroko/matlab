%% Laboratorijas darbs 6.
%% Rostislavs Arhipovs

% Par signalu panemt 3.lab.darba ka individualo signalu
t = 0:0.01:6;
x= uzdlab3(t);
x=@(t) uzdlab3(t);
n=length(t);
xkv=@(t) uzdlab3.^2;
%% 1. Aprekinat patieso videjo un patieso efektivu vertibu

% Meginajums no lab. darba 1 dala

xvid3a=1/(n-1)*sum(x(t(1:end-1)));
xvid3b = 1/(n-1)*sum(x(t(2:end)));
h=(t(end)-t(1))/(n-1);
% tad liekam formulai
xvid3c=sum(x(t(1:end-1)+h/2))*1/(n-1);

xef3a=sqrt(1/(n-1)*sum(xkv(t(1:end-1))));
xef3b = sqrt(1/(n-1)*sum(xkv(t(2:end))));
xef3c = sqrt(sum(xkv(t(1:end-1)+h/2))*1/(n-1));
fprintf('Videja:3a=%f,3b=%f,3c=%f\n',xvid3a,xvid3b,xvid3c)
fprintf('Efektiva: 3a=%f,3b=%f,3c=%f\n',xvid3a,xvid3b,xvid3c)


% Videja patiesa
syms t_sin t_zero t_const t_saw t_troksnis
% Videja vertiba
% sinusoida
% nemam datus no musu signala
A0= 0; A=1.5;
T = (3.5-1.5)/2
f = 1/T; delay=1;
% t_sin = 0:0.01:1.5;
y_sin=A0+A*sin(4*pi*f*(t_sin-delay));
int_sin=int(y_sin,t_sin,0,1.5);
% % nulles
int_zero=0; % zero bus, jo vina ne aug, ne dils. 0
% % konstante
int_const=int(1.5,t_const, 3,3.5)
% mainiga linija 
% atkal nokopejam datus no musu signala
k = (1-0)/(3.5-4);
delay = 4;
y_saw = k*(t_saw-delay);
int_saw=int(y_saw,t_saw,3.5,4)
% % troksnis
int_noise=0; % ari bus 0, jo mes nevaram izrekinam randomu
xvid_paties=1/(t(end)-t(1))*(int_sin+int_zero+int_saw+int_noise)
% % Vel mes varam ielikt double prieks rekinasanai, lai dabut smuku atbilde
xvid_paties=double(1/(t(end)-t(1))*(int_sin+int_zero+int_saw+int_noise))


% Meginajums no 2 dala
xvidpat=1/(n-1)*sum(x(t(1:end-1)))
% Efektivas patiesa vertiba
 
xef_paties= sqrt(1/(n-1)*sum(xkv(t(1:end-1))))
%% 2
% Izmantot 3c formulu izrekinat videjo un efektivo vertibas pie soliem
% dt = [0.1 0.01 0.001]
% rezultatus noformet tabulas veida
dt = [0.1 0.01 0.001];
for dtc=dt;
    t=t(1):dtc:t(end);
    n=length(t);
    h=(t(end)-t(1))/(n-1);
    xvid3c=sum(x(t(1:end-1)+h/2))*1/(n-1);
    xkv=@(t) uzdlab3.^2;
    xef3c=sqrt(1/(n-1)*sum(xkv(t(1:end-1)+h/2)));
    fprintf('Videja vertiba 3c=%0.4f|\t Videja efektiva vertibas3c=%0.4f|\t solis=%f\n'...
        ,xvid3c,xef3c,dtc) % ar 0.4 vai jebkuru ciparu, mes ivelam cik mes gribam
                           % ciparus pec komata
end

%% 3.
% Izmantojot iebuveto matlaba integresana funkciju
% aprekinat videju un efektivu vertibu pir 'RelTol'=[1e-1 1e-2 1e-3]
% Rezultatus noformet tabulas veida

tol = [1e-1 1e-2 1e-3];
for tolc=tol;
    xvid=1/(t(end)-t(1))*integral(x,t(1),t(end),'RelTol',tolc);
    xkv=@(t) uzdlab3.^2;
    xef=sqrt(1/(t(end)-t(1))*integral(x,t(1),t(end),'RelTol',tolc));
    fprintf('Vertibas izrekinatas ar matlab iebuvetu funkciju\n')
    fprintf('Videja vertiba=%f|\tEfektiva vertiba=%f|\tpie tol=%f\n\n',...
        xvid,xef,tolc);
end

%% 4 Pielikt klat ari simulinku
% Videjai vertibai
% Efektivai veribai
% Diemzel es nevaru pielikt simulinku, jo mana versija matlaba
% 
imagee=imread('home.bmp');
figure
imshow(imagee)
% kludai ir rakstits
% The sample time after propagation is [0, 0]. Enter a discrete sample time 
% in 'simsim/Discrete-Time Integrator'
% ka es saprotu, tas ir radits, jo man nav iespejams ielikt auto, ka radits
% laboratorijas darba
% Meginaju daudz kur mainit parametrus, meklet atbilde google
% nevaru risinat so

%% Secinajums
% izmeginaju pielitot rokturi, ciklus, pielitot formulas no lekcijas
% Rezultati:
% Videja vertiba ar formuliem 3a=0.159171,3b=0.154327,3c=0.175960
% Efektiva vertiba ar formuliem Efektiva: 3a=0.172870,3b=0.168164,3c=0.161971
% Ar lielo formulu, kur es pats integreju visu grafiku, man sanaca
% Videja vertiba=0.0417
% 
% Videja patiesa =0.1788
% Efektiva patiesa =0.7504
%
% Videja vertiba 3c=0.1797| Videja efektiva vertibas3c=2.3651| solis=0.100000
% Videja vertiba 3c=0.1523| Videja efektiva vertibas3c=0.7480| solis=0.010000
% Videja vertiba 3c=0.1646| Videja efektiva vertibas3c=0.2380| solis=0.001000
% Videja vertiba diezgan nemainas, bet efektiva samazinas
% 
% Videja vertiba=0.180004| Efektiva vertiba=0.409221| pie tol=0.100000
% Videja vertiba=0.167287| Efektiva vertiba=0.409305| pie tol=0.010000
% Videja vertiba=0.166566| Efektiva vertiba=0.407457| pie tol=0.001000
% Seit mes redzam, ka vertibas samazainas, bet ar ne lielo dalu
%
% Videja vertiba visos aprekinos izskatas vienada,
% Bet efektiva vertiba mainas