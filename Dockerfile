FROM node:18-slim

WORKDIR /usr/src/app

# Một số package native cần tool này
RUN apt-get update && apt-get install -y --no-install-recommends \
    python3 make g++ \
    && rm -rf /var/lib/apt/lists/*

COPY package*.json ./

# Project vừa package cũ (gulp/babel) vừa Azure mới → tránh conflict
RUN npm install --legacy-peer-deps

COPY . .

# Tạo bin/server/server.js + client
RUN npx gulp build-server build-client

ENV PORT=8080
EXPOSE 8080

CMD ["node", "bin/server/server.js"]
