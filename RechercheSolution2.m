function [solution,profitSolution,poidsSolution]=RechercheSolution2(a,b,c,d,f,g,h,k )
profit=a;
poids=b;
poidsSac=c;
coeffTaillePopulationTailleChromosome=d;
coefSelection=f;
coeffCroisement=g;
coeffMutation=h;
nbIterations=k;
tailleChromosome=length(profit);
%=le nombre d'objets 
populationInitiale=CreationPopulationInitiale2(tailleChromosome,coeffTaillePopulationTailleChromosome);
population=populationInitiale;
poidsSolution=poidsSac+5;
while(poidsSolution>poidsSac)
for i=1:nbIterations
populationApresSelection=SelectionTournoi(population,profit,poids, poidsSac,coefSelection);
populationApresCroisement=Croisement2(populationApresSelection,coeffCroisement);
populationApresMutation=Mutation2(populationApresCroisement,coeffMutation);
population=populationApresMutation;
end
populationFinale=SelectionTournoi(population,profit,poids,poidsSac,coefSelection)
sizePop=size(populationFinale);
taillePopulationFinale=sizePop(1);
i=1;
sol=populationFinale(i,:)
poidsSol=sol*poids'
while ((i<taillePopulationFinale)&&(poidsSol>poidsSac))
i=i+1;
sol=populationFinale(i,:);
poidsSol=sol*poids';
end
solution=sol;
profitSolution=sol*profit';
poidsSolution=sol*poids';
populationFinaleApresCroisement=Croisement2(populationFinale,coeffCroisement);
population=populationFinaleApresCroisement;
end
end