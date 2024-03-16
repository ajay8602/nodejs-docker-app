# Use the official Node.js 12 image
FROM node:latest

# Set environment variables
ENV HOME=/home/app

# Update package lists and install htop
RUN apt-get update \
    && apt-get install -y --no-install-recommends htop \
    && rm -rf /var/lib/apt/lists/* 

# Set the working directory in the container
WORKDIR $HOME/node_docker

# Copy package.json and package-lock.json to the container
COPY package.json package-lock.json $HOME/node_docker/

# Install dependencies
RUN npm install --silent --progress=false

# Copy the rest of the application files to the container
COPY . $HOME/node_docker

# Specify the command to run on container startup
CMD ["npm", "start"]

