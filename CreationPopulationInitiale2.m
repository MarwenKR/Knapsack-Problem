function M = CreationPopulationInitiale2( a, b )
tailleChromosome=a;
coeffTaillePopulationTailleChromosome=b;
taillePopulation=tailleChromosome*coeffTaillePopulationTailleChromosome;
for i= 1:taillePopulation
for j=1:tailleChromosome
if (rand < 0.5)
M(i,j)=0;
else
M(i,j)=1;
end
end
end
end