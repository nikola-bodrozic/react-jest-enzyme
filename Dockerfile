FROM node:node:lts-alpine as build-deps
WORKDIR /usr/src/app
COPY package.json .
COPY yarn.lock .
RUN yarn install --network-timeout 3600000
COPY . .
RUN yarn build

# Stage 2 - the production environment
FROM nginx:node:lts-alpine
COPY --from=build-deps /usr/src/app/build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
