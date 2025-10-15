#!/bin/bash

# Script pour compter les lignes de code (LOC) dans un dossier et ses sous-dossiers.

# Vérifier si un dossier est passé en argument
if [ -z "$1" ]; then
    echo "Usage : $0 <chemin_du_dossier>"
    exit 1
fi

DOSSIER="$1"

# Vérifier si le dossier existe
if [ ! -d "$DOSSIER" ]; then
    echo "Erreur : le dossier '$DOSSIER' n'existe pas."
    exit 1
fi

echo "Comptage des lignes de code dans : $DOSSIER"
echo "-------------------------------------------"

# Compter les lignes de tous les fichiers de code (ex : .c, .cpp, .py, .java, .js, etc.)
# Vous pouvez ajuster la liste des extensions selon vos besoins
find "$DOSSIER" -type f \( -name "*.c" -o -name "*.cpp" -o -name "*.h" -o -name "*.py" -o -name "*.java" -o -name "*.js" -o -name "*.sh" \) \
    -exec wc -l {} + | sort -n
