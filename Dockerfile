FROM node:18-alpine
WORKDIR /usr/src/app

COPY package*.json ./

# Thêm cờ --legacy-peer-deps vào cuối dòng này
RUN npm install --legacy-peer-deps

COPY . .

EXPOSE 8080
CMD ["npm", "start"]
