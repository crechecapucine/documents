#! /bin/bash

# Ceci produit la table des matières à partir d'un fichier .md
# Seuls les niveaux ## et ### seront susceptibles d'apparaître.
#
# * Le niveau # est réservé pour le titre
# * Les niveaux #### et inférieurs sont filtrés et réservés pour les articles
#
# * Les niveaux ### qui doivent apparaître dans la table des matières
#   doivent avoir un numéro de section suivi d'un point '.'
#
#   ### 2. Réunion de fonctionnement
#
# * Les niveaux ## n'apparaîtront que si, eux-mêmes, portent un numéro
#   suivi d'un point '.'.  Cela permet d'éviter d'inclure certaines parties.
#   Par exemple,
#
#   III. Projet pédagogique
#
#   serait formatté comme '**III - Projet pédagogique**'.

grep '^#' $1 | fgrep -v '####' | perl toc.plx
