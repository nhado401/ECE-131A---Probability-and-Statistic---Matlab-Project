%This function simulates encoding a bit sequence using N single parity code

function encodedSequence = encoding_single_parity(bitSequence)
sum = 0; 

for i=1:length(bitSequence)
    sum = sum + bitSequence(i);
end
                  
appendedBit = mod(sum,2); %Calculate appended bit
encodedSequence = [bitSequence appendedBit]; %Append the calculated bit at the end of sequence
end
