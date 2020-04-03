FROM ruby:2.6.5-alpine

# Set default argument variables
ARG APP_PATH=/app
ARG RAILS_MASTER_KEY
ARG RAILS_ENV=production
ARG NODE_ENV=production
ARG BUILD_RUBY_VERSION=2.6.5
ARG BUILD_NODE_VERSION=12
ARG BUILD_BUNDLER_VERSION=2.1.4
ARG BUILD_BUNDLE_PATH=/bundle

# Binding argument variables to environment variables
ENV APP_PATH=${APP_PATH} BUNDLE_PATH=${BUILD_BUNDLE_PATH} GEM_HOME=${BUILD_BUNDLE_PATH}
# Use <root>/.bundle folder to store project-specicic Bundler settings.
ENV BUNDLE_APP_CONFIG=${APP_PATH}/.bundle

# Set rails working directory
WORKDIR ${APP_PATH}

# Install packages
RUN apk add --update --no-cache build-base git tzdata curl-dev mysql-dev yaml-dev zlib-dev sqlite-dev nodejs~=${BUILD_NODE_VERSION} yarn && \
    rm -rf /var/cache/apk/*

# Install bundler
RUN gem install bundler -v ${BUILD_BUNDLER_VERSION} --no-doc

# Copy manifest
COPY Gemfile* package.json yarn.lock ./

# Install standard gems
RUN bundle config --global frozen 1 && \
    bundle install -j4 --retry 3

# Install standard node dependencies
RUN yarn install

# Throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1 && \
    bundle config set without 'development:test:assets' && \
    bundle install -j4 --retry 3

# ONBUILD: Add triggers to the image, executed later while building a child image
ONBUILD ENV RAILS_MASTER_KEY=${RAILS_MASTER_KEY} RAILS_ENV=${RAILS_ENV} NODE_ENV=${NODE_ENV}
