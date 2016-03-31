FROM ruby:2.0.0
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /zphn
WORKDIR /zphn
ADD Gemfile /zphn/Gemfile
ADD Gemfile.lock /zphn/Gemfile.lock
RUN bundle install
ADD . /zphn
