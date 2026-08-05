FROM node:18-slim

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install

COPY . .

ENV PORT=8080

EXPOSE 8080

# Chạy thẳng file server.js nằm trong thư mục bin/server/
CMD ["node", "bin/server/server.js"]
