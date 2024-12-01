FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# FIRST PHASE IS DONE
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
