function [maxVal, maxIndex] = myAbsMax(number_array)
% Given a 1D array, find the number with the maximum magnitude and its
% index inside the array
maxVal = -1;
maxIndex = -1;
for numberIndex = 1:length(number_array)
    current = abs(number_array(numberIndex));
    if current > maxVal
        maxVal = current;
        maxIndex = numberIndex;
    end
end