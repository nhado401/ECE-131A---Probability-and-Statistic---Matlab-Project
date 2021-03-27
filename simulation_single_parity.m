%Code Written by Nha Do
%This program simulates the transmission of a sequence of bit using
%N-single parity code 

clc;
clear all;
N = [3,4,5];
probability = 0.125:0.025:0.40; %Erasure Probability 
error = zeros(length(N),length(probability));
P_sin = zeros(length(N),length(probability));
t = 100000; %sample

for n=1:length(N)
    for i=1:length(probability)
        for j=1:t
            input = randi(2,N(n)-1,1)-1; %Generate a sequence of 0 and 1
            encodedSequence = encoding_single_parity(input'); %Encoding input 
            sendingBit = transmission(encodedSequence, probability(i)); %Transmit data
            decodedSequence = decoding_single_parity(sendingBit); %Decoding
            if(decodedSequence == -1)
                error(n,i) = error(n,i) + 1; %Calculate error
                P_sin(n,i) = error(n,i)/100000; %Probability of undecodable
            end
        end
    end
end

semilogy(probability, P_sin(1,:),'m--',probability, P_sin(2,:),'-bo', probability, P_sin(3,:),'-k*');
grid on;
hold on;
title("Simulation of BEC Channel using Single-Parity Code");
xlabel("Erasure Probability");
ylabel("Ratio of Undecodable Data");
legend('N=3', 'N=4', 'N=5');
