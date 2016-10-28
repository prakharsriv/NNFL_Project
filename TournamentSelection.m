%Tournament selection

function [c] = tournament_select(pop_one,fitness)
    x=randperm(20,5);
    pop_temp=pop_one(x,:);
    fit = fitness(x);
    [m,i]=min(fit);
    c = pop_temp(i,:);
end

    
   
    