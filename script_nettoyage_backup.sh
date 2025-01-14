#!/bin/bash
# Nettoyage des anciennes sauvegardes sur S2
DIFF_DIR="/home/MOCmefire/Sauvegardes/R2/diff"
FULL_DIR="/home/MOCmefire/Sauvegardes/R2/full"
S2_USER="MOCmefire"
S2_IP="37.60.244.227"

# Supprimer les sauvegardes différentielles de plus de 7 jours
ssh -p 22222 "$S2_USER@$S2_IP" "find $DIFF_DIR -type d -name 'backup_diff_*' -mtime +7 -exec rm -r {} \;"

# Supprimer les sauvegardes complètes hebdomadaires de plus de 4 semaines
ssh -p 22222 "$S2_USER@$S2_IP" "find $FULL_DIR -type d -name 'backup_full_*' -mtime +28 -exec rm -r {} \;"

# Supprimer les sauvegardes complètes mensuelles de plus de 6 mois
ssh -p 22222 "$S2_USER@$S2_IP" "find $FULL_DIR -type d -name 'backup_full_*' -mtime +180 -exec rm -r {} \;"

# Vérification de l'état final
echo "Nettoyage terminé avec succès."
