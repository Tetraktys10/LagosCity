function dydt = seir_eq_v2_beta2(t,y,k,p,gammaa,gammas,gammah,mus,muh,psi,alpha,q,xi,b1)  %(S E Iu Ia Is Ih Ru Rh D Nc)


    
   if t<15
       beta1 = 2.86e-07;%  (2.581e-07, 3.139e-07)
       psi =     0.75;%  (0.529, 0.9829) 559
       beta2 =   8.535e-08;%  (-1.424e-07, 3.131e-07)
       beta3 =   5.407e-08;%  (4.508e-08, 6.306e-08)
       beta4 =   3.376e-07;%  (3.079e-07, 3.672e-07)
       b1=0;
       psi1=psi;
      psi2=psi;
      psi3=psi;
      psi4=psi;
c=[1 1 1 1;1 1 1 1;1 1 1 1;1 1 1 1];
   elseif t>=15&&t<55
       beta1=0.44*2.86e-07;%0.4
       beta2=0.95*8.535e-08;%0.32
       beta3=0.43*5.407e-08;%0.43
       beta4=0.01*3.376e-07;
 %     beta=beta2*beta1;%
      psi =     0.95;%  
      b1=0.05;
      psi1=psi;
      psi2=0.7;
      psi3=psi;
      psi4=0.97;
%  psi=ppsi;
%  b1=bb1;
      %c=[1 0 0 0;0 1 0 0;0 0 1 0;0 0 0 1];
      c=[1 1 1 1;1 1 1 1;1 1 1 1;1 1 1 1];
   elseif t>=55&&t<85
       beta1 = 2.86e-07;%  (2.581e-07, 3.139e-07)
       psi =     0.85;%  (0.529, 0.9829) 559
       beta2 =   8.535e-08;%  (-1.424e-07, 3.131e-07)
       beta3 =   5.407e-08;%  (4.508e-08, 6.306e-08)
       beta4 =   3.376e-07;%  (3.079e-07, 3.672e-07)
       b1=0;
       psi1=psi;
      psi2=psi;
      psi3=psi;
      psi4=psi;
      c=[0 0 0 0;0 0 0 0;0 0 0 0;1 1 1 1];
   else 
       beta1=1.45e-07;
       beta2=1.5e-07;
       beta3=1.2e-07;
       beta4=1.55e-07;
       beta=beta1;%
       c=[1 1 1 1;1 1 1 1;1 1 1 1;1 1 1 1];
       psi1=psi;
      psi2=psi;
      psi3=psi;
      psi4=psi;
   end

% beta=beta1;

%Mainland

    dydt1 = - c(1,1)*beta1*y(1)*(y(3)+alpha*y(4)+xi*y(5)) - c(1,2)*beta1*y(1)*(y(13)+alpha*y(14)+xi*y(15)) - c(1,3)*beta1*y(1)*(y(23)+alpha*y(24)+xi*y(25)) - c(1,4)*beta1*y(1)*(y(33)+alpha*y(34)+xi*y(35));%S
    dydt2 = c(1,1)*beta1*y(1)*(y(3)+alpha*y(4)+xi*y(5)) + c(1,2)*beta1*y(1)*(y(13)+alpha*y(14)+xi*y(15)) + c(1,3)*beta1*y(1)*(y(23)+alpha*y(24)+xi*y(25)) + c(1,4)*beta1*y(1)*(y(33)+alpha*y(34)+xi*y(35))-k*y(2)-b1*y(2);%E
    dydt3 = p*k*y(2)-q*y(3);%Iu
    dydt4 = (1-p)*k*y(2)-gammaa*y(4);%Ia
    dydt5 = q*(1-psi1)*y(3)-(gammas+mus)*y(5);%Is
    dydt6 = q*psi1*y(3)+b1*y(2)-(gammah+muh)*y(6);%Ih
    dydt7 = gammaa*y(4)+gammas*y(5);%Ru
    dydt8 = gammah*y(6);%Rh
    dydt9 = mus*y(5)+muh*y(6);%D-y(9)
    dydt10 = q*psi1*y(3); %Nc notified cases

