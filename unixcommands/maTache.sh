#!/bin/bash


mkdir -p "~/exec"
if [ "$#" -eq 1 ]; then
	if [ -d $1 ]; then
		echo "C'est un dossier"
		sum=0
		for file in "$1"/*; do
			if [ -x "$file" ]; then
				echo "$file : Fichier executable"
				echo $(ls -l "$file"| cut -d' ' -f5)
				filename=$(basename "$file")
				sum=$((sum+1))
				mv "$file" ~/exec/"$filename"
			fi
		done

	else 
		echo "Ce n'est pas un dossier"
	fi
else 
	echo "Trop ou pas assez d'arguments"
fi  

echo "Nombre de fichier exectubales: $sum"
