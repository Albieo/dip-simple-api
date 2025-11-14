# Base image
FROM --platform=linux/amd64 node:22-slim

# Create app directory
WORKDIR /app

# A wildcard is used to ensure both package.json AND package-lock.json are copied
COPY yarn.lock package.json ./

# Install app dependencies
RUN yarn install

# Bundle app source
COPY . .

# Creates a "dist" folder with the production build of your app
RUN yarn run build

# Expose the port the app runs on
EXPOSE 3000

# Start the app using the production build
CMD [ "yarn", "run", "start:prod" ]
