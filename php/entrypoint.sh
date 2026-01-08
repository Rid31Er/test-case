#!/bin/bash
set -e

if [ ! -f "yii" ]; then
    echo "Yii2 not found, installing..."
    composer create-project yiisoft/yii2-app-basic . --no-interaction
else
    echo "Yii2 already installed"
fi

# Jalankan PHP built-in server
exec php -S 0.0.0.0:3000 -t web
