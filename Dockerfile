
FROM node:14
# Using the official Node.js 14 image as base

WORKDIR /app
# Seting the working directory inside the container

COPY package*.json ./
# Copying package.json and package-lock.json to the pwd

RUN npm install

COPY . .
# Copying  the rest of the application code

EXPOSE 3000
# exposing the required port number

CMD ["node", "main.js"]
#run the application
