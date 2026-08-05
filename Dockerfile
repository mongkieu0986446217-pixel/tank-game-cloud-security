FROM node:18-slim

WORKDIR /usr/src/app

COPY package*.json ./

# Cài đặt thư viện và chặn script ngầm tự chạy
RUN npm install --ignore-scripts

COPY . .

# Biên dịch toàn bộ code tĩnh sang thư mục bin/
RUN npx gulp build-server || npx gulp

ENV PORT=8080

EXPOSE 8080

# Chạy server Node thuần
CMD ["node", "bin/server/server.js"]
