# The first thing we need to do is define from what image we want to build from.
# Here we will use the latest LTS (long term support) version carbon of node
# available from the Docker Hub
FROM node:carbon

# Next we create a directory to hold the application code inside the image,
# this will be the working directory for your application:
WORKDIR usr/src/app

# This image comes with Node.js and NPM already installed so the next thing
# we need to do is to install your app dependencies using the npm binary. 
# Please note that if you are using npm version 4 or earlier a package-lock.json
# file will not be generated.
COPY package*.json ./

RUN npm install
# If you are building your code for production
# RUN npm install --only=production

# Bundle app source code
COPY . .

#Your app binds to port 8080 so you'll use the EXPOSE instruction to have it
# mapped by the docker daemon:
EXPOSE 3001

# Last but not least, define the command to run your app using CMD which defines
# your runtime. Here we will use the basic npm start which will run node server.js
# to start your server:
CMD ["npm", "start"]