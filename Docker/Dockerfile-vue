FROM node:18-alpine as build

WORKDIR /vuejsapp

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build


FROM nginx:alpine

COPY --from=build /vuejsapp/dist/ /usr/share/nginx/html