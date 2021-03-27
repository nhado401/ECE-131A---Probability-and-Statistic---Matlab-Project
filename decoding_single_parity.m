%This function simulates decoding single parity code

function  decodedSequence = decoding_single_parity(bitSequence)
count = 0;
l = length(bitSequence);
sum1 = 0;
sum2 = 0;
originalSequence = zeros(1,l-1);
for i=1:l
   if(bitSequence(i) == 2) %%Assume that when bit is earased, it will be 2
       temp = i;
       count = count + 1; 
   end
end

%Note that N-single-parity code can only reconstruct 1 erasured bit
if(count == 1)
    %Find the position of erasured bit and reconstruct
    if(bitSequence(l) == 2) 
        for k=1:length(bitSequence)-1
            originalSequence(k) = bitSequence(k);
        end
        decodedSequence = originalSequence;
    else            
        for m=1:temp-1
            sum1 = sum1 + bitSequence(m);
        end

        for n=temp+1:l-1
            sum2 = sum2 + bitSequence(n);
        end    
        bitSequence(temp) = mod(bitSequence(l)+sum1+sum2,2);
        tempSequence = bitSequence; 
               
        for k=1:length(tempSequence)-1
            originalSequence(k) = tempSequence(k);
        end
        decodedSequence = originalSequence; 
    end
elseif(count == 0) %If there is no erasured bit, output the same sequence except the last bit
    for k=1:length(bitSequence)-1 
        originalSequence(k) = bitSequence(k);
    end
        decodedSequence = originalSequence; 
else %If more than 1 bit are erasured, it will be undecodable
    decodedSequence = -1;
end

end
