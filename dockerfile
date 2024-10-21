FROM node:14

RUN apt-get update && apt-get install -y nginx

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80

ENTRYPOINT [ "bash", "-c", "service nginx start && node /app/index.js" ]

