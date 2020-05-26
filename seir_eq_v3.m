function dydt = seir_eq_v3(t,y,beta1,c,k,p,gammaa,gammas,gammah,mus,muh1,muh2,muh3,alpha,q,ps,ppsi1,ppsi2,ppsi3,bbeta2,xxi,bb1)  %(S E Iu Ia Is Ih Ru Rh D Nc)
    

   if t<15
       beta2 =      0.7997;%  (-0.1065, 1.706)
       psi1 =      0.8558;%  (-1.457, 3.169)
       psi2 =      0.7001;%  (-0.6266, 2.027)
       psi3 =         0.6;%  (fixed at bound)
       xi =      0.3037;%  (-10.32, 10.92)       
       beta=beta2*beta1;
       a1=1;
       b1=0;
   elseif t>=15&&t<37
       
       beta2 =      0.5;%0.4974;%  (-1.657, 2.652)
       psi1 =      0.9968;%  (0.4334, 1.56)
       psi2 =      0.9311;%  (0.2177, 1.644)
       psi3 =      0.9892;%  (-3.247, 5.225)
       xi =      0.30;%  (-187.1, 187.7)
       b1 =0.03;

      beta=beta2*beta1;%
      a1=1;
      
   elseif t>=37&&t<51
       
%        beta2 =      0.1;%  (-0.1065, 1.706)
%        psi1 =      0.9968;%  (0.4334, 1.56)
%        psi2 =      0.95;%  (0.2177, 1.644)
%        psi3 =      0.99;%  (-3.247, 5.225)
%        xi =      0.30;%  (-10.32, 10.92)  
%        b1=0.5;
%        
       
       b1 =      0.1999;%
       beta2 =      0.2009;%
       psi1 =      0.9797;%
       psi2 =      0.9984;%
       psi3 =      0.9008;%
       xi =        0.25;%
       
%        beta2 =  bbeta2;
%        psi1 =   ppsi1;%  
%        psi2 =   ppsi2;%  
%        psi3 =   ppsi3;%  
%        xi =     xxi;%    
%        b1=bb1;
       
       beta=beta2*beta1;%
       a1=1;
       
   else      
       beta2 =      0.7997;%  (-0.1065, 1.706)
