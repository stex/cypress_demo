FROM cypress/base:16

WORKDIR /app

# Install npm dependencies
COPY ./package.json ./yarn.lock ./
RUN npm install -g yarn
RUN yarn install

ARG BASE_URL=localhost:3000
ENV BASE_URL=$BASE_URL

COPY ./ ./
ENTRYPOINT ["/app/docker-entrypoint.sh"]
CMD ["yarn", "run", "cypress", "run"]
