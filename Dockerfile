# Use an official Node.js runtime as a parent image
FROM node:latest

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install app dependencies
RUN npm install

# Copy all files from the current directory to the working directory
COPY . .

# Expose the port the app runs on
EXPOSE 8000

# Command to run the application
# CMD ["node", "src/index.js"]

# You can have all the cmds all in one(for production and for development)
# Default command (for production)
# CMD ["sh", "-c", "npm start"]

# Command for development (override with "docker run -e NODE_ENV=development ...")
# CMD ["sh", "-c", "if [ \"$NODE_ENV\" = \"development\" ]; then npm run dev; fi"]

# Command to run the application in development mode
CMD ["npm", "run", "dev"]

# NB: Run the following cmds to run image:
# Build Image: sudo docker build -t nodedockerdemo . 

# Run Image (Normal Mode: Development): 
# sudo docker run -p 8700:8700 -v $(pwd):/usr/src/app nodedockerdemo

# Run Image (When both Dev mode and prod mode are set):
# In Dev mode: sudo docker run -p 8500:8500 -v $(pwd):/usr/src/app -e NODE_ENV=development nodedockerdemo
# In Prod mode: sudo docker run -p 8500:8500 nodedockerdemo