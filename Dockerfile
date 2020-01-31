FROM ruby:2.6.2-alpine AS base

ENV APP_HOME /app

RUN apk add build-base
RUN apk add git

RUN mkdir -p ${APP_HOME}
WORKDIR ${APP_HOME}

COPY Gemfile ${APP_HOME}/Gemfile
COPY Procfile ${APP_HOME}/Procfile
COPY lib ${APP_HOME}/lib
COPY config.ru ${APP_HOME}/config.ru

RUN gem install bundler

RUN bundle install --retry 3

EXPOSE 9292

CMD ["bundle", "exec", "foreman", "start"]
