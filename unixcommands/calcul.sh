#!/bin/bash


nbchiffre=0
nboperateur=0
# Calculs et affichages

if [ "$#" -lt 3 ]; then
    echo "Erreur : il faut au moins 3 arguments (op1 opérateur op2)."
    exit 1
fi


for arg in "$@"; do
    echo "Argument : $arg"
    # Vous pouvez effectuer des opérations ici, par exemple :
    if [[ "$arg" =~ ^-?[0-9]+$ ]]; then
        echo "$arg est un entier."
		if  [ nbchiffre -eq 0 ]; then
			if  [ nboperateur -eq 1 ]; then
				echo "Erreur"
				exit
			else 
				nbchiffre = 1
			fi
		elif [ nboperateur -eq 1];
			if  [ nbchiffre -eq 0 ] then
				echo "Erreur"
				exit
			else 
				nboperateur = 1
			fi
		else 
		
    else
		case $op in
		+)
		if  [ nbchiffre -eq 0 ]; then
		echo "somme $a + $b = $((a + b))"
		nboperateur=1
		else 

		;;
		-)
		if  [ nbchiffre -eq 0 ]; then
		echo "sous $a - $b = $((a - b))"
		nboperateur=1
		;;
		x)
		if  [ nbchiffre -eq 0 ]; then
		echo "mult $a x $b = $((a * b))"
		nboperateur=1
		;;
		/)
		if  [ nbchiffre -eq 0 ]; then
		echo "div $a / $b = $((a / b))"
		nboperateur=1
		;;
		*)
		if [ $nboperateur -eq 1 ] && [ $nboperateur -eq 1 ]; then
			echo "Ordre incorrecte"
			exit
		fi
		
	esac


        echo "$arg n'est pas un entier."
    fi
done




# case $op in 
# 	+)
# 	if  [ nbchiffre -eq 0 ]; then
# 	echo "somme $a + $b = $((a + b))"
# 	nboperateur=1
# 	else 

# 	;;
# 	-)
# 	if  [ nbchiffre -eq 0 ]; then
# 	echo "sous $a - $b = $((a - b))"
# 	nboperateur=1
# 	;;
# 	x)
# 	if  [ nbchiffre -eq 0 ]; then
# 	echo "mult $a x $b = $((a * b))"
# 	nboperateur=1
# 	;;
# 	/)
# 	if  [ nbchiffre -eq 0 ]; then
# 	echo "div $a / $b = $((a / b))"
# 	nboperateur=1
# 	;;
# 	*)
# 	if [ $nboperateur -eq 1 ] && [ $nboperateur -eq 1 ]; then
# 		echo "Ordre incorrecte"
# 		exit
# 	fi
	
# esac

