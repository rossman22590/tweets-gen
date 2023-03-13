# Use the official Node.js image as the parent image
FROM node:14

# Install yarn package manager
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update \
    && apt-get install -y yarn

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install the package dependencies
RUN yarn install

# Expose the port on which the server will run
EXPOSE 3000

# Start the server on port 3000
CMD ["yarn", "run", "dev"]
