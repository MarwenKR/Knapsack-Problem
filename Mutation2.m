function [ NP ] = Mutation2( a,b )
populationApresCroisement=a;
coeffMutation=b;
sizePop=size(populationApresCroisement);
taillePopulation=sizePop(1);
tailleChromosome=sizePop(2);
nbMutation=round(taillePopulation*coeffMutation);
%nombre de mutation
for i=1:nbMutation
iMutation=randi(taillePopulation);
jMutation=randi(tailleChromosome);
posMutation=[iMutation jMutation];
if (populationApresCroisement(iMutation,jMutation)==0)
populationApresCroisement(iMutation,jMutation)=1;
else
populationApresCroisement(iMutation,jMutation)=0;
end
end
NP=populationApresCroisement;
end