%Mushin

    dydt11 = - c(2,1)*beta2*y(11)*(y(3)+alpha*y(4)+xi*y(5)) - c(2,2)*beta2*y(11)*(y(13)+alpha*y(14)+xi*y(15)) - c(2,3)*beta2*y(11)*(y(23)+alpha*y(24)+xi*y(25)) - c(2,4)*beta2*y(11)*(y(33)+alpha*y(34)+xi*y(35));%S
    dydt12 = c(2,1)*beta2*y(11)*(y(3)+alpha*y(4)+xi*y(5)) + c(2,2)*beta2*y(11)*(y(13)+alpha*y(14)+xi*y(15)) + c(2,3)*beta2*y(11)*(y(23)+alpha*y(24)+xi*y(25)) + c(2,4)*beta2*y(11)*(y(33)+alpha*y(34)+xi*y(35))-k*y(12)-b1*y(12);%
    dydt13 = p*k*y(12)-q*y(13);%Iu
    dydt14 = (1-p)*k*y(12)-gammaa*y(14);%Ia
    dydt15 = q*(1-psi2)*y(13)-(gammas+mus)*y(15);%Is
    dydt16 = q*psi2*y(13)+b1*y(12)-(gammah+muh)*y(16);%Ih
    dydt17 = gammaa*y(14)+gammas*y(15);%Ru
    dydt18 = gammah*y(16);%Rh
    dydt19 = mus*y(15)+muh*y(16);%D -y(19)
    dydt20 = q*psi2*y(15);%NC
    
%Alimosho

    dydt21 = - c(3,1)*beta3*y(21)*(y(3)+alpha*y(4)+xi*y(5)) - c(3,2)*beta3*y(21)*(y(13)+alpha*y(14)+xi*y(15)) - c(3,3)*beta3*y(21)*(y(23)+alpha*y(24)+xi*y(25)) - c(3,4)*beta3*y(21)*(y(33)+alpha*y(34)+xi*y(35));%
    dydt22 = c(3,1)*beta3*y(21)*(y(3)+alpha*y(4)+xi*y(5)) + c(3,2)*beta3*y(21)*(y(13)+alpha*y(14)+xi*y(15)) + c(3,3)*beta3*y(21)*(y(23)+alpha*y(24)+xi*y(25)) + c(3,4)*beta3*y(21)*(y(33)+alpha*y(34)+xi*y(35))-k*y(22)-b1*y(22);%
    dydt23 = p*k*y(22)-q*y(23);%Iu
    dydt24 = (1-p)*k*y(22)-gammaa*y(24);%Ia
    dydt25 = q*(1-psi3)*y(23)-(gammas+mus)*y(25);%Is
    dydt26 = q*psi3*y(23)+b1*y(22)-(gammah+muh)*y(26);%Ih 
    dydt27 = gammaa*y(24)+gammas*y(25);%Ru
    dydt28 = gammah*y(26);%Rh
    dydt29 = mus*y(25)+muh*y(26);%D -y(29)
    dydt30 = q*psi3*y(25);%NC

%Rest

    dydt31 = - c(4,1)*beta4*y(31)*(y(3)+alpha*y(4)+xi*y(5)) - c(4,2)*beta4*y(31)*(y(13)+alpha*y(14)+xi*y(15)) - c(4,3)*beta4*y(31)*(y(23)+alpha*y(24)+xi*y(25)) - c(4,4)*beta4*y(31)*(y(33)+alpha*y(34)+xi*y(35));%
    dydt32 = c(4,1)*beta4*y(31)*(y(3)+alpha*y(4)+xi*y(5)) + c(4,2)*beta4*y(31)*(y(13)+alpha*y(14)+xi*y(15)) + c(4,3)*beta4*y(31)*(y(23)+alpha*y(24)+xi*y(25)) + c(4,4)*beta4*y(31)*(y(33)+alpha*y(34)+xi*y(35))-k*y(22)-b1*y(22);%
    dydt33 = p*k*y(32)-q*y(33);%Iu
    dydt34 = (1-p)*k*y(32)-gammaa*y(34);%Ia
    dydt35 = q*(1-psi4)*y(33)-(gammas+mus)*y(35);%Is
    dydt36 = q*psi4*y(33)+b1*y(32)-(gammah+muh)*y(36);%Ih 
    dydt37 = gammaa*y(34)+gammas*y(35);%Ru
    dydt38 = gammah*y(36);%Rh
    dydt39 = mus*y(35)+muh*y(36);%D -y(39)
    dydt40 = q*psi4*y(35);%NC
    
    dydt = [dydt1; dydt2; dydt3; dydt4; dydt5; dydt6; dydt7; dydt8; dydt9; dydt10; dydt11; dydt12; dydt13; dydt14; dydt15; dydt16; dydt17; dydt18; dydt19; dydt20; dydt21; dydt22; dydt23; dydt24; dydt25; dydt26; dydt27; dydt28; dydt29; dydt30; dydt31; dydt32; dydt33; dydt34; dydt35; dydt36; dydt37; dydt38; dydt39; dydt40];
    
end