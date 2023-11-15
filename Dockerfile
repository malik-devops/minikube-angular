FROM node:16 as build

WORKDIR /app

COPY . .

RUN npm install -f

RUN npm run build --prod

FROM nginx:alpine

COPY --from=build /app/dist/minikube-angular /usr/share/nginx/html

COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]

