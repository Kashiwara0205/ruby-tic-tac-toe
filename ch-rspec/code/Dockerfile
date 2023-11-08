FROM ruby:2.7
RUN gem update --system
RUN gem install bundler
COPY Gemfile ./Gemfile
RUN bundle install
RUN gem clean up
WORKDIR /code