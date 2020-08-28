#code for production state
FROM node:alpine as builder 

WORKDIR '/app'

COPY package.json .
RUN npm install

COPY . .

RUN npm run build

# Code for run state

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html