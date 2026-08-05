FROM node:18-slim

WORKDIR /usr/src/app

COPY package*.json ./
RUN npm install

COPY . .

# Build server + client vào thư mục bin/
RUN npx gulp build-server build-client || npm run build

EXPOSE 8080

# Chạy file đã build (không phụ thuộc gulp watch)
CMD ["node", "bin/server/server.js"]
