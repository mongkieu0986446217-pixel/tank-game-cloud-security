FROM node:18-alpine

# Cài đặt các công cụ build bắt buộc cho Alpine Linux (python3, make, g++)
RUN apk add --no-co-cache python3 make g++

WORKDIR /usr/src/app

# Coppy file khai báo thư viện
COPY package*.json ./

# Cài đặt thư viện ép bỏ qua xung đột
RUN npm install --legacy-peer-deps --force

# Copy toàn bộ code
COPY . .

# Chạy build project gulp
RUN npm run build || true

EXPOSE 8080
CMD ["npm", "start"]
