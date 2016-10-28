% crossover function
function [c] = crossover(indiv1,indiv2)
uniformRate=0.5;
    p='000000000000000000000000000000000000000000000000000000000000'
    for i=1:60
     x=rand;
     if x<uniformRate
         p(i)=indiv1(i);
     else 
         p(i)=indiv2(i);
     end
       c=p; 
        
    end