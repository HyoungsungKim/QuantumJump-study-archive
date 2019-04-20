%{
1. Generate X vector that have 10 boats which are distributed by gaussian
   distribution
2. Simulate 10,000 times
3. If arrival time of the winning boat is less than 25, add to sumOfYj
4. After fisning simulation, divide by 10,000
%}

function HW3_Problem6()
sumOfYj = 0;
for j = 1:10000
xVec = normrnd(35,5,[1 10]);
sumOfYj = sumOfYj + (min(xVec) <= 25);
end
sumOfYj/10000
end

