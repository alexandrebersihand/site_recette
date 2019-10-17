#!/usr/bin/env bash

DAY=`date +"%Y%m%d"`

# commande pour mettre le site en maintenance
vendor/bin/drupal site:maintenance on

# dump database into a file
mysqldump -u $DB_USER -p$DB_PWD $DB_NAME > Recettes_de_cuisine-$DAY.sql

# definition du fichier créé
tar -czf ../Recettes-de-cuisine-$DAY.tar.gz .

# commande pour mettre le site en ligne
vendor/bin/drupal site:maintenance off
