%COVID-19 Nigeria Districts Model

clear all

data_districts;


%y0=[268270-47 27 5 5 3 2 0 0 0 2 352389-3 0 0 1 1 1 0 0 0 1 2079586 0 0 0 0 0 0 0 0 0 3217684-26 12 2 6 1 1 0 0 0 1]; 
y0=[268270-12 5 1 3 1 2 0 0 0 2 352389-3 0 0 1 1 1 0 0 0 1 2079586 0 0 0 0 0 0 0 0 0 3217684-26 12 2 6 1 1 0 0 0 1]; 
%initialise in 16th March %(S E Iu Ia Is Ih Ru Rh D Nc)

tspan=[0 85];

%define the parameters


%        beta1 =   1.5e-07;
%        beta2 =   0.3;%0.5027;%  (0.3189, 0.3757)
%        xi =     0.2;%  
%        psi = 0.9;%0.5559;%
       
%        beta2 =       0.492;%  (-0.5105, 1.495)
       psi =      0.7;%  (-2.877, 4.311)
       xi =       0.3037;%  (-6.072, 6.616)
       b1=0;

%c = 1;              %contact matrix
alpha = 0.5;        %reduction of infectiousness from asymptomatic people 50%
k = 1/4.6;          %progression from exposed to infectious initial stage, 4.6 days
q = 1/2.9;          %time where the symptomatic case remains unaware of their illness, it's a delay to self-isolation
p = 0.5;           %probability of being symptomatic enough to eventually self-isolate
gammaa= 1/5.1;      %recovery rate asymptomatic, infectious period = 1/6.5 where 6.5 days is the mean infectiousness time
gammas= 1/5.1;      %recovery rate symptomatic, infectious period = 1/6.5 where 6.5 days is the mean infectiousness time
gammah = 1/7;    %recovery rate hospitalised, infectious period = 1/10.4 where 10.4 is the mean hospitalization period
%0.4781;%  (0.2577, 0.6985)         %1/4* hospitalization rate as the percentage of cases that require hospitalization 4.4% multiplied by the hospitalization delay time of 5 days
mus = 0.006469;%           %mortality rate of symptomatic people
muh = 7.505e-5;%  (0.005037, 0.005906)     %mortality rate of hospitalised people: 30% of hospitalised require critical care, of which 50% will die


[t,y] = ode45(@(t,y) seir_eq_v2_beta2(t,y,k,p,gammaa,gammas,gammah,mus,muh,psi,alpha,q,xi,b1),tspan,y0);
%total_notified_cases = 0.5*y(i,5)+y(i,6)+y(i,8);   %50% of infections may not be identified as cases  0.6*y(:,5)+


%%
%PLOTS
figure(01) %(S E Iu Ia Is Ih Ru Rh D Nc)
plot(t,y(:,9)+y(:,19)+y(:,29)+y(:,39),'-', 'LineWidth', 2.5, 'color', 'm')
hold on
plot(t,y(:,10)+y(:,20)+y(:,30)+y(:,40),'-', 'LineWidth', 2.5, 'color', 'c')

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

%%
figure(02) %(S E Iu Ia Is Ih Ru Rh D Nc)
plot(t,y(:,9)+y(:,19)+y(:,29)+y(:,39), 'LineWidth', 2.5, 'color', 'm')
hold on
plot(days2,deaths_cumul, 'o')
set(gca, 'FontSize', 16);
xlabel('Time')
ylabel('Number of deaths')
title(['Deaths in Lagos City'] )
legend('Deaths')
xticks([0 10 20 30 40 50 80])
xticklabels({'16/03','26/03','5/04','15/04','25/04','5/05', '5/06'})

%%
figure(03) %(S E Iu Ia Is Ih Ru Rh D Nc)
plot(t,y(:,9),'-', 'LineWidth', 2.5, 'color', 'm')
hold on
plot(t,y(:,10),'-', 'LineWidth', 2.5, 'color', 'c')

hold on
plot(days,data_mainland, 'o','MarkerSize',8)
hold on
plot(days2,deaths_mainland_cumul, 'o','MarkerSize',8)

set(gca, 'FontSize', 16);
xlabel('Days')
ylabel('Infected cases and deaths since 16th March 2020','FontSize',12)
title(['COVID-19 cases in Lagos Mainland'],'FontSize' ,14)
%legend('Asymptomatic cases', 'Symptomatic cases', 'Hospitalised cases', 'Deaths','Cumulative Notified cases','Cumulative Notified cases data')
legend('Cumulative Deaths vs data','Cumulative Notified cases vs data')
xticks([0 10 20 30 40 50 80])
xticklabels({'16/03','26/03','5/04','15/04','25/04','5/05','5/06'})
%%
figure(04) %(S E Iu Ia Is Ih Ru Rh D Nc)
plot(t,y(:,19),'-', 'LineWidth', 2.5, 'color', 'm')
hold on
plot(t,y(:,20),'-', 'LineWidth', 2.5, 'color', 'c')

