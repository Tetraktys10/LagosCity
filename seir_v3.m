%COVID-19 Lagos City Model with ages

clear all

data_nigeria;

% Several assumptions and parameters come from Imperial report "Impact of non-pharmaceutical interventions (NPIs) to reduce COVID19 mortality and healthcare demand"
% https://www.imperial.ac.uk/media/imperial-college/medicine/sph/ide/gida-fellowships/Imperial-College-COVID19-NPI-modelling-16-03-2020.pdf

%Initialise differential equations

%number of residents aged 0-14: 1897665
%number of residents aged 15-59: 3789709
%number of residents aged 60+: 230555

%number of female residents aged 0-14: 971885
%number of female residents aged 15-59: 1713534  %%%female aged 15-49 are 81559 which makes them 89% of the 15-59 age group
%number of female residents aged 60+: 128712

%number of male residents aged 0-14: 925780
%number of male residents aged 15-59: 2076175
%number of male residents aged 60+: 101843

%main model %(S E Iu Ia Is Ih Ru Rh D Nc)
y0= [1897665 0 0 0 0 0 0 0 0 0 3789709-24 30 10 6 5 3 0 0 0 3 230555-5 9 3 6 3 1 0 0 0 1];   


tspan=[0 51];


%From calibration
beta1 =    3e-07;%

%initial values       
       ppsi1=0.9;%notification rate in the 0-14
       ppsi2=0.9;%notification rate in the 15-59
       ppsi3=0.9;%notification rate in the 60+
       xxi=0;
       bb1=0; %contact tracing

       
      %mortality rates from calibration 
       muh1 =       8e-06;%  
       muh2 =   2.505e-14;%  
       muh3 =   0.0003078;%  
       mus =    0.006469;%  (0.006194, 0.006744)


c = [1.8000    0.6598    1.0269;   1.3219    0.7800    2.1558;   0.1279    0.1324    0.4700]; %contacts adjusted from Melegaro et al.
alpha = 0.5;        %reduction of infectiousness from asymptomatic people 50%
k = 1/4.6;          %progression from exposed to infectious initial stage, 4.6 days
q = 1/2.9;          %time where the symptomatic case remains undetected and where the asymptomatic case remains mixed with the symptomatic before moving to its own compartment
p = 0.5;            %probability of being symptomatic 
ps=0.5;            %probability of being symptomatic in the 60+ age group
gammaa= 1/6.5;      %recovery rate, infectious period = 1/6.5 where 6.5 days is the mean infectiousness time
gammas= 1/5.1;      %recovery rate, infectious period = 1/6.5 where 6.5 days is the mean infectiousness time
gammah = 1/7;    %recovery rate, infectious period = 1/10.4 where 10.4 is the mean hospitalization period



%main model
[t,y] = ode45(@(t,y) seir_eq_v3(t,y,beta1,c,k,p,gammaa,gammas,gammah,mus,muh1,muh2,muh3,alpha,q,ps,ppsi1,ppsi2,ppsi3,xxi,bb1),tspan,y0);

%scenarios
%[t,y] = ode45(@(t,y) seir_eq_v5(t,y,beta1,beta2,beta3,c,k,p,gammaa,gammas,gammah,mus,muh1,muh2,muh3,psi1,psi2,psi3,alpha,q,xi,d1,d2,m1,m2,m3),tspan,y0);

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%PLOTS

%%
%PLOTS
% figure(01) %(S E Iu Ia Is Ih Ru Rh D Nc)
% plot(t,y(:,3)+y(:,4)+y(:,5)+y(:,6), 'LineWidth', 2.5, 'color', 'r')
% hold on
% plot(t,y(:,13)+y(:,14)+y(:,15)+y(:,16), 'LineWidth', 2.5, 'color', 'g')
% hold on
% plot(t,y(:,23)+y(:,24)+y(:,25)+y(:,26), 'LineWidth', 2.5, 'color', 'b')
% hold on
% plot(t,(y(:,13)+y(:,14)+y(:,15)+y(:,16))*0.3576*0.85, 'LineWidth', 2.5, 'color', 'y')
% set(gca, 'FontSize', 16);
% xlabel('Days')
% %ylabel('Populations')
% title(['Infections (all types)'] )
% xticks([0 10 20 30 40 50 80])
% xticklabels({'16/03','26/03','5/04','15/04','25/04','5/05','5/06'})
% legend('0-14', '15-59', '60+', 'Women of reproductive age (15-49)')
% %%
% figure(02) %(S E Iu Ia Is Ih Ru Rh D Nc)
% plot(t,y(:,9), 'LineWidth', 2.5, 'color', 'r')
% hold on
% plot(t,y(:,19), 'LineWidth', 2.5, 'color', 'g')
% hold on
% plot(t,y(:,29), 'LineWidth', 2.5, 'color', 'b')
% hold on
% plot(t,y(:,19)*0.29*0.85, 'LineWidth', 2.5, 'color', 'y')
% set(gca, 'FontSize', 16);
% xlabel('Days')
% %ylabel('Populations')
% title(['Cumulative deaths'] )
% xticks([0 10 20 30 40 50 80])
% xticklabels({'16/03','26/03','5/04','15/04','25/04','5/05','5/06'})
% legend('0-14', '15-59', '60+', 'Women of reproductive age (15-49)')


















