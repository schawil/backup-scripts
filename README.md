# Scripts de Sauvegarde et Nettoyage

Ce dépôt contient des scripts Bash permettant d'automatiser la sauvegarde complète, la sauvegarde différentielle et le nettoyage des anciennes sauvegardes entre un serveur local et un serveur distant.

## 📦 Structure des fichiers
- `script_sauvegarde_full.sh` : Sauvegarde complète du répertoire `R1` vers le serveur `S2`.
- `script_sauvegarde_diff.sh` : Sauvegarde différentielle utilisant `rsync` et `--link-dest`.
- `script_nettoyage_backup.sh` : Nettoyage automatique des anciennes sauvegardes. 
- `crontab_entries.txt` : Lignes à ajouter dans `crontab` pour l'exécution automatique des scripts.

## 🔧 Configuration Crontab
Pour automatiser les sauvegardes et le nettoyage, ajouter les lignes suivantes au `crontab` :  
```bash
0 2 * * 1-6 /home/schawil/Sauvegardes/script_sauvegarde_diff.sh
0 3 * * 0 /home/schawil/Sauvegardes/script_sauvegarde_full.sh
0 4 1 * * /home/schawil/Sauvegardes/script_sauvegarde_full.sh
0 5 * * 1 /home/schawil/Sauvegardes/script_nettoyage_backup.sh


