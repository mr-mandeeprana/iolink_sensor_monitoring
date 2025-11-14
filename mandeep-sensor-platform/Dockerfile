FROM nodered/node-red:latest

USER root

# Copy your flows and package.json from the local data folder into Node-RED data dir
COPY data/flows.json /data/flows.json
COPY data/package.json /data/package.json

# Make sure the right permissions are set
RUN chown -R node-red:node-red /data

USER node-red

# Expose Node-RED Port
EXPOSE 1880
