# Rails Builder

Base docker images with preinstalled dependencies for Ruby on Rails, made building processs 3x times faster.

## Build

```bash
$ docker build -f Dockerfile . -t euclid1990/rails-builder
```
- Alpine: 3.10
- Rails: 2.6.5
- Bundler: 2.1.4
- Node: 12.15.0

## Usage

```Dockerfile
FROM euclid1990/rails-builder:latest AS Builder
...
# Copy your manifest
COPY Gemfile* package.json yarn.lock ./

# Install additional gems
RUN bundle config set without 'development:test:assets' && \
    bundle install -j4 --retry 3

# Remove unneeded files (cached *.gem, *.o, *.c)
RUN rm -rf ${BUNDLE_PATH}/cache/*.gem && \
    find ${BUNDLE_PATH}/gems/ -name "*.c" -delete && \
    find ${BUNDLE_PATH}/gems/ -name "*.o" -delete
...
FROM your/rails-final:latest
...
# Copy built packaged
COPY --from=assetsbuild ${APP_PATH} ${APP_PATH}
COPY --from=assetsbuild ${BUNDLE_PATH} ${BUNDLE_PATH}
...
CMD ["startup.sh"] # Defined in the app image
```

[Docker Hub Link]()
