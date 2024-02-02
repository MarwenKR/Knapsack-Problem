function [ NP ] = Croisement2( a, b )
populationApresSelection=a;
coeffCroisement=b;
sizePop=size(populationApresSelection);
taillePopulation=sizePop(1);
tailleChromosome=sizePop(2);
z=round(taillePopulation* coeffCroisement);
%nombre de croisements
NP=[populationApresSelection];
for i=1:z
indice=i;
indicePere=randi(taillePopulation);
indiceMere=randi(taillePopulation);
Pere=populationApresSelection(indicePere,:);
Mere=populationApresSelection(indiceMere,:);
pointCroisement=randi(tailleChromosome);
Fils1=[Pere(1:pointCroisement),Mere(pointCroisement+1:tailleChromosome)];
Fils2=[Mere(1:pointCroisement),Pere(pointCroisement+1:tailleChromosome)];
NP=[NP;Fils1;Fils2];
end
end