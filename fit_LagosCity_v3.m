function SOL=fit_LagosCity_v3(bbeta2,ppsi1,ppsi2,ppsi3,bb1,xxi,x)%   mus,muh1,muh2,muh3    beta2,xi,psi1,psi2,psi3    ppsi1,ppsi2,ppsi3   bbeta2,ppsi1,ppsi2,ppsi3,bb1,xxi


%main model %(S E Iu Ia Is Ih Ru Rh D Nc)
%y0= [1897665 0 0 0 0 0 0 0 0 0 3789709-9 1 4 2 2 0 0 0 0 2  230555-4 1 1 1 1 0 0 0 0 1];
y0= [1897665 0 0 0 0 0 0 0 0 0 3789709-24 9 3 6 3 3 0 0 0 3  230555-5 1 1 1 1 1 0 0 0 1];
y0= [1897665 0 0 0 0 0 0 0 0 0 3789709-24 30 10 6 5 3 0 0 0 3 230555-5 9 3 6 3 1 0 0 0 1]; 

%scenarios
%y0= [1.7478e+06    235    23.16    10    25    0         0         0         0    11    5.8138e+06    781.3    77    31    64    14    0     0         0    34    1.4852e+06    200    20    8    10    10         0         0         0    15 0 0 0 0 0 0];

tspan=[0 55];

%define the parameters
%not everyone self-isolate and, of those who do, not everyone calls the number

%From calibration

         beta1 =   3e-07;%


       
% mus = 0;            %mortality rate of symptomatic people
% muh1 = 0;    %mortality rate of hospitalised people in ICU (0-14): 5% of hospitalised require critical care, of which 50% will die
% muh2 = 0.0008;   %mortality rate of hospitalised people in ICU (15-59): 5.4% of hospitalised require critical care, of which 50% will die
% muh3 = 0.005;%mortality rate of hospitalised people in ICU (60+): 47.2% of hospitalised require critical care, of which 50% will die

%        muh1 =   4.313e-06;%  (-0.08586, 0.08587)
%        muh2 =   0.0007623;%  (-0.2139, 0.2154)
%        muh3 =    0.005271;%  (-0.9748, 0.9853)
%        mus =     0.005534;%  (-0.1412, 0.1522)
% 
%        muh1 =   4.313e-06;%  (-0.08586, 0.08587)
%        muh2 =   0.00007623;%  (-0.2139, 0.2154)
%        muh3 =    0.0005271;%  (-0.9748, 0.9853)
%        mus =     0.0005534;%  (-0.1412, 0.1522)       
       
              
%        ppsi1=1;
%        ppsi2=1;
%        ppsi3=1;
%        xxi=1;
       

c = [1.8000    0.6598    1.0269;   1.3219    0.7800    2.1558;   0.1279    0.1324    0.4700]; %contacts adjusted from Melegaro et al.
alpha = 0.5;        %reduction of infectiousness from asymptomatic people 50%
k = 1/4.6;          %progression from exposed to infectious initial stage, 4.6 days
q = 1/2.9;          %time where the symptomatic case remains undetected and where the asymptomatic case remains mixed with the symptomatic before moving to its own compartment
p = 0.5;            %probability of being symptomatic 
ps=0.5;            %probability of being symptomatic in the 60+ age group
gammaa= 1/6.5;      %recovery rate, infectious period = 1/6.5 where 6.5 days is the mean infectiousness time
gammas= 1/5.1;      %recovery rate, infectious period = 1/6.5 where 6.5 days is the mean infectiousness time
gammah = 1/7;    %recovery rate, infectious period = 1/10.4 where 10.4 is the mean hospitalization period

%        bbeta2=0.2;
%        ppsi1=0.9;
%        ppsi2=0.9;
%        ppsi3=0.9;
%        xxi=0;
%        bb1=0;

       muh1 =       8e-06;%  (fixed at bound)
       muh2 =   2.505e-14;%  (fixed at bound)
       muh3 =   0.0003078;%  (fixed at bound)
       mus =    0.006469;%  (0.006194, 0.006744)

%main model
[t,y] = ode45(@(t,y) seir_eq_v3(t,y,beta1,c,k,p,gammaa,gammas,gammah,mus,muh1,muh2,muh3,alpha,q,ps,ppsi1,ppsi2,ppsi3,bbeta2,xxi,bb1),tspan,y0);


%SOL = zeros(size(years, 1), size(years, 2));
 SOL = zeros(size(x, 1), size(x, 2));
% %Fill the output matrix
    for r=1:size(SOL,1)
        for c=1:size(SOL,2)
           SOL(r,c) = interp1q(t,y(:,10)+y(:,20)+y(:,30),x(r, c));  %deaths       y(:,10)+y(:,20)+y(:,30) %notifications
        end
    end

end