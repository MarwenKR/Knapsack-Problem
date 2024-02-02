function [populationApresSelection]=SelectionTournoi(a,b,c,d,f)
population=a;
profit=b;
poids=c;
poidsSac=d;
coefSelection=f;
sizePop=size(population);
taillePopulation=sizePop(1);
tailleChromosome=sizePop(2);
F=CalculFitness2(population,profit,poids, poidsSac);
NP=[];
populationApresSelection=[];
for i=1:(coefSelection*taillePopulation)
indiceChromo1=randi(taillePopulation);
indiceChromo2=randi(taillePopulation);
F1=F(indiceChromo1);
F2=F(indiceChromo2);
if (F1>F2)
p=rand;
if (p <= 0.7)
NP=[NP;population(indiceChromo1,:)];
else
NP=[NP;population(indiceChromo2,:)];
end
else
p=rand;
if (p <= 0.7)
NP=[NP;population(indiceChromo2,:)];
else
NP=[NP;population(indiceChromo1,:)];
end
end
end
populationApresSelection=NP;
end