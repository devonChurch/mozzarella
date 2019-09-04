# Use the Cypress "official" Docker image (with Node.js). This allow us to
# consistently apply our visual regression on any machine (including CI/CD).
#
# @see https://github.com/cypress-io/cypress-docker-images
# @see https://docs.cypress.io/examples/examples/docker.html#Images
FROM cypress/browsers:node10.16.0-chrome76

# Create a dumping group for our application when inside the container.
WORKDIR /app

# Update native dependancies then include `bash` so that we can run our `npm`
# scripts.
RUN apt-get update --yes && apt-get install --yes bash

# Pass in ONLY `package.json` initially BEFORE running `npm install` so that
# dependancies will ONLY be re-installed IF `package.json` has changed (otherwise
# the `node_modules` are reused from the cache).
COPY ./package.json /app/package.json
COPY ./package-lock.json /app/package-lock.json

# Install application dependancies based on the supplied `package.json`.
RUN cd /app && node --version && npm --version && npm install

# Move the application content over (after the dependancy installation layer) to
# ensure quicker ongoing builds.
COPY . /app

# Create a generic `bash` script entry point which allows us to use `npm` scripts
# in addition to anything else that is of use.
ENTRYPOINT /bin/bash
