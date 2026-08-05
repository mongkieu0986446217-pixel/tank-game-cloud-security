FROM node:18-slim

WORKDIR /usr/src/app

COPY package*.json ./

# Cài đặt tất cả dependencies (bao gồm gulp, babel, webpack)
RUN npm install

COPY . .

# Chỉ gọi đúng task 'build-server' để biên dịch code ra /bin rồi thoát (không treo)
RUN npx gulp build-server

ENV PORT=8080

EXPOSE 8080

# Chạy server bằng node nguyên bản
CMD ["node", "bin/server/server.js"]
