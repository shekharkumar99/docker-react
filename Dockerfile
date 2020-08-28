#code for production state
FROM node:alpine as builder 

WORKDIR '/app'

COPY package*.json ./
RUN npm install

COPY . .

RUN npm run build

# Code for run state

FROM nginx
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html