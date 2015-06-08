FROM ruby:2.2.2

RUN mkdir /myapp
WORKDIR /myapp
ADD Gemfile /myapp/Gemfile
ADD Gemfile.lock /myapp/Gemfile.lock
ADD start.sh /myapp/bin/
RUN chmod +x /myapp/bin/start.sh
RUN bundle install

ADD . /myapp

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev
RUN apt-get update && apt-get install -y nodejs --no-install-recommends && rm -rf /var/lib/apt/lists/*

EXPOSE 3000
CMD ["bin/start.sh"]