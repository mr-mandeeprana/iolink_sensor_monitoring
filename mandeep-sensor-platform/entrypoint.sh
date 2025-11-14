#!/bin/sh
echo "📥 Updating Node-RED flows from GitHub..."

# If /data is empty, clone; otherwise pull
if [ ! -d "/data/.git" ]; then
    echo "Cloning repository..."
    git clone https://github.com/mr-mandeeprana/iolink_sensor_monitoring.git /data
   
else
    echo "Pulling latest changes..."
    cd /data && git pull
fi

echo "Starting Node-RED..."
npm --no-update-notifier --no-fund start --cache /data/.npm --userconfig /data/.npmrc

