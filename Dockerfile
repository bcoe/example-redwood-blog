# Use the official lightweight Node.js 12 image.
# https://hub.docker.com/_/node
FROM node:12-slim

# Redwood has some git dependencies:
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y git && \
    rm -rf /var/lib/apt/lists/*

# Create and change to the app directory.
WORKDIR /usr/src/app

# Copy local code to the container image.
COPY . ./
RUN yarn install
RUN yarn redwood build api

# Run the web service on container startup.
CMD [ "bash", "scripts/start.sh" ]
