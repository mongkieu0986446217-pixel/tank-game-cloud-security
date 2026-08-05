FROM node:18-slim

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install

COPY . .

# Thêm dòng này để cố định port cho Node.js app
ENV PORT=8080

EXPOSE 8080

CMD ["npm", "start"]
