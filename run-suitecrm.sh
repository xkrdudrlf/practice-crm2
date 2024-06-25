#!/bin/sh

# Increate PHP memeory limit before 'composer install' to avoid potential "zip bomb" issue
echo "memory_limit=512M" > /usr/local/etc/php/conf.d/memory-limit.ini

# Run composer to install packages
composer install

# Run the SuiteCRM installation command
./bin/console suitecrm:app:install -u $DATABASE_USERNAME -p $DATABASE_PASSWORD -U $DATABASE_USERNAME -P $DATABASE_PASSWORD -H $DATABASE_SERVER -Z $DATABASE_PORT -N $DATABASE_NAME -S $SITE_HOST

# Start Apache in the foreground
exec /usr/local/bin/apache2-foreground