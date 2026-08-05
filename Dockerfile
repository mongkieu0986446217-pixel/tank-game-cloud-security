FROM node:18-slim

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install

COPY . .

# Bước quan trọng bị thiếu: Biên dịch code tạo ra thư mục bin/
RUN npx gulp build || npm run build || npx gulp

ENV PORT=8080

EXPOSE 8080

CMD ["node", "bin/server/server.js"]
