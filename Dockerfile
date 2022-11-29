FROM ruby:2.3.1

WORKDIR /slate
RUN apt-get update
RUN gem install bundler:1.17.3
COPY Gemfile .

COPY . .
RUN bundle install

CMD bundle exec middleman server
