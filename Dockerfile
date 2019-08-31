FROM node:10.16.3-alpine

WORKDIR /app

# Pass in ONLY `package.json` initially BEFORE running `npm install` so that
# dependancies will ONLY be re-installed IF `package.json` has changed (otherwise
# the `node_modules` are reused from the cache).
COPY ./package.json /app/package.json

RUN cd /app && node --version && npm --version && npm install

COPY . /app

CMD node --version && npm version && npm start -- --host 0.0.0.0
