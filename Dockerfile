FROM node:20-alpine

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .

# Run tests during build (important)
RUN npm test -- --watchAll=false

EXPOSE 3000

CMD ["npm", "run", "dev"]