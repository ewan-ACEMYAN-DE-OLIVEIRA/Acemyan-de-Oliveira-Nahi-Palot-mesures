#!/bin/bash

# Définir le dossier cible (par défaut le dossier courant si aucun argument n'est fourni)
TARGET_DIR="${1:-.}"

if [ ! -d "$TARGET_DIR" ]; then
    echo "Erreur : Le dossier '$TARGET_DIR' n'existe pas."
    exit 1
fi

# Utilisation de find pour ignorer les dossiers cachés (ex: .git, .vscode)
# et compter les lignes avec wc -l
find "$TARGET_DIR" \
    -not -path '*/.*' \
    -type f \
    -exec wc -l {} + 2>/dev/null | tail -n 1 | awk '{print "Total général : " $1 " lignes"}'