%        psi1 =      0.8558;%  (-1.457, 3.169)
%        psi2 =      0.7001;%  (-0.6266, 2.027)
%        psi3 =         0.6;%  (fixed at bound)
       psi1 =     0.9;% 0.9;%  (-1.457, 3.169)
       psi2 =     0.9;% 0.9;%  (-0.6266, 2.027)
       psi3 =     0.9;%    0.9;%  (fixed at bound)
       xi =      0.3037;%  (-10.32, 10.92)       
       beta=beta2*beta1;
       a1=1;
       b1=0.8;
       

   end

       f=0;
       g=0;
    
    %0-14
    dydt1 = - c(1,1)*beta*y(1)*(y(3)+alpha*y(4)+a1*xi*y(5))-c(2,1)*beta*y(1)*(y(13)+0.92*934000*g+alpha*(y(14)+0.92*934000*f)+a1*xi*y(15))-c(3,1)*beta*y(1)*(y(23)+0.08*934000*g+alpha*(y(24)+0.08*934000*f)+a1*xi*y(25));%
    dydt2 = c(1,1)*beta*y(1)*(y(3)+alpha*y(4)+a1*xi*y(5))+c(2,1)*beta*y(1)*(y(13)+0.92*934000*g+alpha*(y(14)+0.92*934000*f)+a1*xi*y(15))+c(3,1)*beta*y(1)*(y(23)+alpha*y(24)+a1*xi*y(25))-k*y(2)-b1*y(2);%
    dydt3 = p*k*y(2)-q*y(3);%Iu
    dydt4 = (1-p)*k*y(2)-gammaa*y(4);%Ia
    dydt5 = q*(1-psi1)*y(3)-(gammas)*y(5);%Is
    dydt6 = q*psi1*y(3)+b1*y(2)-(gammah+muh1)*y(6);%Ih
    dydt7 = gammaa*y(4)+gammas*y(5);%Ru
    dydt8 = gammah*y(6);%Rh
    dydt9 = muh1*y(6);%D -y(9)
    dydt10 = q*psi1*y(5);%NC
    
    %15-59
    dydt11 = - c(1,2)*beta*y(11)*(y(3)+alpha*y(4)+a1*xi*y(5))-c(2,2)*beta*y(11)*(y(13)+0.92*934000*g+alpha*(y(14)+0.92*934000*f)+a1*xi*y(15))-c(3,2)*beta*y(11)*(y(23)+0.08*934000*g+alpha*(y(24)+0.08*934000*f)+a1*xi*y(25));%
    dydt12 = c(1,2)*beta*y(11)*(y(3)+alpha*y(4)+a1*xi*y(5))+c(2,2)*beta*y(11)*(y(13)+0.92*934000*g+alpha*(y(14)+0.92*934000*f)+a1*xi*y(15))+c(3,2)*beta*y(11)*(y(23)+0.08*934000*g+alpha*(y(24)+0.08*934000*f)+a1*xi*y(25))-k*y(12)-b1*y(12);%
    dydt13 = p*k*y(12)-q*y(13);%Iu
    dydt14 = (1-p)*k*y(12)-gammaa*y(14);%Ia
    dydt15 = q*(1-psi2)*y(13)-(gammas+mus)*y(15);%Is
    dydt16 = q*psi2*y(13)+b1*y(12)-(gammah+muh2)*y(16);%Ih
    dydt17 = gammaa*y(14)+gammas*y(15);%Ru
    dydt18 = gammah*y(16);%Rh
    dydt19 = mus*y(15)+muh2*y(16);%D -y(19)
    dydt20 = q*psi2*y(15);%NC
    
    %60+
    dydt21 = - c(1,3)*beta*y(21)*(y(3)+alpha*y(4)+a1*xi*y(5))-c(2,3)*beta*y(21)*(y(13)+0.92*934000*g+alpha*(y(14)+0.92*934000*f)+a1*xi*y(15))-c(3,3)*beta*y(21)*(y(23)+0.08*934000*g+alpha*(y(24)+0.08*934000*f)+a1*xi*y(25));%
    dydt22 = c(1,3)*beta*y(21)*(y(3)+alpha*y(4)+a1*xi*y(5))+c(2,3)*beta*y(21)*(y(13)+0.92*934000*g+alpha*(y(14)+0.92*934000*f)+a1*xi*y(15))+c(3,3)*beta*y(21)*(y(23)+0.08*934000*g+alpha*(y(24)+0.08*934000*f)+a1*xi*y(25))-k*y(22)-b1*y(22);%
    dydt23 = ps*k*y(22)-q*y(23);%Iu
    dydt24 = (1-ps)*k*y(22)-gammaa*y(24);%Ia
    dydt25 = q*(1-psi3)*y(23)-(gammas+mus)*y(25);%Is
    dydt26 = q*psi3*y(23)+b1*y(22)-(gammah+muh3)*y(26);%Ih 
    dydt27 = gammaa*y(24)+gammas*y(25);%Ru
    dydt28 = gammah*y(26);%Rh
    dydt29 = mus*y(25)+muh3*y(26);%D -y(29)
    dydt30 = q*psi3*y(25);%NC
    
    
    dydt = [dydt1; dydt2; dydt3; dydt4; dydt5; dydt6; dydt7; dydt8; dydt9; dydt10; dydt11; dydt12; dydt13; dydt14; dydt15; dydt16; dydt17; dydt18; dydt19; dydt20; dydt21; dydt22; dydt23; dydt24; dydt25; dydt26; dydt27; dydt28; dydt29; dydt30];
    
end


 
