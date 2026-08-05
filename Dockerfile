FROM node:18-slim

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install

COPY . .

# 1. Cài đặt gulp-cli toàn cục để build
RUN npm install -g gulp-cli

# 2. Tạo thư mục bin/ trước khi chạy server
RUN gulp build || npm run build || gulp

ENV PORT=8080

EXPOSE 8080

# 3. CHẠY THẲNG BẰNG NODE (tuyệt đối không dùng npm start/nodemon)
CMD ["node", "bin/server/server.js"]
