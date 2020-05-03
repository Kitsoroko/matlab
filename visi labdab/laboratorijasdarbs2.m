%% Laboratorijas darbs 2.
% Jaatrisinat ar solve, izteiksmi un rezultatu ielikt atskaite(pretty)
% jaatrisinat atvasinajumu, gan sakuma izteiksmi, gan rezultatu attelot
% uz viena grafika,
% grafikam virsu uzlikt legend ar abam formulam 'latex izskta'
syms a b x; % definejam mainigos, vel varam definet pa vienam mainigam 
            % x=sym(x)...
% piemers a+b-exp^(b*x^2-a*x)=b
x = solve(a+b-exp(b*x^2-a*x)==b, x) % formula
pretty(x) % prasam paradit musu formulu
% Atvasinajums
syms x y; % definejam mainigos
y=x+1/(exp(x)-log(exp(x)+1)+1); % formula
yd=simplify(diff(y)); % atvasinam un prasam formulu uztaisit lasamu(vieglak)
x=-10:0.01:10; % liekam robezus grafikam 
yvm = eval(vectorize(y)); % Taisam vektoru grafiku
ydvm = eval(vectorize(yd));
plot(x,yvm,'-',x,ydvm,'.') % zimesim grafiku
%% Seit mes mainam zimejumu
% liekam srifru, izmeru sriftam, mainam liniju
% liekam nosaukumu grafikam
% ari mainam pozicijas grafikam
% Prasam radit musu formulu a+b/(a+b), bet smukak
a = latex(y) 
b = latex(yd)
text(-8,5,['$$',a,'$$'],'Interpreter','latex','FontSize',12); 
h = legend(['$',a,'$'],['$',b,'$']);
set(h,'Interpreter','latex','FontSize',15)
%% Secinajums
% Iemaciju, ka stradat ar matlabu matematiski apstradat datus.
% Atvasinat, integret un t.t.
% Ari ar to visu ka radit grafiku formuulai un mainit vinu