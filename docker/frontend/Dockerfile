FROM node:16.14-alpine as build

WORKDIR /app/frontend/
COPY ./frontend/package.json ./
COPY ./frontend/yarn.lock ./
RUN yarn install
COPY ./frontend/ ./



