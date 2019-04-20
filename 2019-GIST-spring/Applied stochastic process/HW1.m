function HW1()
%{
1. Split parallel circuit layer 1 and layer 2
2. Probablity of failure of closed circuit is 0%
3. Merge serial nodes in parallel circuit
4. Then there is one parallel layer and one node(last node).
%}

layer1 = [0.2, 0.4, 0.3];
layer2 = [0, 0.4, 0];
lastNode = 0.1;
mergedLayer = layer1 + (1 - layer1) .* layer2;
probOfFailureOfAllNodeOfLayer1 = prod(mergedLayer);
%case 1. Fail everynode in merged layer
%case 2. Don't fail in merged layer but fail at last node
%probOfOperation = 1 - (case1 + case2)
probOfOperation = 1 -  (probOfFailureOfAllNodeOfLayer1 + (1 - probOfFailureOfAllNodeOfLayer1)*lastNode);

resultOfRepetitions = [];
for i = 1:10
    th = rand(1,100);
    numOfOperation = sum(probOfOperation >= th);
    resultOfRepetitions = [resultOfRepetitions numOfOperation];
end
disp(resultOfRepetitions);
%output :  84    88    82    83    92    90    88    85    83    90
end