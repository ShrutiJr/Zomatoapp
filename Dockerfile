# Step 1: Build the React app using Node.js
FROM node:16-slim as build

# Set working directory
WORKDIR /app

# Install app dependencies
COPY package*.json ./
RUN npm install

# Copy app files and build
COPY . .
RUN npm run build

# Step 2: Serve the app using Node.js (optional — only if using a server)
# If you're using Express to serve the build folder:
FROM node:16-slim

WORKDIR /app

# Copy only build artifacts and server code if any
COPY --from=build /app /app

# If you have an Express server, this is where your entry point should be
EXPOSE 3000
CMD ["npm", "start"]

