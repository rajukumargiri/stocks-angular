# Use Node.js version 12 as the base image
FROM node:12

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json first to leverage Docker cache
COPY package*.json ./

# Install all dependencies (npm install)
RUN npm install

# Copy the entire application code to the container
COPY . .

# Build the Angular frontend (npm run-script ng build)
RUN npm run-script ng build

# Expose the port (assuming the app runs on port 8080 or any other port)
EXPOSE 8080

# Start the backend and frontend server (npm run devstart)
CMD ["npm", "run", "devstart"]
