function HW2_Problem6(numberOfTries) 
%{
1. Define 2 space. one is probability of 0.15 and the other is probability
   of 0.1
2. Define Y. Each index of Y means the price by number of pages.
3. Define cost to add each price of try
4. Select a number between 1 to 10. CDF of space1 is 0.6 and CDF of space2 is 0.4
   It means a number between 1 and 6 is a number in space1, between 7
   and 10 is a number in space2
5. After selecting which space will use, shuffle selected space and select first
   number. this is the number of pages for fax
%}

space1 = [1, 2, 3, 4];
space2 = [5, 6, 7, 8];
Y = [100, 190, 270, 340, 400, 500, 500, 500, 500, 500 ];
cost = 0;

for i = 1:numberOfTries
    %Generate 1 number between 1 an 10
    selectedNum = randi(10,1,1);
    
    %randperm is a function for shuffle
    if(selectedNum <= 6)
        numberOfPages = space1(randperm(4));
    else
        numberOfPages = space2(randperm(4));
    end
    cost = cost + Y(numberOfPages(1));
end
exepectationVal = cost / numberOfTries;
disp(exepectationVal);    
end
