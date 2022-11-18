FROM node:14.15.4
WORKDIR /app
COPY package.json .
RUN npm install
RUN npm install mysql2
COPY . .
EXPOSE 3000

CMD ["node", "src/index.js"]