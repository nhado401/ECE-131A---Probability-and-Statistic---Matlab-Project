%This function simulates a BEC channel

function sendingBit = transmission(input, probability)

for k=1:length(input)
    result = rand();
    
    if(result < probability)
        input(k) = 2; %Assume that when bit is erased, it will be 2
    end
end

sendingBit = input;
end
