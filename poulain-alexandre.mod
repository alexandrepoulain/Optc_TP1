#------------------------------------------
#
# Poulain Alexandre
#
#------------------------------------------
# Modele de regression lineaire 
# en norme 1 avec gmpl  
#------------------------------------------

#--- Nombre de variables
param N, integer, > 0;
param M, integer, > 0; 

#--- Indices des lignes  
set I := 1..N; 

#--- Indices des colonnes
set J := 1..(M+1); 

#--- Coefficients de la matrice des contraintes 
param Beta{j in J};
param eps{i in I};
param X{i in I, j in J};

#--- Variables de decision
var b{j in J}  ;
var t{i in I} >= 0;

#--- Contraintes du probleme
s.t. lower_bound{i in I}: -(sum{j in J}(Beta[j]*X[i, j]) + eps[i]) + (sum{j in J}(b[j]*X[i, j])) <= t[i];
s.t. upper_bound{i in I}: (sum{j in J}(Beta[j]*X[i, j]) + eps[i]) - (sum{j in J}(b[j]*X[i, j])) <= t[i];


#--- Critere a optimiser: minimiser l'erreur commise
minimize profit: sum{i in I}(t[i]) ;

#--- Commande pour lancer la resolution du probleme ... 
solve; 

##------------------------------------
## Section pour generer un rapport de resolution 
##-------------------------------------------------

printf '\n\n';
printf '#########################################\n';
printf '##  REPORTING \n'; 
printf '##\n'; 

printf "   Optimium objective value : %.2f \n", profit;
printf "   Optimal solution found:\n\n"; 
for{j in J}{
	
	printf '%5s b(%s) = %.2f',' ', j-1, b[j];
	printf "\n";  

}

printf "\n"; 
printf "##\n"; 
printf "##########################################";
printf "\n\n"; 

end;	 
