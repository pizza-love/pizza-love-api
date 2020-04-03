FROM ruby:2.5
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN mkdir /pizza-love-api
WORKDIR /pizza-love-api
COPY Gemfile /pizza-love-api/Gemfile
COPY Gemfile.lock /pizza-live-api/Gemfile.lock
RUN bundle install
COPY . /pizza-love-api

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
