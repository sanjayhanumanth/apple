FROM node:20-alpine

WORKDIR /app

# Copy package.json first
COPY package*.json ./

# Install dependencies (none, but keeps structure correct)
RUN npm install

# Copy rest of code
COPY . .

EXPOSE 3000

CMD ["npm", "run", "dev"]