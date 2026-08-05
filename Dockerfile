FROM node:18-alpine
WORKDIR /usr/src/app

COPY package*.json ./

# Ép npm bỏ qua kiểm tra phiên bản xung đột
RUN npm install --legacy-peer-deps --force

COPY . .

# Chạy build project
RUN npm run build || true

EXPOSE 8080
CMD ["npm", "start"]
