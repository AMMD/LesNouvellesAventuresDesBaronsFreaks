#!/bin/bash
######## ENV
VIDSRC="VideosSources"
EP="Episode"
SKEL="Skel"

######## TITRE
echo -e "Quel est le titre du ciné-concert ? (sans espace ni caractère spécial)"
read line
TITRE=$line
echo -e "Le titre est "$TITRE
mkdir $TITRE
cp $SKEL/$SKEL.sh $TITRE/

####### EPISODES
echo -e "\n\n------\nEPISODES STANDARDS"
i=0
while [ $i -le 6 ]
do	
	echo -e "L'épisode "$i" est-il joué ? (o/n)"
	read line
	if [ $line = "o" ]
	then
		ln -sn $VIDSRC/$EP"_"$i $TITRE/$EP"_"$i
		echo -e "i\n\n ### PIPELINE_BF $i \n" >> $TITRE/$SKEL.sh
		cat $SKEL/$SKEL"_"$EP"_"$i >> $TITRE/$SKEL.sh
		echo -e "\n ### PIPELINE_AF $i \n" >> $TITRE/$SKEL.sh
	
	fi
	i=$(echo "$i+1"|bc)
done

echo -e "Récapitulatif des épisodes joués :"
ls $TITRE |grep Episode

echo -e "\n ------\n Episodes Non Standards"

echo -e "Faut-il ajouter un épisode non standard ?"
j=0
while read line
do
	if [ $line = "n" ]
		then break
	else
		echo -e "Indique le chemin vers ton fichier Script"
		while read line2
		do
			if [ -e $line2 ]
				then echo -e "Fichier $line2 trouvé"
				break
			else
				echo -e "Fichier non trouvé"
				echo -e "Indique le chemin vers ton fichier"
			fi
		done
		echo -e "Indique à quel endroit tu veux l'insérer"
		echo "Là, je crééerais les chemins et scripts"
	fi

	echo -e "Faut-il ajouter un épisode non standard ?"
	j=$(echo "$j+1"|bc)
done

