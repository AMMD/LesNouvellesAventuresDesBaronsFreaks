#!/bin/bash
# Scripts pour synchroniser les nouveaux rushes vidéos vers le disque dur externe
jailDir=""
HDDDir=""

if [ -d $jailDir ]; then

	if [ -d $HDDDir ]; then

		rsync -avz --progress $jailDir"/Rushes/*" $HDDDir"/Rushes/"

		echo -e "Terminé"
	else
		echo "Le dossier "$HDDDir" n'existe pas."
	fi

else
	echo "Le dossier "$jailDir" n'existe pas."
fi
