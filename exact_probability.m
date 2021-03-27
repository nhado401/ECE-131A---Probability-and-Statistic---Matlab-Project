%Code Written by Nha Do
%This program generates exact probability of N-Single-Parity code

clc;
clear all;
pe = 0.125:0.025:0.40; %Erasure Probability
P_sin_exact_3 = zeros(1,length(pe));
P_sin_exact_4 = zeros(1,length(pe));
P_sin_exact_5 = zeros(1,length(pe));
for i=1:length(pe)
   P_sin_exact_3(1,i)= 1 - (1-pe(i)).^3 - 3*pe(i)*(1-pe(i)).^2;
   P_sin_exact_4(1,i)= 1 - (1-pe(i)).^4 - 4*pe(i)*(1-pe(i)).^3;
   P_sin_exact_5(1,i)= 1 - (1-pe(i)).^5 - 5*pe(i)*(1-pe(i)).^4;
end

semilogy(pe, P_sin_exact_3,'m--', pe, P_sin_exact_4,'-bo', pe, P_sin_exact_5,'-k*');
grid on
hold on
title("Simulation of Exact Probability in Case of Single Parity Code");
xlabel("Erasure Probability");
ylabel("Exact Probability");
legend('N=3', 'N=4', 'N=5');
