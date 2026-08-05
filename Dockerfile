FROM node:18-slim

WORKDIR /usr/src/app

COPY package*.json ./

# Cài đặt toàn bộ thư viện
RUN npm install

COPY . .

# Biên dịch ra thư mục bin/
RUN npx gulp build || npx gulp

ENV PORT=8080

EXPOSE 8080

# Chạy thẳng bằng node
CMD ["node", "bin/server/server.js"]
