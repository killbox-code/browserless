ARG FROM=ghcr.io/killbox-code/multi:latest

FROM ${FROM}

# Change to root for install
USER root

# Cleanup
RUN rm -rf $APP_DIR
RUN mkdir -p $APP_DIR

WORKDIR $APP_DIR

# Copy src
COPY src src
COPY package.json .
COPY package-lock.json .
COPY tsconfig.json .
COPY *README.md .

# Install dependencies
RUN npm install

# Build Source files
RUN npm run build

# Back to non-privileged user
USER blessuser

CMD xvfb-run --server-args='-screen 0 1920x1080x24' npm start
