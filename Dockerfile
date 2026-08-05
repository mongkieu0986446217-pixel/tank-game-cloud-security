FROM node:18-alpine
WORKDIR /usr/src/app

# Coppy file khai bao thu vien
COPY package*.json ./

# CAI DAT TOAN BO THU VIEN (Thieu dong nay app se crash)
RUN npm install

# Copy toan bo code con lai
COPY . .

EXPOSE 8080
CMD ["npm", "start"]
