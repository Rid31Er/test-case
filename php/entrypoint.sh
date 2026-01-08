#!/bin/bash
set -e

# Check if Yii2 exists, if not create a new project
if [ ! -f "yii" ]; then
    echo "Yii2 not found, installing..."
    composer create-project yiisoft/yii2-app-basic . --no-interaction
else
    echo "Yii2 already installed"
fi

# Always install/update composer dependencies
echo "Installing/updating composer dependencies..."
composer install --no-interaction

# Run migrations automatically if Yii2 exists
if [ -f "yii" ]; then
    echo "Running migrations..."
    php yii migrate --interactive=0 || echo "No migrations to run or database not ready yet"
fi

# Start the PHP built-in server
exec php -S 0.0.0.0:3000 -t web
