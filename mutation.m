%mutation function
function [c] = mutation(indiv1)
mutationRate=0.015;
for i=1:60
    x=rand;
    if x<mutationRate
        a=randi([0 1],1,1);
        indiv1(i)=a;
    end
end
c=p;
end
