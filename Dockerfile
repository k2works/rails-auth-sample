FROM ruby:2.2.2
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev node
RUN mkdir /myapp
WORKDIR /myapp
ADD Gemfile /myapp/Gemfile
RUN bundle install
ADD . /myapp
CMD ["bundle exec", "rake", "db:migrate"]
