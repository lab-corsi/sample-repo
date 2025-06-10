FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy dependencies
COPY package*.json ./
RUN npm ci

# Copy source
COPY . .

# Build the React app
RUN npm run build

# Expose port and start server
EXPOSE 3000
CMD ["npx", "serve", "-s", "build"]