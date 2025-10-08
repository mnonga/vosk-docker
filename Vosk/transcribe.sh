#!/bin/bash

# Nom du modèle Vosk (celui que vous avez spécifié)
MODEL_NAME="vosk-model-small-fr-0.22"

echo "Démarrage de la transcription des fichiers MP3 dans le répertoire courant..."

# Parcourir tous les fichiers se terminant par .mp3 (insensible à la casse)
# Le globstar '**/*' permet de parcourir aussi les sous-dossiers si nécessaire (décommenter pour l'activer)
# Pour le répertoire courant uniquement, utilisez simplement '*.mp3'
for mp3_file in *.mp3; do

    # Vérifier si un fichier mp3 existe pour éviter les erreurs si le glob retourne littéralement "*.mp3"
    if [ -f "$mp3_file" ]; then
        
        # 1. Extraire le nom de base du fichier sans l'extension (.mp3)
        #    Exemple: 'Cours 12.mp3' devient 'Cours 12'
        base_name=$(basename "$mp3_file" .mp3)
        
        # 2. Construire le nom du fichier de sortie .txt
        output_file="${base_name}.txt"

        echo "--------------------------------------------------------"
        echo "Traitement de : $mp3_file"
        echo "Fichier de sortie : $output_file"
        
        # 3. Exécuter la commande de transcription
        vosk-transcriber -i "$mp3_file" -o "$output_file" -n "$MODEL_NAME"
        
        # Vérifier le statut de la commande précédente
        if [ $? -eq 0 ]; then
            echo "✅ Transcription de '$mp3_file' terminée avec succès."
        else
            echo "❌ ERREUR lors de la transcription de '$mp3_file'."
        fi
    fi
done

echo "--------------------------------------------------------"
echo "Traitement terminé. Les fichiers .txt sont dans ce répertoire."