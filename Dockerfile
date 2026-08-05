FROM node:18-alpine
WORKDIR /usr/src/app

COPY package*.json ./
RUN npm install

COPY . .

# Chạy build để sinh ra thư mục bin/server/server.js
RUN npm run build

EXPOSE 8080
CMD ["npm", "start"]
