%% data done
%% initial population done.
%% need to think and include various constants like mutation rate=0.015, uniform_rate=0.5,   etc.
%% call fcm fn on initial pop and store fitness values. fitness is an array of 20 nodes.

%% load data

pop_one = ['100010100111111010001111111101011011101110000001010111110101';'100011100000010110011011110110011111000011000101011000000101';
       '100010100111111010001111111101011011101110000001010111110101';'100011100000010110011011110110011111000011000101011000000101';
       '100010100111111010001111111101011011101110000001010111110101';'100011100000010110011011110110011111000011000101011000000101';
       '100010100111111010001111111101011011101110000001010111110101';'100011100000010110011011110110011111000011000101011000000101';
       '100010100111111010001111111101011011101110000001010111110101';'100011100000010110011011110110011111000011000101011000000101';
       '100010100111111010001111111101011011101110000001010111110101';'100011100000010110011011110110011111000011000101011000000101';
       '100010100111111010001111111101011011101110000001010111110101';'100011100000010110011011110110011111000011000101011000000101';
       '100010100111111010001111111101011011101110000001010111110101';'100011100000010110011011110110011111000011000101011000000101';
       '100010100111111010001111111101011011101110000001010111110101';'100011100000010110011011110110011111000011000101011000000101';
       '100010100111111010001111111101011011101110000001010111110101';'100011100000010110011011110110011111000011000101011000000101'];

     
p =[];  %% mostly unused. check it.
for j=1:20
for i=1:60
    x = randi([0 1],1,1);
    q = int2str(x);
    pop_one(j,i) = q;
end

end
load nnfldata.dat;
fcm = nnfldata;

%% declaring empty variables for the fcm function.

fitness = [];   %% will store the fitness values for each chromosome.
best_fitness = []; %% will store the best fitness value from fitness.
fittest = []; %% will store the best chromosome of each population. 
alpha = []; %% alpha is a chromosome which is broken in 6 parts. It needs to be passed to fitnessFunction and plot fn.
temp = []; %% temp is to create alpha.
%%temp_fittest = []; %% to hold temporarily the best chromosome.
%%temp_best_fittest = []; %% to hold temporarily the best fitness value.

%% calling the fcm function.
%%t=1;
for i =1 : 20
	t=1;
	indiv = pop_one(i,:);
	for j =1:6
		temp = indiv(t:t+9);
		t=t+10;
		alpha = [alpha ; temp];
	end
	fitness = [fitness fitnessFunction(alpha,fcm)];
	alpha = [];
	
end
	[M I] = min(fitness);
	best_fitness = [ best_fitness M];
	fittest = [fittest ; pop_one(I,:)]; 






%% starting GA loop

for i = 1:500
	pop_two = [];

	%% elitism
		%% to carry over the best chromosome from the last generation.
		%% fittest(i) will return the ith best chromosome.
	
	pop_two = [fittest(i)];
	
	%% crossover
		%% we will call the tournament selection in crossover

		for j = 1:20
			indiv1 = tournament_select(pop_one,fitness);
			indiv2 = tournament_select(pop_one,fitness);
			indiv_new = crossover(indiv1,indiv2);
			pop_two = [pop_two;indiv_new];
		end
	
	%% mutation

		for j = 1:20
			mutate(pop_two(j,:));
		end

	%% convert the population in decimal for the fcm fn
	%% call the fcm function.
	%% fcm function will call the fitness function and return the fitness values and best chromosomes.
	%% store the best results.

	for i =1 : 20
		t=1;
		indiv = pop_two(i,:);
		for j =1:6
			temp = indiv(t:t+9);
			t=t+10;
			alpha = [alpha ; temp];
		end
		fitness = [fitness fitnessFunction(alpha,fcm)];
		alpha = [];
		 
	end
		[M I] = min(fitness);
		best_fitness = [ best_fitness M];
		fittest = [fittest ; pop_two(I,:)];



	pop_one = pop_two;
end

%% plot functions
[Mi,In]= min(best_fitness);
best_indiv=fittest(In,:);
t=1;
for j =1:6
			temp = best_indiv(t:t+9);
			t=t+10;
			alpha = [alpha ; temp];
		end
	plot(alpha,fcm);
