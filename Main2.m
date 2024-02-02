function [ solutionOptimale,profitSolutionOptimale,poidsSolutionOptimale,tempsExecution,affichObjetSol ] = Main2(k,a,c,d,e,f,g )
kp=k; 
if(kp==1) 
    profit=[5 8 6 3 7 5 2 9 2 7];
    poids=[2 1 1 8 9 3 4 3 6 3];
    poidsSac=27;
end
if(kp==2)
profit=[5 6 7 8 6 4 9 7 8 4];
poids=[10 7 9 8 1 1 7 7 7 3];
poidsSac=20
end
if(kp==3)
profit=[2 1 2 6 10 4 3 10 2 9 8 2 6 6 5 9 8 10 5 8];
poids=[2 7 6 3 1 9 8 8 8 3 5 2 6 3 5 4 9 4 9 3];
poidsSac=58; end
if(kp==4) profit=[1 9 6 4 5 9 7 7 10 1 4 7 8 1 8 10 3 4 2 10];
poids=[8 8 6 10 10 3 1 7 3 6 1 1 6 7 1 8 3 10 6 4];
poidsSac=38; end
if(kp==5)
profit=[4 8 3 9 8 5 3 7 7 8 6 7 7 5 10 2 3 5 8 5 2 7 1 7 5 2 6 10 9 3];
poids=[9 9 10 6 4 7 2 8 1 7 1 3 2 9 2 4 3 8 3 4 10 2 2 3 6 5 5 1 10 3];
poidsSac=86;
end
if(kp==6)
profit=[4 3 6 5 9 2 7 7 8 4 7 4 2 10 4 6 4 10 7 8 9 2 4 6 1 8 9 4 10 2];
poids=[3 4 7 8 7 6 9 9 1 8 10 10 9 1 4 4 8 6 6 6 9 7 5 5 7 10 6 4 6 10];
poidsSac=57;
end
if(kp==7)
profit=[3 2 4 5 9 7 8 5 8 3 6 3 8 9 6 9 3 5 2 8 5 10 5 8 8 1 6 1 3 7 7 5 6 6 3 6 2 8 5 4];
poids=[6 8 7 5 1 4 10 10 3 8 10 7 10 8 8 2 4 5 9 1 3 3 8 4 10 6 7 4 9 7 2 1 3 3 2 10 7 3 4 1];
poidsSac=109;
end
if(kp==8)
    profit=[5 3 3 9 9 4 6 4 10 6 3 5 10 5 3 5 5 4 4 8 9 4 4 1 5 1 8 5 2 3 9 4 3 3 2 2 4 2 2 1];
    poids=[1 10 3 3 1 10 2 3 5 10 8 4 7 1 8 3 7 9 7 8 3 5 1 7 5 7 1 2 2 1 3 4 8 10 7 8 7 7 4 2];
    poidsSac=61;
end
if(kp==9)
profit=[5 1 8 6 10 9 3 7 6 5 6 10 9 1 5 6 2 9 8 6 1 1 8 9 7 6 9 6 8 1 2 4 1 6 8 10 9 9 8 4 3 7 9 5 3 3 5 8 3 7];
poids=[7 10 4 2 6 6 1 7 9 8 6 7 5 1 10 1 7 10 2 3 6 2 1 5 8 8 2 10 1 7 4 3 1 7 6 9 9 10 6 2 6 1 6 1 2 5 2 5 9 3];
poidsSac=146;
end
if(kp==10)
profit=[2 9 8 1 3 2 9 4 5 7 10 9 3 3 7 9 10 4 6 10 3 9 6 8 7 5 1 7 5 10 3 2 2 2 10 7 6 7 2 1 8 4 5 5 1 2 5 6 10 2];
poids=[7 7 2 8 9 6 5 5 1 2 6 10 3 4 3 9 8 10 1 2 10 9 2 2 8 4 4 6 10 9 2 8 7 1 6 6 10 1 6 6 5 5 4 5 1 8 2 3 5 9];
poidsSac=90;
end
coeffTaillePopulationTailleChromosome=a;
coefSelection=c;
coeffCroisement=d;
coeffMutation=e;
nbIterations=f;
nbRepetition=g;
t0=cputime;
matriceSolutions=[];
profitspoidsSolutions=[];
for i=1:nbRepetition
[solution,profitSolution,poidsSolution]=RechercheSolution2(profit,poids,poidsSac,coeffTaillePopulationTailleChromosome,coefSelection,coeffCroisement,coeffMutation,nbIterations);
matriceSolutions=[matriceSolutions;solution];
profitspoidsSolutions=[profitspoidsSolutions;
profitSolution poidsSolution];
end
vecteurProfit=[];
for i=1:nbRepetition
profitSolution=matriceSolutions(i,:)*profit';
vecteurProfit=[vecteurProfit;profitSolution];
end
max=vecteurProfit(1);
iMax=1; for i=1:nbRepetition
if (vecteurProfit(i)>max)
max=vecteurProfit(i);
iMax=i;
end
end
solutionOptimale=matriceSolutions(iMax,:);
profitSolutionOptimale=solutionOptimale*profit';
poidsSolutionOptimale=solutionOptimale*poids';
tempsExecution=cputime -t0; affichObjetSol=[];
for i=1:(length(solutionOptimale))
if (solutionOptimale(i)==1)
affichObjetSol=[affichObjetSol i];
%disp(['Objet : ',num2str(i)])
end
end
%disp(['le temps d''execution est : ',num2str(tempsExecution)])
end

