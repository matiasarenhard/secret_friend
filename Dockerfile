FROM ruby:2.3-slim
# Install dependencies
RUN apt-get update && apt-get install -qq -y --no-install-recommends \
      build-essential nodejs libpq-dev imagemagick
# Set Path
ENV INSTALL_PATH /secret_friend
# Create repository
RUN mkdir -p $INSTALL_PATH
# create path
WORKDIR $INSTALL_PATH
# copy gemfile to container
COPY Gemfile ./
# set path for gems
ENV BUNDLE_PATH /box
# copy code for container
COPY . .
