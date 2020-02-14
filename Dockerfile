FROM ruby:2.6.5
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN mkdir /wherebot
WORKDIR /wherebot
COPY Gemfile /wherebot/Gemfile
COPY Gemfile.lock /wherebot/Gemfile.lock
RUN gem install bundle
RUN bundle install
COPY . /wherebot

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["script/server"]
