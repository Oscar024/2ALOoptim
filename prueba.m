datos = load('redes2.mat');
net = datos.arquitec.bestnnall(8).nn;

% load pacientesreal.dat
% load tarreal.dat
% 
% x1=pacientesreal;
% rtarg=tarreal;

load pactst.dat
load tarpactst.dat

x1=pactst;
rtarg=tarpactst;

num=length(rtarg);
%SIMULANDO DATOS PRONOSTICADOS

pn2 = normaliza(x1,7);


an2 = sim(net,pn2);
sim1 = desnormaliza(an2,1);
sim2=round(sim1);

% MSE= mymse(rtarg,sim2);
% 

%IMPRIMIR SOLO EL PRONOSITICO
% pronostico1=round(rtarg);

% perf = mse(net,pronostico1,sim2,'regularization',0.01);
% perf=immse(pronostico1,sim2)
% 
%  for j=1:num
%      pronostico1(1,j)=sim2(1,j);
%  end
%  
%  pronostico1=round(pronostico1);

%%%%%%%%%%%%%%%%%%%%
%INTEGRACION POR PROMEDIO
% 
% prom=pronostico1;
% for iii=1:12
%    erroresga(iii)=abs(rtarg(iii)-pronostico1(iii));  
%    mse_calc(iii) = sum((rtarg(iii)-pronostico1(iii)).^2)/length(rtarg);
% end

% MSE = mean(( pronostico1 - rtarg).^2);
MSE= mymse(rtarg,sim2);
   %mse_calc = sum((y-targets).^2)/length(y);

% errorestfpa=0;
% for ii=1:12
%    errorestfpa=errorestfpa+mse_calc(ii);
% end
% 
% errorestfpa=errorestfpa/50

p1 = 1:1:50;
figure
plot(p1,rtarg,'b');
grid on
hold on
plot(p1,sim2,'r');
hold on

