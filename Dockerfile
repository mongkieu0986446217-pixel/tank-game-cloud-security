FROM node:18-slim

WORKDIR /usr/src/app

COPY package*.json ./

# Dùng --ignore-scripts để CHẶN BẮT BUỘC nodemon không được tự chạy ngầm
RUN npm install --ignore-scripts

COPY . .

# Chỉ biên dịch file tĩnh ra /bin/server/ và /bin/client/
RUN npx gulp build-server

ENV PORT=8080

EXPOSE 8080

# Khởi chạy ứng dụng bằng node thuần
CMD ["node", "bin/server/server.js"]