hold on
plot(days,data_mushin, 'o','MarkerSize',8)
hold on
plot(days2,deaths_mushin_cumul, 'o','MarkerSize',8)

set(gca, 'FontSize', 16);
xlabel('Days')
ylabel('Infected cases and deaths since 16th March 2020','FontSize',12)
title(['COVID-19 cases in Mushin'],'FontSize' ,14)
%legend('Asymptomatic cases', 'Symptomatic cases', 'Hospitalised cases', 'Deaths','Cumulative Notified cases','Cumulative Notified cases data')
legend('Cumulative Deaths vs data','Cumulative Notified cases vs data')
xticks([0 10 20 30 40 50 80])
xticklabels({'16/03','26/03','5/04','15/04','25/04','5/05','5/06'})
%%
figure(05) %(S E Iu Ia Is Ih Ru Rh D Nc)
plot(t,y(:,29),'-', 'LineWidth', 2.5, 'color', 'm')
hold on
plot(t,y(:,30),'-', 'LineWidth', 2.5, 'color', 'c')

hold on
plot(days,data_alimosho, 'o','MarkerSize',8)
hold on
plot(days2,deaths_alimosho_cumul, 'o','MarkerSize',8)

set(gca, 'FontSize', 16);
xlabel('Days')
ylabel('Infected cases and deaths since 16th March 2020','FontSize',12)
title(['COVID-19 cases in Alimosho'],'FontSize' ,14)
%legend('Asymptomatic cases', 'Symptomatic cases', 'Hospitalised cases', 'Deaths','Cumulative Notified cases','Cumulative Notified cases data')
legend('Cumulative Deaths vs data','Cumulative Notified cases vs data')
xticks([0 10 20 30 40 50 80])
xticklabels({'16/03','26/03','5/04','15/04','25/04','5/05','5/06'})
%%
figure(06) %(S E Iu Ia Is Ih Ru Rh D Nc)
plot(t,y(:,39),'-', 'LineWidth', 2.5, 'color', 'm')
hold on
plot(t,y(:,40),'-', 'LineWidth', 2.5, 'color', 'c')

hold on
plot(days,data_rest, 'o','MarkerSize',8)
hold on
plot(days2,deaths_rest_cumul, 'o','MarkerSize',8)

set(gca, 'FontSize', 16);
xlabel('Days')
ylabel('Infected cases and deaths since 16th March 2020','FontSize',12)
title(['COVID-19 cases in the remaining districts of Lagos City'],'FontSize' ,14)
%legend('Asymptomatic cases', 'Symptomatic cases', 'Hospitalised cases', 'Deaths','Cumulative Notified cases','Cumulative Notified cases data')
legend('Cumulative Deaths vs data','Cumulative Notified cases vs data')
xticks([0 10 20 30 40 50 80])
xticklabels({'16/03','26/03','5/04','15/04','25/04','5/05','5/06'})
%%
figure(07) %(S E Iu Ia Is Ih Ru Rh D Nc)
plot(t,(y(:,3)+y(:,4)+y(:,5)+y(:,6))/268270*100000, 'LineWidth', 2.5, 'color', 'r')
hold on
plot(t,(y(:,13)+y(:,14)+y(:,15)+y(:,16))/352389*100000, 'LineWidth', 2.5, 'color', 'g')
hold on
plot(t,(y(:,23)+y(:,24)+y(:,25)+y(:,26))/2079586*100000, 'LineWidth', 2.5, 'color', 'b')
% hold on
% plot(t,y(:,33)+y(:,34)+y(:,35)+y(:,36)/3217684*100000, 'LineWidth', 2.5, 'color', 'y')
set(gca, 'FontSize', 16);
xlabel('Days')
%ylabel('Populations')
title(['Infections (all types) x100,000'] )
legend('Lagos Mainland','Mushin','Alimosho')%
xticks([0 10 20 30 40 50 80])
xticklabels({'16/03','26/03','5/04','15/04','25/04','5/05','5/06'})

%%
figure(08) %(S E Iu Ia Is Ih Ru Rh D Nc)
plot(t,y(:,9)+y(:,19)+y(:,29)+y(:,39),'--', 'LineWidth', 2.5, 'color', 'm')
hold on
set(gca, 'FontSize', 16);
xlabel('Days')
ylabel('Infected cases and deaths since 16th March 2020','FontSize',12)
title(['Cumulative Deaths in Lagos City'],'FontSize' ,14)
%legend('Asymptomatic cases', 'Symptomatic cases', 'Hospitalised cases', 'Deaths','Cumulative Notified cases','Cumulative Notified cases data')
%legend('Cumulative Deaths')
xticks([0 10 20 30 40 50 80])
xticklabels({'16/03','26/03','5/04','15/04','25/04','5/05','5/06'})
