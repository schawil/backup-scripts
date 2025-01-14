#!/bin/bash
# Sauvegarde différentielle de R1 vers S2
R1="/home/schawil/Sauvegardes/R1"
R2="/home/MOCmefire/Sauvegardes/R2/diff"
FULL_BACKUP_DIR="/home/MOCmefire/Sauvegardes/R2/full"
S2_USER="MOCmefire"
S2_IP="37.60.244.227"
DATE=$(date +%Y-%m-%d)

# Récupérer la dernière sauvegarde complète depuis le serveur distant
LAST_FULL=$(ssh -p 22222 "$S2_USER@$S2_IP" "ls -td $FULL_BACKUP_DIR/backup_full_* | head -n 1")

# Vérification si une sauvegarde complète est trouvée
if [ -z "$LAST_FULL" ]; then
    echo "Erreur : Aucune sauvegarde complète trouvée sur le serveur distant."
    exit 1
fi

# Sauvegarde différentielle avec rsync en utilisant la dernière sauvegarde complète comme référence
rsync -avz --delete --link-dest="$LAST_FULL" -e "ssh -p 22222" "$R1/" "$S2_USER@$S2_IP:$R2/backup_diff_$DATE"
