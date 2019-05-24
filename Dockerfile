FROM ruby:2.6-slim
MAINTAINER Todd Clevenger <todcle@gmail.com>

#ENV BUILD_PACKAGES ruby-dev build-base nodejs
#ENV BUILD_PACKAGES build-base
#ENV RUBY_PACKAGES ruby ruby-io-console ruby-bundler libxslt-dev libxml2-dev tzdata

# update and install all of the required packages.
# at the end, remove the apk cache
# combine into a single docker run command to create a single layer
RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get install -qq -y build-essential nodejs libsqlite3-dev --fix-missing --no-install-recommends && \
    apt-get -y clean

# could just pass these environment variables into the
# docker run command
ENV RAILS_ENV development
ENV RAILS_SERVE_STATIC_FILES true
ENV RAILS_LOG_TO_STDOUT true

RUN mkdir -p /usr/app
WORKDIR /usr/app

COPY Gemfile Gemfile.lock /usr/app/

RUN bundle config --global frozen 1
RUN bundle install --without test

COPY . /usr/app

EXPOSE 3000
CMD ["rails", "s", "-b", "0.0.0.0"]