# FROM node:10.16.3-alpine
FROM rastasheep/alpine-node-chromium:10-alpine

WORKDIR /app

# ENV CHROME_BIN="/usr/bin/chromium-browser" \
#     PUPPETEER_SKIP_CHROMIUM_DOWNLOAD="true"

# RUN set -x \
#     && apk update \
#     && apk upgrade \
#     && apk add bash \
#     && apk add --no-cache \
#     udev \
#     ttf-freefont \
#     chromium \

RUN apk update && apk add bash

# Install latest chrome dev package and fonts to support major charsets (Chinese, Japanese, Arabic, Hebrew, Thai and a few others)
# Note: this installs the necessary libs to make the bundled version of Chromium that Puppeteer
# installs, work.
# RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
#     && sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' \
#     && apt-get update \
#     && apt-get install -y google-chrome-unstable fonts-ipafont-gothic fonts-wqy-zenhei fonts-thai-tlwg fonts-kacst fonts-freefont-ttf \
#       --no-install-recommends \
#     && rm -rf /var/lib/apt/lists/*

# RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
# RUN sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
# RUN apt-get update && apt-get install -y google-chrome-stable

# RUN apk update && apk add bash
# RUN apk add gconf-service libasound2 libatk1.0-0 libc6 libcairo2 libcups2 libdbus-1-3 libexpat1 libfontconfig1 libgcc1 libgconf-2-4 libgdk-pixbuf2.0-0 libglib2.0-0 libgtk-3-0 libnspr4 libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 libxtst6 ca-certificates fonts-liberation libappindicator1 libnss3 lsb-release xdg-utils wget
# RUN apt-get --yes install -yq gconf-service libasound2 libatk1.0-0 libc6 libcairo2 libcups2 libdbus-1-3 libexpat1 libfontconfig1 libgcc1 libgconf-2-4 libgdk-pixbuf2.0-0 libglib2.0-0 libgtk-3-0 libnspr4 libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 libxtst6 ca-certificates fonts-liberation libappindicator1 libnss3 lsb-release xdg-utils wget
# RUN apt-get -y install google-chrome-stable
# RUN npm install -g puppeteer@1.19.0 --unsafe-perm=true --allow-root

# Pass in ONLY `package.json` initially BEFORE running `npm install` so that
# dependancies will ONLY be re-installed IF `package.json` has changed (otherwise
# the `node_modules` are reused from the cache).
COPY ./package.json /app/package.json

RUN cd /app && node --version && npm --version && npm install

COPY . /app

# ENTRYPOINT ["/bin/bash"]
# ENTRYPOINT ["/bin/bash -c"]
# ENTRYPOINT npm run

# CMD ["-- -c \"npm start\""]
# CMD ["-c \"npm start\""]
# CMD ["npm start"]
CMD npm start

