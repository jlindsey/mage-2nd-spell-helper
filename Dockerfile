FROM node:20.11.1-slim AS build
COPY public /app
WORKDIR /app
RUN npm i
RUN npm run build

FROM caddy:2-alpine
COPY --from=build /app/dist/ /usr/share/caddy/