%%
% figure(05) %(S E Iu Ia Is Ih Ru Rh D Nc)
% plot(t,y(:,9)+y(:,19)+y(:,29),':', 'LineWidth', 2.5, 'color', 'm') %'*-','MarkerIndices',1:10:length(y)
% hold on
% %plot(days2,deaths_cumul, 'o')%
% set(gca, 'FontSize', 16);
% xlabel('Days')
% ylabel('Populations')
% title(['Cumulative deaths'] )
% % set(gca,'XTick',[0 50 100 160 365 547]);
% xticks([0 50 100 160 365 547])
% xticklabels({'9/03','26/04','17/06','16/08','9/03/21','7/09/21',''})
% %legend('Deaths')
% 
% figure(06) %(S E Iu Ia Is Ih Ru Rh D Nc)
% plot(t,y(:,4)+y(:,5)+y(:,6)+y(:,14)+y(:,15)+y(:,16)+y(:,24)+y(:,25)+y(:,26),':', 'LineWidth', 2.5, 'color', 'r')%,'*-','MarkerIndices',1:10:length(y),
% hold on
% %plot(days,data, 'o')
% set(gca, 'FontSize', 16);
% xlabel('Days')
% ylabel('Populations')
% title(['Infections'] )
% xticks([0 10 20 30 40 50 80])
% xticklabels({'16/03','26/03','5/04','15/04','25/04','5/05','5/06'})
% %legend('Infections (all types)')

%%
figure(05) %(S E Iu Ia Is Ih Ru Rh D Nc)
plot(t,y(:,9)+y(:,19)+y(:,29),'-', 'LineWidth', 2.5, 'color', 'm') %'-.','MarkerIndices',1:10:length(y)
%plot(t,y(:,9)+y(:,19)+y(:,29),'-d','MarkerIndices',1:10:length(y), 'LineWidth', 0.5, 'color', 'm') %'-.','MarkerIndices',1:10:length(y)
hold on
%plot(days2,deaths_cumul, 'o')
set(gca, 'FontSize', 16);
xlabel('Days')
ylabel('Populations')
title(['Cumulative deaths'] )
xticks([0 10 20 30 40 50 80])
xticklabels({'16/03','26/03','5/04','15/04','25/04','5/05','5/06'})
xlim([0 81])
%legend('Days')
%
figure(06) %(S E Iu Ia Is Ih Ru Rh D Nc)
plot(t,y(:,4)+y(:,5)+y(:,6)+y(:,14)+y(:,15)+y(:,16)+y(:,24)+y(:,25)+y(:,26),'-','LineWidth', 2.5, 'color', 'r')%
%plot(t,y(:,4)+y(:,5)+y(:,6)+y(:,14)+y(:,15)+y(:,16)+y(:,24)+y(:,25)+y(:,26),'-d','MarkerIndices',1:10:length(y), 'LineWidth', 0.5, 'color', 'r')%
hold on
set(gca, 'FontSize', 16);
xlabel('Days')
ylabel('Populations')
title(['Infections'] )
xticks([0 10 20 30 40 50 80])
xticklabels({'16/03','26/03','5/04','15/04','25/04','5/05','5/06'})
xlim([0 81])
%legend('Infections (all types)')

%%
% % figure(03) %(S E Iu Ia Is Ih Ru Rh D Nc)
% % plot(t,y(:,9)+y(:,19)+y(:,29), 'LineWidth', 2.5, 'color', 'm')
% % hold on
% % plot(days2,deaths_cumul, 'o')
% % set(gca, 'FontSize', 16);
% % xlabel('Time')
% % ylabel('Number of deaths')
% % title(['Deaths in Lagos City'] )
% % legend('Deaths')
% % xticks([0 10 20 30 40 50])
% % xticklabels({'16/03','26/03','5/04','15/04','25/04','5/05'})
% % 
%%% (y(:,1)+y(:,11)+y(:,21))/(y(:,1)+y(:,2)+y(:,3)+y(:,4)+y(:,5)+y(:,6)+y(:,7)+y(:,8)+y(:,9)+y(:,11)+y(:,12)+y(:,13)+y(:,14)+y(:,15)+y(:,16)+y(:,17)+y(:,18)+y(:,19)+y(:,21)+y(:,22)+y(:,23)+y(:,24)+y(:,25)+y(:,26)+y(:,27)+y(:,28)+y(:,29))
%% 
figure(04)
plot(t,y(:,9)+y(:,19)+y(:,29),'-', 'LineWidth', 2.5, 'color', 'm')
hold on
plot(t,y(:,10)+y(:,20)+y(:,30),'-', 'LineWidth', 2.5, 'color', 'c')

hold on
plot(days,data, 'o','MarkerSize',8)
hold on
plot(days2,deaths_cumul, 'o','MarkerSize',8)

set(gca, 'FontSize', 16);
xlabel('Days')
ylabel('Infected cases and deaths since 16th March 2020','FontSize',12)
title(['COVID-19 cases in Lagos City'],'FontSize' ,14)
%legend('Asymptomatic cases', 'Symptomatic cases', 'Hospitalised cases', 'Deaths','Cumulative Notified cases','Cumulative Notified cases data')
legend('Cumulative Deaths vs data','Cumulative Notified cases vs data')
xticks([0 10 20 30 40 50])
xticklabels({'16/03','26/03','5/04','15/04','25/04','5/05'})