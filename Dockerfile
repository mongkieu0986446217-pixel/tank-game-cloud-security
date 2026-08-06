FROM node:18-slim

WORKDIR /usr/src/app

COPY package*.json ./

# Cài đủ dependency (giữ scripts — cần cho một số package build)
RUN npm install

COPY . .

# Chỉ build, không chạy server / watch
RUN npx gulp build-server build-client

ENV PORT=8080
EXPOSE 8080

CMD ["node", "bin/server/server.js"]
