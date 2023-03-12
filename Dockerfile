# Use the official Node.js 16 image as the base image
FROM node:16

# Create the app directory
WORKDIR /usr/src/app

# Copy the package files to the app directory
COPY package*.json ./

# Install the app dependencies
RUN npm install

# Copy the app source code to the app directory
COPY . .

# Build the app for production
RUN npm run build

# Expose port 3000 for the app to listen on
EXPOSE 3000

# Start the app
CMD ["nuxt", "start"]
