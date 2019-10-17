#!/usr/bin/env bash

if [[ -z "$1"]]
  then
    echo "merci de préciser la sauvegarde à restaurer comme suit:"
    echo "restore.sh YYYYMMDD"
    exit 1
fi

# make a directory
mkdir restore
cd restore

# extract the entire project directory
tar -xzf ../recette-de-cuisine-$1.tar.gz

#dump database into a file
mysql -u $DB_USER -p$DB_PWD $DB_NAME < recette-de-cuisne-$1.sql

put size site back from maintenance mode
./vendor/bin/drupal site:maintenance off
