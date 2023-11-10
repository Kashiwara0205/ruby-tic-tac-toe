FROM ruby:3.1
RUN gem update --system
RUN gem install bundler
COPY Gemfile ./Gemfile
RUN bundle install
RUN gem clean up
WORKDIR /code