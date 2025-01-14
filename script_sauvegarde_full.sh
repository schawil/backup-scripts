#!/bin/bash
# Sauvegarde complète de R1 vers S2
R1="/home/schawil/Sauvegardes/R1"
R2="/home/MOCmefire/Sauvegardes/R2/full"
S2_USER="MOCmefire"
S2_IP="37.60.244.227"
DATE=$(date +%Y-%m-%d)

# Sauvegarde complète avec rsync
rsync -avz --delete -e "ssh -p 22222" "$R1/" "$S2_USER@$S2_IP:$R2/backup_full_$DATE"
