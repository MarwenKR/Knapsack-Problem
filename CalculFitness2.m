function [Fit]=CalculFitness2(a,b,c, d)
population=a;
profit=b;
poids=c;
poidsSac=d;
sizePop=size(population);
taillePopulation=sizePop(1);
tailleChromosome=sizePop(2);
utilteMax=profit*ones(tailleChromosome,1);
coefPenalisation=utilteMax/2;
F=[];
for i=1:taillePopulation
poidsChromosome=0;
for j=1:tailleChromosome
poidsChromosome=poidsChromosome+population(i,j)*poids(j);
end
if (poidsChromosome>=poidsSac)
fit=0;
for j=1:tailleChromosome
fit=fit+(population(i,j)*profit(j))-(coefPenalisation*(poidsChromosome-poidsSac));
end
else
fit=0;
for j=1:tailleChromosome
fit=fit+(population(i,j)*profit(j));
end
end
F(i)=fit;
end
Fit=F;
end